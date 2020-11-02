From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon,  2 Nov 2020 13:34:24 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/libcap: add upstream patches to
 bring support to disable thread
Message-ID: <20201102123425.25727-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The latest release is not able to build on environments w/o thread
support. This commit adds support for that.

- add PTHREADS to package make flags
- change DYNAMIC with SHARED parameter of package make flags
- add several mainline patches to get support for disabling threads
- modify patch from Thomas to meet current shape of makefile
- drop patch from Thomas Petazzoni and replace with upstream one that
  introduces supports for SHARED option

Fixes:
http://autobuild.buildroot.net/results/fc1e7573327c7412dfa45b45a96966d993c7fc86/

Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 ...ed-library-build-and-linkage-of-lpsx.patch | 257 +++++++++++++++++
 ...disable-building-installing-shared-l.patch |  38 ---
 ...sts-sudotest-for-DYNAMIC-yes-testing.patch | 127 +++++++++
 ...libpsx-is-important-for-multithreade.patch | 236 +++++++++++++++
 ...s-with-no-available-pthreads-support.patch | 269 ++++++++++++++++++
 ...tions-can-t-support-shared-libraries.patch | 123 ++++++++
 package/libcap/libcap.mk                      |   3 +-
 7 files changed, 1014 insertions(+), 39 deletions(-)
 create mode 100644 package/libcap/0001-Support-shared-library-build-and-linkage-of-lpsx.patch
 delete mode 100644 package/libcap/0001-libcap-Makefile-disable-building-installing-shared-l.patch
 create mode 100644 package/libcap/0002-Fix-tests-sudotest-for-DYNAMIC-yes-testing.patch
 create mode 100644 package/libcap/0003-Demonstrate-why-libpsx-is-important-for-multithreade.patch
 create mode 100644 package/libcap/0004-Support-systems-with-no-available-pthreads-support.patch
 create mode 100644 package/libcap/0005-Some-distributions-can-t-support-shared-libraries.patch

diff --git a/package/libcap/0001-Support-shared-library-build-and-linkage-of-lpsx.patch b/package/libcap/0001-Support-shared-library-build-and-linkage-of-lpsx.patch
new file mode 100644
index 0000000000..72feea5b89
--- /dev/null
+++ b/package/libcap/0001-Support-shared-library-build-and-linkage-of-lpsx.patch
@@ -0,0 +1,257 @@
+From dd1c6c943a5b0de390eeb53bf4034ddfd587ab74 Mon Sep 17 00:00:00 2001
+From: "Andrew G. Morgan" <morgan@kernel.org>
+Date: Tue, 13 Oct 2020 06:21:55 -0700
+Subject: [PATCH] Support shared library build and linkage of -lpsx
+
+For now, the dynamic linkage of libpsx.so* is considered alpha.
+The build tree supports it and can successfully run tests but
+I'm hopeful I can get some feedback from third parties that it
+works as expected.
+
+Feature request:
+  https://bugzilla.kernel.org/show_bug.cgi?id=206093
+
+Signed-off-by: Andrew G. Morgan <morgan@kernel.org>
+[Taken from upstream]
+Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
+---
+ Make.Rules                    |  3 +-
+ libcap/.gitignore             |  1 +
+ libcap/Makefile               | 53 +++++++++++++++++++++++------------
+ psx/include/sys/psx_syscall.h |  8 ------
+ tests/Makefile                | 30 +++++++++++---------
+ 5 files changed, 54 insertions(+), 41 deletions(-)
+
+diff --git a/Make.Rules b/Make.Rules
+index 5366f2d..6a571c6 100644
+--- a/Make.Rules
++++ b/Make.Rules
+@@ -71,7 +71,8 @@ WARNINGS=-Wall -Wwrite-strings \
+ LD=$(CC) -Wl,-x -shared
+ LDFLAGS ?= #-g
+ LIBCAPLIB := -L$(topdir)/libcap -lcap
+-LIBPSXLIB := -L$(topdir)/libcap -lpsx -lpthread -Wl,-wrap,pthread_create
++PSXLINKFLAGS :=  -lpthread -Wl,-wrap,pthread_create
++LIBPSXLIB := -L$(topdir)/libcap -lpsx $(PSXLINKFLAGS)
+ 
+ BUILD_GPERF := $(shell which gperf >/dev/null 2>/dev/null && echo yes)
+ 
+diff --git a/libcap/.gitignore b/libcap/.gitignore
+index 000c694..8f77a0e 100644
+--- a/libcap/.gitignore
++++ b/libcap/.gitignore
+@@ -4,6 +4,7 @@ _caps_output.gperf
+ libcap.a
+ libcap.so*
+ libpsx.a
++libpsx.so*
+ _makenames
+ cap_test
+ libcap.pc
+diff --git a/libcap/Makefile b/libcap/Makefile
+index de6a28d..51b0059 100644
+--- a/libcap/Makefile
++++ b/libcap/Makefile
+@@ -6,23 +6,27 @@ include ../Make.Rules
+ #
+ # Library version
+ #
+-LIBNAME=$(LIBTITLE).so
++CAPLIBNAME=$(LIBTITLE).so
+ STACAPLIBNAME=$(LIBTITLE).a
+ #
++PSXLIBNAME=libpsx.so
+ STAPSXLIBNAME=libpsx.a
+ 
+ CAPFILES=cap_alloc cap_proc cap_extint cap_flag cap_text cap_file
+ PSXFILES=../psx/psx
+ 
+ INCLS=libcap.h cap_names.h $(INCS)
++GPERF_OUTPUT = _caps_output.gperf
++
+ CAPOBJS=$(addsuffix .o, $(CAPFILES))
+-PSXOBJS=$(addsuffix .o, $(PSXFILES))
++MAJCAPLIBNAME=$(CAPLIBNAME).$(VERSION)
++MINCAPLIBNAME=$(MAJCAPLIBNAME).$(MINOR)
+ 
+-MAJLIBNAME=$(LIBNAME).$(VERSION)
+-MINLIBNAME=$(MAJLIBNAME).$(MINOR)
+-GPERF_OUTPUT = _caps_output.gperf
++PSXOBJS=$(addsuffix .o, $(PSXFILES))
++MAJPSXLIBNAME=$(PSXLIBNAME).$(VERSION)
++MINPSXLIBNAME=$(MAJPSXLIBNAME).$(MINOR)
+ 
+-all: $(MINLIBNAME) $(STACAPLIBNAME) pcs $(STAPSXLIBNAME)
++all: pcs $(MINCAPLIBNAME) $(STACAPLIBNAME) $(MINPSXLIBNAME) $(STAPSXLIBNAME)
+ 
+ pcs: libcap.pc libpsx.pc
+ 
+@@ -76,10 +80,15 @@ $(STAPSXLIBNAME): $(PSXOBJS)
+ 	$(AR) rcs $@ $^
+ 	$(RANLIB) $@
+ 
+-$(MINLIBNAME): $(CAPOBJS)
+-	$(LD) $(CFLAGS) $(LDFLAGS) -Wl,-soname,$(MAJLIBNAME) -o $@ $^
+-	ln -sf $(MINLIBNAME) $(MAJLIBNAME)
+-	ln -sf $(MAJLIBNAME) $(LIBNAME)
++$(MINCAPLIBNAME): $(CAPOBJS)
++	$(LD) $(CFLAGS) $(LDFLAGS) -Wl,-soname,$(MAJCAPLIBNAME) -o $@ $^
++	ln -sf $(MINCAPLIBNAME) $(MAJCAPLIBNAME)
++	ln -sf $(MAJCAPLIBNAME) $(CAPLIBNAME)
++
++$(MINPSXLIBNAME): $(PSXOBJS)
++	$(LD) $(CFLAGS) $(LDFLAGS) -Wl,-soname,$(MAJPSXLIBNAME) -o $@ $^ $(PSXLINKFLAGS)
++	ln -sf $(MINPSXLIBNAME) $(MAJPSXLIBNAME)
++	ln -sf $(MAJPSXLIBNAME) $(PSXLIBNAME)
+ 
+ %.o: %.c $(INCLS)
+ 	$(CC) $(CFLAGS) $(IPATH) -c $< -o $@
+@@ -97,19 +106,19 @@ install: install-static install-shared
+ 
+ install-static: install-static-cap install-static-psx
+ 
+-install-shared: install-shared-cap
++install-shared: install-shared-cap install-shared-psx
+ 
+ install-cap: install-static-cap install-shared-cap
+ 
+-install-psx: install-static-psx
++install-psx: install-static-psx install-shared-psx
+ 
+ install-static-cap: install-common-cap $(STACAPLIBNAME)
+ 	install -m 0644 $(STACAPLIBNAME) $(FAKEROOT)$(LIBDIR)/$(STACAPLIBNAME)
+ 
+-install-shared-cap: install-common-cap $(MINLIBNAME)
+-	install -m 0644 $(MINLIBNAME) $(FAKEROOT)$(LIBDIR)/$(MINLIBNAME)
+-	ln -sf $(MINLIBNAME) $(FAKEROOT)$(LIBDIR)/$(MAJLIBNAME)
+-	ln -sf $(MAJLIBNAME) $(FAKEROOT)$(LIBDIR)/$(LIBNAME)
++install-shared-cap: install-common-cap $(MINCAPLIBNAME)
++	install -m 0644 $(MINCAPLIBNAME) $(FAKEROOT)$(LIBDIR)/$(MINCAPLIBNAME)
++	ln -sf $(MINCAPLIBNAME) $(FAKEROOT)$(LIBDIR)/$(MAJCAPLIBNAME)
++	ln -sf $(MAJCAPLIBNAME) $(FAKEROOT)$(LIBDIR)/$(CAPLIBNAME)
+ ifeq ($(FAKEROOT),)
+ 	-/sbin/ldconfig
+ endif
+@@ -117,6 +126,14 @@ endif
+ install-static-psx: install-common-psx $(STAPSXLIBNAME)
+ 	install -m 0644 $(STAPSXLIBNAME) $(FAKEROOT)$(LIBDIR)/$(STAPSXLIBNAME)
+ 
++install-shared-psx: install-common-psx $(MINPSXLIBNAME)
++	install -m 0644 $(MINPSXLIBNAME) $(FAKEROOT)$(LIBDIR)/$(MINPSXLIBNAME)
++	ln -sf $(MINPSXLIBNAME) $(FAKEROOT)$(LIBDIR)/$(MAJPSXLIBNAME)
++	ln -sf $(MAJPSXLIBNAME) $(FAKEROOT)$(LIBDIR)/$(PSXLIBNAME)
++ifeq ($(FAKEROOT),)
++	-/sbin/ldconfig
++endif
++
+ install-common-cap: install-common libcap.pc
+ 	install -m 0644 include/sys/capability.h $(FAKEROOT)$(INCDIR)/sys
+ 	install -m 0644 libcap.pc $(FAKEROOT)$(PKGCONFIGDIR)/libcap.pc
+@@ -132,7 +149,7 @@ install-common:
+ 
+ clean:
+ 	$(LOCALCLEAN)
+-	rm -f $(CAPOBJS) $(LIBNAME)* $(STACAPLIBNAME) libcap.pc libpsx.pc
+-	rm -f $(PSXOBJS) $(STAPSXLIBNAME)
++	rm -f $(CAPOBJS) $(CAPLIBNAME)* $(STACAPLIBNAME) libcap.pc
++	rm -f $(PSXOBJS) $(PSXLIBNAME)* $(STAPSXLIBNAME) libpsx.pc
+ 	rm -f cap_names.h cap_names.list.h _makenames $(GPERF_OUTPUT) cap_test
+ 	cd include/sys && $(LOCALCLEAN)
+diff --git a/psx/include/sys/psx_syscall.h b/psx/include/sys/psx_syscall.h
+index 8044fbd..d1159e2 100644
+--- a/psx/include/sys/psx_syscall.h
++++ b/psx/include/sys/psx_syscall.h
+@@ -25,14 +25,6 @@ extern "C" {
+ 
+ #include <pthread.h>
+ 
+-/*
+- * This function is actually provided by the linker trick:
+- *
+- *   gcc ... -lpsx -lpthread -Wl,-wrap,pthread_create
+- */
+-int __real_pthread_create(pthread_t *thread, const pthread_attr_t *attr,
+-			  void *(*start_routine) (void *), void *arg);
+-
+ /*
+  * psx_syscall performs the specified syscall on all psx registered
+  * threads. The mechanism by which this occurs is much less efficient
+diff --git a/tests/Makefile b/tests/Makefile
+index 8956d5d..476bc63 100644
+--- a/tests/Makefile
++++ b/tests/Makefile
+@@ -1,18 +1,20 @@
+ #
+-# defines
++# NOTE the built tests are all designed to be run from this
++# working directory when built DYNAMIC=yes. That is, they
++# link to the shared libraries in ../libcap/ .
+ #
+ topdir=$(shell pwd)/..
+ include ../Make.Rules
+ #
+ 
+-DEPS=../libcap/libcap.a ../libcap/libpsx.a
+-
+ ifeq ($(DYNAMIC),yes)
+-LDPATH = LD_LIBRARY_PATH=../libcap
+ DEPSBUILD = all
++DEPS=../libcap/libcap.so ../libcap/libpsx.so
++LINKEXTRA=-Wl,-rpath,../libcap
+ else
+ LDFLAGS += --static
+ DEPSBUILD = libcap.a libpsx.a
++DEPS=../libcap/libcap.a ../libcap/libpsx.a
+ endif
+ 
+ all: psx_test libcap_psx_test libcap_launch_test
+@@ -20,36 +22,36 @@ all: psx_test libcap_psx_test libcap_launch_test
+ $(DEPS):
+ 	make -C ../libcap $(DEPSBUILD)
+ 
+-test: run_psx_test run_libcap_psx_test
++test: run_libcap_psx_test
+ 
+-sudotest: test run_libcap_launch_test run_libcap_launch_test
++sudotest: test run_psx_test run_libcap_launch_test run_libcap_psx_test
+ 
+ install: all
+ 
+ run_psx_test: psx_test
+-	$(LDPATH) ./psx_test
++	sudo ./psx_test
+ 
+ psx_test: psx_test.c $(DEPS)
+-	$(CC) $(CFLAGS) $(IPATH) $< -o $@ $(LIBPSXLIB)
++	$(CC) $(CFLAGS) $(IPATH) $< -o $@ $(LINKEXTRA) $(LIBPSXLIB) $(LDFLAGS)
+ 
+ run_libcap_psx_test: libcap_psx_test
+-	$(LDPATH) ./libcap_psx_test
++	./libcap_psx_test
+ 
+ libcap_psx_test: libcap_psx_test.c $(DEPS)
+-	$(CC) $(CFLAGS) $(IPATH) $< -o $@ $(LIBCAPLIB) $(LIBPSXLIB) $(LDFLAGS)
++	$(CC) $(CFLAGS) $(IPATH) $< -o $@ $(LINKEXTRA) $(LIBCAPLIB) $(LIBPSXLIB) $(LDFLAGS)
+ 
+ run_libcap_launch_test: libcap_launch_test libcap_psx_launch_test noop
+-	sudo $(LDPATH) ./libcap_launch_test
+-	sudo $(LDPATH) ./libcap_psx_launch_test
++	sudo ./libcap_launch_test
++	sudo ./libcap_psx_launch_test
+ 
+ libcap_launch_test: libcap_launch_test.c $(DEPS)
+-	$(CC) $(CFLAGS) $(IPATH) $< -o $@ $(LIBCAPLIB) $(LDFLAGS)
++	$(CC) $(CFLAGS) $(IPATH) $< -o $@ $(LINKEXTRA) $(LIBCAPLIB) $(LDFLAGS)
+ 
+ # this varies only slightly from the above insofar as it currently
+ # only links in the pthreads fork support. TODO() we need to change
+ # the source to do something interesting with pthreads.
+ libcap_psx_launch_test: libcap_launch_test.c $(DEPS)
+-	$(CC) $(CFLAGS) $(IPATH) -DWITH_PTHREADS $< -o $@ $(LIBCAPLIB) $(LIBPSXLIB) $(LDFLAGS)
++	$(CC) $(CFLAGS) $(IPATH) -DWITH_PTHREADS $< -o $@ $(LINKEXTRA) $(LIBCAPLIB) $(LIBPSXLIB) $(LDFLAGS)
+ 
+ # This one runs in a chroot with no shared library files.
+ noop: noop.c
+-- 
+2.20.1
+
diff --git a/package/libcap/0001-libcap-Makefile-disable-building-installing-shared-l.patch b/package/libcap/0001-libcap-Makefile-disable-building-installing-shared-l.patch
deleted file mode 100644
index 6d49f235a9..0000000000
--- a/package/libcap/0001-libcap-Makefile-disable-building-installing-shared-l.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From b7ca9dd97bbd9657c541f749ea6baf1f45b7c98a Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Wed, 9 Sep 2020 22:22:18 +0200
-Subject: [PATCH] libcap/Makefile: disable building/installing shared
- library when DYNAMIC is empty
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-[slightly manual modifications that patch still applies for libcap 2.44]
-Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
----
- libcap/Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/libcap/Makefile b/libcap/Makefile
-index 81b089e..dfd4dea 100644
---- a/libcap/Makefile
-+++ b/libcap/Makefile
-@@ -22,7 +22,7 @@ MAJLIBNAME=$(LIBNAME).$(VERSION)
- MINLIBNAME=$(MAJLIBNAME).$(MINOR)
- GPERF_OUTPUT = _caps_output.gperf
- 
--all: $(MINLIBNAME) $(STACAPLIBNAME) pcs $(STAPSXLIBNAME)
-+all: $(if $(DYNAMIC),$(MINLIBNAME)) $(STACAPLIBNAME) pcs $(STAPSXLIBNAME)
- 
- pcs: libcap.pc libpsx.pc
- 
-@@ -93,7 +93,7 @@ cap_test: cap_test.c libcap.h
- test: cap_test
- 	./cap_test
- 
--install: install-static install-shared
-+install: $(if $(DYNAMIC),install-shared) install-static
- 
- install-common: pcs
- 	mkdir -p -m 0755 $(FAKEROOT)$(INCDIR)/sys
--- 
-2.26.2
-
diff --git a/package/libcap/0002-Fix-tests-sudotest-for-DYNAMIC-yes-testing.patch b/package/libcap/0002-Fix-tests-sudotest-for-DYNAMIC-yes-testing.patch
new file mode 100644
index 0000000000..0c7c479538
--- /dev/null
+++ b/package/libcap/0002-Fix-tests-sudotest-for-DYNAMIC-yes-testing.patch
@@ -0,0 +1,127 @@
+From ee019b87cdbb1c0eabd771c977cafcea7de25e37 Mon Sep 17 00:00:00 2001
+From: "Andrew G. Morgan" <morgan@kernel.org>
+Date: Sun, 18 Oct 2020 13:37:50 -0700
+Subject: [PATCH] Fix tests:sudotest for DYNAMIC=yes testing
+
+Actually, fix the libcap_launch_test.c itself since it wasn't correctly
+failing with an error exit code before.
+
+Signed-off-by: Andrew G. Morgan <morgan@kernel.org>
+[Taken from upstream]
+Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
+---
+ Makefile                   |  1 +
+ tests/Makefile             |  6 ++++--
+ tests/libcap_launch_test.c | 16 +++++++++-------
+ 3 files changed, 14 insertions(+), 9 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 9b3b5e0..8e8d5f3 100644
+--- a/Makefile
++++ b/Makefile
+@@ -64,6 +64,7 @@ endif
+ 
+ distcheck:
+ 	./distcheck.sh
++	make DYNAMIC=yes clean all test sudotest
+ 	make CC=/usr/local/musl/bin/musl-gcc clean all test sudotest
+ 	make clean all test sudotest
+ 	make distclean
+diff --git a/tests/Makefile b/tests/Makefile
+index 476bc63..4d13441 100644
+--- a/tests/Makefile
++++ b/tests/Makefile
+@@ -8,19 +8,21 @@ include ../Make.Rules
+ #
+ 
+ ifeq ($(DYNAMIC),yes)
++LDPATH = LD_LIBRARY_PATH=../libcap
+ DEPSBUILD = all
+-DEPS=../libcap/libcap.so ../libcap/libpsx.so
++DEPS=../libcap/libcap.so ../libcap/libpsx.so ../progs/tcapsh-static
+ LINKEXTRA=-Wl,-rpath,../libcap
+ else
+ LDFLAGS += --static
+ DEPSBUILD = libcap.a libpsx.a
+-DEPS=../libcap/libcap.a ../libcap/libpsx.a
++DEPS=../libcap/libcap.a ../libcap/libpsx.a ../progs/tcapsh-static
+ endif
+ 
+ all: psx_test libcap_psx_test libcap_launch_test
+ 
+ $(DEPS):
+ 	make -C ../libcap $(DEPSBUILD)
++	make -C ../progs tcapsh-static
+ 
+ test: run_libcap_psx_test
+ 
+diff --git a/tests/libcap_launch_test.c b/tests/libcap_launch_test.c
+index be33abc..c9ef205 100644
+--- a/tests/libcap_launch_test.c
++++ b/tests/libcap_launch_test.c
+@@ -1,4 +1,5 @@
+ #include <stdio.h>
++#include <stdlib.h>
+ #include <string.h>
+ #include <sys/capability.h>
+ #include <sys/types.h>
+@@ -34,20 +35,20 @@ struct test_case_s {
+ int main(int argc, char **argv) {
+     static struct test_case_s vs[] = {
+ 	{
+-	    .args = { "../progs/capsh", "--", "-c", "echo hello" },
++	    .args = { "../progs/tcapsh-static", "--", "-c", "echo hello" },
+ 	    .result = 0
+ 	},
+ 	{
+-	    .args = { "../progs/capsh", "--is-uid=123" },
++	    .args = { "../progs/tcapsh-static", "--is-uid=123" },
+ 	    .result = 256
+ 	},
+ 	{
+-	    .args = { "../progs/capsh", "--is-uid=123" },
++	    .args = { "../progs/tcapsh-static", "--is-uid=123" },
+ 	    .result = 0,
+ 	    .uid = 123,
+ 	},
+ 	{
+-	    .args = { "../progs/capsh", "--is-gid=123" },
++	    .args = { "../progs/tcapsh-static", "--is-gid=123" },
+ 	    .result = 0,
+ 	    .gid = 123,
+ 	    .ngroups = 1,
+@@ -55,13 +56,13 @@ int main(int argc, char **argv) {
+ 	    .iab = "",
+ 	},
+ 	{
+-	    .args = { "../progs/capsh", "--dropped=cap_chown",
++	    .args = { "../progs/tcapsh-static", "--dropped=cap_chown",
+ 		      "--has-i=cap_chown" },
+ 	    .result = 0,
+ 	    .iab = "!%cap_chown"
+ 	},
+ 	{
+-	    .args = { "../progs/capsh", "--dropped=cap_chown",
++	    .args = { "../progs/tcapsh-static", "--dropped=cap_chown",
+ 		      "--has-i=cap_chown", "--is-uid=234",
+ 		      "--has-a=cap_chown", "--has-p=cap_chown" },
+ 	    .uid = 234,
+@@ -69,7 +70,7 @@ int main(int argc, char **argv) {
+ 	    .iab = "!^cap_chown"
+ 	},
+ 	{
+-	    .args = { "../progs/capsh", "--inmode=NOPRIV" },
++	    .args = { "../progs/tcapsh-static", "--inmode=NOPRIV" },
+ 	    .result = 0,
+ 	    .mode = CAP_MODE_NOPRIV
+ 	},
+@@ -166,5 +167,6 @@ int main(int argc, char **argv) {
+ 	printf("cap_launch_test: PASSED\n");
+     } else {
+ 	printf("cap_launch_test: FAILED\n");
++	exit(1);
+     }
+ }
+-- 
+2.20.1
+
diff --git a/package/libcap/0003-Demonstrate-why-libpsx-is-important-for-multithreade.patch b/package/libcap/0003-Demonstrate-why-libpsx-is-important-for-multithreade.patch
new file mode 100644
index 0000000000..c42107909d
--- /dev/null
+++ b/package/libcap/0003-Demonstrate-why-libpsx-is-important-for-multithreade.patch
@@ -0,0 +1,236 @@
+From 1bac1936ab8444aa2b98f1e3142e6a4f79f50bfd Mon Sep 17 00:00:00 2001
+From: "Andrew G. Morgan" <morgan@kernel.org>
+Date: Sat, 24 Oct 2020 20:57:11 -0700
+Subject: [PATCH] Demonstrate why libpsx is important for multithreaded C code.
+
+I've heard a number of folk ask why one might need libpsx for anything
+other than Go program linking, so this demonstrates the class of exploit
+that is possible when libcap is linked with -lpthread and not -lpsx.
+
+Signed-off-by: Andrew G. Morgan <morgan@kernel.org>
+[Taken from upstream]
+Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
+---
+ tests/.gitignore |   2 +
+ tests/Makefile   |  22 ++++++-
+ tests/exploit.c  | 154 +++++++++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 177 insertions(+), 1 deletion(-)
+ create mode 100644 tests/exploit.c
+
+diff --git a/tests/.gitignore b/tests/.gitignore
+index 43118ef..ac7ffb0 100644
+--- a/tests/.gitignore
++++ b/tests/.gitignore
+@@ -3,3 +3,5 @@ psx_test
+ libcap_psx_test
+ libcap_launch_test
+ libcap_psx_launch_test
++exploit
++noexploit
+diff --git a/tests/Makefile b/tests/Makefile
+index 4d13441..9ab9766 100644
+--- a/tests/Makefile
++++ b/tests/Makefile
+@@ -26,7 +26,7 @@ $(DEPS):
+ 
+ test: run_libcap_psx_test
+ 
+-sudotest: test run_psx_test run_libcap_launch_test run_libcap_psx_test
++sudotest: test run_psx_test run_libcap_launch_test run_libcap_psx_test run_exploit_test
+ 
+ install: all
+ 
+@@ -49,6 +49,25 @@ run_libcap_launch_test: libcap_launch_test libcap_psx_launch_test noop
+ libcap_launch_test: libcap_launch_test.c $(DEPS)
+ 	$(CC) $(CFLAGS) $(IPATH) $< -o $@ $(LINKEXTRA) $(LIBCAPLIB) $(LDFLAGS)
+ 
++# This test demonstrates that libpsx is needed to secure multithreaded programs
++# that link against libcap.
++run_exploit_test: exploit noexploit
++	@echo exploit should succeed
++	sudo ./exploit ; if [[ $$? -ne 0 ]]; then exit 0; else exit 1 ; fi
++	@echo exploit should fail
++	sudo ./noexploit ; if [[ $$? -eq 0 ]]; then exit 0; else exit 1 ; fi
++
++exploit.o: exploit.c
++	$(CC) $(CFLAGS) $(IPATH) -c $<
++
++exploit: exploit.o $(DEPS)
++	$(CC) $(CFLAGS) $(IPATH) $< -o $@ $(LINKEXTRA) $(LIBCAPLIB) -lpthread $(LDFLAGS)
++
++# Note, for some reason, the order of libraries is important to avoid the exploit working
++# for dynamic linking.
++noexploit: exploit.o $(DEPS)
++	$(CC) $(CFLAGS) $(IPATH) $< -o $@ $(LINKEXTRA) $(LIBPSXLIB) $(LIBCAPLIB) $(LDFLAGS)
++
+ # this varies only slightly from the above insofar as it currently
+ # only links in the pthreads fork support. TODO() we need to change
+ # the source to do something interesting with pthreads.
+@@ -62,3 +81,4 @@ noop: noop.c
+ clean:
+ 	rm -f psx_test libcap_psx_test libcap_launch_test *~
+ 	rm -f libcap_launch_test libcap_psx_launch_test core noop
++	rm -f exploit noexploit exploit.o
+diff --git a/tests/exploit.c b/tests/exploit.c
+new file mode 100644
+index 0000000..28bac88
+--- /dev/null
++++ b/tests/exploit.c
+@@ -0,0 +1,154 @@
++/*
++ * Copyright (c) 2020 Andrew G Morgan <morgan@kernel.org>
++ *
++ * This program exploit demonstrates why libcap alone in a
++ * multithreaded C/C++ program is inherently vulnerable to privilege
++ * escalation.
++ *
++ * The code also serves as a demonstration of how linking with libpsx
++ * can eliminate this vulnerability by maintaining a process wide
++ * common security state.
++ *
++ * The basic idea (which is well known and why POSIX stipulates "posix
++ * semantics" for security relevant state at the abstraction of a
++ * process) is that, because of shared memory, if a single thread alone
++ * is vulnerable to code injection, then it can cause any other thread
++ * to execute arbitrary code. As such, if all but one thread drops
++ * privilege, privilege escalation is somewhat trivial.
++ */
++#include <pthread.h>
++#include <signal.h>
++#include <stdio.h>
++#include <stdlib.h>
++#include <sys/capability.h>
++#include <sys/types.h>
++
++/* thread coordination */
++pthread_mutex_t mu;
++pthread_cond_t cond;
++int hits;
++
++/* evidence of highest privilege attained */
++ssize_t greatest_len;
++char *text;
++
++/*
++ * interrupt handler - potentially watching for an opportunity to
++ * perform an exploit when invoked as a privileged thread.
++ */
++static void handler(int signum, siginfo_t *info, void *ignore) {
++    ssize_t length;
++    char *working;
++    pthread_mutex_lock(&mu);
++
++    cap_t caps = cap_get_proc();
++    working = cap_to_text(caps, &length);
++    if (length > greatest_len) {
++	/*
++	 * This is where the exploit code might go.
++	 */
++	cap_free(text);
++	text = working;
++	greatest_len = length;
++    }
++    cap_free(caps);
++    hits++;
++
++    pthread_cond_signal(&cond);
++    pthread_mutex_unlock(&mu);
++
++}
++
++/*
++ * privileged thread code (imagine it doing whatever needs privilege).
++ */
++static void *victim(void *args) {
++    pthread_mutex_lock(&mu);
++    hits = 1;
++    printf("started privileged thread\n");
++    pthread_cond_signal(&cond);
++    pthread_mutex_unlock(&mu);
++
++    pthread_mutex_lock(&mu);
++    while (hits < 2) {
++	pthread_cond_wait(&cond, &mu);
++    }
++    pthread_mutex_unlock(&mu);
++
++    return NULL;
++}
++
++int main(int argc, char **argv) {
++    pthread_t peer;
++    cap_t caps = cap_init();
++    struct sigaction sig_action;
++
++    printf("program starting\n");
++    if (pthread_create(&peer, NULL, victim, NULL)) {
++	perror("unable to start the victim thread");
++	exit(1);
++    }
++
++    /*
++     * Wait until the peer thread is fully up.
++     */
++    pthread_mutex_lock(&mu);
++    while (hits < 1) {
++	pthread_cond_wait(&cond, &mu);
++    }
++    pthread_mutex_unlock(&mu);
++
++    printf("dropping privilege from main process thread\n");
++
++    if (cap_set_proc(caps)) {
++	perror("unable to drop capabilities from main process thread");
++	exit(1);
++    }
++    cap_free(caps);
++
++    /* confirm the low privilege of the process' main thread */
++
++    caps = cap_get_proc();
++    text = cap_to_text(caps, &greatest_len);
++    cap_free(caps);
++
++    printf("no privilege in main process thread: len:%ld, caps:\"%s\"\n",
++	   greatest_len, text);
++    if (greatest_len != 1) {
++	printf("failed to lower privilege as expected\n");
++	exit(1);
++    }
++
++    /*
++     * So, we have confirmed that this running thread has no
++     * privilege. From this thread we setup an interrupt handler and
++     * then trigger it on the privileged peer thread.
++     */
++
++    sig_action.sa_sigaction = &handler;
++    sigemptyset(&sig_action.sa_mask);
++    sig_action.sa_flags = SA_SIGINFO | SA_RESTART;;
++    sigaction(SIGRTMIN, &sig_action, NULL);
++
++    pthread_kill(peer, SIGRTMIN);
++
++    /*
++     * Wait for the thread to exit.
++     */
++    pthread_join(peer, NULL);
++
++    /*
++     * Let's see how we did with the exploit.
++     */
++
++    printf("greatest privilege in main process thread: len:%ld, caps:\"%s\"\n",
++	   greatest_len, text);
++
++    cap_free(text);
++    if (greatest_len != 1) {
++	printf("exploit succeeded\n");
++	exit(1);
++    } else {
++	printf("exploit failed\n");
++    }
++}
+-- 
+2.20.1
+
diff --git a/package/libcap/0004-Support-systems-with-no-available-pthreads-support.patch b/package/libcap/0004-Support-systems-with-no-available-pthreads-support.patch
new file mode 100644
index 0000000000..ae1590fee8
--- /dev/null
+++ b/package/libcap/0004-Support-systems-with-no-available-pthreads-support.patch
@@ -0,0 +1,269 @@
+From 7e8c5bb8bf718542b6ef08448dcfae9f73bb92a6 Mon Sep 17 00:00:00 2001
+From: "Andrew G. Morgan" <morgan@kernel.org>
+Date: Tue, 27 Oct 2020 20:20:47 -0700
+Subject: [PATCH] Support systems with no available pthreads support.
+
+This change addresses:
+
+  https://bugzilla.kernel.org/show_bug.cgi?id=209875
+
+Howto:
+
+  make PTHREADS=no ...
+
+Signed-off-by: Andrew G. Morgan <morgan@kernel.org>
+[Taken from upstream]
+Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
+---
+ Make.Rules      | 13 ++++++++
+ libcap/Makefile | 24 ++++++++++-----
+ progs/Makefile  | 15 +++++-----
+ tests/Makefile  | 80 ++++++++++++++++++++++++++++++++++---------------
+ 4 files changed, 94 insertions(+), 38 deletions(-)
+
+diff --git a/Make.Rules b/Make.Rules
+index 6a571c6..0e7192c 100644
+--- a/Make.Rules
++++ b/Make.Rules
+@@ -84,6 +84,18 @@ PAM_CAP ?= $(shell if [ -f /usr/include/security/pam_modules.h ]; then echo yes
+ INDENT := $(shell if [ -n "$$(which indent 2>/dev/null)" ]; then echo "| indent -kr" ; fi)
+ DYNAMIC := $(shell if [ ! -d "$(topdir)/.git" ]; then echo yes; fi)
+ 
++# If your system does not support pthreads, override this as "no".
++#
++#    make PTHREADS=no ...
++#
++# This implies no Go support and no C/C++ libpsx build. Why might you
++# need libpsx for non-Go use? Tl;dr for POSIX semantics security:
++#
++#    https://sites.google.com/site/fullycapable/who-ordered-libpsx
++#
++PTHREADS ?= yes
++
++ifeq ($(PTHREADS),yes)
+ GO := go
+ GOLANG := $(shell if [ -n "$(shell $(GO) version 2>/dev/null)" ]; then echo yes ; else echo no ; fi)
+ ifeq ($(GOLANG),yes)
+@@ -99,6 +111,7 @@ ifeq ($(CGO_REQUIRED),0)
+ GOBUILDTAG=-tags allthreadssyscall
+ endif
+ endif
++endif
+ 
+ # If you want capsh to launch with something other than /bin/bash
+ # build like this:
+diff --git a/libcap/Makefile b/libcap/Makefile
+index 51b0059..a3646a0 100644
+--- a/libcap/Makefile
++++ b/libcap/Makefile
+@@ -26,7 +26,11 @@ PSXOBJS=$(addsuffix .o, $(PSXFILES))
+ MAJPSXLIBNAME=$(PSXLIBNAME).$(VERSION)
+ MINPSXLIBNAME=$(MAJPSXLIBNAME).$(MINOR)
+ 
+-all: pcs $(MINCAPLIBNAME) $(STACAPLIBNAME) $(MINPSXLIBNAME) $(STAPSXLIBNAME)
++all: pcs
++	make $(CAPLIBNAME) $(STACAPLIBNAME)
++ifeq ($(PTHREADS),yes)
++	make $(PSXLIBNAME) $(STAPSXLIBNAME)
++endif
+ 
+ pcs: libcap.pc libpsx.pc
+ 
+@@ -80,13 +84,13 @@ $(STAPSXLIBNAME): $(PSXOBJS)
+ 	$(AR) rcs $@ $^
+ 	$(RANLIB) $@
+ 
+-$(MINCAPLIBNAME): $(CAPOBJS)
+-	$(LD) $(CFLAGS) $(LDFLAGS) -Wl,-soname,$(MAJCAPLIBNAME) -o $@ $^
++$(CAPLIBNAME) $(MAJCAPLIBNAME) $(MINCAPLIBNAME): $(CAPOBJS)
++	$(LD) $(CFLAGS) $(LDFLAGS) -Wl,-soname,$(MAJCAPLIBNAME) -o $(MINCAPLIBNAME) $^
+ 	ln -sf $(MINCAPLIBNAME) $(MAJCAPLIBNAME)
+ 	ln -sf $(MAJCAPLIBNAME) $(CAPLIBNAME)
+ 
+-$(MINPSXLIBNAME): $(PSXOBJS)
+-	$(LD) $(CFLAGS) $(LDFLAGS) -Wl,-soname,$(MAJPSXLIBNAME) -o $@ $^ $(PSXLINKFLAGS)
++$(PSXLIBNAME) $(MAJPSXLIBNAME) $(MINPSXLIBNAME): $(PSXOBJS)
++	$(LD) $(CFLAGS) $(LDFLAGS) -Wl,-soname,$(MAJPSXLIBNAME) -o $(MINPSXLIBNAME) $^ $(PSXLINKFLAGS)
+ 	ln -sf $(MINPSXLIBNAME) $(MAJPSXLIBNAME)
+ 	ln -sf $(MAJPSXLIBNAME) $(PSXLIBNAME)
+ 
+@@ -104,9 +108,15 @@ test: cap_test
+ 
+ install: install-static install-shared
+ 
+-install-static: install-static-cap install-static-psx
++install-static: install-static-cap
++ifeq ($(PTHREADS),yes)
++	make install-static-psx
++endif
+ 
+-install-shared: install-shared-cap install-shared-psx
++install-shared: install-shared-cap
++ifeq ($(PTHREADS),yes)
++	make install-shared-psx
++endif
+ 
+ install-cap: install-static-cap install-shared-cap
+ 
+diff --git a/progs/Makefile b/progs/Makefile
+index 9462a2f..1d7fc7a 100644
+--- a/progs/Makefile
++++ b/progs/Makefile
+@@ -8,20 +8,21 @@ PROGS=getpcaps capsh getcap setcap
+ 
+ BUILD=$(PROGS)
+ 
++all: $(BUILD)
++
+ ifeq ($(DYNAMIC),yes)
+ LDPATH = LD_LIBRARY_PATH=../libcap
+-DEPSBUILD = all
++DEPS = ../libcap/libcap.so
+ else
+ LDFLAGS += --static
+-DEPSBUILD = libcap.a
++DEPS = ../libcap/libcap.a
+ endif
+ 
+-DEPS=../libcap/libcap.a
+-
+-all: $(BUILD)
++../libcap/libcap.a:
++	make -C ../libcap libcap.a
+ 
+-$(DEPS):
+-	make -C ../libcap $(DEPSBUILD)
++../libcap/libcap.so:
++	make -C ../libcap libcap.so
+ 
+ $(BUILD): %: %.o $(DEPS)
+ 	$(CC) $(CFLAGS) -o $@ $< $(LIBCAPLIB) $(LDFLAGS)
+diff --git a/tests/Makefile b/tests/Makefile
+index 9ab9766..5778f26 100644
+--- a/tests/Makefile
++++ b/tests/Makefile
+@@ -7,31 +7,59 @@ topdir=$(shell pwd)/..
+ include ../Make.Rules
+ #
+ 
++all:
++	make libcap_launch_test
++ifeq ($(PTHREADS),yes)
++	make psx_test libcap_psx_test libcap_psx_launch_test
++endif
++
++install: all
++
+ ifeq ($(DYNAMIC),yes)
+-LDPATH = LD_LIBRARY_PATH=../libcap
+-DEPSBUILD = all
+-DEPS=../libcap/libcap.so ../libcap/libpsx.so ../progs/tcapsh-static
+ LINKEXTRA=-Wl,-rpath,../libcap
++DEPS=../libcap/libcap.so ../progs/tcapsh-static
++ifeq ($(PTHREADS),yes)
++DEPS += ../libcap/libpsx.so
++endif
+ else
+ LDFLAGS += --static
+-DEPSBUILD = libcap.a libpsx.a
+-DEPS=../libcap/libcap.a ../libcap/libpsx.a ../progs/tcapsh-static
++DEPS=../libcap/libcap.a ../progs/tcapsh-static
++ifeq ($(PTHREADS),yes)
++DEPS +=  ../libcap/libpsx.a
++endif
+ endif
+ 
+-all: psx_test libcap_psx_test libcap_launch_test
++../libcap/libcap.so:
++	make -C ../libcap libcap.so
+ 
+-$(DEPS):
+-	make -C ../libcap $(DEPSBUILD)
+-	make -C ../progs tcapsh-static
++../libcap/libcap.a:
++	make -C ../libcap libcap.a
+ 
+-test: run_libcap_psx_test
++ifeq ($(PTHREADS),yes)
++../libcap/libpsx.so:
++	make -C ../libcap libpsx.so
+ 
+-sudotest: test run_psx_test run_libcap_launch_test run_libcap_psx_test run_exploit_test
++../libcap/libpsx.a:
++	make -C ../libcap libpsx.a
++endif
+ 
+-install: all
++../progs/tcapsh-static:
++	make -C ../progs tcapsh-static
++
++test:
++ifeq ($(PTHREADS),yes)
++	make run_psx_test run_libcap_psx_test
++endif
++
++sudotest: test
++	make run_libcap_launch_test
++ifeq ($(PTHREADS),yes)
++	make run_libcap_psx_launch_test run_exploit_test
++endif
+ 
++# unprivileged
+ run_psx_test: psx_test
+-	sudo ./psx_test
++	./psx_test
+ 
+ psx_test: psx_test.c $(DEPS)
+ 	$(CC) $(CFLAGS) $(IPATH) $< -o $@ $(LINKEXTRA) $(LIBPSXLIB) $(LDFLAGS)
+@@ -42,15 +70,25 @@ run_libcap_psx_test: libcap_psx_test
+ libcap_psx_test: libcap_psx_test.c $(DEPS)
+ 	$(CC) $(CFLAGS) $(IPATH) $< -o $@ $(LINKEXTRA) $(LIBCAPLIB) $(LIBPSXLIB) $(LDFLAGS)
+ 
+-run_libcap_launch_test: libcap_launch_test libcap_psx_launch_test noop
++# privileged
++run_libcap_launch_test: libcap_launch_test noop
+ 	sudo ./libcap_launch_test
++
++run_libcap_psx_launch_test: libcap_psx_launch_test
+ 	sudo ./libcap_psx_launch_test
+ 
+ libcap_launch_test: libcap_launch_test.c $(DEPS)
+ 	$(CC) $(CFLAGS) $(IPATH) $< -o $@ $(LINKEXTRA) $(LIBCAPLIB) $(LDFLAGS)
+ 
+-# This test demonstrates that libpsx is needed to secure multithreaded programs
+-# that link against libcap.
++# This varies only slightly from the above insofar as it currently
++# only links in the pthreads fork support. TODO() we need to change
++# the source to do something interesting with pthreads.
++libcap_psx_launch_test: libcap_launch_test.c $(DEPS)
++	$(CC) $(CFLAGS) $(IPATH) -DWITH_PTHREADS $< -o $@ $(LINKEXTRA) $(LIBCAPLIB) $(LIBPSXLIB) $(LDFLAGS)
++
++
++# This test demonstrates that libpsx is needed to secure multithreaded
++# programs that link against libcap.
+ run_exploit_test: exploit noexploit
+ 	@echo exploit should succeed
+ 	sudo ./exploit ; if [[ $$? -ne 0 ]]; then exit 0; else exit 1 ; fi
+@@ -63,17 +101,11 @@ exploit.o: exploit.c
+ exploit: exploit.o $(DEPS)
+ 	$(CC) $(CFLAGS) $(IPATH) $< -o $@ $(LINKEXTRA) $(LIBCAPLIB) -lpthread $(LDFLAGS)
+ 
+-# Note, for some reason, the order of libraries is important to avoid the exploit working
+-# for dynamic linking.
++# Note, for some reason, the order of libraries is important to avoid
++# the exploit working for dynamic linking.
+ noexploit: exploit.o $(DEPS)
+ 	$(CC) $(CFLAGS) $(IPATH) $< -o $@ $(LINKEXTRA) $(LIBPSXLIB) $(LIBCAPLIB) $(LDFLAGS)
+ 
+-# this varies only slightly from the above insofar as it currently
+-# only links in the pthreads fork support. TODO() we need to change
+-# the source to do something interesting with pthreads.
+-libcap_psx_launch_test: libcap_launch_test.c $(DEPS)
+-	$(CC) $(CFLAGS) $(IPATH) -DWITH_PTHREADS $< -o $@ $(LINKEXTRA) $(LIBCAPLIB) $(LIBPSXLIB) $(LDFLAGS)
+-
+ # This one runs in a chroot with no shared library files.
+ noop: noop.c
+ 	$(CC) $(CFLAGS) $< -o $@ --static
+-- 
+2.20.1
+
diff --git a/package/libcap/0005-Some-distributions-can-t-support-shared-libraries.patch b/package/libcap/0005-Some-distributions-can-t-support-shared-libraries.patch
new file mode 100644
index 0000000000..b558ad512a
--- /dev/null
+++ b/package/libcap/0005-Some-distributions-can-t-support-shared-libraries.patch
@@ -0,0 +1,123 @@
+From f025e2fb7a2b075005847eb9a82d2f4bfbd42566 Mon Sep 17 00:00:00 2001
+From: "Andrew G. Morgan" <morgan@kernel.org>
+Date: Sun, 1 Nov 2020 15:00:02 -0800
+Subject: [PATCH] Some distributions can't support shared libraries
+
+Heiko Thiery reports that some embedded distributions that link
+against uLibc can't support shared libraries. So, refactor the
+Makefiles to support
+
+  make SHARED=no ...
+
+(SHARED defaults to yes).
+
+Signed-off-by: Andrew G. Morgan <morgan@kernel.org>
+[Taken from upstream]
+Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
+---
+ Make.Rules      | 11 +++++++++--
+ libcap/Makefile | 33 ++++++++++++++++++++++++++-------
+ 2 files changed, 35 insertions(+), 9 deletions(-)
+
+diff --git a/Make.Rules b/Make.Rules
+index 0e7192c..360e258 100644
+--- a/Make.Rules
++++ b/Make.Rules
+@@ -80,9 +80,16 @@ SYSTEM_HEADERS = /usr/include
+ INCS=$(topdir)/libcap/include/sys/capability.h
+ LDFLAGS += -L$(topdir)/libcap
+ CFLAGS += -Dlinux $(WARNINGS) $(DEBUG)
+-PAM_CAP ?= $(shell if [ -f /usr/include/security/pam_modules.h ]; then echo yes ; else echo no ; fi)
+ INDENT := $(shell if [ -n "$$(which indent 2>/dev/null)" ]; then echo "| indent -kr" ; fi)
+-DYNAMIC := $(shell if [ ! -d "$(topdir)/.git" ]; then echo yes; fi)
++
++# SHARED tracks whether or not the SHARED libraries (libcap.so,
++# libpsx.so and pam_cap.so) are built. (Some environments don't
++# support shared libraries.)
++SHARED ?= yes
++# DYNAMIC controls how capsh etc are linked - to shared or static libraries
++DYNAMIC := $(shell if [ ! -d "$(topdir)/.git" ]; then echo $(SHARED); else echo no ; fi)
++
++PAM_CAP ?= $(shell if [ -f /usr/include/security/pam_modules.h ]; then echo $(SHARED) ; else echo no ; fi)
+ 
+ # If your system does not support pthreads, override this as "no".
+ #
+diff --git a/libcap/Makefile b/libcap/Makefile
+index a3646a0..230be39 100644
+--- a/libcap/Makefile
++++ b/libcap/Makefile
+@@ -26,13 +26,21 @@ PSXOBJS=$(addsuffix .o, $(PSXFILES))
+ MAJPSXLIBNAME=$(PSXLIBNAME).$(VERSION)
+ MINPSXLIBNAME=$(MAJPSXLIBNAME).$(MINOR)
+ 
+-all: pcs
+-	make $(CAPLIBNAME) $(STACAPLIBNAME)
++all: pcs $(STACAPLIBNAME)
++ifeq ($(SHARED),yes)
++	make $(CAPLIBNAME)
++endif
+ ifeq ($(PTHREADS),yes)
+-	make $(PSXLIBNAME) $(STAPSXLIBNAME)
++	make $(STAPSXLIBNAME)
++ifeq ($(SHARED),yes)
++	make $(PSXLIBNAME)
++endif
+ endif
+ 
+-pcs: libcap.pc libpsx.pc
++pcs: libcap.pc
++ifeq ($(PTHREADS),yes)
++	make libpsx.pc
++endif
+ 
+ ifeq ($(BUILD_GPERF),yes)
+ USE_GPERF_OUTPUT = $(GPERF_OUTPUT)
+@@ -84,6 +92,7 @@ $(STAPSXLIBNAME): $(PSXOBJS)
+ 	$(AR) rcs $@ $^
+ 	$(RANLIB) $@
+ 
++ifeq ($(SHARED),yes)
+ $(CAPLIBNAME) $(MAJCAPLIBNAME) $(MINCAPLIBNAME): $(CAPOBJS)
+ 	$(LD) $(CFLAGS) $(LDFLAGS) -Wl,-soname,$(MAJCAPLIBNAME) -o $(MINCAPLIBNAME) $^
+ 	ln -sf $(MINCAPLIBNAME) $(MAJCAPLIBNAME)
+@@ -93,6 +102,7 @@ $(PSXLIBNAME) $(MAJPSXLIBNAME) $(MINPSXLIBNAME): $(PSXOBJS)
+ 	$(LD) $(CFLAGS) $(LDFLAGS) -Wl,-soname,$(MAJPSXLIBNAME) -o $(MINPSXLIBNAME) $^ $(PSXLINKFLAGS)
+ 	ln -sf $(MINPSXLIBNAME) $(MAJPSXLIBNAME)
+ 	ln -sf $(MAJPSXLIBNAME) $(PSXLIBNAME)
++endif
+ 
+ %.o: %.c $(INCLS)
+ 	$(CC) $(CFLAGS) $(IPATH) -c $< -o $@
+@@ -106,7 +116,10 @@ cap_test: cap_test.c libcap.h
+ test: cap_test
+ 	./cap_test
+ 
+-install: install-static install-shared
++install: install-static
++ifeq ($(SHARED),yes)
++	make install-shared
++endif
+ 
+ install-static: install-static-cap
+ ifeq ($(PTHREADS),yes)
+@@ -118,9 +131,15 @@ ifeq ($(PTHREADS),yes)
+ 	make install-shared-psx
+ endif
+ 
+-install-cap: install-static-cap install-shared-cap
++install-cap: install-static-cap
++ifeq ($(SHARED),yes)
++	make install-shared-cap
++endif
+ 
+-install-psx: install-static-psx install-shared-psx
++install-psx: install-static-psx
++ifeq ($(SHARED),yes)
++	make install-shared-psx
++endif
+ 
+ install-static-cap: install-common-cap $(STACAPLIBNAME)
+ 	install -m 0644 $(STACAPLIBNAME) $(FAKEROOT)$(LIBDIR)/$(STACAPLIBNAME)
+-- 
+2.20.1
+
diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index e09bc1a624..52191d7c6c 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -19,7 +19,8 @@ LIBCAP_MAKE_FLAGS = \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
 	BUILD_CC="$(HOSTCC)" \
 	BUILD_CFLAGS="$(HOST_CFLAGS)" \
-	DYNAMIC=$(if $(BR2_STATIC_LIBS),,yes)
+	SHARED=$(if $(BR2_STATIC_LIBS),,yes) \
+	PTHREADS=$(if $(BR2_TOOLCHAIN_HAS_THREADS),yes,)
 
 LIBCAP_MAKE_DIRS = libcap
 
-- 
2.20.1
