From: Martin Bark <martin@barkynet.com>
Date: Mon,  7 Mar 2016 10:37:11 +0000
Subject: [Buildroot] [PATCH v2] package/kbd: fix not installing to the target
Message-ID: <1457347031-12817-1-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit https://git.busybox.net/buildroot/commit/?id=9f81bad fixed a build
error in kbd but unfortunately it broke the target install rule so that
nothing is being installed.

Add the missing DESTDIR=$(TARGET_DIR) install to KBD_INSTALL_TARGET_OPTS
so that it installs to the target again.

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Martin Bark <martin@barkynet.com>

---

Changes v1 -> v2
 - Moved KBD_INSTALL_TARGET_OPTS before $(eval $(autotools-package))
   (Suggested by Thomas)
---
 package/kbd/kbd.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/kbd/kbd.mk b/package/kbd/kbd.mk
index 9dabce1..7d9adf3 100644
--- a/package/kbd/kbd.mk
+++ b/package/kbd/kbd.mk
@@ -17,6 +17,7 @@ KBD_LICENSE = GPLv2+
 KBD_LICENSE_FILES = COPYING
 KBD_AUTORECONF = YES
 
-KBD_INSTALL_TARGET_OPTS += MKINSTALLDIRS=$(@D)/config/mkinstalldirs
+KBD_INSTALL_TARGET_OPTS = MKINSTALLDIRS=$(@D)/config/mkinstalldirs \
+	DESTDIR=$(TARGET_DIR) install
 
 $(eval $(autotools-package))
-- 
2.7.2
