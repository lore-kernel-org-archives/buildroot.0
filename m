From: Norbert Lange <nolange79@gmail.com>
Date: Fri, 31 Jul 2020 23:53:44 +0200
Subject: [Buildroot] [PATCH 4/5] package/systemd: remove util-linux nologin
 dependency
In-Reply-To: <20200731215345.19212-1-nolange79@gmail.com>
References: <20200731215345.19212-1-nolange79@gmail.com>
Message-ID: <20200731215345.19212-5-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

if the tool is not enabled, then configure /bin/false
as fallback.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/systemd/Config.in  | 1 -
 package/systemd/systemd.mk | 6 ++++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index bea8aaa019..1c37a37789 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -31,7 +31,6 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
 	select BR2_PACKAGE_UTIL_LINUX_AGETTY
 	select BR2_PACKAGE_UTIL_LINUX_MOUNT
-	select BR2_PACKAGE_UTIL_LINUX_NOLOGIN
 	select BR2_PACKAGE_UTIL_LINUX_FSCK
 	select BR2_PACKAGE_KMOD
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # kmod-tools
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 00c18be210..ac03e16829 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -217,6 +217,12 @@ else
 SYSTEMD_CONF_OPTS += -Dblkid=false
 endif
 
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_NOLOGIN),y)
+SYSTEMD_CONF_OPTS += -Dnologin-path=/usr/sbin/nologin
+else
+SYSTEMD_CONF_OPTS += -Dnologin-path=/bin/false
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_INITRD),y)
 SYSTEMD_CONF_OPTS += -Dinitrd=true
 else
-- 
2.27.0
