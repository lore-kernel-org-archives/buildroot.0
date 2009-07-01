From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 1 Jul 2009 15:31:59 +0200
Subject: [Buildroot] [git commit] lighttpd: bump version
Message-ID: <20090701133732.E5898777FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=264b9c115d2cb9e6db3f574ae114bccc5036a669
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Closes #419.

lighttpd 1.4.23 is out, there are many bugfixes from 1.4.20 currently in
buildroot:
 *  Fix workaround for incorrect path info/scriptname if fastcgi prefix is
    ???/??? (fixes #729)
 * Finally removed spawn-fcgi
 * Fix bug with FastCGI request id overflow under high load; just use always
   id 1 as we don???t use multiplexing. (thx jgray)
 * Workaround broken operating systems: check for trailing ???/??? in filenames
   (fixes #1989)
Plus fixes from 1.4.22 and 1.4.21.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                          |    1 +
 package/lighttpd/lighttpd-1.4.20-configure.patch |   11 -----------
 package/lighttpd/lighttpd.mk                     |   20 +++++++++++++-------
 3 files changed, 14 insertions(+), 18 deletions(-)
 delete mode 100644 package/lighttpd/lighttpd-1.4.20-configure.patch

diff --git a/CHANGES b/CHANGES
index 2d646b7..88fdabf 100644
--- a/CHANGES
+++ b/CHANGES
@@ -15,6 +15,7 @@
 	#395: gst-plugins-bad: New package
 	#409: Bump php package to 5.2.10
 	#411: ipsec-tools: Bump version to 0.7.2
+	#419: Bump lighttpd package to 1.4.23
 
 2009.05, Released June 1st, 2009:
 
diff --git a/package/lighttpd/lighttpd-1.4.20-configure.patch b/package/lighttpd/lighttpd-1.4.20-configure.patch
deleted file mode 100644
index ecbacd3..0000000
--- a/package/lighttpd/lighttpd-1.4.20-configure.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- lighttpd-1.4.19-org/configure	2008-03-10 21:46:12.000000000 +0000
-+++ lighttpd-1.4.19/configure	2008-03-31 06:58:41.000000000 +0000
-@@ -23971,7 +23971,7 @@
- { echo "$as_me:$LINENO: result: $WITH_PCRE" >&5
- echo "${ECHO_T}$WITH_PCRE" >&6; }
- 
--if test "x$cross_compiling" = xno -a "$WITH_PCRE" != "no"; then
-+if test "$WITH_PCRE" != "no"; then
-   # Extract the first word of "pcre-config", so it can be a program name with args.
- set dummy pcre-config; ac_word=$2
- { echo "$as_me:$LINENO: checking for $ac_word" >&5
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 7f5a630..e842c60 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -3,13 +3,12 @@
 # lighttpd
 #
 #############################################################
-LIGHTTPD_VERSION:=1.4.20
-LIGHTTPD_SOURCE:=lighttpd-$(LIGHTTPD_VERSION).tar.bz2
-LIGHTTPD_SITE:=http://www.lighttpd.net/download
-LIGHTTPD_INSTALL_STAGING = NO
-LIGHTTPD_INSTALL_TARGET = YES
+
+LIGHTTPD_VERSION = 1.4.23
+LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.bz2
+LIGHTTPD_SITE = http://www.lighttpd.net/download
+LIGHTTPD_LIBTOOL_PATCH = NO
 LIGHTTPD_DEPENDENCIES = uclibc
-LIGHTTPD_CONF_ENV =
 
 ifneq ($(BR2_LARGEFILE),y)
 LIGHTTPD_LFS:=$(DISABLE_LARGEFILE) --disable-lfs
@@ -45,7 +44,7 @@ LIGHTTPD_CONF_OPT += --without-bzip2
 endif
 
 ifeq ($(BR2_PACKAGE_LIGHTTPD_PCRE),y)
-LIGHTTPD_CONF_ENV += PCRE_LIB="-lpcre"
+LIGHTTPD_CONF_ENV = PCRE_LIB="-lpcre"
 LIGHTTPD_DEPENDENCIES += pcre
 LIGHTTPD_CONF_OPT += --with-pcre
 else
@@ -53,3 +52,10 @@ LIGHTTPD_CONF_OPT += --without-pcre
 endif
 
 $(eval $(call AUTOTARGETS,package,lighttpd))
+
+$(LIGHTTPD_TARGET_UNINSTALL):
+	$(call MESSAGE,"Uninstalling")
+	rm -f $(TARGET_DIR)/usr/sbin/lighttpd
+	rm -f $(TARGET_DIR)/usr/sbin/lighttpd-angel
+	rm -rf $(TARGET_DIR)/usr/lib/lighttpd
+	rm -f $(LIGHTTPD_TARGET_INSTALL_TARGET) $(LIGHTTPD_HOOK_POST_INSTALL)
-- 
1.6.3.3
