From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Dec 2019 09:57:41 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/jasper: Apply fix
 for CVE-2018-19542
Message-ID: <20191206085334.6A31482125@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=631c5570b9629970066cbf342d50aba75d5ac0ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Add 0002-check-null-in-jp2_decode.patch:

Patch was proposed upstream[1] but upstream is very inactive.
Linux distributions use the same fix to patch their packages.

1: https://github.com/mdadams/jasper/pull/200
Signed-off-by: Michael Vetter <jubalh@iodoru.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 61703b82cdcbd32dd27e8a8f2de31dfa45e6a2b1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...2-check-null-in-jp2_decode-CVE-2018-19542.patch | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/package/jasper/0002-check-null-in-jp2_decode-CVE-2018-19542.patch b/package/jasper/0002-check-null-in-jp2_decode-CVE-2018-19542.patch
new file mode 100644
index 0000000000..515a6162cd
--- /dev/null
+++ b/package/jasper/0002-check-null-in-jp2_decode-CVE-2018-19542.patch
@@ -0,0 +1,24 @@
+From fc62d1b7164ded2405fd6a0604548b34a5a77462 Mon Sep 17 00:00:00 2001
+From: Timothy Lyanguzov <timothy.lyanguzov@sap.com>
+Date: Mon, 18 Mar 2019 16:46:24 +1300
+Subject: [PATCH] Fix CVE-2018-19542: Check for NULL pointer in jp2_decode
+
+Signed-off-by: Michael Vetter <jubalh@iodoru.org>
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
