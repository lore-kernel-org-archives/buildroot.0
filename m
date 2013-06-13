From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 13 Jun 2013 10:00:23 -0300
Subject: [Buildroot] [PATCH] freetype: fixup config file
Message-ID: <1371128423-17314-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix freetype-config's includedir and libdir since they're expanded from
configure values since bumping to version 2.4.12

Fixes:
http://autobuild.buildroot.net/results/1c7/1c70ce0ff350623cc38baf4b8b61c8a7a8586aba/
...and many others.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/freetype/freetype.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 16f00fe..177adf5 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -18,5 +18,13 @@ FREETYPE_CONFIG_SCRIPTS = freetype-config
 
 HOST_FREETYPE_DEPENDENCIES = host-pkgconf
 
+# Extra fixing since includedir and libdir are expanded from configure values
+define FREETYPE_FIX_CONFIG_FILE
+	$(SED) 's:^includedir=.*:includedir="$${prefix}/include":' \
+		-e 's:^libdir=.*:libdir="$${exec_prefix}/lib":' \
+		$(STAGING_DIR)/usr/bin/freetype-config
+endef
+FREETYPE_POST_INSTALL_STAGING_HOOKS += FREETYPE_FIX_CONFIG_FILE
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
1.8.1.5
