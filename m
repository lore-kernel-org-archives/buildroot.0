From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon,  5 Dec 2016 14:15:04 +0100
Subject: [Buildroot] [PATCH] bluez5_utils: add autoreconf back
Message-ID: <20161205131504.28872-1-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Not necessary for an unmodified package. However if your external
layer includes BlueZ5 patches which brings new files (such as a
new hciattach protocol), it will not be built since the Makefile.in
is already there.

Forcing an autoreconf fixes such issue.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
Hi all,

I know this is a corner case which isn't a problem for 99% of users
so I won't be surprised if it is rejected.

The use case here is that we provide a WiFi/BT combo from Qualcomm
(QCA9377) which isn't supported in upstream BlueZ5.
https://boundarydevices.com/product/bd_sdmac_wifi/

Qualcomm said there was no plan to upstream the support, but provides
their own (outdated) tree in codeaurora:
https://source.codeaurora.org/quic/la/platform/external/bluetooth/bluez/

We generated a patch out of that repo that allows to add support for
this chip in Yocto (with a simple bbappend):
https://github.com/boundarydevices/meta-boundary/tree/krogoth/recipes-connectivity/bluez5/bluez5

Now the idea is to provide a Boundary external layer that adds support
for this chip in Buildroot.

When adding this patch, the builds fails since hciattach_rome.c isn't
specified in the Makefile.in already present in the archive.

Let me know if there's another opion in your opinion.

Regards,
Gary
---
 package/bluez5_utils/bluez5_utils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 49cc7c2..af92926 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -11,6 +11,7 @@ BLUEZ5_UTILS_INSTALL_STAGING = YES
 BLUEZ5_UTILS_DEPENDENCIES = dbus libglib2
 BLUEZ5_UTILS_LICENSE = GPLv2+, LGPLv2.1+
 BLUEZ5_UTILS_LICENSE_FILES = COPYING COPYING.LIB
+BLUEZ5_UTILS_AUTORECONF = YES
 
 BLUEZ5_UTILS_CONF_OPTS = 	\
 	--enable-tools 		\
-- 
2.10.2
