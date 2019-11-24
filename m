From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sun, 24 Nov 2019 11:57:37 -0800
Subject: [Buildroot] [PATCH 3/4] package/polkit: support different
 authentication frameworks
In-Reply-To: <20191124195738.1591524-1-aduskett@gmail.com>
References: <20191124195738.1591524-1-aduskett@gmail.com>
Message-ID: <20191124195738.1591524-4-aduskett@gmail.com>
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
index 5d85ea9897..4135a64d6b 100644
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
 	--enable-libsystemd-login=no \
 	--enable-libelogind=no
 
+ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
+POLKIT_CONF_OPTS += --with-authfw=pam
+else
+POLKIT_CONF_OPTS += --with-authfw=shadow
+endif
+
 $(eval $(autotools-package))
-- 
2.23.0
