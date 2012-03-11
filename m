From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 11 Mar 2012 18:48:09 -0300
Subject: [Buildroot] [PATCH 20/20] alsa-utils: bump to version 1.0.25
In-Reply-To: <1331502489-5036-1-git-send-email-gustavo@zacarias.com.ar>
References: <1331502489-5036-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1331502489-5036-20-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../alsa-utils/alsa-utils-exp10-workaround.patch   |   33 --------------------
 package/multimedia/alsa-utils/alsa-utils.mk        |    3 +-
 2 files changed, 2 insertions(+), 34 deletions(-)
 delete mode 100644 package/multimedia/alsa-utils/alsa-utils-exp10-workaround.patch

diff --git a/package/multimedia/alsa-utils/alsa-utils-exp10-workaround.patch b/package/multimedia/alsa-utils/alsa-utils-exp10-workaround.patch
deleted file mode 100644
index f4a520a..0000000
--- a/package/multimedia/alsa-utils/alsa-utils-exp10-workaround.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From da14c5ab2a6e030c5c56c979b8eb3ca071890876 Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <jacmet@sunsite.dk>
-Date: Mon, 14 Mar 2011 09:19:18 +0100
-Subject: [PATCH] alsamixer: fix build on uClibc
-
-exp10 is a glibc extension, which isn't supported on uClibc. Luckily,
-exp10() is trivial to compute based on exp(), so add a wrapper for
-the uClibc case.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- alsamixer/volume_mapping.c |    5 +++++
- 1 files changed, 5 insertions(+), 0 deletions(-)
-
-diff --git a/alsamixer/volume_mapping.c b/alsamixer/volume_mapping.c
-index 9cacad8..1c0d7c4 100644
---- a/alsamixer/volume_mapping.c
-+++ b/alsamixer/volume_mapping.c
-@@ -37,6 +37,11 @@
- #include <stdbool.h>
- #include "volume_mapping.h"
- 
-+#ifdef __UCLIBC__
-+/* 10^x = 10^(log e^x) = (e^x)^log10 = e^(x * log 10) */
-+#define exp10(x) (exp((x) * log(10)))
-+#endif /* __UCLIBC__ */
-+
- #define MAX_LINEAR_DB_SCALE	24
- 
- static inline bool use_linear_dB_scale(long dBmin, long dBmax)
--- 
-1.7.2.3
-
diff --git a/package/multimedia/alsa-utils/alsa-utils.mk b/package/multimedia/alsa-utils/alsa-utils.mk
index 59579c2..744ec85 100644
--- a/package/multimedia/alsa-utils/alsa-utils.mk
+++ b/package/multimedia/alsa-utils/alsa-utils.mk
@@ -3,7 +3,8 @@
 # alsa-utils
 #
 #############################################################
-ALSA_UTILS_VERSION = 1.0.24.2
+
+ALSA_UTILS_VERSION = 1.0.25
 ALSA_UTILS_SOURCE = alsa-utils-$(ALSA_UTILS_VERSION).tar.bz2
 ALSA_UTILS_SITE = ftp://ftp.alsa-project.org/pub/utils
 ALSA_UTILS_INSTALL_STAGING = YES
-- 
1.7.3.4
