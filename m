From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Dec 2016 14:19:05 +0100
Subject: [Buildroot] [git commit] systemd: enable selinux if libselinux is
	enabled
Message-ID: <20161217131936.96196802C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c14e749957d49adf2c30975a0678003419592844
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

systemd currently has selinux disabled unconditionally.  This prevents
/sys/fs/selinux from being mounted automatically at boot which causes
audit to no longer function. This patch fixes the problem by checking if
libselinux is enabled and enabling support for selinux in systemd if so.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
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
