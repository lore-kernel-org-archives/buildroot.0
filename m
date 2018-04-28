From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Apr 2018 23:09:05 +0200
Subject: [Buildroot] [git commit] uclibc: update to 1.0.30
Message-ID: <20180428210916.17C998641C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6c4e9a2486f3c598d043eeb59393f226d11282f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patches are upstream.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...0001-utils-fix-compile-of-msgfmt-msgmerge.patch | 48 ----------------------
 ...dd-F_-DUPFD_CLOEXEC-SETPIPE_SZ-GETPIPE_SZ.patch | 36 ----------------
 package/uclibc/uclibc.hash                         |  2 +-
 package/uclibc/uclibc.mk                           |  2 +-
 4 files changed, 2 insertions(+), 86 deletions(-)

diff --git a/package/uclibc/0001-utils-fix-compile-of-msgfmt-msgmerge.patch b/package/uclibc/0001-utils-fix-compile-of-msgfmt-msgmerge.patch
deleted file mode 100644
index 968d682127..0000000000
--- a/package/uclibc/0001-utils-fix-compile-of-msgfmt-msgmerge.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 01e9f2f202a0afc658bfd82c0ff1770de7900bb1 Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@uclibc-ng.org>
-Date: Mon, 5 Mar 2018 20:29:56 +0100
-Subject: [PATCH] utils: fix compile of msgfmt/msgmerge
-
-The host utils are missing the dependencies, the target
-utils need libiconv enabled.
-
-Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
----
- utils/Makefile.in | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/utils/Makefile.in b/utils/Makefile.in
-index 99241845f..2f8d1c96a 100644
---- a/utils/Makefile.in
-+++ b/utils/Makefile.in
-@@ -83,7 +83,9 @@ utils_OUT := $(top_builddir)utils
- DEPS-ldconfig := $(utils_DIR)/chroot_realpath.c
- DEPS-ldconfig.host := $(DEPS-ldconfig)
- DEPS-msgfmt := $(utils_DIR)/poparser.c $(utils_DIR)/StringEscape.c
-+DEPS-msgfmt.host := $(DEPS-msgfmt)
- DEPS-msgmerge := $(utils_DIR)/poparser.c $(utils_DIR)/StringEscape.c
-+DEPS-msgmerge.host := $(DEPS-msgmerge)
- 
- utils_OBJ := getconf
- ifeq ($(HAVE_SHARED),y)
-@@ -96,7 +98,7 @@ utils_OBJ += iconv
- utils_LOCALE_OBJ += $(utils_OUT)/locale
- endif
- 
--ifeq ($(UCLIBC_HAS_LIBINTL),y)
-+ifeq ($(UCLIBC_HAS_LIBINTL)$(UCLIBC_HAS_LIBICONV),yy)
- utils_OBJ += msgfmt msgmerge
- endif
- 
-@@ -141,7 +143,7 @@ ifeq ($(UCLIBC_HAS_LOCALE),y)
- 	$(Q)$(INSTALL) -m 755 $(utils_OUT)/iconv$(DOTHOST) $(PREFIX)$(DEVEL_PREFIX)bin/iconv
- 	$(Q)$(INSTALL) -m 755 $(utils_OUT)/locale$(DOTHOST) $(PREFIX)$(DEVEL_PREFIX)bin/locale
- endif
--ifeq ($(UCLIBC_HAS_LIBINTL),y)
-+ifeq ($(UCLIBC_HAS_LIBINTL)$(UCLIBC_HAS_LIBICONV),yy)
- 	$(Q)$(INSTALL) -m 755 $(utils_OUT)/msgmerge$(DOTHOST) $(PREFIX)$(DEVEL_PREFIX)bin/msgmerge
- 	$(Q)$(INSTALL) -m 755 $(utils_OUT)/msgfmt$(DOTHOST) $(PREFIX)$(DEVEL_PREFIX)bin/msgfmt
- 	$(Q)$(INSTALL) -m 755 $(utils_OUT)/xgettext $(PREFIX)$(DEVEL_PREFIX)bin
--- 
-2.16.1
-
diff --git a/package/uclibc/0002-or1k-add-F_-DUPFD_CLOEXEC-SETPIPE_SZ-GETPIPE_SZ.patch b/package/uclibc/0002-or1k-add-F_-DUPFD_CLOEXEC-SETPIPE_SZ-GETPIPE_SZ.patch
deleted file mode 100644
index b81c5921b9..0000000000
--- a/package/uclibc/0002-or1k-add-F_-DUPFD_CLOEXEC-SETPIPE_SZ-GETPIPE_SZ.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From f42d18f06084b6db90c104fb5404a91602e9b904 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Thu, 12 Apr 2018 23:24:59 +0200
-Subject: [PATCH] or1k: add F_{DUPFD_CLOEXEC, SETPIPE_SZ, GETPIPE_SZ}
-
-Those definitions exist on all other architectures, but were not
-present in or1k specific headers when or1k support was merged.
-
-On the kernel side, their support is completely architecture
-independent, so we just need those definitions to make those fcntl()
-calls available on or1k.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Upstream-status: https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=f42d18f06084b6db90c104fb5404a91602e9b904
----
- libc/sysdeps/linux/or1k/bits/fcntl.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/libc/sysdeps/linux/or1k/bits/fcntl.h b/libc/sysdeps/linux/or1k/bits/fcntl.h
-index bd6a8c511..a82ede424 100644
---- a/libc/sysdeps/linux/or1k/bits/fcntl.h
-+++ b/libc/sysdeps/linux/or1k/bits/fcntl.h
-@@ -102,6 +102,10 @@
- # define F_SETLEASE	1024	/* Set a lease.	 */
- # define F_GETLEASE	1025	/* Enquire what lease is active.  */
- # define F_NOTIFY	1026	/* Request notfications on a directory.	 */
-+# define F_DUPFD_CLOEXEC 1030	/* Duplicate file descriptor with
-+				   close-on-exit set on new fd.  */
-+# define F_SETPIPE_SZ	1031    /* Set pipe page size array.  */
-+# define F_GETPIPE_SZ	1032    /* Get pipe page size array.  */
- #endif
- 
- /* For F_[GET|SET]FL.  */
--- 
-2.14.3
-
diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index 14f71d0fbb..81936f3639 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -1,2 +1,2 @@
 # From https://uclibc-ng.org/
-sha256  e014e34abb13e97ca81694927f8ba95484cca2d3abac64b71f1a7981a96cb99c        uClibc-ng-1.0.29.tar.xz
+sha256  992bd9a2889ea385902b87e3d3d30603741eb16728288fbf537ff2027f770496        uClibc-ng-1.0.30.tar.xz
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index afcf7deb82..7de9219873 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UCLIBC_VERSION = 1.0.29
+UCLIBC_VERSION = 1.0.30
 UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
 UCLIBC_SITE = http://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
 UCLIBC_LICENSE = LGPL-2.1+
