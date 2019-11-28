From: aduskett at gmail.com <aduskett@gmail.com>
Date: Wed, 27 Nov 2019 17:26:05 -0800
Subject: [Buildroot] [PATCH v4 2/6] package/polkit: support different
 authentication frameworks
In-Reply-To: <20191128012609.3632661-1-aduskett@gmail.com>
References: <20191128012609.3632661-1-aduskett@gmail.com>
Message-ID: <20191128012609.3632661-3-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Use pam if available, otherwise use shadow.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/polkit/polkit.mk | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index 507d1865fa..0c17e9bc27 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -13,13 +13,18 @@ POLKIT_INSTALL_STAGING = YES
 
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
+
 $(eval $(autotools-package))
-- 
2.23.0
