From: aduskett at gmail.com <aduskett@gmail.com>
Date: Tue, 31 Mar 2020 17:21:30 -0700
Subject: [Buildroot] [PATCH 08/12] package/atk: enable gobject-introspection
 support
In-Reply-To: <20200401002134.1779241-1-aduskett@gmail.com>
References: <20200401002134.1779241-1-aduskett@gmail.com>
Message-ID: <20200401002134.1779241-8-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

If gobject-introspection is selected, add the gobject-introspection package to
the dependency list and set the conf opt -Dintrospection=true.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/atk/atk.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/atk/atk.mk b/package/atk/atk.mk
index 7039666059..a16143d2c0 100644
--- a/package/atk/atk.mk
+++ b/package/atk/atk.mk
@@ -13,7 +13,13 @@ ATK_LICENSE_FILES = COPYING
 ATK_INSTALL_STAGING = YES
 ATK_DEPENDENCIES = libglib2 $(TARGET_NLS_DEPENDENCIES)
 
-ATK_CONF_OPTS = -Dintrospection=false
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+ATK_CONF_OPTS += -Dintrospection=true
+ATK_DEPENDENCIES += gobject-introspection
+else
+ATK_CONF_OPTS += -Dintrospection=false
+endif
+
 ATK_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
 $(eval $(meson-package))
-- 
2.25.1
