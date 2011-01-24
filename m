From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 24 Jan 2011 17:04:28 +0100
Subject: [Buildroot] [git commit master 1/1] busybox: 1.18.2 fix for wc
Message-ID: <20110124160459.B2DC28D233@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=87cb38b9286f1eca230e77715d7d8fca8289358e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../busybox/busybox-1.18.2/busybox-1.18.2-wc.patch |   41 ++++++++++++++++++++
 1 files changed, 41 insertions(+), 0 deletions(-)
 create mode 100644 package/busybox/busybox-1.18.2/busybox-1.18.2-wc.patch

diff --git a/package/busybox/busybox-1.18.2/busybox-1.18.2-wc.patch b/package/busybox/busybox-1.18.2/busybox-1.18.2-wc.patch
new file mode 100644
index 0000000..558896d
--- /dev/null
+++ b/package/busybox/busybox-1.18.2/busybox-1.18.2-wc.patch
@@ -0,0 +1,41 @@
+--- busybox-1.18.2/coreutils/wc.c
++++ busybox-1.18.2-wc/coreutils/wc.c
+@@ -81,11 +81,11 @@
+  * column order in "wc -cmlwL" output:
+  */
+ enum {
+-	WC_LINES    = 0,
+-	WC_WORDS    = 1,
+-	WC_UNICHARS = 2,
+-	WC_CHARS    = 3,
+-	WC_LENGTH   = 4,
++	WC_LINES    = 0, /* -l */
++	WC_WORDS    = 1, /* -w */
++	WC_UNICHARS = 2, /* -m */
++	WC_BYTES    = 3, /* -c */
++	WC_LENGTH   = 4, /* -L */
+ 	NUM_WCS     = 5,
+ };
+ 
+@@ -104,10 +104,10 @@ int wc_main(int argc UNUSED_PARAM, char 
+ 
+ 	init_unicode();
+ 
+-	print_type = getopt32(argv, "lwcmL");
++	print_type = getopt32(argv, "lwmcL");
+ 
+ 	if (print_type == 0) {
+-		print_type = (1 << WC_LINES) | (1 << WC_WORDS) | (1 << WC_CHARS);
++		print_type = (1 << WC_LINES) | (1 << WC_WORDS) | (1 << WC_BYTES);
+ 	}
+ 
+ 	argv += optind;
+@@ -157,7 +157,7 @@ int wc_main(int argc UNUSED_PARAM, char 
+ 			}
+ 
+ 			/* Cater for -c and -m */
+-			++counts[WC_CHARS];
++			++counts[WC_BYTES];
+ 			if (unicode_status != UNICODE_ON /* every byte is a new char */
+ 			 || (c & 0xc0) != 0x80 /* it isn't a 2nd+ byte of a Unicode char */
+ 			) {
-- 
1.7.3.4
