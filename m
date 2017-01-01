From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  1 Jan 2017 10:00:56 +0100
Subject: [Buildroot] [PATCHv2] package/nut: bump version
Message-ID: <1483261256-18816-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update our patches:
  - drop patch 1, replaced by an upstream equivalent; adapt config
    options and env accordingly,
  - drop patch 2, applied upstream,
  - rename patch 3

gdlib-config and net-snmp-config are only used when said support is
enabled (resp. CGI and SNMP), so no need to pass them unconditionally.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Changes v1 -> v2:
  - add missing SoB lines in patch 0001
  - fix commit title
---
 ...stomize-path-to-gdlib-config-and-net-snmp.patch | 153 +++++++++++++++++++++
 package/nut/0001-foo-config.patch                  |  72 ----------
 ...h => 0002-client-ups-add-missing-include.patch} |   2 +-
 package/nut/0002-parallel-build.patch              |  24 ----
 package/nut/nut.hash                               |   2 +-
 package/nut/nut.mk                                 |  14 +-
 6 files changed, 162 insertions(+), 105 deletions(-)
 create mode 100644 package/nut/0001-Allow-to-customize-path-to-gdlib-config-and-net-snmp.patch
 delete mode 100644 package/nut/0001-foo-config.patch
 rename package/nut/{0003-client-ups-add-missing-include.patch => 0002-client-ups-add-missing-include.patch} (90%)
 delete mode 100644 package/nut/0002-parallel-build.patch

diff --git a/package/nut/0001-Allow-to-customize-path-to-gdlib-config-and-net-snmp.patch b/package/nut/0001-Allow-to-customize-path-to-gdlib-config-and-net-snmp.patch
new file mode 100644
index 0000000..308dbb1
--- /dev/null
+++ b/package/nut/0001-Allow-to-customize-path-to-gdlib-config-and-net-snmp.patch
@@ -0,0 +1,153 @@
+From 086b5fa8fe4ba74404e92b5f838263dfcf9f173d Mon Sep 17 00:00:00 2001
+From: Jim Klimov <jim@jimklimov.com>
+Date: Thu, 7 Apr 2016 03:56:51 +0200
+Subject: [PATCH] Allow to customize path to gdlib-config and net-snmp-config
+ programs
+
+[yann.morin.1998 at free.fr: backport]
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+---
+Backported from upstream commit 086b5fa8fe4ba74404e92b5f838263dfcf9f173d
+---
+ docs/configure.txt         | 14 ++++++++++++++
+ m4/nut_check_libgd.m4      | 29 +++++++++++++++++++++++------
+ m4/nut_check_libnetsnmp.m4 | 25 +++++++++++++++++++++----
+ 3 files changed, 58 insertions(+), 10 deletions(-)
+
+diff --git a/docs/configure.txt b/docs/configure.txt
+index aff82c1..b3b542a 100644
+--- a/docs/configure.txt
++++ b/docs/configure.txt
+@@ -23,6 +23,13 @@ Note that you need to install the libusb development package or files.
+ Build and install the SNMP drivers (default: auto-detect)
+ Note that you need to install libsnmp development package or files.
+ 
++	--with-net-snmp-config
++
++In addition to the `--with-snmp` option above, this one allows to provide
++a custom program name (in `PATH`) or complete pathname to `net-snmp-config`.
++This may be needed on build systems which support multiple architectures,
++or in cases where your distribution names this program differently.
++
+ 	--with-neon
+ 
+ Build and install the XML drivers (default: auto-detect)
+@@ -335,6 +342,13 @@ NOTE: the --with-gd switches are not necessary if you have gd 2.0.8
+ or higher installed properly.  The gdlib-config script will be 
+ detected and used by default in that situation.
+ 
++	--with-gdlib-config
++
++This option allows to provide a custom program name (in `PATH`) or
++a complete pathname to `gdlib-config`. This may be needed on build
++systems which support multiple architectures, or in cases where your
++distribution names this program differently.
++
+ 	--with-ssl-includes, --with-usb-includes, --with-snmp-includes,
+ 	--with-neon-includes, --with-libltdl-includes,
+ 	--with-powerman-includes="-I/foo/bar"
+diff --git a/m4/nut_check_libgd.m4 b/m4/nut_check_libgd.m4
+index 01cc882..73f4da7 100644
+--- a/m4/nut_check_libgd.m4
++++ b/m4/nut_check_libgd.m4
+@@ -19,8 +19,25 @@ if test -z "${nut_have_libgd_seen}"; then
+ 	LDFLAGS="-L/usr/X11R6/lib"
+ 	LIBS="-lgd -lpng -lz -ljpeg -lfreetype -lm -lXpm -lX11"
+ 
+-	AC_MSG_CHECKING(for gd version via gdlib-config)
+-	GD_VERSION=`gdlib-config --version 2>/dev/null`
++	dnl By default seek in PATH
++	GDLIB_CONFIG=gdlib-config
++	AC_ARG_WITH(gdlib-config,
++		AS_HELP_STRING([@<:@--with-gdlib-config=/path/to/gdlib-config@:>@],
++			[path to program that reports GDLIB configuration]),
++	[
++		case "${withval}" in
++		"") ;;
++		yes|no)
++			AC_MSG_ERROR(invalid option --with(out)-gdlib-config - see docs/configure.txt)
++			;;
++		*)
++			GDLIB_CONFIG="${withval}"
++			;;
++		esac
++	])
++
++	AC_MSG_CHECKING(for gd version via ${GDLIB_CONFIG})
++	GD_VERSION=`${GDLIB_CONFIG} --version 2>/dev/null`
+ 	if test "$?" != "0" -o -z "${GD_VERSION}"; then
+ 		GD_VERSION="none"
+ 	fi
+@@ -30,13 +47,13 @@ if test -z "${nut_have_libgd_seen}"; then
+ 	none)
+ 		;;
+ 	2.0.5 | 2.0.6 | 2.0.7)
+-		AC_MSG_WARN([[gd ${GD_VERSION} detected, unable to use gdlib-config script]])
++		AC_MSG_WARN([[gd ${GD_VERSION} detected, unable to use ${GDLIB_CONFIG} script]])
+ 		AC_MSG_WARN([[If gd detection fails, upgrade gd or use --with-gd-includes and --with-gd-libs]])
+ 		;;
+ 	*)
+-		CFLAGS="`gdlib-config --includes 2>/dev/null`"
+-		LDFLAGS="`gdlib-config --ldflags 2>/dev/null`"
+-		LIBS="`gdlib-config --libs 2>/dev/null`"
++		CFLAGS="`${GDLIB_CONFIG} --includes 2>/dev/null`"
++		LDFLAGS="`${GDLIB_CONFIG} --ldflags 2>/dev/null`"
++		LIBS="`${GDLIB_CONFIG} --libs 2>/dev/null`"
+ 		;;
+ 	esac
+ 
+diff --git a/m4/nut_check_libnetsnmp.m4 b/m4/nut_check_libnetsnmp.m4
+index e1c1426..83b2633 100644
+--- a/m4/nut_check_libnetsnmp.m4
++++ b/m4/nut_check_libnetsnmp.m4
+@@ -13,9 +13,26 @@ if test -z "${nut_have_libnetsnmp_seen}"; then
+ 	CFLAGS_ORIG="${CFLAGS}"
+ 	LIBS_ORIG="${LIBS}"
+ 
++	dnl By default seek in PATH
++	NET_SNMP_CONFIG=net-snmp-config
++	AC_ARG_WITH(net-snmp-config,
++		AS_HELP_STRING([@<:@--with-net-snmp-config=/path/to/net-snmp-config@:>@],
++			[path to program that reports Net-SNMP configuration]),
++	[
++		case "${withval}" in
++		"") ;;
++		yes|no)
++			AC_MSG_ERROR(invalid option --with(out)-net-snmp-config - see docs/configure.txt)
++			;;
++		*)
++			NET_SNMP_CONFIG="${withval}"
++			;;
++		esac
++	])
++
+ 	dnl See which version of the Net-SNMP library (if any) is installed
+-	AC_MSG_CHECKING(for Net-SNMP version via net-snmp-config)
+-	SNMP_VERSION=`net-snmp-config --version 2>/dev/null`
++	AC_MSG_CHECKING(for Net-SNMP version via ${NET_SNMP_CONFIG})
++	SNMP_VERSION=`${NET_SNMP_CONFIG} --version 2>/dev/null`
+ 	if test "$?" != "0" -o -z "${SNMP_VERSION}"; then
+ 		SNMP_VERSION="none"
+ 	fi
+@@ -33,7 +50,7 @@ if test -z "${nut_have_libnetsnmp_seen}"; then
+ 			CFLAGS="${withval}"
+ 			;;
+ 		esac
+-	], [CFLAGS="`net-snmp-config --base-cflags 2>/dev/null`"])
++	], [CFLAGS="`${NET_SNMP_CONFIG} --base-cflags 2>/dev/null`"])
+ 	AC_MSG_RESULT([${CFLAGS}])
+ 
+ 	AC_MSG_CHECKING(for Net-SNMP libs)
+@@ -48,7 +65,7 @@ if test -z "${nut_have_libnetsnmp_seen}"; then
+ 			LIBS="${withval}"
+ 			;;
+ 		esac
+-	], [LIBS="`net-snmp-config --libs 2>/dev/null`"])
++	], [LIBS="`${NET_SNMP_CONFIG} --libs 2>/dev/null`"])
+ 	AC_MSG_RESULT([${LIBS}])
+ 
+ 	dnl Check if the Net-SNMP library is usable
+-- 
+2.7.4
+
diff --git a/package/nut/0001-foo-config.patch b/package/nut/0001-foo-config.patch
deleted file mode 100644
index 7202f13..0000000
--- a/package/nut/0001-foo-config.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-configure: fix calls to {gdlib,net-snmp}-config
-
-nut directly calls to {gdlib,net-snmp}-config. In Buildroot,
-those are not in the PATH, and nut would catch those of the
-system (if they are installed), or miss them entirely.
-
-Fix that by using environment variables that will tell where
-to look for them.
-
-Note: libusb also uses libusb-config, but only as a fallback
-if pkg-config fails. Since we ensure that pkg-config exists,
-and libusb is properly installed before we build nut, there
-is no need to fix the libusb-config calls, since they won't
-be called at all.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-diff -durN nut-2.6.5.orig/m4/nut_check_libgd.m4 nut-2.6.5/m4/nut_check_libgd.m4
---- nut-2.6.5.orig/m4/nut_check_libgd.m4	2012-07-31 19:38:56.000000000 +0200
-+++ nut-2.6.5/m4/nut_check_libgd.m4	2013-11-01 16:24:02.626549810 +0100
-@@ -20,7 +20,7 @@
- 	LIBS="-lgd -lpng -lz -ljpeg -lfreetype -lm -lXpm -lX11"
- 
- 	AC_MSG_CHECKING(for gd version via gdlib-config)
--	GD_VERSION=`gdlib-config --version 2>/dev/null`
-+	GD_VERSION=`${GDLIB_CONFIG} --version 2>/dev/null`
- 	if test "$?" != "0" -o -z "${GD_VERSION}"; then
- 		GD_VERSION="none"
- 	fi
-@@ -34,9 +34,9 @@
- 		AC_MSG_WARN([[If gd detection fails, upgrade gd or use --with-gd-includes and --with-gd-libs]])
- 		;;
- 	*)
--		CFLAGS="`gdlib-config --includes 2>/dev/null`"
--		LDFLAGS="`gdlib-config --ldflags 2>/dev/null`"
--		LIBS="`gdlib-config --libs 2>/dev/null`"
-+		CFLAGS="`${GDLIB_CONFIG} --includes 2>/dev/null`"
-+		LDFLAGS="`${GDLIB_CONFIG} --ldflags 2>/dev/null`"
-+		LIBS="`${GDLIB_CONFIG} --libs 2>/dev/null`"
- 		;;
- 	esac
- 
-diff -durN nut-2.6.5.orig/m4/nut_check_libnetsnmp.m4 nut-2.6.5/m4/nut_check_libnetsnmp.m4
---- nut-2.6.5.orig/m4/nut_check_libnetsnmp.m4	2012-07-31 19:38:56.000000000 +0200
-+++ nut-2.6.5/m4/nut_check_libnetsnmp.m4	2013-11-01 16:30:07.398282923 +0100
-@@ -15,7 +15,7 @@
- 
- 	dnl See which version of the Net-SNMP library (if any) is installed
- 	AC_MSG_CHECKING(for Net-SNMP version via net-snmp-config)
--	SNMP_VERSION=`net-snmp-config --version 2>/dev/null`
-+	SNMP_VERSION=`${NET_SNMP_CONFIG} --version 2>/dev/null`
- 	if test "$?" != "0" -o -z "${SNMP_VERSION}"; then
- 		SNMP_VERSION="none"
- 	fi
-@@ -33,7 +33,7 @@
- 			CFLAGS="${withval}"
- 			;;
- 		esac
--	], [CFLAGS="`net-snmp-config --base-cflags 2>/dev/null`"])
-+	], [CFLAGS="`${NET_SNMP_CONFIG} --base-cflags 2>/dev/null`"])
- 	AC_MSG_RESULT([${CFLAGS}])
- 
- 	AC_MSG_CHECKING(for Net-SNMP libs)
-@@ -48,7 +48,7 @@
- 			LIBS="${withval}"
- 			;;
- 		esac
--	], [LIBS="`net-snmp-config --libs 2>/dev/null`"])
-+	], [LIBS="`${NET_SNMP_CONFIG} --libs 2>/dev/null`"])
- 	AC_MSG_RESULT([${LIBS}])
- 
- 	dnl Check if the Net-SNMP library is usable
diff --git a/package/nut/0003-client-ups-add-missing-include.patch b/package/nut/0002-client-ups-add-missing-include.patch
similarity index 90%
rename from package/nut/0003-client-ups-add-missing-include.patch
rename to package/nut/0002-client-ups-add-missing-include.patch
index 78472cd..63fdcdc 100644
--- a/package/nut/0003-client-ups-add-missing-include.patch
+++ b/package/nut/0002-client-ups-add-missing-include.patch
@@ -7,7 +7,7 @@ struct timeval is declared in sys/time.h, so we need to #include it.
 
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 ---
-Backported from upstream.
+Backported from upstream commit da0969b26ad4bb839bcb88362c8f41aaf0eb8363
 ---
  clients/upsclient.c | 1 +
  1 file changed, 1 insertion(+)
diff --git a/package/nut/0002-parallel-build.patch b/package/nut/0002-parallel-build.patch
deleted file mode 100644
index f979c19..0000000
--- a/package/nut/0002-parallel-build.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-conf: fix parallel install
-
-Do not reference the upsmon.conf.sample twice, otherwise install, with
-a high number of make jobs, may fail, like so:
-    http://autobuild.buildroot.net/results/256/2567e13cd5bc702bc3a38a1d6fc8e34022cc7db5/build-end.log
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
----
-Upstream status:
-    https://github.com/networkupstools/nut/pull/147
-
-diff -durB nut-2.7.2.orig/conf/Makefile.am nut-2.7.2/conf/Makefile.am
---- nut-2.7.2.orig/conf/Makefile.am	2014-02-14 09:56:53.000000000 +0100
-+++ nut-2.7.2/conf/Makefile.am	2014-08-17 11:33:46.804439240 +0200
-@@ -2,7 +2,7 @@
- 
- INSTALL_0600 = $(INSTALL) -m 0600
- 
--SECFILES = upsmon.conf.sample upsd.conf.sample upsd.users.sample
-+SECFILES = upsd.conf.sample upsd.users.sample
- PUBFILES = nut.conf.sample ups.conf.sample
- CGIPUB = hosts.conf.sample upsset.conf.sample upsstats.html.sample	\
-  upsstats-single.html.sample
diff --git a/package/nut/nut.hash b/package/nut/nut.hash
index 0174366..870c67c 100644
--- a/package/nut/nut.hash
+++ b/package/nut/nut.hash
@@ -1,2 +1,2 @@
 # From http://www.networkupstools.org/source/2.7/nut-2.7.2.tar.gz.sha256
-sha256	4d5365359b059d96dfcb77458f361a114d26c84f1297ffcd0c6c166f7200376d	nut-2.7.2.tar.gz
+sha256  980e82918c52d364605c0703a5dcf01f74ad2ef06e3d365949e43b7d406d25a7  nut-2.7.4.tar.gz
diff --git a/package/nut/nut.mk b/package/nut/nut.mk
index b0a92ca..7136e83 100644
--- a/package/nut/nut.mk
+++ b/package/nut/nut.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NUT_VERSION_MAJOR = 2.7
-NUT_VERSION = $(NUT_VERSION_MAJOR).2
+NUT_VERSION = $(NUT_VERSION_MAJOR).4
 NUT_SITE = http://www.networkupstools.org/source/$(NUT_VERSION_MAJOR)
 NUT_LICENSE = GPLv2+, GPLv3+ (python scripts), GPL/Artistic (perl client)
 NUT_LICENSE_FILES = COPYING LICENSE-GPL2 LICENSE-GPL3
@@ -20,10 +20,6 @@ NUT_CONF_OPTS = \
 	--with-altpidpath=/var/run/upsd \
 	--without-hal
 
-NUT_CONF_ENV = \
-	GDLIB_CONFIG=$(STAGING_DIR)/usr/bin/gdlib-config \
-	NET_SNMP_CONFIG=$(STAGING_DIR)/usr/bin/net-snmp-config
-
 # For uClibc-based toolchains, nut forgets to link with -lm
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 NUT_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -lm"
@@ -45,7 +41,9 @@ endif
 # gd with support for png is required for the CGI
 ifeq ($(BR2_PACKAGE_GD)$(BR2_PACKAGE_LIBPNG),yy)
 NUT_DEPENDENCIES += gd libpng
-NUT_CONF_OPTS += --with-cgi
+NUT_CONF_OPTS += \
+	--with-cgi \
+	--with-gdlib-config=$(STAGING_DIR)/usr/bin/gdlib-config
 else
 NUT_CONF_OPTS += --without-cgi
 endif
@@ -77,7 +75,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_NETSNMP),y)
 NUT_DEPENDENCIES += netsnmp
-NUT_CONF_OPTS += --with-snmp
+NUT_CONF_OPTS += \
+	--with-snmp \
+	--with-net-snmp-config=$(STAGING_DIR)/usr/bin/net-snmp-config
 else
 NUT_CONF_OPTS += --without-snmp
 endif
-- 
2.7.4
