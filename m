From: Timo Ketola <timo.ketola@exertus.fi>
Date: Thu,  8 Mar 2018 09:22:05 +0200
Subject: [Buildroot] [PATCH v2 1/1] fbgrab: add patch fixing pixel format
 report
Message-ID: <1520493725-1146-1-git-send-email-timo.ketola@exertus.fi>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When verbosive, fbgrab reports pixel format. Green and blue offset and
msb_right fields are accidentally swapped there. This commit adds a patch
which straightens them up.

Upstream-Status: Submitted [Gunnar Monell <gmo@linux.nu>]

Signed-off-by: Timo Ketola <timo.ketola@exertus.fi>
---
No changes in the payload. Only added Upstream-status (Adrian) and
adjusted subject line (Thomas).
---
 package/fbgrab/0100-fix-pixfmt-report.patch | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 package/fbgrab/0100-fix-pixfmt-report.patch

diff --git a/package/fbgrab/0100-fix-pixfmt-report.patch b/package/fbgrab/0100-fix-pixfmt-report.patch
new file mode 100644
index 0000000..18bcf96
--- /dev/null
+++ b/package/fbgrab/0100-fix-pixfmt-report.patch
@@ -0,0 +1,22 @@
+Fix pixel format report
+
+When fbgrab tells about the framebuffer pixel format, blue and green
+are accidentally swapped in 'length' and 'msb_right' columns. Let's
+order everything as RGB.
+
+Signed-off-by timo.ketola at exertus.fi
+
+diff -u a/fbgrab.c b/fbgrab.c
+--- a/fbgrab.c	2018-03-07 11:42:04.739250433 +0200
++++ b/fbgrab.c	2018-03-07 11:43:26.128043877 +0200
+@@ -169,8 +169,8 @@
+         fprintf(stderr, "bits_per_pixel: %i\n", fb_varinfo_p->bits_per_pixel);
+         fprintf(stderr, "grayscale: %s\n", fb_varinfo_p->grayscale ? "true" : "false");
+         fprintf(stderr, "red:   offset: %i, length: %i, msb_right: %i\n", fb_varinfo_p->red.offset, fb_varinfo_p->red.length, fb_varinfo_p->red.msb_right);
+-        fprintf(stderr, "blue:  offset: %i, length: %i, msb_right: %i\n", fb_varinfo_p->blue.offset, fb_varinfo_p->green.length, fb_varinfo_p->green.msb_right);
+-        fprintf(stderr, "green: offset: %i, length: %i, msb_right: %i\n", fb_varinfo_p->green.offset, fb_varinfo_p->blue.length, fb_varinfo_p->blue.msb_right);
++        fprintf(stderr, "green: offset: %i, length: %i, msb_right: %i\n", fb_varinfo_p->green.offset, fb_varinfo_p->green.length, fb_varinfo_p->green.msb_right);
++        fprintf(stderr, "blue:  offset: %i, length: %i, msb_right: %i\n", fb_varinfo_p->blue.offset, fb_varinfo_p->blue.length, fb_varinfo_p->blue.msb_right);
+         fprintf(stderr, "alpha: offset: %i, length: %i, msb_right: %i\n", fb_varinfo_p->transp.offset, fb_varinfo_p->transp.length, fb_varinfo_p->transp.msb_right);
+         fprintf(stderr, "pixel format: %s\n", fb_varinfo_p->nonstd == 0 ? "standard" : "non-standard");
+     }
-- 
2.7.4
