From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 13 Mar 2016 21:17:12 +0100
Subject: [Buildroot] [git commit] kbd: fix install to target
Message-ID: <20160313204834.89FC58025E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=28a55b66897f97e3acad36549a4c9e02e7f5dc22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The package makefile attempted to append to KBD_INSTALL_TARGET_OPTS, but this
fails when done before evaluating $(autotools-package). This is because
autotools-package uses ?= to set default values. Instead of appending we now
override KBD_INSTALL_TARGET_OPTS.

Signed-off-by: Niels Skou Olsen <niels@tonebarker.dk>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kbd/kbd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kbd/kbd.mk b/package/kbd/kbd.mk
index 9dabce1..0243c53 100644
--- a/package/kbd/kbd.mk
+++ b/package/kbd/kbd.mk
@@ -17,6 +17,6 @@ KBD_LICENSE = GPLv2+
 KBD_LICENSE_FILES = COPYING
 KBD_AUTORECONF = YES
 
-KBD_INSTALL_TARGET_OPTS += MKINSTALLDIRS=$(@D)/config/mkinstalldirs
+KBD_INSTALL_TARGET_OPTS = MKINSTALLDIRS=$(@D)/config/mkinstalldirs DESTDIR=$(TARGET_DIR) install
 
 $(eval $(autotools-package))
