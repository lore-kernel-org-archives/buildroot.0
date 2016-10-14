From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 Oct 2016 16:09:44 +0200
Subject: [Buildroot] [PATCH] package/Makefile.in: synchronize pkg-config
	settings between HOST_{CONFIGURE_OPTS, MAKE_ENV}
Message-ID: <20161014140944.9436-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The pkg-config settings in HOST_CONFIGURE_OPTS and HOST_MAKE_ENV have
diverged over time, so they now used different _LIBDIR and
_ALLOW_SYSTEM_{CFLAGS,LIBS} settings.

Conceptually _CONFIGURE_OPTS should be a superset of _MAKE_ENV, so move the
definitions around and define _CONFIGURE_OPTS in terms of _MAKE_ENV instead
of repeating the individual settings.

Do this both for the target and host variant for consistency.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Makefile.in | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index b4a4c60..98e30b4 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -235,8 +235,10 @@ export PERL=$(shell which perl)
 # finds this perl module by exporting the proper value for PERL5LIB.
 export PERL5LIB=$(HOST_DIR)/usr/lib/perl
 
+TARGET_MAKE_ENV = PATH=$(BR_PATH)
+
 TARGET_CONFIGURE_OPTS = \
-	PATH=$(BR_PATH) \
+	$(TARGET_MAKE_ENV) \
 	AR="$(TARGET_AR)" \
 	AS="$(TARGET_AS)" \
 	LD="$(TARGET_LD)" \
@@ -275,11 +277,17 @@ TARGET_CONFIGURE_OPTS = \
 	STAGING_DIR="$(STAGING_DIR)" \
 	INTLTOOL_PERL=$(PERL)
 
-TARGET_MAKE_ENV = PATH=$(BR_PATH)
 
+HOST_MAKE_ENV = \
+	PATH=$(BR_PATH) \
+	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
+	PKG_CONFIG_SYSROOT_DIR="/" \
+	PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
+	PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
+	PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig:$(HOST_DIR)/usr/share/pkgconfig"
 
 HOST_CONFIGURE_OPTS = \
-	PATH=$(BR_PATH) \
+	$(HOST_MAKE_ENV) \
 	AR="$(HOSTAR)" \
 	AS="$(HOSTAS)" \
 	LD="$(HOSTLD)" \
@@ -294,19 +302,8 @@ HOST_CONFIGURE_OPTS = \
 	CFLAGS="$(HOST_CFLAGS)" \
 	CXXFLAGS="$(HOST_CXXFLAGS)" \
 	LDFLAGS="$(HOST_LDFLAGS)" \
-	PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
-	PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
-	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
-	PKG_CONFIG_SYSROOT_DIR="/" \
-	PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig:$(HOST_DIR)/usr/share/pkgconfig" \
 	INTLTOOL_PERL=$(PERL)
 
-HOST_MAKE_ENV = \
-	PATH=$(BR_PATH) \
-	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
-	PKG_CONFIG_SYSROOT_DIR="/" \
-	PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig"
-
 # This is extra environment we can not export ourselves (eg. because some
 # packages use that variable internally, eg. uboot), so we have to
 # explicitly pass it to user-supplied external hooks (eg. post-build,
-- 
2.9.3
