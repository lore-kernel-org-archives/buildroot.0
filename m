From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Jun 2018 23:33:51 +0200
Subject: [Buildroot] [git commit] package/hidapi: select glibc gconv libs
 copy
Message-ID: <20180626213100.926168351F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a7404a79c6355343253353ba9fdd0d227e638df5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Hidapi source uses iconv_open UTF-16 conversion [1] which requires
gconv libararies when buiding with glibc in order to successfully
find serial number, manufacturer and product strings [2].

Use select in the config file to autmatically select gconv libararies
for inclusion on the target when building with glibc

Tested with ./utils/test-pkg -c hidapi.cfg -p hidapi and hidapi.cfg file
contents:
BR2_PACKAGE_HIDAPI=y
BR2_PACKAGE_EUDEV=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_USE_MMU=y
BR2_USE_WCHAR=y

Also tested on x86-64 build target with application using hidapi

[1]: https://github.com/signal11/hidapi/blob/a6a622ffb680c55da0de787ff93b80280498330f/libusb/hid.c#L446
[2]: https://www.silabs.com/community/interface/forum.topic.html/cp2114_linux_sta-RtWg

Signed-off-by: Dan Walkes <danwalkes@trellis-logic.com>
Tested-by: Dan Walkes <danwalkes@trellis-logic.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/hidapi/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/hidapi/Config.in b/package/hidapi/Config.in
index f6a31bacd3..b98c2db91c 100644
--- a/package/hidapi/Config.in
+++ b/package/hidapi/Config.in
@@ -5,6 +5,8 @@ config BR2_PACKAGE_HIDAPI
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBGUDEV
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	# runtime UTF conversion support
+	select BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  HIDAPI is a multi-platform library which allows an application
 	  to interface with USB and Bluetooth HID-Class devices on
