From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Oct 2018 18:00:34 +0200
Subject: [Buildroot] [PATCH] package/bluez5_utils: ensure build order with
 the headers-only variant
Message-ID: <20181021160034.2542-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since bluez5_utils and bluez5_utils-headers would install the same set
of files (headers), we want to ensurfe the former is run after the
latter.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Grzegorz Blach <grzegorz@blach.pl>
Cc: Arnout Vandecappelle <arnout@mind.be>

---

This will help quell issues with top-level parallel build, to avoid two
unrelated packages to install the same files.
---
 package/bluez5_utils/bluez5_utils.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index a613def2e2..f5b827cc30 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -9,10 +9,14 @@ BLUEZ5_UTILS_VERSION = 5.50
 BLUEZ5_UTILS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
 BLUEZ5_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ5_UTILS_INSTALL_STAGING = YES
-BLUEZ5_UTILS_DEPENDENCIES = dbus libglib2
 BLUEZ5_UTILS_LICENSE = GPL-2.0+, LGPL-2.1+
 BLUEZ5_UTILS_LICENSE_FILES = COPYING COPYING.LIB
 
+BLUEZ5_UTILS_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_BLUEZ5_UTILS_HEADERS),bluez5_utils-headers) \
+	dbus \
+	libglib2
+
 BLUEZ5_UTILS_CONF_OPTS = \
 	--enable-tools \
 	--enable-library \
-- 
2.14.1
