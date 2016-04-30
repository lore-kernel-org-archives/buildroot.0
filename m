From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Date: Sat, 30 Apr 2016 09:49:09 +0200
Subject: [Buildroot] [PATCH 13/34] reproducibility/libtool: fix
	reproducibility issues
In-Reply-To: <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160430074358.GE1781@hermes.click-hack.org>
 <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <1462002570-14706-13-git-send-email-gilles.chanteperdrix@xenomai.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- remove libtool and libtoolize; they are full of references to the
  build environment tools, and unlikely to be needed on target;
- do not use /etc/ld.so.conf contents in libtool search path: they are
  not relevant on target, and cause a useless dependency of libltdl
  on the build environment.
---
 package/libtool/0001-fix-cross-compilation.patch | 11 +++++++++++
 package/libtool/libtool.mk                       |  8 ++++++--
 2 files changed, 17 insertions(+), 2 deletions(-)
 create mode 100644 package/libtool/0001-fix-cross-compilation.patch

diff --git a/package/libtool/0001-fix-cross-compilation.patch b/package/libtool/0001-fix-cross-compilation.patch
new file mode 100644
index 0000000..c203371
--- /dev/null
+++ b/package/libtool/0001-fix-cross-compilation.patch
@@ -0,0 +1,11 @@
+--- libtool-2.4.6/m4/libtool.m4~	2015-01-20 17:15:19.000000000 +0100
++++ libtool-2.4.6/m4/libtool.m4	2016-02-27 21:02:21.513684396 +0100
+@@ -2873,7 +2873,7 @@ linux* | k*bsd*-gnu | kopensolaris*-gnu
+   # 'ldconfig -N -X -v | grep ^/' on 64bit Fedora does not report /usr/lib64,
+   # even though it is searched at run-time.  Try to do the best guess by
+   # appending ld.so.conf contents (and includes) to the search path.
+-  if test -f /etc/ld.so.conf; then
++  if test "$cross_compiling" != "yes" -a -f /etc/ld.so.conf; then
+     lt_ld_extra=`awk '/^include / { system(sprintf("cd /etc; cat %s 2>/dev/null", \[$]2)); skip = 1; } { if (!skip) print \[$]0; skip = 0; }' < /etc/ld.so.conf | $SED -e 's/#.*//;/^[	 ]*hwcap[	 ]/d;s/[:,	]/ /g;s/=[^=]*$//;s/=[^= ]* / /g;s/"//g;/^$/d' | tr '\n' ' '`
+     sys_lib_dlsearch_path_spec="/lib /usr/lib $lt_ld_extra"
+   fi
diff --git a/package/libtool/libtool.mk b/package/libtool/libtool.mk
index 8688f8b..c177626 100644
--- a/package/libtool/libtool.mk
+++ b/package/libtool/libtool.mk
@@ -8,7 +8,7 @@ LIBTOOL_VERSION = 2.4.6
 LIBTOOL_SOURCE = libtool-$(LIBTOOL_VERSION).tar.xz
 LIBTOOL_SITE = $(BR2_GNU_MIRROR)/libtool
 LIBTOOL_INSTALL_STAGING = YES
-LIBTOOL_CONF_ENV = HELP2MAN=true
+LIBTOOL_CONF_OPTS = HELP2MAN=true
 LIBTOOL_DEPENDENCIES = host-m4
 LIBTOOL_LICENSE = GPLv2+
 LIBTOOL_LICENSE_FILES = COPYING
@@ -33,9 +33,13 @@ define LIBTOOL_AVOID_AUTORECONF_HOOK
 	find $(@D) -name configure -exec touch '{}' \;
 	find $(@D) -name Makefile.in -exec touch '{}' \;
 endef
-LIBTOOL_PRE_CONFIGURE_HOOKS += LIBTOOL_AVOID_AUTORECONF_HOOK
 HOST_LIBTOOL_PRE_CONFIGURE_HOOKS += LIBTOOL_AVOID_AUTORECONF_HOOK
 
+define LIBTOOL_REMOVE_LIBTOOL
+	rm $(TARGET_DIR)/usr/bin/libtool $(TARGET_DIR)/usr/bin/libtoolize
+endef
+LIBTOOL_POST_INSTALL_TARGET_HOOKS += LIBTOOL_REMOVE_LIBTOOL
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
-- 
2.7.4
