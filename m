From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 11 Dec 2012 12:04:09 +0100
Subject: [Buildroot] [PATCH] host-libxml2: enable debug for mesa3d
Message-ID: <1355223849-3934-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The API generation script in mesa3d requires libxml2 to be built with
debug, because it uses the lsCountNode function which is only available
in debug mode.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
I'm very surprised there are not autobuilder failures for mesa3d, since
this fails consistently for me on all configs that have python enabled.

 package/libxml2/libxml2.mk |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index fde3735..0c84652 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -26,7 +26,12 @@ LIBXML2_POST_INSTALL_STAGING_HOOKS += LIBXML2_STAGING_LIBXML2_CONFIG_FIXUP
 
 HOST_LIBXML2_DEPENDENCIES = host-pkgconf
 
+# mesa3d uses functions that are only available with debug
+ifeq ($(BR2_PACKAGE_MESA3D),y)
+HOST_LIBXML2_CONF_OPT = --with-debug
+else
 HOST_LIBXML2_CONF_OPT = --without-debug
+endif
 
 ifeq ($(BR2_PACKAGE_HOST_LIBXML2_PYTHON),y)
 HOST_LIBXML2_DEPENDENCIES += host-python
-- 
tg: (c93ba9d..) t/host-libxml2-for-mesa (depends on: p/boost)
