From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Dec 2019 20:31:57 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/acsccid: needs
 iconv
Message-ID: <20191222204327.873108D6ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b0a87da6cc29ab97c3806e108377dc7799a76a73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Upstream commit
https://github.com/acshk/acsccid/commit/5672d821ba96deb6c0c11060e4de0c9dab9b21c7
added "include <iconv.h>"

Fixes:
http://autobuild.buildroot.net/results/04e/04eac264718a47c550bb48b3c36314751fb4de91/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f9bcd91e5c7f4631c14971ef29047cbd534c577a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/acsccid/Config.in  | 1 +
 package/acsccid/acsccid.mk | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/acsccid/Config.in b/package/acsccid/Config.in
index 90624ee797..74dd6de295 100644
--- a/package/acsccid/Config.in
+++ b/package/acsccid/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_ACSCCID
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pcsc-lite, libusb
 	depends on BR2_USE_MMU # pcsc-lite
 	depends on !BR2_STATIC_LIBS # pcsc-lite
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_PCSC_LITE
 	# Even though there is a --disable-libusb option, it has in
 	# fact no effect, and acsccid really requires libusb.
diff --git a/package/acsccid/acsccid.mk b/package/acsccid/acsccid.mk
index abb25ac3be..28a31b95a3 100644
--- a/package/acsccid/acsccid.mk
+++ b/package/acsccid/acsccid.mk
@@ -13,4 +13,8 @@ ACSCCID_INSTALL_STAGING = YES
 ACSCCID_DEPENDENCIES = pcsc-lite host-flex host-pkgconf libusb
 ACSCCID_CONF_OPTS = --enable-usbdropdir=/usr/lib/pcsc/drivers
 
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+ACSCCID_DEPENDENCIES += libiconv
+endif
+
 $(eval $(autotools-package))
