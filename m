From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Oct 2020 21:47:54 +0200
Subject: [Buildroot] [git commit] package/nut: use pkg-config to find gd
Message-ID: <20201008193720.5E13D8EB59@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dbdcf5c76f98eda8aa388ed5548278190e59dd56
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop gdlib-config and use pkg-config to find gd because gdlib-config
has been dropped from version 2.3.0

gdlib.pc is available since version 2.1.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ibgd.m4-try-to-find-gd-through-pkg-config.patch | 120 +++++++++++++++++++++
 package/nut/nut.mk                                 |   4 +-
 2 files changed, 121 insertions(+), 3 deletions(-)

diff --git a/package/nut/0004-nut_check_libgd.m4-try-to-find-gd-through-pkg-config.patch b/package/nut/0004-nut_check_libgd.m4-try-to-find-gd-through-pkg-config.patch
new file mode 100644
index 0000000000..3c4a88b47b
--- /dev/null
+++ b/package/nut/0004-nut_check_libgd.m4-try-to-find-gd-through-pkg-config.patch
@@ -0,0 +1,120 @@
+From cb507c44d26d8ae04a0cc3d1c24e79e3bf33ba23 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 29 Jul 2020 22:51:54 +0200
+Subject: [PATCH] nut_check_libgd.m4: try to find gd through pkg-config
+
+gdlib-config has been dropped from version 2.3.0 with
+https://github.com/libgd/libgd/commit/d62f608c7c4a814c70d4ba777725e3e62d9e2cde
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/networkupstools/nut/commit/cb507c44d26d8ae04a0cc3d1c24e79e3bf33ba23]
+---
+ m4/nut_check_libgd.m4 | 88 ++++++++++++++++++++++++-------------------
+ 1 file changed, 50 insertions(+), 38 deletions(-)
+
+diff --git a/m4/nut_check_libgd.m4 b/m4/nut_check_libgd.m4
+index 73f4da76d..c4e96761c 100644
+--- a/m4/nut_check_libgd.m4
++++ b/m4/nut_check_libgd.m4
+@@ -12,50 +12,62 @@ if test -z "${nut_have_libgd_seen}"; then
+ 	LDFLAGS_ORIG="${LDFLAGS}"
+ 	LIBS_ORIG="${LIBS}"
+ 
+-	dnl Initial defaults. These are only used if gdlib-config is
+-	dnl unusable and the user fails to pass better values in --with
+-	dnl arguments
+-	CFLAGS=""
+-	LDFLAGS="-L/usr/X11R6/lib"
+-	LIBS="-lgd -lpng -lz -ljpeg -lfreetype -lm -lXpm -lX11"
++	AC_MSG_CHECKING(for gd version via pkg-config)
++	GD_VERSION="`pkg-config --silence-errors --modversion gdlib 2>/dev/null`"
++	if test "$?" = "0" -a -n "${GD_VERSION}"; then
++		CFLAGS="`pkg-config --silence-errors --cflags gdlib 2>/dev/null`"
++		LIBS="`pkg-config --silence-errors --libs gdlib 2>/dev/null`"
++	else
++		GD_VERSION="none"
++	fi
++	AC_MSG_RESULT(${GD_VERSION} found)
+ 
+-	dnl By default seek in PATH
+-	GDLIB_CONFIG=gdlib-config
+-	AC_ARG_WITH(gdlib-config,
+-		AS_HELP_STRING([@<:@--with-gdlib-config=/path/to/gdlib-config@:>@],
+-			[path to program that reports GDLIB configuration]),
+-	[
+-		case "${withval}" in
+-		"") ;;
+-		yes|no)
+-			AC_MSG_ERROR(invalid option --with(out)-gdlib-config - see docs/configure.txt)
++	if test "${GD_VERSION}" = "none"; then
++		dnl Initial defaults. These are only used if gdlib-config is
++		dnl unusable and the user fails to pass better values in --with
++		dnl arguments
++		CFLAGS=""
++		LDFLAGS="-L/usr/X11R6/lib"
++		LIBS="-lgd -lpng -lz -ljpeg -lfreetype -lm -lXpm -lX11"
++
++		dnl By default seek in PATH
++		GDLIB_CONFIG=gdlib-config
++		AC_ARG_WITH(gdlib-config,
++			AS_HELP_STRING([@<:@--with-gdlib-config=/path/to/gdlib-config@:>@],
++				[path to program that reports GDLIB configuration]),
++		[
++			case "${withval}" in
++			"") ;;
++			yes|no)
++				AC_MSG_ERROR(invalid option --with(out)-gdlib-config - see docs/configure.txt)
++				;;
++			*)
++				GDLIB_CONFIG="${withval}"
++				;;
++			esac
++		])
++
++		AC_MSG_CHECKING(for gd version via ${GDLIB_CONFIG})
++		GD_VERSION=`${GDLIB_CONFIG} --version 2>/dev/null`
++		if test "$?" != "0" -o -z "${GD_VERSION}"; then
++			GD_VERSION="none"
++		fi
++		AC_MSG_RESULT(${GD_VERSION} found)
++
++		case "${GD_VERSION}" in
++		none)
++			;;
++		2.0.5 | 2.0.6 | 2.0.7)
++			AC_MSG_WARN([[gd ${GD_VERSION} detected, unable to use ${GDLIB_CONFIG} script]])
++			AC_MSG_WARN([[If gd detection fails, upgrade gd or use --with-gd-includes and --with-gd-libs]])
+ 			;;
+ 		*)
+-			GDLIB_CONFIG="${withval}"
++			CFLAGS="`${GDLIB_CONFIG} --includes 2>/dev/null`"
++			LDFLAGS="`${GDLIB_CONFIG} --ldflags 2>/dev/null`"
++			LIBS="`${GDLIB_CONFIG} --libs 2>/dev/null`"
+ 			;;
+ 		esac
+-	])
+-
+-	AC_MSG_CHECKING(for gd version via ${GDLIB_CONFIG})
+-	GD_VERSION=`${GDLIB_CONFIG} --version 2>/dev/null`
+-	if test "$?" != "0" -o -z "${GD_VERSION}"; then
+-		GD_VERSION="none"
+ 	fi
+-	AC_MSG_RESULT(${GD_VERSION} found)
+-
+-	case "${GD_VERSION}" in
+-	none)
+-		;;
+-	2.0.5 | 2.0.6 | 2.0.7)
+-		AC_MSG_WARN([[gd ${GD_VERSION} detected, unable to use ${GDLIB_CONFIG} script]])
+-		AC_MSG_WARN([[If gd detection fails, upgrade gd or use --with-gd-includes and --with-gd-libs]])
+-		;;
+-	*)
+-		CFLAGS="`${GDLIB_CONFIG} --includes 2>/dev/null`"
+-		LDFLAGS="`${GDLIB_CONFIG} --ldflags 2>/dev/null`"
+-		LIBS="`${GDLIB_CONFIG} --libs 2>/dev/null`"
+-		;;
+-	esac
+ 
+ 	dnl Now allow overriding gd settings if the user knows best
+ 	AC_MSG_CHECKING(for gd include flags)
diff --git a/package/nut/nut.mk b/package/nut/nut.mk
index 593d19926a..ad575310f5 100644
--- a/package/nut/nut.mk
+++ b/package/nut/nut.mk
@@ -46,9 +46,7 @@ endif
 # gd with support for png is required for the CGI
 ifeq ($(BR2_PACKAGE_GD)$(BR2_PACKAGE_LIBPNG),yy)
 NUT_DEPENDENCIES += gd libpng
-NUT_CONF_OPTS += \
-	--with-cgi \
-	--with-gdlib-config=$(STAGING_DIR)/usr/bin/gdlib-config
+NUT_CONF_OPTS += --with-cgi
 else
 NUT_CONF_OPTS += --without-cgi
 endif
