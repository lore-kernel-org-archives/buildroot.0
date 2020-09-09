From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 10 Sep 2020 00:06:46 +0200
Subject: [Buildroot] [git commit] package/libcap: fix static linking issues
Message-ID: <20200909220944.A39A08875B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9c13e02c35c74eca56e69f2bbfde452b51860f5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the bump of libcap to 2.42, host-libcap unconditionally tries to
build a shared library, which fails on build machines where the static
version of the C library is not available.

This issue was reported upstream, who fixed it by two different
commits, which are backported as patches 0001 and 0002. They require
passing a DYNAMIC= value, which should be "yes" to enable dynamic
linking, or empty when not using dynamic linking.

However, other upstream changes broke our logic to support static-only
linking for the target. So we introduce a 0003 patch which extends how
the DYNAMIC flag is used to disable the build of the shared library in
the libcap/ folder. This allows to greatly simplify libcap.mk.

Note that the refactoring is mixed with the fix: the two are hardly
splitable. We need to be able to pass the same options at all steps, and
especially the staging step, otherwise some code gets compiled with the
host compiler, installed in staging, and thus fails the architecture
check later on.

Fixes:

  host-libcap build failure on system without a static libc
  http://autobuild.buildroot.net/results/4b14458014e420ffe088f118e7d0261e67f2d551/

  libcap build failure on static only systems
  http://autobuild.buildroot.net/results/8961759067c4639ae697b6ee5db606f098b7c7e8/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998 at free.fr:
  - also pass DYNAMIC=yes at host-install step
  - extend commit log to explain why we refactor and fix together
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...rt-dynamic-test-compilation-and-execution.patch | 222 +++++++++++++++++++++
 ...-uses-of-tcapsh-static-to-sudotest-target.patch |  55 +++++
 ...file-disable-building-installing-shared-l.patch |  36 ++++
 package/libcap/libcap.mk                           |  49 ++---
 4 files changed, 332 insertions(+), 30 deletions(-)

diff --git a/package/libcap/0001-Support-dynamic-test-compilation-and-execution.patch b/package/libcap/0001-Support-dynamic-test-compilation-and-execution.patch
new file mode 100644
index 0000000000..66813ccf89
--- /dev/null
+++ b/package/libcap/0001-Support-dynamic-test-compilation-and-execution.patch
@@ -0,0 +1,222 @@
+From 3613927310c4b46df1d558f6f2c0b1cdf8878dd3 Mon Sep 17 00:00:00 2001
+From: "Andrew G. Morgan" <morgan@kernel.org>
+Date: Mon, 7 Sep 2020 12:24:43 -0700
+Subject: [PATCH] Support dynamic test compilation and execution.
+
+  make DYNAMIC=yes test sudotest
+
+works now. Thomas Petazzoni provided a patch that built
+the tests this way, but I've restructured things to
+make the above command line work against the uninstalled
+library builds.
+
+Signed-off-by: Andrew G. Morgan <morgan@kernel.org>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ Make.Rules          |  2 +-
+ go/Makefile         |  6 +++---
+ go/try-launching.go |  2 +-
+ progs/.gitignore    |  1 +
+ progs/Makefile      | 15 ++++++++++-----
+ progs/quicktest.sh  |  8 ++++----
+ tests/Makefile      | 23 +++++++++++++++--------
+ 7 files changed, 35 insertions(+), 22 deletions(-)
+
+diff --git a/Make.Rules b/Make.Rules
+index 8440e18..9a77607 100644
+--- a/Make.Rules
++++ b/Make.Rules
+@@ -69,7 +69,7 @@ WARNINGS=-Wall -Wwrite-strings \
+ LD=$(CC) -Wl,-x -shared
+ LDFLAGS ?= #-g
+ LIBCAPLIB := -L$(topdir)/libcap -lcap
+-LIBPSXLIB := -L$(topdir)/libcap -lpsx -lpthread
++LIBPSXLIB := -L$(topdir)/libcap -lpsx -lpthread -Wl,-wrap,pthread_create
+ 
+ BUILD_GPERF := $(shell which gperf >/dev/null 2>/dev/null && echo yes)
+ 
+diff --git a/go/Makefile b/go/Makefile
+index c5ad7aa..19b3e29 100644
+--- a/go/Makefile
++++ b/go/Makefile
+@@ -23,8 +23,8 @@ all: $(PSXGOPACKAGE) $(CAPGOPACKAGE) web compare-cap try-launching
+ $(DEPS):
+ 	make -C ../libcap all
+ 
+-../progs/capsh:
+-	make -C ../progs capsh
++../progs/tcapsh-static:
++	make -C ../progs tcapsh-static
+ 
+ src/$(IMPORTDIR)/psx:
+ 	mkdir -p "src/$(IMPORTDIR)"
+@@ -70,7 +70,7 @@ ifeq ($(CGO_REQUIRED),0)
+ 	CGO_ENABLED="1" CGO_LDFLAGS_ALLOW="$(CGO_LDFLAGS_ALLOW)" GOPATH=$(GOPATH) $(GO) build -o $@-cgo $<
+ endif
+ 
+-test: all ../progs/capsh
++test: all ../progs/tcapsh-static
+ 	CGO_LDFLAGS_ALLOW="$(CGO_LDFLAGS_ALLOW)" GOPATH="$(GOPATH)" $(GO) test $(IMPORTDIR)/psx
+ 	CGO_LDFLAGS_ALLOW="$(CGO_LDFLAGS_ALLOW)" GOPATH="$(GOPATH)" $(GO) test $(IMPORTDIR)/cap
+ 	LD_LIBRARY_PATH=../libcap ./compare-cap
+diff --git a/go/try-launching.go b/go/try-launching.go
+index 1c3d477..272fd0a 100644
+--- a/go/try-launching.go
++++ b/go/try-launching.go
+@@ -32,7 +32,7 @@ func tryLaunching() {
+ 	}{
+ 		{args: []string{root + "/go/ok"}},
+ 		{
+-			args:   []string{root + "/progs/capsh", "--dropped=cap_chown", "--is-uid=123", "--is-gid=456", "--has-a=cap_setuid"},
++			args:   []string{root + "/progs/tcapsh-static", "--dropped=cap_chown", "--is-uid=123", "--is-gid=456", "--has-a=cap_setuid"},
+ 			iab:    "!cap_chown,^cap_setuid,cap_sys_admin",
+ 			uid:    123,
+ 			gid:    456,
+diff --git a/progs/.gitignore b/progs/.gitignore
+index 1c7ff23..978229e 100644
+--- a/progs/.gitignore
++++ b/progs/.gitignore
+@@ -1,4 +1,5 @@
+ capsh
++tcapsh-static
+ getcap
+ getpcaps
+ setcap
+diff --git a/progs/Makefile b/progs/Makefile
+index 076e44f..1b27c41 100644
+--- a/progs/Makefile
++++ b/progs/Makefile
+@@ -8,13 +8,15 @@ PROGS=getpcaps capsh getcap setcap
+ 
+ BUILD=$(PROGS)
+ 
+-ifneq ($(DYNAMIC),yes)
++ifeq ($(DYNAMIC),yes)
++LDPATH = LD_LIBRARY_PATH=../libcap
++else
+ LDFLAGS += --static
+ endif
+ 
+ DEPS=../libcap/libcap.a ../libcap/libpsx.a
+ 
+-all: $(BUILD)
++all: $(BUILD) tcapsh-static
+ 
+ $(DEPS):
+ 	make -C ../libcap all
+@@ -36,9 +38,12 @@ endif
+ 
+ test: $(PROGS)
+ 
+-sudotest: test
+-	sudo ./quicktest.sh
++tcapsh-static: capsh.c $(DEPS)
++	$(CC) $(IPATH) $(CAPSH_SHELL) $(CFLAGS) -o $@ $< $(LIBCAPLIB) $(LDFLAGS) --static
++
++sudotest: test tcapsh-static
++	sudo $(LDPATH) ./quicktest.sh
+ 
+ clean:
+ 	$(LOCALCLEAN)
+-	rm -f *.o $(BUILD) tcapsh ping hack.sh compare-cap
++	rm -f *.o $(BUILD) tcapsh* privileged ping hack.sh compare-cap
+diff --git a/progs/quicktest.sh b/progs/quicktest.sh
+index fbe98a6..5873317 100755
+--- a/progs/quicktest.sh
++++ b/progs/quicktest.sh
+@@ -45,7 +45,7 @@ pass_capsh () {
+ pass_capsh --print
+ 
+ # Make a local non-setuid-0 version of capsh and call it privileged
+-cp ./capsh ./privileged && /bin/chmod -s ./privileged
++cp ./tcapsh-static ./privileged && /bin/chmod -s ./privileged
+ if [ $? -ne 0 ]; then
+     echo "Failed to copy capsh for capability manipulation"
+     exit 1
+@@ -77,7 +77,7 @@ pass_capsh --mode=PURE1E --iab='!%cap_chown,cap_sys_admin'
+ pass_capsh --keep=0 --keep=1 --keep=0 --keep=1 --print
+ 
+ /bin/rm -f tcapsh
+-/bin/cp capsh tcapsh
++/bin/cp tcapsh-static tcapsh
+ /bin/chown root.root tcapsh
+ /bin/chmod u+s tcapsh
+ /bin/ls -l tcapsh
+@@ -166,7 +166,7 @@ pass_capsh --keep=1 --uid=$nouid --caps=cap_setpcap=ep \
+ 
+ # Verify we can chroot
+ pass_capsh --chroot=$(/bin/pwd)
+-pass_capsh --chroot=$(/bin/pwd) ==
++pass_capsh -- -c "./tcapsh-static --chroot=$(/bin/pwd) =="
+ fail_capsh --chroot=$(/bin/pwd) -- -c "echo oops"
+ 
+ ./capsh --has-ambient
+@@ -216,7 +216,7 @@ echo "testing namespaced file caps"
+ # nsprivileged capsh will have an ns rootid value (this is
+ # the same setup as an earlier test but with a ns file cap).
+ rm -f nsprivileged
+-cp ./capsh ./nsprivileged && /bin/chmod -s ./nsprivileged
++cp ./tcapsh-static ./nsprivileged && /bin/chmod -s ./nsprivileged
+ ./setcap -n 1 all=ep ./nsprivileged
+ if [ $? -eq 0 ]; then
+     ./getcap -n ./nsprivileged | fgrep "[rootid=1]"
+diff --git a/tests/Makefile b/tests/Makefile
+index bfedbc2..d85d019 100644
+--- a/tests/Makefile
++++ b/tests/Makefile
+@@ -7,6 +7,12 @@ include ../Make.Rules
+ 
+ DEPS=../libcap/libcap.a ../libcap/libpsx.a
+ 
++ifeq ($(DYNAMIC),yes)
++LDPATH = LD_LIBRARY_PATH=../libcap
++else
++LDFLAGS += --static
++endif
++
+ all: psx_test psx_test_wrap libcap_psx_test libcap_launch_test
+ 
+ $(DEPS):
+@@ -19,30 +25,31 @@ sudotest: test run_libcap_launch_test run_libcap_launch_test
+ install: all
+ 
+ run_psx_test: psx_test
+-	./psx_test
++	$(LDPATH) ./psx_test
+ 
+ psx_test: psx_test.c $(DEPS)
+-	$(CC) $(CFLAGS) $(IPATH) $< -o $@ $(LIBPSXLIB) -Wl,-wrap,pthread_create
++	$(CC) $(CFLAGS) $(IPATH) $< -o $@ $(LIBPSXLIB)
+ 
+ run_libcap_psx_test: libcap_psx_test
+-	./libcap_psx_test
++	$(LDPATH) ./libcap_psx_test
+ 
+ libcap_psx_test: libcap_psx_test.c $(DEPS)
+-	$(CC) $(CFLAGS) $(IPATH) $< -o $@ $(LIBCAPLIB) $(LIBPSXLIB) -Wl,-wrap,pthread_create --static
++	$(CC) $(CFLAGS) $(IPATH) $< -o $@ $(LIBCAPLIB) $(LIBPSXLIB) $(LDFLAGS)
+ 
+ run_libcap_launch_test: libcap_launch_test libcap_psx_launch_test noop
+-	sudo ./libcap_launch_test
+-	sudo ./libcap_psx_launch_test
++	sudo $(LDPATH) ./libcap_launch_test
++	sudo $(LDPATH) ./libcap_psx_launch_test
+ 
+ libcap_launch_test: libcap_launch_test.c $(DEPS)
+-	$(CC) $(CFLAGS) $(IPATH) $< -o $@ $(LIBCAPLIB) --static
++	$(CC) $(CFLAGS) $(IPATH) $< -o $@ $(LIBCAPLIB) $(LDFLAGS)
+ 
+ # this varies only slightly from the above insofar as it currently
+ # only links in the pthreads fork support. TODO() we need to change
+ # the source to do something interesting with pthreads.
+ libcap_psx_launch_test: libcap_launch_test.c $(DEPS)
+-	$(CC) $(CFLAGS) $(IPATH) -DWITH_PTHREADS $< -o $@ $(LIBCAPLIB) $(LIBPSXLIB) -Wl,-wrap,pthread_create --static
++	$(CC) $(CFLAGS) $(IPATH) -DWITH_PTHREADS $< -o $@ $(LIBCAPLIB) $(LIBPSXLIB) $(LDFLAGS)
+ 
++# This one runs in a chroot with no shared library files.
+ noop: noop.c
+ 	$(CC) $(CFLAGS) $< -o $@ --static
+ 
+-- 
+2.26.2
+
diff --git a/package/libcap/0002-Migrate-all-uses-of-tcapsh-static-to-sudotest-target.patch b/package/libcap/0002-Migrate-all-uses-of-tcapsh-static-to-sudotest-target.patch
new file mode 100644
index 0000000000..db1b00462f
--- /dev/null
+++ b/package/libcap/0002-Migrate-all-uses-of-tcapsh-static-to-sudotest-target.patch
@@ -0,0 +1,55 @@
+From 159d53d71c7539719b3883bbdc7b113c876a5e55 Mon Sep 17 00:00:00 2001
+From: "Andrew G. Morgan" <morgan@kernel.org>
+Date: Mon, 7 Sep 2020 14:02:03 -0700
+Subject: [PATCH] Migrate all uses of tcapsh-static to sudotest target.
+
+Since sudotest is mostly the reason for using a static binary, force
+all uses to be under this test target.
+
+Signed-off-by: Andrew G. Morgan <morgan@kernel.org>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ go/Makefile    | 6 +++---
+ progs/Makefile | 2 +-
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/go/Makefile b/go/Makefile
+index 19b3e29..508b380 100644
+--- a/go/Makefile
++++ b/go/Makefile
+@@ -70,16 +70,16 @@ ifeq ($(CGO_REQUIRED),0)
+ 	CGO_ENABLED="1" CGO_LDFLAGS_ALLOW="$(CGO_LDFLAGS_ALLOW)" GOPATH=$(GOPATH) $(GO) build -o $@-cgo $<
+ endif
+ 
+-test: all ../progs/tcapsh-static
++test: all
+ 	CGO_LDFLAGS_ALLOW="$(CGO_LDFLAGS_ALLOW)" GOPATH="$(GOPATH)" $(GO) test $(IMPORTDIR)/psx
+ 	CGO_LDFLAGS_ALLOW="$(CGO_LDFLAGS_ALLOW)" GOPATH="$(GOPATH)" $(GO) test $(IMPORTDIR)/cap
+ 	LD_LIBRARY_PATH=../libcap ./compare-cap
++
++sudotest: test ../progs/tcapsh-static
+ 	./try-launching
+ ifeq ($(CGO_REQUIRED),0)
+ 	./try-launching-cgo
+ endif
+-
+-sudotest: test
+ 	sudo ./try-launching
+ ifeq ($(CGO_REQUIRED),0)
+ 	sudo ./try-launching-cgo
+diff --git a/progs/Makefile b/progs/Makefile
+index 1b27c41..f416e59 100644
+--- a/progs/Makefile
++++ b/progs/Makefile
+@@ -16,7 +16,7 @@ endif
+ 
+ DEPS=../libcap/libcap.a ../libcap/libpsx.a
+ 
+-all: $(BUILD) tcapsh-static
++all: $(BUILD)
+ 
+ $(DEPS):
+ 	make -C ../libcap all
+-- 
+2.26.2
+
diff --git a/package/libcap/0003-libcap-Makefile-disable-building-installing-shared-l.patch b/package/libcap/0003-libcap-Makefile-disable-building-installing-shared-l.patch
new file mode 100644
index 0000000000..d3a8bbec1d
--- /dev/null
+++ b/package/libcap/0003-libcap-Makefile-disable-building-installing-shared-l.patch
@@ -0,0 +1,36 @@
+From b7ca9dd97bbd9657c541f749ea6baf1f45b7c98a Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Wed, 9 Sep 2020 22:22:18 +0200
+Subject: [PATCH] libcap/Makefile: disable building/installing shared
+ library when DYNAMIC is empty
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ libcap/Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libcap/Makefile b/libcap/Makefile
+index 81b089e..dfd4dea 100644
+--- a/libcap/Makefile
++++ b/libcap/Makefile
+@@ -22,7 +22,7 @@ MAJLIBNAME=$(LIBNAME).$(VERSION)
+ MINLIBNAME=$(MAJLIBNAME).$(MINOR)
+ GPERF_OUTPUT = _caps_output.gperf
+ 
+-all: $(MINLIBNAME) $(STACAPLIBNAME) pcs $(STAPSXLIBNAME)
++all: $(if $(DYNAMIC),$(MINLIBNAME)) $(STACAPLIBNAME) pcs $(STAPSXLIBNAME)
+ 
+ pcs: libcap.pc libpsx.pc
+ 
+@@ -93,7 +93,7 @@ cap_test: cap_test.c libcap.h
+ test: cap_test
+ 	./cap_test
+ 
+-install: install-shared install-static
++install: $(if $(DYNAMIC),install-shared) install-static
+ 
+ install-common: pcs
+ 	mkdir -p -m 0755 $(FAKEROOT)$(INCDIR)/sys
+-- 
+2.26.2
+
diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index e16e4ed413..6f1bb8a07f 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -15,58 +15,47 @@ LIBCAP_INSTALL_STAGING = YES
 
 HOST_LIBCAP_DEPENDENCIES = host-gperf
 
-ifeq ($(BR2_STATIC_LIBS),y)
-LIBCAP_MAKE_TARGET = libcap.a libcap.pc
-LIBCAP_MAKE_INSTALL_TARGET = install-static
-else ifeq ($(BR2_SHARED_LIBS),y)
-LIBCAP_MAKE_TARGET = all
-LIBCAP_MAKE_INSTALL_TARGET = install-shared
-else
-LIBCAP_MAKE_TARGET = all
-LIBCAP_MAKE_INSTALL_TARGET = install
-endif
-
 LIBCAP_MAKE_FLAGS = \
 	BUILD_CC="$(HOSTCC)" \
-	BUILD_CFLAGS="$(HOST_CFLAGS)"
+	BUILD_CFLAGS="$(HOST_CFLAGS)" \
+	DYNAMIC=$(if $(BR2_STATIC_LIBS),,yes)
 
-ifeq ($(BR2_PACKAGE_LIBCAP_TOOLS),y)
-define LIBCAP_BUILD_TOOLS_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/progs \
-		$(LIBCAP_MAKE_FLAGS)
-endef
+LIBCAP_MAKE_DIRS = libcap
 
-define LIBCAP_INSTALL_TOOLS_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/progs \
-		RAISE_SETFCAP=no prefix=/usr \
-		DESTDIR=$(TARGET_DIR) $(LIBCAP_MAKE_FLAGS) install
-endef
+ifeq ($(BR2_PACKAGE_LIBCAP_TOOLS),y)
+LIBCAP_MAKE_DIRS += progs
 endif
 
 define LIBCAP_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/libcap \
-		$(LIBCAP_MAKE_FLAGS) $(LIBCAP_MAKE_TARGET)
-	$(LIBCAP_BUILD_TOOLS_CMDS)
+	$(foreach d,$(LIBCAP_MAKE_DIRS), \
+		$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/$(d) \
+			$(LIBCAP_MAKE_FLAGS) all
+	)
 endef
 
 define LIBCAP_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libcap $(LIBCAP_MAKE_FLAGS) \
-		DESTDIR=$(STAGING_DIR) prefix=/usr lib=lib $(LIBCAP_MAKE_INSTALL_TARGET)
+	$(foreach d,$(LIBCAP_MAKE_DIRS), \
+		$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/$(d) $(LIBCAP_MAKE_FLAGS) \
+			DESTDIR=$(STAGING_DIR) prefix=/usr lib=lib install
+	)
 endef
 
 define LIBCAP_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libcap $(LIBCAP_MAKE_FLAGS) \
-		DESTDIR=$(TARGET_DIR) prefix=/usr lib=lib $(LIBCAP_MAKE_INSTALL_TARGET)
-	$(LIBCAP_INSTALL_TOOLS_CMDS)
+	$(foreach d,$(LIBCAP_MAKE_DIRS), \
+		$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/$(d) $(LIBCAP_MAKE_FLAGS) \
+			DESTDIR=$(TARGET_DIR) prefix=/usr lib=lib install
+	)
 endef
 
 define HOST_LIBCAP_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)\
+		DYNAMIC=yes \
 		RAISE_SETFCAP=no GOLANG=no
 endef
 
 define HOST_LIBCAP_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) prefix=$(HOST_DIR) \
+		DYNAMIC=yes \
 		RAISE_SETFCAP=no GOLANG=no lib=lib install
 endef
 
