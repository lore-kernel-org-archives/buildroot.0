From: Adam Duskett <Adamduskett@outlook.com>
Date: Sat, 17 Dec 2016 05:29:42 +0000
Subject: [Buildroot] [v2,
	1/1] systemd: enable selinux if libselinux is selected.
Message-ID: <MWHPR19MB14405FD5F80097332112D99DB99F0@MWHPR19MB1440.namprd19.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

systemd currently has selinux disabled statically.  This prevents
/sys/fs/selinux from being mounted automatically at boot which
causes audit to no longer function.  This patch fixes the problem
by checking to see if libselinux is selected and enabling support for
selinux if so.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
Changes v1 - v2:
 - Added SYSTEMD_DEPENDENCIES += libselinux in the case that
   libselinux was selected.

 package/systemd/systemd.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index fa07bd0..278c8e9 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -30,7 +30,6 @@ SYSTEMD_CONF_OPTS += \
 	--enable-blkid \
 	--enable-static=no \
 	--disable-manpages \
-	--disable-selinux \
 	--disable-pam \
 	--disable-ima \
 	--disable-libcryptsetup \
@@ -153,6 +152,13 @@ else
 SYSTEMD_CONF_OPTS += --disable-microhttpd --disable-qrencode
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+SYSTEMD_DEPENDENCIES += libselinux
+SYSTEMD_CONF_OPTS += --enable-selinux
+else
+SYSTEMD_CONF_OPTS += --disable-selinux
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_HWDB),y)
 SYSTEMD_CONF_OPTS += --enable-hwdb
 else
-- 
2.9.3
