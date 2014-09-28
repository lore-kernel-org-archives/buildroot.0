From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Sep 2014 22:30:05 +0200
Subject: [Buildroot] [git commit] keyutils: Bump version to 1.5.9,
	fix patches and
Message-ID: <20140928203405.234459D795@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=339df19f7a851ea7c92bc8d01c577e7d5fe20023
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Bump version to 1.5.9
- Remove patches already included in this version
- Use make parameters instead of environment variables
- Add an upstream patch to fix building statically
- Adapt old patches to the new version
- Add a hash file

Fixes:
  http://autobuild.buildroot.net/results/ced/ced596bd1c73286f7044f5a8e11b6588fc973f11/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ng-of-the-shared-library-to-be-suppressed.patch |  104 ++++++++++++++++++++
 .../keyutils-01-memleak-from-realloc.patch         |   51 ----------
 package/keyutils/keyutils-02-another-memleak.patch |   32 ------
 ...le.patch => keyutils-02-fix-install-rule.patch} |   13 ++-
 .../keyutils-04-Makefile-for-buildroot.patch       |   64 ++----------
 package/keyutils/keyutils.hash                     |    3 +
 package/keyutils/keyutils.mk                       |   24 +++--
 7 files changed, 138 insertions(+), 153 deletions(-)

diff --git a/package/keyutils/keyutils-01-allow-building-of-the-shared-library-to-be-suppressed.patch b/package/keyutils/keyutils-01-allow-building-of-the-shared-library-to-be-suppressed.patch
new file mode 100644
index 0000000..88d32b0
--- /dev/null
+++ b/package/keyutils/keyutils-01-allow-building-of-the-shared-library-to-be-suppressed.patch
@@ -0,0 +1,104 @@
+keyutils: Allow building of the shared library to be suppressed
+
+Upstream patch:
+  https://kernel.googlesource.com/pub/scm/linux/kernel/git/dhowells/keyutils/+/a4deb71ddc05e951c8be8d46615beed9d408a5c8
+
+Signed-off-by: Vicente Olivert Riera <vincent.riera@imgtec.com>
+
+LIB: Allow building of the shared library to be suppressed
+
+Allow building of the shared library to be suppressed by passing NO_SOLIB=1 to
+the Makefile.
+
+Reported-and-tested-by: Vicente Olivert Riera <vincent.riera@imgtec.com>
+Signed-off-by: David Howells <dhowells@redhat.com>
+diff --git a/Makefile b/Makefile
+index c904eaf..5dd2113 100644
+--- a/Makefile
++++ b/Makefile
+@@ -5,6 +5,7 @@
+ SPECFILE	:= keyutils.spec
+ NO_GLIBC_KEYERR	:= 0
+ NO_ARLIB	:= 0
++NO_SOLIB	:= 0
+ ETCDIR		:= /etc
+ BINDIR		:= /bin
+ SBINDIR		:= /sbin
+@@ -95,7 +96,7 @@
+ # Normal build rule
+ #
+ ###############################################################################
+-all: $(DEVELLIB) keyctl request-key key.dns_resolver
++all: keyctl request-key key.dns_resolver
+ 
+ ###############################################################################
+ #
+@@ -104,20 +105,23 @@
+ ###############################################################################
+ #RPATH = -Wl,-rpath,$(LIBDIR)
+ 
+-ifeq ($(NO_ARLIB),0)
+-all: $(ARLIB)
+-$(ARLIB): keyutils.o
+-	$(AR) rcs $@ $<
+-endif
+-
+ VCPPFLAGS	:= -DPKGBUILD="\"$(shell date -u +%F)\""
+ VCPPFLAGS	+= -DPKGVERSION="\"keyutils-$(VERSION)\""
+ VCPPFLAGS	+= -DAPIVERSION="\"libkeyutils-$(APIVERSION)\""
+ 
++ifeq ($(NO_ARLIB),0)
++all: $(ARLIB)
++$(ARLIB): keyutils.o
++	$(AR) rcs $@ $<
++
+ keyutils.o: keyutils.c keyutils.h Makefile
+ 	$(CC) $(CPPFLAGS) $(VCPPFLAGS) $(CFLAGS) -UNO_GLIBC_KEYERR -o $@ -c $<
++LIB_DEPENDENCY	:= libkeyutils.a
++endif
+ 
+ 
++ifeq ($(NO_SOLIB),0)
++all: $(DEVELLIB)
+ $(DEVELLIB): $(SONAME)
+ 	ln -sf $< $@
+ 
+@@ -131,6 +135,8 @@
+ 
+ keyutils.os: keyutils.c keyutils.h Makefile
+ 	$(CC) $(CPPFLAGS) $(VCPPFLAGS) $(CFLAGS) -fPIC -o $@ -c $<
++LIB_DEPENDENCY	:= $(DEVELLIB)
++endif
+ 
+ ###############################################################################
+ #
+@@ -140,13 +146,13 @@
+ %.o: %.c keyutils.h Makefile
+ 	$(CC) $(CPPFLAGS) $(CFLAGS) -o $@ -c $<
+ 
+-keyctl: keyctl.o $(DEVELLIB)
++keyctl: keyctl.o $(LIB_DEPENDENCY)
+ 	$(CC) -L. $(CFLAGS) $(LDFLAGS) $(RPATH) -o $@ $< -lkeyutils
+ 
+-request-key: request-key.o $(DEVELLIB)
++request-key: request-key.o $(LIB_DEPENDENCY)
+ 	$(CC) -L. $(CFLAGS) $(LDFLAGS) $(RPATH) -o $@ $< -lkeyutils
+ 
+-key.dns_resolver: key.dns_resolver.o $(DEVELLIB)
++key.dns_resolver: key.dns_resolver.o $(LIB_DEPENDENCY)
+ 	$(CC) -L. $(CFLAGS) $(LDFLAGS) $(RPATH) -o $@ $< -lkeyutils -lresolv
+ 
+ ###############################################################################
+@@ -158,10 +164,12 @@
+ ifeq ($(NO_ARLIB),0)
+ 	$(INSTALL) -D -m 0644 $(ARLIB) $(DESTDIR)$(USRLIBDIR)/$(ARLIB)
+ endif
++ifeq ($(NO_SOLIB),0)
+ 	$(INSTALL) -D $(LIBNAME) $(DESTDIR)$(LIBDIR)/$(LIBNAME)
+ 	$(LNS) $(LIBNAME) $(DESTDIR)$(LIBDIR)/$(SONAME)
+ 	mkdir -p $(DESTDIR)$(USRLIBDIR)
+ 	$(LNS) $(LIBDIR)/$(SONAME) $(DESTDIR)$(USRLIBDIR)/$(DEVELLIB)
++endif
+ 	$(INSTALL) -D keyctl $(DESTDIR)$(BINDIR)/keyctl
+ 	$(INSTALL) -D request-key $(DESTDIR)$(SBINDIR)/request-key
+ 	$(INSTALL) -D request-key-debug.sh $(DESTDIR)$(SHAREDIR)/request-key-debug.sh
diff --git a/package/keyutils/keyutils-01-memleak-from-realloc.patch b/package/keyutils/keyutils-01-memleak-from-realloc.patch
deleted file mode 100644
index 0faa9d8..0000000
--- a/package/keyutils/keyutils-01-memleak-from-realloc.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-Patch vampirised from Debian's packaging of keyutils-1.4
-
-Author: Michael Gebetsroither <gebi@grml.org>
-Description: Fixed memleak from realloc (Closes: #496466).
-
-diff -Naurp keyutils.orig/keyutils.c keyutils/keyutils.c
---- keyutils.orig/keyutils.c	2008-08-09 21:46:52.000000000 +0200
-+++ keyutils/keyutils.c	2008-08-25 13:38:07.000000000 +0200
-@@ -165,6 +165,24 @@ long keyctl_assume_authority(key_serial_
- 	return keyctl(KEYCTL_ASSUME_AUTHORITY, id);
- }
- 
-+
-+/*****************************************************************************/
-+/*
-+ * plain realloc is just crazy
-+ */
-+static void* __xrealloc(void* ptr, size_t size)
-+{
-+    void* ret;
-+
-+    ret = realloc(ptr, size);
-+    if(!ret) {
-+        free(ptr);
-+        return 0;
-+    }
-+    return ret;
-+}
-+
-+
- /*****************************************************************************/
- /*
-  * fetch key description into an allocated buffer
-@@ -194,7 +212,7 @@ int keyctl_describe_alloc(key_serial_t i
- 			break;
- 
- 		buflen = ret;
--		buf = realloc(buf, buflen);
-+		buf = __xrealloc(buf, buflen);
- 		if (!buf)
- 			return -1;
- 	}
-@@ -233,7 +251,7 @@ int keyctl_read_alloc(key_serial_t id, v
- 			break;
- 
- 		buflen = ret;
--		buf = realloc(buf, buflen + 1);
-+		buf = __xrealloc(buf, buflen + 1);
- 		if (!buf)
- 			return -1;
- 	}
diff --git a/package/keyutils/keyutils-02-another-memleak.patch b/package/keyutils/keyutils-02-another-memleak.patch
deleted file mode 100644
index f74fd79..0000000
--- a/package/keyutils/keyutils-02-another-memleak.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Patch vampirised from Debian's packaging of keyutils-1.4
-
-Author: Michael Gebetsroither <gebi@grml.org>
-Description: Fixed another memleak (Closes: #496466).
-
-diff -Naurp keyutils.orig/keyutils.c keyutils/keyutils.c
---- keyutils.orig/keyutils.c	2008-08-09 21:46:52.000000000 +0200
-+++ keyutils/keyutils.c	2008-08-25 13:38:25.000000000 +0200
-@@ -187,8 +187,10 @@ int keyctl_describe_alloc(key_serial_t i
- 
- 	for (;;) {
- 		ret = keyctl_describe(id, buf, buflen);
--		if (ret < 0)
-+		if (ret < 0) {
-+            free(buf);
- 			return -1;
-+        }
- 
- 		if (buflen >= ret)
- 			break;
-@@ -226,8 +228,10 @@ int keyctl_read_alloc(key_serial_t id, v
- 
- 	for (;;) {
- 		ret = keyctl_read(id, buf, buflen);
--		if (ret < 0)
-+		if (ret < 0) {
-+            free(buf);
- 			return -1;
-+        }
- 
- 		if (buflen >= ret)
- 			break;
diff --git a/package/keyutils/keyutils-05-fix-install-rule.patch b/package/keyutils/keyutils-02-fix-install-rule.patch
similarity index 57%
rename from package/keyutils/keyutils-05-fix-install-rule.patch
rename to package/keyutils/keyutils-02-fix-install-rule.patch
index 74e5670..3670d28 100644
--- a/package/keyutils/keyutils-05-fix-install-rule.patch
+++ b/package/keyutils/keyutils-02-fix-install-rule.patch
@@ -3,17 +3,18 @@ Makefile: fix install rule
 Do not link the .so with an absolute path, otherwise it may point to
 the host library.
 
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Based on the former patch by Yann E. MORIN.
 
-diff -durN keyutils-1.5.5.orig/Makefile keyutils-1.5.5/Makefile
---- keyutils-1.5.5.orig/Makefile	2012-10-22 20:11:57.188548033 +0200
-+++ keyutils-1.5.5/Makefile	2012-10-22 20:14:40.868236838 +0200
-@@ -127,7 +127,7 @@
+Signed-off-by: Vicente Olivert Riera <vincent.riera@imgtec.com>
+
+--- keyutils-1.5.9/Makefile.orig	2014-09-22 16:13:41.593562765 +0100
++++ keyutils-1.5.9/Makefile	2014-09-22 16:14:05.377963952 +0100
+@@ -168,7 +168,7 @@ ifeq ($(NO_SOLIB),0)
  	$(INSTALL) -D $(LIBNAME) $(DESTDIR)$(LIBDIR)/$(LIBNAME)
  	$(LNS) $(LIBNAME) $(DESTDIR)$(LIBDIR)/$(SONAME)
  	mkdir -p $(DESTDIR)$(USRLIBDIR)
 -	$(LNS) $(LIBDIR)/$(SONAME) $(DESTDIR)$(USRLIBDIR)/$(DEVELLIB)
 +	$(LNS) $(SONAME) $(DESTDIR)$(USRLIBDIR)/$(DEVELLIB)
+ endif
  	$(INSTALL) -D keyctl $(DESTDIR)$(BINDIR)/keyctl
  	$(INSTALL) -D request-key $(DESTDIR)$(SBINDIR)/request-key
- 	$(INSTALL) -D request-key-debug.sh $(DESTDIR)$(SHAREDIR)/request-key-debug.sh
diff --git a/package/keyutils/keyutils-04-Makefile-for-buildroot.patch b/package/keyutils/keyutils-04-Makefile-for-buildroot.patch
index e10abd5..1e19f77 100644
--- a/package/keyutils/keyutils-04-Makefile-for-buildroot.patch
+++ b/package/keyutils/keyutils-04-Makefile-for-buildroot.patch
@@ -1,58 +1,12 @@
-diff -durN keyutils-1.5.5.orig/Makefile keyutils-1.5.5/Makefile
---- keyutils-1.5.5.orig/Makefile	2011-11-30 16:27:43.000000000 +0100
-+++ keyutils-1.5.5/Makefile	2012-08-14 17:06:07.064412101 +0200
-@@ -1,7 +1,5 @@
--CPPFLAGS	:= -I.
--CFLAGS		:= -g -Wall -Werror
--INSTALL		:= install
--DESTDIR		:=
-+CPPFLAGS	+= -I.
-+CFLAGS		+= -g -Wall -Werror
- SPECFILE	:= keyutils.spec
- NO_GLIBC_KEYERR	:= 0
- NO_ARLIB	:= 0
-@@ -14,7 +12,7 @@
- MAN5		:= /usr/share/man/man5
- MAN8		:= /usr/share/man/man8
- INCLUDEDIR	:= /usr/include
--LNS		:= ln -sf
-+LNS		:= $(LN) -sf
- 
- ###############################################################################
- #
-@@ -48,29 +46,6 @@
- 
- ###############################################################################
- #
--# Guess at the appropriate lib directory and word size
--#
--###############################################################################
--LIBDIR		:= $(shell ldd /usr/bin/make | grep '\(/libc\)' | sed -e 's!.*\(/.*\)/libc[.].*!\1!')
--USRLIBDIR	:= $(patsubst /lib/%,/usr/lib/%,$(LIBDIR))
--BUILDFOR	:= $(shell file /usr/bin/make | sed -e 's!.*ELF \(32\|64\)-bit.*!\1!')-bit
--
--LNS		:= ln -sf
--
--ifeq ($(BUILDFOR),32-bit)
--CFLAGS		+= -m32
--LIBDIR		:= /lib
--USRLIBDIR	:= /usr/lib
--else
--ifeq ($(BUILDFOR),64-bit)
--CFLAGS		+= -m64
--LIBDIR		:= /lib64
--USRLIBDIR	:= /usr/lib64
--endif
--endif
--
--###############################################################################
--#
- # This is necessary if glibc doesn't know about the key management error codes
- #
- ###############################################################################
-@@ -110,10 +85,10 @@
- 
- 
+Makefile: Don't call "ln" directly
+
+Signed-off-by: Vicente Olivert Riera <vincent.riera@imgtec.com>
+
+--- keyutils-1.5.9/Makefile.orig	2014-09-22 16:05:14.117007430 +0100
++++ keyutils-1.5.9/Makefile	2014-09-22 16:06:26.053219336 +0100
+@@ -123,10 +123,10 @@ endif
+ ifeq ($(NO_SOLIB),0)
+ all: $(DEVELLIB)
  $(DEVELLIB): $(SONAME)
 -	ln -sf $< $@
 +	$(LNS) $< $@
diff --git a/package/keyutils/keyutils.hash b/package/keyutils/keyutils.hash
new file mode 100644
index 0000000..21ecae5
--- /dev/null
+++ b/package/keyutils/keyutils.hash
@@ -0,0 +1,3 @@
+# From http://people.redhat.com/~dhowells/keyutils/
+md5	7f8ac985c45086b5fbcd12cecd23cf07	keyutils-1.5.9.tar.bz2
+sha1	cf040adebe25eb466760f34752f4100fd5acb5e7	keyutils-1.5.9.tar.bz2
diff --git a/package/keyutils/keyutils.mk b/package/keyutils/keyutils.mk
index 7097529..ad73016 100644
--- a/package/keyutils/keyutils.mk
+++ b/package/keyutils/keyutils.mk
@@ -4,29 +4,35 @@
 #
 ################################################################################
 
-KEYUTILS_VERSION         = 1.5.5
+KEYUTILS_VERSION         = 1.5.9
 KEYUTILS_SOURCE          = keyutils-$(KEYUTILS_VERSION).tar.bz2
 KEYUTILS_SITE            = http://people.redhat.com/~dhowells/keyutils
 KEYUTILS_LICENSE         = GPLv2+ LGPLv2.1+
 KEYUTILS_LICENSE_FILES   = LICENCE.GPL LICENCE.LGPL
 KEYUTILS_INSTALL_STAGING = YES
 
-KEYUTILS_MAKE_ENV =     \
-    INSTALL=$(INSTALL)  \
-    LIBDIR=/usr/lib     \
-    USRLIBDIR=/usr/lib  \
-    LN=$(HOSTLN)        \
+KEYUTILS_MAKE_PARAMS =                \
+    INSTALL=$(INSTALL)                \
+    LIBDIR=/usr/lib                   \
+    USRLIBDIR=/usr/lib                \
+    CFLAGS="$(TARGET_CFLAGS)"         \
+    CPPFLAGS="$(TARGET_CPPFLAGS) -I." \
+    LNS="$(HOSTLN) -sf"
+
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+KEYUTILS_MAKE_PARAMS += NO_SOLIB=1
+endif
 
 define KEYUTILS_BUILD_CMDS
-	$(KEYUTILS_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) $(KEYUTILS_MAKE_PARAMS) -C $(@D)
 endef
 
 define KEYUTILS_INSTALL_STAGING_CMDS
-	$(KEYUTILS_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
+	$(MAKE) $(KEYUTILS_MAKE_PARAMS) -C $(@D) DESTDIR=$(STAGING_DIR) install
 endef
 
 define KEYUTILS_INSTALL_TARGET_CMDS
-	$(KEYUTILS_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+	$(MAKE) $(KEYUTILS_MAKE_PARAMS) -C $(@D) DESTDIR=$(TARGET_DIR) install
 endef
 
 $(eval $(generic-package))
