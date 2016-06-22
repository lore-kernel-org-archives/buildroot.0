From: Waldemar Brodkorb <wbx@openadk.org>
Date: Wed, 22 Jun 2016 21:13:23 +0200
Subject: [Buildroot] [PATCH] bluez_utils: disable PIE for m68k
Message-ID: <20160622191323.GA5898@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

PIE for m68k seems broken even for non-static case.
Fixes following kind of autobuild failures:
http://autobuild.buildroot.net/results/5bb524a58575d57de1006ffa70be17ca713e7730/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/bluez_utils/bluez_utils.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/bluez_utils/bluez_utils.mk b/package/bluez_utils/bluez_utils.mk
index c2e8295..91c2905 100644
--- a/package/bluez_utils/bluez_utils.mk
+++ b/package/bluez_utils/bluez_utils.mk
@@ -54,4 +54,9 @@ BLUEZ_UTILS_CONF_OPTS +=	\
 	--disable-usb
 endif
 
+# PIE is broken for m68k
+ifeq ($(BR2_m68k),y)
+BLUEZ_UTILS_CONF_OPTS += --disable-pie
+endif
+
 $(eval $(autotools-package))
-- 
2.1.4
