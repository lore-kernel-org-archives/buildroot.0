From: Francois Perrad <fperrad@gmail.com>
Date: Sun,  3 Jan 2021 10:23:31 +0100
Subject: [Buildroot] [PATCH] package/htop: bump to version 3.0.4
Message-ID: <20210103092331.1091069-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

remove merged patch

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 ...ter-restore-non-wide-character-build.patch | 32 -------------------
 package/htop/htop.hash                        |  2 +-
 package/htop/htop.mk                          |  2 +-
 3 files changed, 2 insertions(+), 34 deletions(-)
 delete mode 100644 package/htop/0001-Meter-restore-non-wide-character-build.patch

diff --git a/package/htop/0001-Meter-restore-non-wide-character-build.patch b/package/htop/0001-Meter-restore-non-wide-character-build.patch
deleted file mode 100644
index 5f67d1f0f..000000000
--- a/package/htop/0001-Meter-restore-non-wide-character-build.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 79970f05f37677fe32aa804e493c5da747a2652f Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>
-Date: Tue, 15 Dec 2020 12:05:20 +0100
-Subject: [PATCH] Meter: restore non-wide-character build
-
-Use mbstowcs() only with wide ncurses support.
-
-Closes: #401
-
-[Retrieved from:
-https://github.com/htop-dev/htop/commit/79970f05f37677fe32aa804e493c5da747a2652f]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- Meter.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/Meter.c b/Meter.c
-index b006a584..e849ea4a 100644
---- a/Meter.c
-+++ b/Meter.c
-@@ -196,7 +196,11 @@ static void BarMeterMode_draw(Meter* this, int x, int y, int w) {
- 
-    // The text in the bar is right aligned;
-    // calculate needed padding and generate leading spaces
-+#ifdef HAVE_LIBNCURSESW
-    const int textLen = mbstowcs(NULL, buffer, 0);
-+#else
-+   const int textLen = strlen(buffer);
-+#endif
-    const int padding = CLAMP(w - textLen, 0, w);
- 
-    RichString_begin(bar);
diff --git a/package/htop/htop.hash b/package/htop/htop.hash
index d788c8e5c..6a6534eee 100644
--- a/package/htop/htop.hash
+++ b/package/htop/htop.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  5a0909956cd9289871269b1d146580b9c1e11218bb6d454c21d781161b6dae0f  htop-3.0.3.tar.gz
+sha256  3a403b4af4b5100a86183d3e9bb4839fcec99ac4368a60c242e9d7c742a34928  htop-3.0.4.tar.gz
 sha256  c228cc14df980a23ea0c3c9ac957b904dd6a8514f6283db403de22e9179471be  COPYING
diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index 0bea775a5..bb6185a56 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HTOP_VERSION = 3.0.3
+HTOP_VERSION = 3.0.4
 HTOP_SITE = https://dl.bintray.com/htop/source
 HTOP_DEPENDENCIES = ncurses
 # Prevent htop build system from searching the host paths
-- 
2.27.0
