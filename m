From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 Oct 2017 22:45:30 +0200
Subject: [Buildroot] [git commit] lvm2: add host variant
Message-ID: <20171005203902.1FB317FEB5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=90cfc5f16a29f2c469048e4019af63289d106e87
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is only for the device-mapper library, so a user selectable
Config.in.host option isn't needed.

[Peter: add host-pkgconf dependency as pointed out by Arnout]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lvm2/lvm2.mk | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index f7f7069..9880c12 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -51,4 +51,17 @@ ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
 LVM2_CONF_ENV += ac_cv_flag_HAVE_PIE=no
 endif
 
+HOST_LVM2_DEPENDENCIES = host-pkgconf
+HOST_LVM2_CONF_OPTS = \
+	--enable-write_install \
+	--enable-pkgconfig \
+	--disable-cmdlib \
+	--disable-dmeventd \
+	--disable-applib \
+	--disable-fsadm \
+	--disable-readline
+HOST_LVM2_MAKE_OPTS = device-mapper
+HOST_LVM2_INSTALL_OPTS = install_device-mapper
+
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
