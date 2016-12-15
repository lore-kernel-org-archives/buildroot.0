From: Adam Duskett <Adamduskett@outlook.com>
Date: Thu, 15 Dec 2016 21:23:12 +0000
Subject: [Buildroot] [PATCH 1/1] systemd: enable selinux if libselinux is
	selected.
Message-ID: <MWHPR19MB1440119476458B1DB7D8E1B9B99D0@MWHPR19MB1440.namprd19.prod.outlook.com>
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
 package/systemd/systemd.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index fa07bd0..ca1f49e 100644
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
@@ -153,6 +152,12 @@ else
 SYSTEMD_CONF_OPTS += --disable-microhttpd --disable-qrencode
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
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
