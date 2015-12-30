From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Dec 2015 22:18:11 +0100
Subject: [Buildroot] [git commit] hidapi: add libiconv handling
Message-ID: <20151230211827.943637FCBB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=97f6ba2e7bae5df8ae07b8062a5b80e044cedecb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

hidapi uses iconv functions, which on uClibc without locale support is
provided by the external libiconv library. This commit adds the
necessary libiconv handling to make the hidapi package build on
!locale toolchains.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/hidapi/Config.in | 1 +
 package/hidapi/hidapi.mk | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/package/hidapi/Config.in b/package/hidapi/Config.in
index c48a096..5119aac 100644
--- a/package/hidapi/Config.in
+++ b/package/hidapi/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_HIDAPI
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBGUDEV
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  HIDAPI is a multi-platform library which allows an application
 	  to interface with USB and Bluetooth HID-Class devices on
diff --git a/package/hidapi/hidapi.mk b/package/hidapi/hidapi.mk
index b16e4ae..270836c 100644
--- a/package/hidapi/hidapi.mk
+++ b/package/hidapi/hidapi.mk
@@ -16,4 +16,9 @@ HIDAPI_LICENSE_FILES = LICENSE.txt LICENSE-gpl3.txt LICENSE-bsd.txt LICENSE-orig
 
 HIDAPI_DEPENDENCIES = libusb libgudev
 
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+HIDAPI_DEPENDENCIES += libiconv
+HIDAPI_CONF_ENV += LIBS="-liconv"
+endif
+
 $(eval $(autotools-package))
