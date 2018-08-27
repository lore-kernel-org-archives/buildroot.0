From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 27 Aug 2018 23:55:03 +0200
Subject: [Buildroot] [PATCH 1/1] librtlsdr: bump to version 0.6.0
Message-ID: <20180827215503.25709-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove second patch (already in version even if PR has not been closed):
see
https://github.com/steve-m/librtlsdr/commit/9047eef701f50d8bc4748233a31d65a0519ed86c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...x-builds-with-newer-compilers-C-standards.patch | 68 ----------------------
 package/librtlsdr/librtlsdr.hash                   |  2 +-
 package/librtlsdr/librtlsdr.mk                     |  2 +-
 3 files changed, 2 insertions(+), 70 deletions(-)
 delete mode 100644 package/librtlsdr/0002-fix-builds-with-newer-compilers-C-standards.patch

diff --git a/package/librtlsdr/0002-fix-builds-with-newer-compilers-C-standards.patch b/package/librtlsdr/0002-fix-builds-with-newer-compilers-C-standards.patch
deleted file mode 100644
index b663d08b9f..0000000000
--- a/package/librtlsdr/0002-fix-builds-with-newer-compilers-C-standards.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From ea6a86d8e792430faa3a8161ee99f2bc392875d1 Mon Sep 17 00:00:00 2001
-From: Mike Frysinger <vapier@chromium.org>
-Date: Fri, 3 Feb 2017 15:44:18 -1000
-Subject: [PATCH] fix builds with newer compilers & C standards
-
-The meaning of "inline" has changed when "static" is not used.
-Since none of these functions are used outside of their respective
-files, mark them as static to avoid build errors where funcs are
-not inlined (based on compiler flags too).
-
-Upstream status: pull request #38
-
-Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
----
- src/rtl_adsb.c  | 8 ++++----
- src/rtl_power.c | 2 +-
- 2 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/src/rtl_adsb.c b/src/rtl_adsb.c
-index e611e78..a3bfa7f 100644
---- a/src/rtl_adsb.c
-+++ b/src/rtl_adsb.c
-@@ -182,7 +182,7 @@ int magnitute(uint8_t *buf, int len)
- 	return len/2;
- }
- 
--inline uint16_t single_manchester(uint16_t a, uint16_t b, uint16_t c, uint16_t d)
-+static inline uint16_t single_manchester(uint16_t a, uint16_t b, uint16_t c, uint16_t d)
- /* takes 4 consecutive real samples, return 0 or 1, BADSAMPLE on error */
- {
- 	int bit, bit_p;
-@@ -223,17 +223,17 @@ inline uint16_t single_manchester(uint16_t a, uint16_t b, uint16_t c, uint16_t d
- 	return BADSAMPLE;
- }
- 
--inline uint16_t min16(uint16_t a, uint16_t b)
-+static inline uint16_t min16(uint16_t a, uint16_t b)
- {
- 	return a<b ? a : b;
- }
- 
--inline uint16_t max16(uint16_t a, uint16_t b)
-+static inline uint16_t max16(uint16_t a, uint16_t b)
- {
- 	return a>b ? a : b;
- }
- 
--inline int preamble(uint16_t *buf, int i)
-+static inline int preamble(uint16_t *buf, int i)
- /* returns 0/1 for preamble at index i */
- {
- 	int i2;
-diff --git a/src/rtl_power.c b/src/rtl_power.c
-index aa7a138..a7a43bb 100644
---- a/src/rtl_power.c
-+++ b/src/rtl_power.c
-@@ -249,7 +249,7 @@ void sine_table(int size)
- 	}
- }
- 
--inline int16_t FIX_MPY(int16_t a, int16_t b)
-+static inline int16_t FIX_MPY(int16_t a, int16_t b)
- /* fixed point multiply and scale */
- {
- 	int c = ((int)a * (int)b) >> 14;
--- 
-2.13.0
-
diff --git a/package/librtlsdr/librtlsdr.hash b/package/librtlsdr/librtlsdr.hash
index 9184196d9a..e7b0e84f4a 100644
--- a/package/librtlsdr/librtlsdr.hash
+++ b/package/librtlsdr/librtlsdr.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 6fd0d298c1a18fc8005b0c2f6199b08bc15e3fb4f4312f551eea2ae269c940c5  librtlsdr-v0.5.4.tar.gz
+sha256 80a5155f3505bca8f1b808f8414d7dcd7c459b662a1cde84d3a2629a6e72ae55  librtlsdr-0.6.0.tar.gz
 # License file, locally calculated
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/librtlsdr/librtlsdr.mk b/package/librtlsdr/librtlsdr.mk
index dd1feacc03..500ccc5d17 100644
--- a/package/librtlsdr/librtlsdr.mk
+++ b/package/librtlsdr/librtlsdr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRTLSDR_VERSION = v0.5.4
+LIBRTLSDR_VERSION = 0.6.0
 LIBRTLSDR_SITE = $(call github,steve-m,librtlsdr,$(LIBRTLSDR_VERSION))
 LIBRTLSDR_LICENSE = GPL-2.0+
 LIBRTLSDR_LICENSE_FILES = COPYING
-- 
2.14.1
