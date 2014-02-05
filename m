From: Francois Perrad <fperrad@gmail.com>
Date: Wed,  5 Feb 2014 14:52:52 +0100
Subject: [Buildroot] [pkg-perl infra V4 1/9] pkg-perl: refactor and rename
	PERL5LIB
In-Reply-To: <1391608380-23240-1-git-send-email-francois.perrad@gadz.org>
References: <1391608380-23240-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1391608380-23240-2-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Makefile.in          |   11 +++++++----
 package/intltool/intltool.mk |    3 +--
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 2e433fd..d0b1cfd 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -206,6 +206,8 @@ HOST_PATH=$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(PATH)
 HOSTCC_VERSION:=$(shell $(HOSTCC_NOCCACHE) --version | \
 	sed -n 's/^.* \([0-9]*\)\.\([0-9]*\)\.\([0-9]*\)[ ]*.*$$/\1\2\3/p')
 
+HOST_PERL5LIB = $(HOST_DIR)/usr/lib/perl
+
 TARGET_CONFIGURE_OPTS=PATH=$(TARGET_PATH) \
 		AR="$(TARGET_AR)" \
 		AS="$(TARGET_AS)" \
@@ -241,11 +243,12 @@ TARGET_CONFIGURE_OPTS=PATH=$(TARGET_PATH) \
 		LDFLAGS="$(TARGET_LDFLAGS)" \
 		FCFLAGS="$(TARGET_FCFLAGS)" \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
-		PERLLIB="$(HOST_DIR)/usr/lib/perl" \
+		PERL5LIB=$(HOST_PERL5LIB) \
 		STAGING_DIR="$(STAGING_DIR)"
 
 TARGET_MAKE_ENV=PATH=$(TARGET_PATH) \
-		PERLLIB="$(HOST_DIR)/usr/lib/perl"
+		PERL5LIB=$(HOST_PERL5LIB)
+
 
 HOST_CONFIGURE_OPTS=PATH=$(HOST_PATH) \
 		AR="$(HOSTAR)" \
@@ -267,7 +270,7 @@ HOST_CONFIGURE_OPTS=PATH=$(HOST_PATH) \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 		PKG_CONFIG_SYSROOT_DIR="/" \
 		PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig:$(HOST_DIR)/usr/share/pkgconfig" \
-		PERLLIB="$(HOST_DIR)/usr/lib/perl" \
+		PERL5LIB=$(HOST_PERL5LIB) \
 		LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib:$(LD_LIBRARY_PATH)"
 
 HOST_MAKE_ENV=PATH=$(HOST_PATH) \
@@ -275,7 +278,7 @@ HOST_MAKE_ENV=PATH=$(HOST_PATH) \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 		PKG_CONFIG_SYSROOT_DIR="/" \
 		PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig" \
-		PERLLIB="$(HOST_DIR)/usr/lib/perl"
+		PERL5LIB=$(HOST_PERL5LIB)
 
 # This extra environment we can not export ourselves (eg. because some
 # packages use that variable internally, eg. uboot), so we have to
diff --git a/package/intltool/intltool.mk b/package/intltool/intltool.mk
index b2418fe..4235606 100644
--- a/package/intltool/intltool.mk
+++ b/package/intltool/intltool.mk
@@ -10,8 +10,7 @@ INTLTOOL_LICENSE = GPLv2+
 INTLTOOL_LICENSE_FILES = COPYING
 
 HOST_INTLTOOL_DEPENDENCIES = host-gettext host-libxml-parser-perl
-HOST_INTLTOOL_CONF_OPT = \
-  PERLLIB=$(HOST_DIR)/usr/lib/perl
+HOST_INTLTOOL_CONF_ENV = PERL5LIB=$(HOST_PERL5LIB)
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
1.7.9.5
