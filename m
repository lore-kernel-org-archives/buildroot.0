From: Anisse Astier <anisse@astier.eu>
Date: Fri, 11 May 2018 12:10:18 +0200
Subject: [Buildroot] [PATCH 1/3] go: patch to fix cross-compilation support
In-Reply-To: <20180511101020.10295-1-anisse@astier.eu>
References: <20180511101020.10295-1-anisse@astier.eu>
Message-ID: <20180511101020.10295-2-anisse@astier.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patches the go toolchain with upstream-proposed patch by Angelo in
order to fix cross-compilation when building a go toolchain for a target
that has the same os and arch as host, but a different libc. This should
fix the buildroot autobuild failures on x86_64 musl/uclibc targets.

This patch should go as soon as it's accepted or a similar upstream
feature is merged.

I'm adding myself to the DEVELOPERS file in order to get CC-ed to future
build failures.

Reference: https://github.com/golang/go/issues/25177
Reference: https://golang.org/cl/112156
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Anisse Astier <anisse@astier.eu>
---
 DEVELOPERS                                         |  3 ++
 ...dist-explicit-option-for-crosscompilation.patch | 52 ++++++++++++++++++++++
 package/go/go.mk                                   | 29 +++---------
 3 files changed, 62 insertions(+), 22 deletions(-)
 create mode 100644 package/go/0001-cmd-dist-explicit-option-for-crosscompilation.patch

diff --git a/DEVELOPERS b/DEVELOPERS
index b910a86a8c..dabea65b03 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -153,6 +153,9 @@ F:	package/python-pydal/
 F:	package/python-web2py/
 F:	package/sysdig/
 
+N:	Anisse Astier <anisse@astier.eu>
+F:	package/go/
+
 N:	Antony Pavlov <antonynpavlov@gmail.com>
 F:	package/lsscsi/
 
diff --git a/package/go/0001-cmd-dist-explicit-option-for-crosscompilation.patch b/package/go/0001-cmd-dist-explicit-option-for-crosscompilation.patch
new file mode 100644
index 0000000000..a779179609
--- /dev/null
+++ b/package/go/0001-cmd-dist-explicit-option-for-crosscompilation.patch
@@ -0,0 +1,52 @@
+From acb08e41dad7f0e642149449564f7276bca3ada4 Mon Sep 17 00:00:00 2001
+From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
+Date: Tue, 8 May 2018 16:08:44 +0200
+Subject: [PATCH] cmd/dist: explicit option for crosscompilation
+
+If GOHOSTOS == GOOS || GOHOSTARCH == GOARCH the go build system assume
+it's not cross compiling and uses the same compiler for both
+CC_FOR_TARGET and CC even if they are declared different. During go
+compilation, this produces the error:
+
+fork/exec
+/accts/mlweber1/rclinux/rc-buildroot-test/scripts/instance-2/output/build/host-go-1.10/bin/go:
+no such file or directory
+
+cause the go binary produced is linked against a different libc and
+cannot be run on the host machine.
+
+This is a problem in case the cross compilation mandates a different
+toolchain for host and target like happens in cross compilation
+environments like buildroot. This patch adds GO_ASSUME_CROSSCOMPILING
+varible to assure that in case of cross compilation CC_FOR_TARGET can be
+different from CC.
+
+Fixes #25177
+
+Change-Id: I4833c6d522407e29b039ca5660fd79df81e4b7ed
+---
+ src/cmd/dist/build.go | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go
+index 99d1db5909..eb4097f443 100644
+--- a/src/cmd/dist/build.go
++++ b/src/cmd/dist/build.go
+@@ -252,12 +252,13 @@ func xinit() {
+ // $CC_FOR_goos_goarch, if set, applies only to goos/goarch.
+ func compilerEnv(envName, def string) map[string]string {
+ 	m := map[string]string{"": def}
++	crosscompiling := os.Getenv("GO_ASSUME_CROSSCOMPILING")
+ 
+ 	if env := os.Getenv(envName); env != "" {
+ 		m[""] = env
+ 	}
+ 	if env := os.Getenv(envName + "_FOR_TARGET"); env != "" {
+-		if gohostos != goos || gohostarch != goarch {
++		if gohostos != goos || gohostarch != goarch || crosscompiling == "1" {
+ 			m[gohostos+"/"+gohostarch] = m[""]
+ 		}
+ 		m[""] = env
+-- 
+2.13.6
+
diff --git a/package/go/go.mk b/package/go/go.mk
index 4d55e16cc3..37bb9801c2 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -58,13 +58,7 @@ else
 HOST_GO_CGO_ENABLED = 0
 endif
 
-# The go build system doesn't have the notion of cross compiling, but just the
-# notion of architecture.  When the host and target architectures are different
-# it expects to be given a target cross compiler in CC_FOR_TARGET.  When the
-# architectures are the same it will use CC_FOR_TARGET for both host and target
-# compilation.  To work around this limitation build and install a set of
-# compiler and tool binaries built with CC_FOR_TARGET set to the host compiler.
-# Also, the go build system is not compatible with ccache, so use
+# The go build system is not compatible with ccache, so use
 # HOSTCC_NOCCACHE.  See https://github.com/golang/go/issues/11685.
 HOST_GO_MAKE_ENV = \
 	GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_ROOT) \
@@ -75,31 +69,22 @@ HOST_GO_MAKE_ENV = \
 	$(if $(GO_GOARM),GOARM=$(GO_GOARM)) \
 	GOOS=linux \
 	CC=$(HOSTCC_NOCCACHE) \
-	CXX=$(HOSTCXX_NOCCACHE)
+	CXX=$(HOSTCXX_NOCCACHE) \
+	GO_ASSUME_CROSSCOMPILING=1
 
 HOST_GO_TARGET_CC = \
 	CC_FOR_TARGET="$(TARGET_CC)" \
 	CXX_FOR_TARGET="$(TARGET_CXX)"
 
-HOST_GO_HOST_CC = \
-	CC_FOR_TARGET=$(HOSTCC_NOCCACHE) \
-	CXX_FOR_TARGET=$(HOSTCXX_NOCCACHE)
-
-HOST_GO_TMP = $(@D)/host-go-tmp
 
 define HOST_GO_BUILD_CMDS
 	cd $(@D)/src && \
-		$(HOST_GO_MAKE_ENV) $(HOST_GO_HOST_CC) CGO_ENABLED=0 ./make.bash
-	mkdir -p $(HOST_GO_TMP)
-	mv $(@D)/pkg/tool $(HOST_GO_TMP)/
-	mv $(@D)/bin/ $(HOST_GO_TMP)/
-	cd $(@D)/src && \
 		$(HOST_GO_MAKE_ENV) $(HOST_GO_TARGET_CC) CGO_ENABLED=$(HOST_GO_CGO_ENABLED) ./make.bash
 endef
 
 define HOST_GO_INSTALL_CMDS
-	$(INSTALL) -D -m 0755 $(HOST_GO_TMP)/bin/go $(HOST_GO_ROOT)/bin/go
-	$(INSTALL) -D -m 0755 $(HOST_GO_TMP)/bin/gofmt $(HOST_GO_ROOT)/bin/gofmt
+	$(INSTALL) -D -m 0755 $(@D)/bin/go $(HOST_GO_ROOT)/bin/go
+	$(INSTALL) -D -m 0755 $(@D)/bin/gofmt $(HOST_GO_ROOT)/bin/gofmt
 
 	ln -sf ../lib/go/bin/go $(HOST_DIR)/bin/
 	ln -sf ../lib/go/bin/gofmt $(HOST_DIR)/bin/
@@ -108,7 +93,7 @@ define HOST_GO_INSTALL_CMDS
 
 	mkdir -p $(HOST_GO_ROOT)/pkg
 	cp -a $(@D)/pkg/include $(@D)/pkg/linux_* $(HOST_GO_ROOT)/pkg/
-	cp -a $(HOST_GO_TMP)/tool $(HOST_GO_ROOT)/pkg/
+	cp -a $(@D)/pkg/tool $(HOST_GO_ROOT)/pkg/
 
 	# There is a known issue which requires the go sources to be installed
 	# https://golang.org/issue/2775
@@ -116,7 +101,7 @@ define HOST_GO_INSTALL_CMDS
 
 	# Set all file timestamps to prevent the go compiler from rebuilding any
 	# built in packages when programs are built.
-	find $(HOST_GO_ROOT) -type f -exec touch -r $(HOST_GO_TMP)/bin/go {} \;
+	find $(HOST_GO_ROOT) -type f -exec touch -r $(@D)/bin/go {} \;
 endef
 
 $(eval $(host-generic-package))
-- 
2.13.6
