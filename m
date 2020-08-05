From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Aug 2020 15:48:17 +0200
Subject: [Buildroot] [git commit] package/systemd: remove util-linux nologin
 dependency
Message-ID: <20200805134339.C2FE281358@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c2c32f865c61534b5ba68abea63e0f5a17a37dcb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

if the tool is not enabled, then configure /bin/false
as fallback.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/systemd/Config.in  | 1 -
 package/systemd/systemd.mk | 6 ++++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 223ab6e113..f21c8d32dd 100644
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
index 247ead532b..4fcff90512 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -213,6 +213,12 @@ else
 SYSTEMD_CONF_OPTS += -Dblkid=false
 endif
 
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_NOLOGIN),y)
+SYSTEMD_CONF_OPTS += -Dnologin-path=/sbin/nologin
+else
+SYSTEMD_CONF_OPTS += -Dnologin-path=/bin/false
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_INITRD),y)
 SYSTEMD_CONF_OPTS += -Dinitrd=true
 else
