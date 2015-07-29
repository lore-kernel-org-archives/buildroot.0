From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 29 Jul 2015 22:35:01 +0200
Subject: [Buildroot] [PATCH] package/golang: new package
Message-ID: <1438202101-5106-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Christian Stewart <christian@paral.in>

This patch adds golang, the Go compiler-and-interpreter.

We're adding a host package to get the golang cross-compiler, and a
target package to get the golang interpreter on the target.

It is to be noted that golang's buildsystem is going at great length to
not do anything like any other buildsystem, and is full of little
tricks.

First-off, even though it generates code for the target, the host-variant
does not need the toolchain; it has its own built-in code generator. Yet,
building the target variant, the toolchain is indeed required. Weird...

Second, it misdetects cross-compilation: it considers that if the target
CPU and the build CPU are the same, then this is not cross-compilation.
Of course, this is completely stupid and wrong. So, we need to patch it
to override its insane heuristic.

Third, even so, when the target CPU is the same as the build CPU, the
resulting binaries will be dynamically linked, otherwise, they are
statically linked. We can't even force it one way or the other...
Instead, we mark it as requiring dynamic libraries, and let the golang
ill buildsystem decide whether to do static or dynamic link; we can do
so because any sane toolchain will always have the static variants of
the libc and libpthread, which is all that golang requires anyway.

Signed-off-by: Christian Stewart <christian@paral.in>
[yann.morin.1998 at free.fr:
 - add architecture-specific options
 - needs dynamic linking
 - fix tab-space indentation in patch 0003
 - fix licensing info
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/Config.in                                  |  1 +
 package/golang/0001-add-no-march-option-gccp.patch | 19 +++++
 .../0002-remove-unnecessary-march-ld-flag.patch    | 29 +++++++
 package/golang/0003-fix-make-bash-script.patch     | 46 +++++++++++
 package/golang/Config.in                           | 22 ++++++
 package/golang/golang.hash                         |  1 +
 package/golang/golang.mk                           | 91 ++++++++++++++++++++++
 7 files changed, 209 insertions(+)
 create mode 100644 package/golang/0001-add-no-march-option-gccp.patch
 create mode 100644 package/golang/0002-remove-unnecessary-march-ld-flag.patch
 create mode 100644 package/golang/0003-fix-make-bash-script.patch
 create mode 100644 package/golang/Config.in
 create mode 100644 package/golang/golang.hash
 create mode 100644 package/golang/golang.mk

diff --git a/package/Config.in b/package/Config.in
index eba74a0..2f08b99 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -460,6 +460,7 @@ menu "Erlang libraries/modules"
 	source "package/erlang-p1-zlib/Config.in"
 endmenu
 endif
+	source "package/golang/Config.in"
 	source "package/guile/Config.in"
 	source "package/haserl/Config.in"
 	source "package/jamvm/Config.in"
diff --git a/package/golang/0001-add-no-march-option-gccp.patch b/package/golang/0001-add-no-march-option-gccp.patch
new file mode 100644
index 0000000..87231aa
--- /dev/null
+++ b/package/golang/0001-add-no-march-option-gccp.patch
@@ -0,0 +1,19 @@
+Adds an option to not add the problematic -m parameter to GCC.
+
+Signed-off-by: Christian Stewart <christian@paral.in>
+
+diff -Nau golang.orig/src/cmd/cgo/gcc.go golang/src/cmd/cgo/gcc.go
+--- golang.orig/src/cmd/cgo/gcc.go.orig	2015-07-09 15:53:55.720794139 -0700
++++ golang/src/cmd/cgo/gcc.go	2015-07-09 17:46:43.664496374 -0700
+@@ -736,6 +736,11 @@
+ 
+ // gccMachine returns the gcc -m flag to use, either "-m32", "-m64" or "-marm".
+ func (p *Package) gccMachine() []string {
++
++	if os.Getenv("CGO_NO_EMULATION") == "1" {
++		return nil
++	}
++
+ 	switch goarch {
+ 	case "amd64":
+ 		return []string{"-m64"}
diff --git a/package/golang/0002-remove-unnecessary-march-ld-flag.patch b/package/golang/0002-remove-unnecessary-march-ld-flag.patch
new file mode 100644
index 0000000..7cc20f4
--- /dev/null
+++ b/package/golang/0002-remove-unnecessary-march-ld-flag.patch
@@ -0,0 +1,29 @@
+Removes defining -m parameter to LD, which is unnecessary in buildroot.
+
+Signed-off-by: Christian Stewart <christian@paral.in>
+
+diff -Nau golang.orig/src/cmd/ld/lib.c golang/src/cmd/ld/lib.c
+--- golang.orig/src/cmd/ld/lib.c.orig	2015-07-09 18:38:44.192359082 -0700
++++ golang/src/cmd/ld/lib.c	2015-07-09 18:39:02.108358294 -0700
+@@ -589,20 +589,7 @@
+ 	if(extld == nil)
+ 		extld = "gcc";
+ 	argv[argc++] = extld;
+-	switch(thechar){
+-	case '8':
+-		argv[argc++] = "-m32";
+-		break;
+-	case '6':
+-		argv[argc++] = "-m64";
+-		break;
+-	case '5':
+-		argv[argc++] = "-marm";
+-		break;
+-	}
+-	if(!debug['s'] && !debug_s) {
+-		argv[argc++] = "-gdwarf-2"; 
+-	} else {
++	if(debug['s'] || debug_s) {
+ 		argv[argc++] = "-s";
+ 	}
+ 	if(HEADTYPE == Hdarwin)
diff --git a/package/golang/0003-fix-make-bash-script.patch b/package/golang/0003-fix-make-bash-script.patch
new file mode 100644
index 0000000..c7b3587
--- /dev/null
+++ b/package/golang/0003-fix-make-bash-script.patch
@@ -0,0 +1,46 @@
+make.bash: fix cross-compile when target is same arch as host
+
+Add options GO_NO_HOST and GO_NO_TARGET to make.bash and copy binaries
+into specific directories depending on the target.
+
+Signed-off-by: Christian Stewart <christian@paral.in>
+[yann.morin.1998 at free.fr: fix tab-space indentation issues; fix moving
+ in the proper location using cp, not find]
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN golang-1.4.2.orig/src/make.bash golang-1.4.2/src/make.bash
+--- golang-1.4.2.orig/src/make.bash	2015-02-18 05:38:34.000000000 +0100
++++ golang-1.4.2/src/make.bash	2015-07-28 23:00:26.375589973 +0200
+@@ -161,18 +161,28 @@
+ "$GOTOOLDIR"/go_bootstrap clean -i std
+ echo
+ 
+-if [ "$GOHOSTARCH" != "$GOARCH" -o "$GOHOSTOS" != "$GOOS" ]; then
++if [ -z "$GO_NO_HOST" ]; then
+ 	echo "# Building packages and commands for host, $GOHOSTOS/$GOHOSTARCH."
+ 	# CC_FOR_TARGET is recorded as the default compiler for the go tool. When building for the host, however,
+ 	# use the host compiler, CC, from `cmd/dist/dist env` instead.
+ 	CC=$CC GOOS=$GOHOSTOS GOARCH=$GOHOSTARCH \
+ 		"$GOTOOLDIR"/go_bootstrap install -ccflags "$GO_CCFLAGS" -gcflags "$GO_GCFLAGS" -ldflags "$GO_LDFLAGS" -v std
+ 	echo
++
++	# xxx buildroot patch, move to host/ subdir
++	mkdir -p ../bin/host/
++	find ../bin/ -maxdepth 1 -type f -exec mv -i {} ../bin/host/ \;
+ fi
+ 
+-echo "# Building packages and commands for $GOOS/$GOARCH."
+-CC=$CC_FOR_TARGET "$GOTOOLDIR"/go_bootstrap install $GO_FLAGS -ccflags "$GO_CCFLAGS" -gcflags "$GO_GCFLAGS" -ldflags "$GO_LDFLAGS" -v std
+-echo
++if [ -z "$GO_NO_TARGET" ]; then
++	echo "# Building packages and commands for $GOOS/$GOARCH."
++	CC=$CC_FOR_TARGET "$GOTOOLDIR"/go_bootstrap install $GO_FLAGS -ccflags "$GO_CCFLAGS" -gcflags "$GO_GCFLAGS" -ldflags "$GO_LDFLAGS" -v std
++	echo
++
++	# xxx buildroot patch, move to target subdir
++	mkdir -p ../bin/${GOOS}_${GOARCH}/
++	find ../bin/ -maxdepth 1 -type f -exec mv -i {} ../bin/${GOOS}_${GOARCH}/ \;
++fi
+ 
+ rm -f "$GOTOOLDIR"/go_bootstrap
+ 
diff --git a/package/golang/Config.in b/package/golang/Config.in
new file mode 100644
index 0000000..8dbd75a
--- /dev/null
+++ b/package/golang/Config.in
@@ -0,0 +1,22 @@
+comment "golang needs a toolchain w/ threads, dynamic library"
+	depends on BR2_PACKAGE_GOLANG_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+
+# golang only supports x86, x86_64 and ARM (LE) targets.
+# For ARM, armv5 or above is required.
+config BR2_PACKAGE_GOLANG_ARCH_SUPPORTS
+	bool
+	default y
+	depends on BR2_USE_MMU
+	depends on BR2_i386 || BR2_x86_64 || BR2_arm
+	depends on !BR2_ARM_CPU_ARMV4
+
+config BR2_PACKAGE_GOLANG
+	bool "golang"
+	depends on BR2_PACKAGE_GOLANG_ARCH_SUPPORTS
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  Go compiler and cli tool.
+
+	  http://golang.org/
diff --git a/package/golang/golang.hash b/package/golang/golang.hash
new file mode 100644
index 0000000..146e39c
--- /dev/null
+++ b/package/golang/golang.hash
@@ -0,0 +1 @@
+sha1 460caac03379f746c473814a65223397e9c9a2f6  go1.4.2.src.tar.gz
diff --git a/package/golang/golang.mk b/package/golang/golang.mk
new file mode 100644
index 0000000..76da0c3
--- /dev/null
+++ b/package/golang/golang.mk
@@ -0,0 +1,91 @@
+################################################################################
+#
+# GOLANG
+#
+################################################################################
+
+GOLANG_VERSION = 1.4.2
+GOLANG_SOURCE = go$(GOLANG_VERSION).src.tar.gz
+GOLANG_SITE = https://storage.googleapis.com/golang
+GOLANG_LICENSE = BSD-3c
+GOLANG_LICENSE_FILES = LICENSE
+
+GOLANG = $(HOST_DIR)/usr/bin/go
+GOLANGFMT = $(HOST_DIR)/usr/bin/gofmt
+
+GOLANG_ARCH =
+GOLANG_ENV = \
+	CC_FOR_TARGET="$(TARGET_CC)" \
+	LD_FOR_TARGET="$(TARGET_LD)" \
+	GOOS=linux
+
+ifeq ($(BR2_i386),y)
+GOLANG_ARCH = 386
+ifeq ($(BR2_X86_CPU_HAS_SSE2),y)
+GOLANG_ENV += GO386=sse2
+else
+GOLANG_ENV += GO386=387
+endif
+endif # i386
+
+ifeq ($(BR2_x86_64),y)
+GOLANG_ARCH = amd64
+endif # x86_64
+
+# For ARM, the selection of the instruciton set is a bit unusual,
+# and is decided on whether the CPU has an FPU, and which one.
+ifeq ($(BR2_arm),y)
+GOLANG_ARCH = arm
+ifeq ($(BR2_ARM_CPU_HAS_VFPV3),y)
+GOLANG_ENV += GOARM=7
+else ifeq ($(BR2_ARM_CPU_HAS_VFPV2),y)
+GOLANG_ENV += GOARM=6
+else
+GOLANG_ENV += GOARM=5
+endif
+endif # arm
+
+GOLANG_ENV += GOARCH=$(GOLANG_ARCH)
+
+define GOLANG_BUILD_CMDS
+	cd $(@D)/src/; \
+	$(GOLANG_ENV) \
+	GOROOT_FINAL="/usr/lib/go" \
+	GO_NO_HOST=1 \
+	./make.bash --no-banner
+endef
+
+# We must install both the src/ and include/ subdirs because they
+# contain the go "runtime".
+define GOLANG_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/bin/linux_$(GOLANG_ARCH)/go $(TARGET_DIR)/usr/bin/go
+	$(INSTALL) -D -m 0755 $(@D)/bin/linux_$(GOLANG_ARCH)/gofmt $(TARGET_DIR)/usr/bin/gofmt
+	rm -rf $(TARGET_DIR)/usr/lib/go/
+	mkdir -p $(TARGET_DIR)/usr/lib/go/
+	cp -a $(@D)/src $(TARGET_DIR)/usr/lib/go/
+	cp -a $(@D)/include $(TARGET_DIR)/usr/lib/go/
+	cp -a $(@D)/pkg $(TARGET_DIR)/usr/lib/go/
+endef
+
+define HOST_GOLANG_BUILD_CMDS
+	cd $(@D)/src/ ; \
+	$(GOLANG_ENV) \
+	GOROOT_FINAL="$(HOST_DIR)/usr/lib/go" \
+	GO_NO_TARGET=1 \
+	./make.bash --no-banner
+endef
+
+# We must install both the src/ and include/ subdirs because they
+# contain the go "runtime"
+define HOST_GOLANG_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/bin/host/go $(HOST_DIR)/usr/bin/go
+	$(INSTALL) -D -m 0755 $(@D)/bin/host/gofmt $(HOST_DIR)/usr/bin/gofmt
+	rm -rf $(HOST_DIR)/usr/lib/go/
+	mkdir -p $(HOST_DIR)/usr/lib/go/
+	cp -a $(@D)/src $(HOST_DIR)/usr/lib/go/
+	cp -a $(@D)/include $(HOST_DIR)/usr/lib/go/
+	cp -a $(@D)/pkg $(HOST_DIR)/usr/lib/go/
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
1.9.1
