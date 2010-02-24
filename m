From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Feb 2010 22:16:55 +0100
Subject: [Buildroot] [PATCH 08/10] pango: remove dependency on host-pango
In-Reply-To: <cover.1267046193.git.thomas.petazzoni@free-electrons.com>
References: <cover.1267046193.git.thomas.petazzoni@free-electrons.com>
Message-ID: <f002445d744cfccb6541b064399072a9121796a9.1267046193.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pango was depending on host-pango because of the pango-querymodules
utility. Compiling pango for the host is a mess because it depends on
Cairo, which itself depends on X.org.

Therefore, we remove the dependency of pango on pango-querymodules by
using statically compiled rendering libraries instead of modules. For
the moment, all rendering libraries are included, but we could imagine
adding more configuration options in the future.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pango/pango.mk |   13 +++----------
 1 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 38e163e..08f6610 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -38,14 +38,15 @@ PANGO_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
 		ac_cv_path_FREETYPE_CONFIG=$(STAGING_DIR)/usr/bin/freetype-config
 
 PANGO_CONF_OPT = --enable-shared --enable-static \
-		--enable-explicit-deps=no --disable-debug
+		--enable-explicit-deps=no --disable-debug \
+		--without-dynamic-modules --with-included-modules=yes
 
 HOST_PANGO_CONF_OPT = \
 		--disable-static \
 		$(if $(BR2_PACKAGE_XORG7),--with-x,--without-x) \
 		--disable-debug \
 
-PANGO_DEPENDENCIES = gettext libintl host-pkg-config host-pango libglib2 cairo
+PANGO_DEPENDENCIES = gettext libintl host-pkg-config libglib2 cairo
 
 HOST_PANGO_DEPENDENCIES = host-pkg-config host-cairo host-libglib2 host-autoconf host-automake
 
@@ -62,11 +63,3 @@ endif
 
 $(eval $(call AUTOTARGETS,package,pango))
 $(eval $(call AUTOTARGETS,package,pango,host))
-
-$(PANGO_HOOK_POST_INSTALL):
-	mkdir -p $(TARGET_DIR)/etc/pango
-	$(PANGO_HOST_BINARY) > $(TARGET_DIR)/etc/pango/pango.modules
-	$(SED) 's~$(HOST_DIR)~~g' $(TARGET_DIR)/etc/pango/pango.modules
-	touch $@
-
-PANGO_HOST_BINARY:=$(HOST_DIR)/usr/bin/pango-querymodules
-- 
1.6.3.3
