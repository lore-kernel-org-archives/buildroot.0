From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 24 Jul 2017 20:48:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/keyutils: bump version to 1.5.10
Message-ID: <20170724184814.24354-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream does not provide hashes anymore, replace with self-computed
sha256 hash.

Removed patches applied upstream, renumbered remaining patches:

0001-allow-building-of-the-shared-library-to-be-suppressed.patch
https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/keyutils.git/commit/?id=a4deb71ddc05e951c8be8d46615beed9d408a5c8

0004-Makefile-for-buildroot.patch
https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/keyutils.git/commit/?id=d83b9b827c6c4bc2377dfa073cf5c837b87465e8

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...ng-of-the-shared-library-to-be-suppressed.patch | 104 ---------------------
 ...tall-rule.patch => 0001-fix-install-rule.patch} |   0
 .../keyutils/{0003-cifs.patch => 0002-cifs.patch}  |   0
 ...tch => 0003-Add-missing-limits.h-include.patch} |   0
 package/keyutils/0004-Makefile-for-buildroot.patch |  19 ----
 package/keyutils/keyutils.hash                     |   5 +-
 package/keyutils/keyutils.mk                       |   2 +-
 7 files changed, 3 insertions(+), 127 deletions(-)
 delete mode 100644 package/keyutils/0001-allow-building-of-the-shared-library-to-be-suppressed.patch
 rename package/keyutils/{0002-fix-install-rule.patch => 0001-fix-install-rule.patch} (100%)
 rename package/keyutils/{0003-cifs.patch => 0002-cifs.patch} (100%)
 rename package/keyutils/{0005-Add-missing-limits.h-include.patch => 0003-Add-missing-limits.h-include.patch} (100%)
 delete mode 100644 package/keyutils/0004-Makefile-for-buildroot.patch

diff --git a/package/keyutils/0001-allow-building-of-the-shared-library-to-be-suppressed.patch b/package/keyutils/0001-allow-building-of-the-shared-library-to-be-suppressed.patch
deleted file mode 100644
index 88d32b0cf..000000000
--- a/package/keyutils/0001-allow-building-of-the-shared-library-to-be-suppressed.patch
+++ /dev/null
@@ -1,104 +0,0 @@
-keyutils: Allow building of the shared library to be suppressed
-
-Upstream patch:
-  https://kernel.googlesource.com/pub/scm/linux/kernel/git/dhowells/keyutils/+/a4deb71ddc05e951c8be8d46615beed9d408a5c8
-
-Signed-off-by: Vicente Olivert Riera <vincent.riera@imgtec.com>
-
-LIB: Allow building of the shared library to be suppressed
-
-Allow building of the shared library to be suppressed by passing NO_SOLIB=1 to
-the Makefile.
-
-Reported-and-tested-by: Vicente Olivert Riera <vincent.riera@imgtec.com>
-Signed-off-by: David Howells <dhowells@redhat.com>
-diff --git a/Makefile b/Makefile
-index c904eaf..5dd2113 100644
---- a/Makefile
-+++ b/Makefile
-@@ -5,6 +5,7 @@
- SPECFILE	:= keyutils.spec
- NO_GLIBC_KEYERR	:= 0
- NO_ARLIB	:= 0
-+NO_SOLIB	:= 0
- ETCDIR		:= /etc
- BINDIR		:= /bin
- SBINDIR		:= /sbin
-@@ -95,7 +96,7 @@
- # Normal build rule
- #
- ###############################################################################
--all: $(DEVELLIB) keyctl request-key key.dns_resolver
-+all: keyctl request-key key.dns_resolver
- 
- ###############################################################################
- #
-@@ -104,20 +105,23 @@
- ###############################################################################
- #RPATH = -Wl,-rpath,$(LIBDIR)
- 
--ifeq ($(NO_ARLIB),0)
--all: $(ARLIB)
--$(ARLIB): keyutils.o
--	$(AR) rcs $@ $<
--endif
--
- VCPPFLAGS	:= -DPKGBUILD="\"$(shell date -u +%F)\""
- VCPPFLAGS	+= -DPKGVERSION="\"keyutils-$(VERSION)\""
- VCPPFLAGS	+= -DAPIVERSION="\"libkeyutils-$(APIVERSION)\""
- 
-+ifeq ($(NO_ARLIB),0)
-+all: $(ARLIB)
-+$(ARLIB): keyutils.o
-+	$(AR) rcs $@ $<
-+
- keyutils.o: keyutils.c keyutils.h Makefile
- 	$(CC) $(CPPFLAGS) $(VCPPFLAGS) $(CFLAGS) -UNO_GLIBC_KEYERR -o $@ -c $<
-+LIB_DEPENDENCY	:= libkeyutils.a
-+endif
- 
- 
-+ifeq ($(NO_SOLIB),0)
-+all: $(DEVELLIB)
- $(DEVELLIB): $(SONAME)
- 	ln -sf $< $@
- 
-@@ -131,6 +135,8 @@
- 
- keyutils.os: keyutils.c keyutils.h Makefile
- 	$(CC) $(CPPFLAGS) $(VCPPFLAGS) $(CFLAGS) -fPIC -o $@ -c $<
-+LIB_DEPENDENCY	:= $(DEVELLIB)
-+endif
- 
- ###############################################################################
- #
-@@ -140,13 +146,13 @@
- %.o: %.c keyutils.h Makefile
- 	$(CC) $(CPPFLAGS) $(CFLAGS) -o $@ -c $<
- 
--keyctl: keyctl.o $(DEVELLIB)
-+keyctl: keyctl.o $(LIB_DEPENDENCY)
- 	$(CC) -L. $(CFLAGS) $(LDFLAGS) $(RPATH) -o $@ $< -lkeyutils
- 
--request-key: request-key.o $(DEVELLIB)
-+request-key: request-key.o $(LIB_DEPENDENCY)
- 	$(CC) -L. $(CFLAGS) $(LDFLAGS) $(RPATH) -o $@ $< -lkeyutils
- 
--key.dns_resolver: key.dns_resolver.o $(DEVELLIB)
-+key.dns_resolver: key.dns_resolver.o $(LIB_DEPENDENCY)
- 	$(CC) -L. $(CFLAGS) $(LDFLAGS) $(RPATH) -o $@ $< -lkeyutils -lresolv
- 
- ###############################################################################
-@@ -158,10 +164,12 @@
- ifeq ($(NO_ARLIB),0)
- 	$(INSTALL) -D -m 0644 $(ARLIB) $(DESTDIR)$(USRLIBDIR)/$(ARLIB)
- endif
-+ifeq ($(NO_SOLIB),0)
- 	$(INSTALL) -D $(LIBNAME) $(DESTDIR)$(LIBDIR)/$(LIBNAME)
- 	$(LNS) $(LIBNAME) $(DESTDIR)$(LIBDIR)/$(SONAME)
- 	mkdir -p $(DESTDIR)$(USRLIBDIR)
- 	$(LNS) $(LIBDIR)/$(SONAME) $(DESTDIR)$(USRLIBDIR)/$(DEVELLIB)
-+endif
- 	$(INSTALL) -D keyctl $(DESTDIR)$(BINDIR)/keyctl
- 	$(INSTALL) -D request-key $(DESTDIR)$(SBINDIR)/request-key
- 	$(INSTALL) -D request-key-debug.sh $(DESTDIR)$(SHAREDIR)/request-key-debug.sh
diff --git a/package/keyutils/0002-fix-install-rule.patch b/package/keyutils/0001-fix-install-rule.patch
similarity index 100%
rename from package/keyutils/0002-fix-install-rule.patch
rename to package/keyutils/0001-fix-install-rule.patch
diff --git a/package/keyutils/0003-cifs.patch b/package/keyutils/0002-cifs.patch
similarity index 100%
rename from package/keyutils/0003-cifs.patch
rename to package/keyutils/0002-cifs.patch
diff --git a/package/keyutils/0005-Add-missing-limits.h-include.patch b/package/keyutils/0003-Add-missing-limits.h-include.patch
similarity index 100%
rename from package/keyutils/0005-Add-missing-limits.h-include.patch
rename to package/keyutils/0003-Add-missing-limits.h-include.patch
diff --git a/package/keyutils/0004-Makefile-for-buildroot.patch b/package/keyutils/0004-Makefile-for-buildroot.patch
deleted file mode 100644
index 1e19f77dc..000000000
--- a/package/keyutils/0004-Makefile-for-buildroot.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Makefile: Don't call "ln" directly
-
-Signed-off-by: Vicente Olivert Riera <vincent.riera@imgtec.com>
-
---- keyutils-1.5.9/Makefile.orig	2014-09-22 16:05:14.117007430 +0100
-+++ keyutils-1.5.9/Makefile	2014-09-22 16:06:26.053219336 +0100
-@@ -123,10 +123,10 @@ endif
- ifeq ($(NO_SOLIB),0)
- all: $(DEVELLIB)
- $(DEVELLIB): $(SONAME)
--	ln -sf $< $@
-+	$(LNS) $< $@
- 
- $(SONAME): $(LIBNAME)
--	ln -sf $< $@
-+	$(LNS) $< $@
- 
- LIBVERS := -shared -Wl,-soname,$(SONAME) -Wl,--version-script,version.lds
- 
diff --git a/package/keyutils/keyutils.hash b/package/keyutils/keyutils.hash
index 21ecae515..b14b7bec1 100644
--- a/package/keyutils/keyutils.hash
+++ b/package/keyutils/keyutils.hash
@@ -1,3 +1,2 @@
-# From http://people.redhat.com/~dhowells/keyutils/
-md5	7f8ac985c45086b5fbcd12cecd23cf07	keyutils-1.5.9.tar.bz2
-sha1	cf040adebe25eb466760f34752f4100fd5acb5e7	keyutils-1.5.9.tar.bz2
+# Locally computed
+sha256 115c3deae7f181778fd0e0ffaa2dad1bf1fe2f5677cf2e0e348cdb7a1c93afb6  keyutils-1.5.10.tar.bz2
diff --git a/package/keyutils/keyutils.mk b/package/keyutils/keyutils.mk
index 0e725d155..048b6894d 100644
--- a/package/keyutils/keyutils.mk
+++ b/package/keyutils/keyutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KEYUTILS_VERSION = 1.5.9
+KEYUTILS_VERSION = 1.5.10
 KEYUTILS_SOURCE = keyutils-$(KEYUTILS_VERSION).tar.bz2
 KEYUTILS_SITE = http://people.redhat.com/~dhowells/keyutils
 KEYUTILS_LICENSE = GPL-2.0+, LGPL-2.1+
-- 
2.11.0
