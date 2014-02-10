From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 10 Feb 2014 19:48:49 +0100
Subject: [Buildroot] [git commit] host-perl: export and rename PERL5LIB
Message-ID: <20140210194347.B6E849C957@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f99a66de95ebf67cfa9e89a41cb39ec9ab8e07f1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The official Perl documentation refers only to PERL5LIB.
PERLLIB is obsolete, we don't need to be compatible with Perl4.

PERL5LIB is used in all environment, so it is simpler to just export it.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Makefile.in          |   11 +++++------
 package/intltool/intltool.mk |    2 --
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 9d0e7d6..eea7043 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -206,6 +206,8 @@ HOST_PATH=$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(PATH)
 HOSTCC_VERSION:=$(shell $(HOSTCC_NOCCACHE) --version | \
 	sed -n 's/^.* \([0-9]*\)\.\([0-9]*\)\.\([0-9]*\)[ ]*.*$$/\1\2\3/p')
 
+export PERL5LIB := $(HOST_DIR)/usr/lib/perl
+
 TARGET_CONFIGURE_OPTS=PATH=$(TARGET_PATH) \
 		AR="$(TARGET_AR)" \
 		AS="$(TARGET_AS)" \
@@ -241,11 +243,10 @@ TARGET_CONFIGURE_OPTS=PATH=$(TARGET_PATH) \
 		LDFLAGS="$(TARGET_LDFLAGS)" \
 		FCFLAGS="$(TARGET_FCFLAGS)" \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
-		PERLLIB="$(HOST_DIR)/usr/lib/perl" \
 		STAGING_DIR="$(STAGING_DIR)"
 
-TARGET_MAKE_ENV=PATH=$(TARGET_PATH) \
-		PERLLIB="$(HOST_DIR)/usr/lib/perl"
+TARGET_MAKE_ENV=PATH=$(TARGET_PATH)
+
 
 HOST_CONFIGURE_OPTS=PATH=$(HOST_PATH) \
 		AR="$(HOSTAR)" \
@@ -267,15 +268,13 @@ HOST_CONFIGURE_OPTS=PATH=$(HOST_PATH) \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 		PKG_CONFIG_SYSROOT_DIR="/" \
 		PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig:$(HOST_DIR)/usr/share/pkgconfig" \
-		PERLLIB="$(HOST_DIR)/usr/lib/perl" \
 		LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib:$(LD_LIBRARY_PATH)"
 
 HOST_MAKE_ENV=PATH=$(HOST_PATH) \
 		LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib:$(LD_LIBRARY_PATH)" \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 		PKG_CONFIG_SYSROOT_DIR="/" \
-		PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig" \
-		PERLLIB="$(HOST_DIR)/usr/lib/perl"
+		PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig"
 
 # This extra environment we can not export ourselves (eg. because some
 # packages use that variable internally, eg. uboot), so we have to
diff --git a/package/intltool/intltool.mk b/package/intltool/intltool.mk
index b2418fe..58b46e6 100644
--- a/package/intltool/intltool.mk
+++ b/package/intltool/intltool.mk
@@ -10,8 +10,6 @@ INTLTOOL_LICENSE = GPLv2+
 INTLTOOL_LICENSE_FILES = COPYING
 
 HOST_INTLTOOL_DEPENDENCIES = host-gettext host-libxml-parser-perl
-HOST_INTLTOOL_CONF_OPT = \
-  PERLLIB=$(HOST_DIR)/usr/lib/perl
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
