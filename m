From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 12 Apr 2016 19:55:36 +0300
Subject: [Buildroot] [PATCH] links: fix static link with directfb
Message-ID: <535156e43ad4326bc4f9eff213ad4903229c01b5.1460480136.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The AC_HAVE_FUNCS autoconf macro uses gcc to check for function existence.
This breaks when the library depends on libstdc++, like directfb. Add this
dependency externally.

Fixes:
http://autobuild.buildroot.net/results/548/548019b71c7db649f20d2c479bb8fb3612162d4a/
http://autobuild.buildroot.net/results/c94/c9495f54db388bde9d64325bb57fc4e58741f7a7/
http://autobuild.buildroot.net/results/9b8/9b883d42bff3633f16447d76d2eb4ddf68013788/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/links/links.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/links/links.mk b/package/links/links.mk
index 62f91a32e39e..ab2b58359965 100644
--- a/package/links/links.mk
+++ b/package/links/links.mk
@@ -22,6 +22,9 @@ LINKS_CONF_OPTS += --without-x
 endif
 ifeq ($(BR2_PACKAGE_DIRECTFB),y)
 LINKS_CONF_ENV = ac_cv_path_DIRECTFB_CONFIG=$(STAGING_DIR)/usr/bin/directfb-config
+ifeq ($(BR2_STATIC_LIBS),y)
+LINKS_CONF_ENV += LIBS=-lstdc++
+endif
 LINKS_CONF_OPTS += --with-directfb
 LINKS_DEPENDENCIES += directfb
 else
-- 
2.8.0.rc3
