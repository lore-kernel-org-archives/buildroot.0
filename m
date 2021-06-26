From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Jun 2021 15:06:42 +0200
Subject: [Buildroot] [git commit] package/usbguard: fix build with libgcrypt
Message-ID: <20210626123448.0D0C081520@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ac2f121159cf28fdd879883e6bcee85fcf185a40
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Building with libgcrypt fails since the addition of the package in
commit fbff7d7289cc95db991184f890f4ca1fcf8a101e:

checking for sparc64-buildroot-linux-gnu-libgcrypt-config... no
checking for libgcrypt-config... no
checking for LIBGCRYPT - version >= 1.5.0... no
configure: error: The selected crypto backend library is not available.

Fix this build failure by helping usbguard to find libgcrypt-config

Fixes:
 - http://autobuild.buildroot.org/results/4c19e50a2a5308cb31a62f1b4b538a30353022bb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/usbguard/usbguard.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/usbguard/usbguard.mk b/package/usbguard/usbguard.mk
index f3bd7c57ac..53d103346e 100644
--- a/package/usbguard/usbguard.mk
+++ b/package/usbguard/usbguard.mk
@@ -24,6 +24,8 @@ USBGUARD_DEPENDENCIES += libopenssl
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
+USBGUARD_CONF_ENV += \
+	ac_cv_path_LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
 USBGUARD_CONF_OPTS += --with-crypto-library=gcrypt
 USBGUARD_DEPENDENCIES += libgcrypt
 endif
