From: aduskett at gmail.com <aduskett@gmail.com>
Date: Fri, 29 Nov 2019 13:59:11 -0800
Subject: [Buildroot] [PATCH/next v5 2/6] package/polkit: support different
 authentication frameworks
In-Reply-To: <20191129215915.2549083-1-aduskett@gmail.com>
References: <20191129215915.2549083-1-aduskett@gmail.com>
Message-ID: <20191129215915.2549083-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Use pam if available, otherwise use shadow.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/polkit/polkit.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index 507d1865fa..7791d23d19 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -13,13 +13,17 @@ POLKIT_INSTALL_STAGING = YES
 
 POLKIT_DEPENDENCIES = libglib2 host-intltool expat spidermonkey
 
-# We could also support --with-authfw=pam
 POLKIT_CONF_OPTS = \
-	--with-authfw=shadow \
 	--with-os-type=unknown \
 	--disable-man-pages \
 	--disable-examples \
 	--disable-libelogind \
 	--disable-libsystemd-login
 
+ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
+POLKIT_CONF_OPTS += --with-authfw=pam
+else
+POLKIT_CONF_OPTS += --with-authfw=shadow
+endif
+
 $(eval $(autotools-package))
-- 
2.23.0
