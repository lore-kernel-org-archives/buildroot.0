From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon, 25 Nov 2019 09:50:31 -0800
Subject: [Buildroot] [PATCH/next v3 4/4] package/polkit: enable systemd
 login support
In-Reply-To: <20191125175031.4086339-1-aduskett@gmail.com>
References: <20191125175031.4086339-1-aduskett@gmail.com>
Message-ID: <20191125175031.4086339-5-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <aduskett@greenlots.com>

If systemd-logind is selected, enable libsystemd-login support.

Signed-off-by: Adam Duskett <aduskett@greenlots.com>
---
Changes v2 -> v3:
  - Change --enable-libsystemd-login=yes to
    --enable-libsystemd-login (Thomas)

 package/polkit/polkit.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index 725db85471..899c157b40 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -17,8 +17,7 @@ POLKIT_CONF_OPTS = \
 	--with-os-type=unknown \
 	--disable-man-pages \
 	--disable-examples \
-	--disable-libelogind \
-	--disable-libsystemd-login
+	--disable-libelogind
 
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 POLKIT_CONF_OPTS += --with-authfw=pam
@@ -26,6 +25,13 @@ else
 POLKIT_CONF_OPTS += --with-authfw=shadow
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_LOGIND),y)
+POLKIT_DEPENDENCIES += systemd
+POLKIT_CONF_OPTS += --enable-libsystemd-login
+else
+POLKIT_CONF_OPTS += --disable-libsystemd-login
+endif
+
 define POLKIT_USERS
 	polkitd -1 polkitd -1 * /usr/lib/polkit-1 /bin/sh - Polkit Daemon
 endef
-- 
2.23.0
