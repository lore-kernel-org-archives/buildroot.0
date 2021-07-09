From: Norbert Lange <nolange79@gmail.com>
Date: Fri,  9 Jul 2021 11:07:28 +0200
Subject: [Buildroot] [PATCH 3/3] package/systemd: always enable
 systemd-tmpfilesd
In-Reply-To: <20210709090729.280632-1-nolange79@gmail.com>
References: <20210709090729.280632-1-nolange79@gmail.com>
Message-ID: <20210709090729.280632-3-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

this tool and service is pretty much expected to be enabled,
making this a certainty will enable future improvements.

remove the related BR2_PACKAGE_SYSTEMD Config option tree-wide.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/dhcp/Config.in     |  1 -
 package/systemd/Config.in  | 11 -----------
 package/systemd/systemd.mk |  7 +------
 3 files changed, 1 insertion(+), 18 deletions(-)

diff --git a/package/dhcp/Config.in b/package/dhcp/Config.in
index e6e70908dd..515040c612 100644
--- a/package/dhcp/Config.in
+++ b/package/dhcp/Config.in
@@ -13,7 +13,6 @@ if BR2_PACKAGE_DHCP
 
 config BR2_PACKAGE_DHCP_SERVER
 	bool "dhcp server"
-	select BR2_PACKAGE_SYSTEMD_TMPFILES if BR2_PACKAGE_SYSTEMD
 	help
 	  DHCP server from the ISC DHCP distribution.
 
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 94c5c47c7e..1e9a9f042c 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -465,17 +465,6 @@ config BR2_PACKAGE_SYSTEMD_TIMESYNCD
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-timesyncd.html
 
-config BR2_PACKAGE_SYSTEMD_TMPFILES
-	bool "enable tmpfiles support"
-	default y
-	help
-	  systemd-tmpfiles creates, deletes, and cleans up volatile
-	  and temporary files and directories, based on the
-	  configuration file format and location specified in
-	  tmpfiles.d(5).
-
-	  http://www.freedesktop.org/software/systemd/man/systemd-tmpfiles.html
-
 config BR2_PACKAGE_SYSTEMD_USERDB
 	bool "enable userdb daemon"
 	help
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 0fb1c8b068..af139a3304 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -48,6 +48,7 @@ SYSTEMD_CONF_OPTS += \
 	-Dsysvrcnd-path= \
 	-Dtelinit-path= \
 	-Dtests=false \
+	-Dtmpfiles=true \
 	-Dumount-path=/usr/bin/umount \
 	-Dutmp=false
 
@@ -300,12 +301,6 @@ else
 SYSTEMD_CONF_OPTS += -Dquotacheck=false
 endif
 
-ifeq ($(BR2_PACKAGE_SYSTEMD_TMPFILES),y)
-SYSTEMD_CONF_OPTS += -Dtmpfiles=true
-else
-SYSTEMD_CONF_OPTS += -Dtmpfiles=false
-endif
-
 ifeq ($(BR2_PACKAGE_SYSTEMD_SYSUSERS),y)
 SYSTEMD_CONF_OPTS += -Dsysusers=true
 else
-- 
2.30.2
