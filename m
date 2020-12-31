From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 31 Dec 2020 17:32:12 +0100
Subject: [Buildroot] [git commit] package/htop: fix build without wchar
Message-ID: <20201231161434.894A284204@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1dcbd3f602325d33ce647430c7be3957047d40fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/5ad330244546e6f087425be816aea158a1f833cb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...01-Meter-restore-non-wide-character-build.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/package/htop/0001-Meter-restore-non-wide-character-build.patch b/package/htop/0001-Meter-restore-non-wide-character-build.patch
new file mode 100644
index 0000000000..5f67d1f0f1
--- /dev/null
+++ b/package/htop/0001-Meter-restore-non-wide-character-build.patch
@@ -0,0 +1,32 @@
+From 79970f05f37677fe32aa804e493c5da747a2652f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>
+Date: Tue, 15 Dec 2020 12:05:20 +0100
+Subject: [PATCH] Meter: restore non-wide-character build
+
+Use mbstowcs() only with wide ncurses support.
+
+Closes: #401
+
+[Retrieved from:
+https://github.com/htop-dev/htop/commit/79970f05f37677fe32aa804e493c5da747a2652f]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ Meter.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/Meter.c b/Meter.c
+index b006a584..e849ea4a 100644
+--- a/Meter.c
++++ b/Meter.c
+@@ -196,7 +196,11 @@ static void BarMeterMode_draw(Meter* this, int x, int y, int w) {
+ 
+    // The text in the bar is right aligned;
+    // calculate needed padding and generate leading spaces
++#ifdef HAVE_LIBNCURSESW
+    const int textLen = mbstowcs(NULL, buffer, 0);
++#else
++   const int textLen = strlen(buffer);
++#endif
+    const int padding = CLAMP(w - textLen, 0, w);
+ 
+    RichString_begin(bar);
