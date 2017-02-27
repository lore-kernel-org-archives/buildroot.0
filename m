From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Feb 2017 21:40:12 +0100
Subject: [Buildroot] [git commit branch/next] systemd: enable optional PAM
	support
Message-ID: <20170227210016.0FFA1807CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9a6c03a390872d7ce91b619fdaf1d674491ad8cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This commit enables PAM support in systemd if BR2_PACKAGE_LINUX_PAM is
set. Some essential config files are not installed without the
--enable-pam option.

Signed-off-by: James Balean <james@balean.com.au>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/systemd.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index fce5d84..0d2f416 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -30,7 +30,6 @@ SYSTEMD_CONF_OPTS += \
 	--enable-blkid \
 	--enable-static=no \
 	--disable-manpages \
-	--disable-pam \
 	--disable-ima \
 	--disable-libcryptsetup \
 	--disable-efi \
@@ -108,6 +107,13 @@ else
 SYSTEMD_CONF_OPTS += --disable-lz4
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
+SYSTEMD_DEPENDENCIES += linux-pam
+SYSTEMD_CONF_OPTS += --enable-pam
+else
+SYSTEMD_CONF_OPTS += --disable-pam
+endif
+
 ifeq ($(BR2_PACKAGE_XZ),y)
 SYSTEMD_DEPENDENCIES += xz
 SYSTEMD_CONF_OPTS += --enable-xz
