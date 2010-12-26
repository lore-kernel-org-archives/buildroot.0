From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Sun, 26 Dec 2010 17:16:35 +0100
Subject: [Buildroot] [PATCH 2/3] package: avoid copying .m4 files from host
	to staging
In-Reply-To: <1293380196-22990-1-git-send-email-llandwerlin@gmail.com>
References: <1293380196-22990-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1293380196-22990-3-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Since we are preparing a package generation mechanism, we would like
to avoid packages that move/touch/modify files which are not part
of their own package. That's why we try to not install host files into
the staging directory (in this case .m4 files) and instead we include
$(HOST_DIR)/usr/share/aclocal into autoreconf search directory.

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/autoconf/autoconf.mk     |    2 +-
 package/automake/automake.mk     |    1 +
 package/libtool/libtool.mk       |    9 ---------
 package/pkg-config/pkg-config.mk |    7 -------
 4 files changed, 2 insertions(+), 17 deletions(-)

diff --git a/package/autoconf/autoconf.mk b/package/autoconf/autoconf.mk
index a21192f..0ff0644 100644
--- a/package/autoconf/autoconf.mk
+++ b/package/autoconf/autoconf.mk
@@ -23,4 +23,4 @@ $(eval $(call AUTOTARGETS,package,autoconf,host))
 # variables used by other packages
 AUTOCONF:=$(HOST_DIR)/usr/bin/autoconf
 AUTOHEADER:=$(HOST_DIR)/usr/bin/autoheader
-AUTORECONF=$(HOST_CONFIGURE_OPTS) ACLOCAL="$(ACLOCAL)" AUTOCONF="$(AUTOCONF)" AUTOHEADER="$(AUTOHEADER)" AUTOMAKE="$(AUTOMAKE)" $(HOST_DIR)/usr/bin/autoreconf -f -i -I "$(ACLOCAL_DIR)"
+AUTORECONF=$(HOST_CONFIGURE_OPTS) ACLOCAL="$(ACLOCAL)" AUTOCONF="$(AUTOCONF)" AUTOHEADER="$(AUTOHEADER)" AUTOMAKE="$(AUTOMAKE)" $(HOST_DIR)/usr/bin/autoreconf -f -i -I "$(ACLOCAL_DIR)" -I "$(ACLOCAL_HOST_DIR)"
diff --git a/package/automake/automake.mk b/package/automake/automake.mk
index e2ff9b2..6ee3121 100644
--- a/package/automake/automake.mk
+++ b/package/automake/automake.mk
@@ -23,4 +23,5 @@ $(eval $(call AUTOTARGETS,package,automake,host))
 # variables used by other packages
 AUTOMAKE = $(HOST_DIR)/usr/bin/automake
 ACLOCAL_DIR = $(STAGING_DIR)/usr/share/aclocal
+ACLOCAL_HOST_DIR = $(HOST_DIR)/usr/share/aclocal
 ACLOCAL = $(HOST_DIR)/usr/bin/aclocal -I $(ACLOCAL_DIR)
diff --git a/package/libtool/libtool.mk b/package/libtool/libtool.mk
index 60fee9f..3306244 100644
--- a/package/libtool/libtool.mk
+++ b/package/libtool/libtool.mk
@@ -7,15 +7,6 @@ LIBTOOL_VERSION = 2.2.10
 LIBTOOL_SOURCE = libtool-$(LIBTOOL_VERSION).tar.gz
 LIBTOOL_SITE = $(BR2_GNU_MIRROR)/libtool
 
-define HOST_LIBTOOL_CUSTOM_INSTALL
-	install -D -m 0644 $(HOST_DIR)/usr/share/aclocal/libtool.m4 \
-		$(STAGING_DIR)/usr/share/aclocal/libtool.m4
-	install -D -m 0644 $(HOST_DIR)/usr/share/aclocal/ltdl.m4 \
-		$(STAGING_DIR)/usr/share/aclocal/ltdl.m4
-endef
-
-HOST_LIBTOOL_POST_INSTALL_HOOKS += HOST_LIBTOOL_CUSTOM_INSTALL
-
 HOST_LIBTOOL_LIBTOOL_PATCH = NO
 
 $(eval $(call AUTOTARGETS,package,libtool))
diff --git a/package/pkg-config/pkg-config.mk b/package/pkg-config/pkg-config.mk
index 330b166..d0bc424 100644
--- a/package/pkg-config/pkg-config.mk
+++ b/package/pkg-config/pkg-config.mk
@@ -15,13 +15,6 @@ HOST_PKG_CONFIG_CONF_OPT = \
 		--with-pc-path="$(STAGING_DIR)/usr/lib/pkgconfig" \
 		--disable-static
 
-define HOST_PKG_CONFIG_INSTALL_M4
-install -D -m 0644 $(HOST_DIR)/usr/share/aclocal/pkg.m4 \
-		$(STAGING_DIR)/usr/share/aclocal/pkg.m4
-endef
-
-HOST_PKG_CONFIG_POST_INSTALL_HOOKS += HOST_PKG_CONFIG_INSTALL_M4
-
 $(eval $(call AUTOTARGETS,package,pkg-config))
 $(eval $(call AUTOTARGETS,package,pkg-config,host))
 
-- 
1.7.2.3
