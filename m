From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon, 25 Nov 2019 09:50:30 -0800
Subject: [Buildroot] [PATCH/next v3 3/4] package/polkit: support different
 authentication frameworks
In-Reply-To: <20191125175031.4086339-1-aduskett@gmail.com>
References: <20191125175031.4086339-1-aduskett@gmail.com>
Message-ID: <20191125175031.4086339-4-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <aduskett@greenlots.com>

Use pam if available, otherwise use shadow.

Signed-off-by: Adam Duskett <aduskett@greenlots.com>
---
 package/polkit/polkit.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index 96af4033ff..725db85471 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -13,15 +13,19 @@ POLKIT_INSTALL_STAGING = YES
 
 POLKIT_DEPENDENCIES = libglib2 host-intltool expat dbus spidermonkey
 
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
 define POLKIT_USERS
 	polkitd -1 polkitd -1 * /usr/lib/polkit-1 /bin/sh - Polkit Daemon
 endef
-- 
2.23.0
