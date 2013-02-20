From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 20 Feb 2013 10:31:28 +0100
Subject: [Buildroot] [For master RFC] fix compiler warnings: use puts()
	instead of printf()
Message-ID: <1361352688-25309-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use puts() because printf() isn't needed,
to fix the following compiler warnings:

/barebox/common/menu.c: In function ?menu_show?:
/barebox/common/menu.c:277:4: warning: format not a string literal and no format arguments [-Wformat-security]

/barebox/scripts/omap4_usbboot.c: In function ?read_asic_id?:
/barebox/scripts/omap4_usbboot.c:101:3: warning: format not a string literal and no format arguments [-Wformat-security]

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 common/menu.c           | 2 +-
 scripts/omap4_usbboot.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/common/menu.c b/common/menu.c
index ce93838..30dced7 100644
--- a/common/menu.c
+++ b/common/menu.c
@@ -274,7 +274,7 @@ int menu_show(struct menu *m)
 			printf("Auto Select in");
 		} else {
 			auto_display_len = strlen(m->auto_display);
-			printf(m->auto_display);
+			puts(m->auto_display);
 		}
 		printf(" %2d", countdown--);
 	}
diff --git a/scripts/omap4_usbboot.c b/scripts/omap4_usbboot.c
index 8c5775d..34e53c0 100644
--- a/scripts/omap4_usbboot.c
+++ b/scripts/omap4_usbboot.c
@@ -98,7 +98,7 @@ int read_asic_id(struct usb_handle *usb)
 			sprintf(line+4+j*3, "%02X ", id[i+j]);
 		line[4+j*3+0] = '\n';
 		line[4+j*3+1] = 0;
-		printf(line);
+		puts(line);
 	}
 	ret = 0;
 	for (i = 1, j = 0; i < sizeof(id) && j < id[0]; i += 2+id[i+1], j++) {
-- 
1.8.1.1
