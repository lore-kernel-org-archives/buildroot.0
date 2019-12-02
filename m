From: Michael Vetter <jubalh@iodoru.org>
Date: Mon,  2 Dec 2019 10:51:41 +0100
Subject: [Buildroot] [PATCH 2/3] package/jasper: Apply fix for CVE-2018-19542
In-Reply-To: <20191202095142.15115-1-jubalh@iodoru.org>
References: <20191202095142.15115-1-jubalh@iodoru.org>
Message-ID: <20191202095142.15115-2-jubalh@iodoru.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add 0002-check-null-in-jp2_decode.patch:

Patch was proposed upstream[1] but upstream is very inactive.
Linux distributions use the same fix to patch their packages.

1: https://github.com/mdadams/jasper/pull/200
Signed-off-by: Michael Vetter <jubalh@iodoru.org>
---
 ...2-check-null-in-jp2_decode-CVE-2018-19542.patch | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 package/jasper/0002-check-null-in-jp2_decode-CVE-2018-19542.patch

diff --git a/package/jasper/0002-check-null-in-jp2_decode-CVE-2018-19542.patch b/package/jasper/0002-check-null-in-jp2_decode-CVE-2018-19542.patch
new file mode 100644
index 0000000000..bfe07ee786
--- /dev/null
+++ b/package/jasper/0002-check-null-in-jp2_decode-CVE-2018-19542.patch
@@ -0,0 +1,23 @@
+From fc62d1b7164ded2405fd6a0604548b34a5a77462 Mon Sep 17 00:00:00 2001
+From: Timothy Lyanguzov <timothy.lyanguzov@sap.com>
+Date: Mon, 18 Mar 2019 16:46:24 +1300
+Subject: [PATCH] Fix CVE-2018-19542: Check for NULL pointer in jp2_decode
+
+---
+ src/libjasper/jp2/jp2_dec.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/libjasper/jp2/jp2_dec.c b/src/libjasper/jp2/jp2_dec.c
+index 03b0eaf..a535c19 100644
+--- a/src/libjasper/jp2/jp2_dec.c
++++ b/src/libjasper/jp2/jp2_dec.c
+@@ -388,6 +388,9 @@ jas_image_t *jp2_decode(jas_stream_t *in, const char *optstr)
+ 				jas_image_setcmpttype(dec->image, newcmptno, jp2_getct(jas_image_clrspc(dec->image), 0, channo + 1));
+ 				}
+ #endif
++			} else {
++				jas_eprintf("error: invalid MTYP in CMAP box\n");
++				goto error;
+ 			}
+ 		}
+ 	}
-- 
2.16.4
