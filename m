From: Niels Skou Olsen <niels@tonebarker.dk>
Date: Sat, 12 Mar 2016 13:43:58 +0100
Subject: [Buildroot] [PATCH 1/1] kbd: fix target install
Message-ID: <1457786638-13861-1-git-send-email-niels@tonebarker.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The package makefile fails to append to the KBD_INSTALL_TARGET_OPTS variable in
autotools-package. This means that the DESTDIR and install target are lost, and
so the package is never installed to target.

To fix it the append must happen after the eval of autotools-package.

Signed-off-by: Niels Skou Olsen <niels@tonebarker.dk>
---
 package/kbd/kbd.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/kbd/kbd.mk b/package/kbd/kbd.mk
index 9dabce1..72519ff 100644
--- a/package/kbd/kbd.mk
+++ b/package/kbd/kbd.mk
@@ -17,6 +17,7 @@ KBD_LICENSE = GPLv2+
 KBD_LICENSE_FILES = COPYING
 KBD_AUTORECONF = YES
 
-KBD_INSTALL_TARGET_OPTS += MKINSTALLDIRS=$(@D)/config/mkinstalldirs
-
 $(eval $(autotools-package))
+
+# must happen after the autotools-package eval, or else the append becomes an overwrite
+KBD_INSTALL_TARGET_OPTS += MKINSTALLDIRS=$(@D)/config/mkinstalldirs
-- 
2.5.0
