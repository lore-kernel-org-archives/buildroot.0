From: Grzegorz Blach <grzegorz@blach.pl>
Date: Mon,  7 Jun 2021 14:09:47 +0200
Subject: [Buildroot] [PATCH] package/python-rpi-ws281x: Bump to version 4.3.0
Message-ID: <20210607120949.2182-1-grzegorz@blach.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove 0001-ws2811.c-fix-build-with-gcc-4.8.patch,
it has been merged upstream.

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
---
 ...0001-ws2811.c-fix-build-with-gcc-4.8.patch | 51 -------------------
 .../python-rpi-ws281x/python-rpi-ws281x.hash  |  4 +-
 .../python-rpi-ws281x/python-rpi-ws281x.mk    |  4 +-
 3 files changed, 4 insertions(+), 55 deletions(-)
 delete mode 100644 package/python-rpi-ws281x/0001-ws2811.c-fix-build-with-gcc-4.8.patch

diff --git a/package/python-rpi-ws281x/0001-ws2811.c-fix-build-with-gcc-4.8.patch b/package/python-rpi-ws281x/0001-ws2811.c-fix-build-with-gcc-4.8.patch
deleted file mode 100644
index 9b534ac67a..0000000000
--- a/package/python-rpi-ws281x/0001-ws2811.c-fix-build-with-gcc-4.8.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 8faa5c2fb2b04b4fb062255aa807abafc50bff66 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 3 Apr 2021 10:27:20 +0200
-Subject: [PATCH] ws2811.c: fix build with gcc 4.8
-
-Fix the following build failure with gcc 4.8 (which has been added by
-commit 391f6e856d28510bd9ae4efd3a166da7f73613ab):
-
-lib/ws2811.c: In function 'ws2811_set_custom_gamma_factor':
-lib/ws2811.c:1289:5: error: 'for' loop initial declarations are only allowed in C99 mode
-     for (int chan = 0; chan < RPI_PWM_CHANNELS; chan++)
-     ^
-lib/ws2811.c:1289:5: note: use option -std=c99 or -std=gnu99 to compile your code
-lib/ws2811.c:1295:11: error: 'for' loop initial declarations are only allowed in C99 mode
-           for(int counter = 0; counter < 256; counter++)
-           ^
-
-Fixes:
- - http://autobuild.buildroot.org/results/3d037922484bfc45d0f985f87b38f20c5a4ab064
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/jgarff/rpi_ws281x/commit/0814bae544f0184ab1600bc2660486874eef5970]
----
- ws2811.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/ws2811.c b/ws2811.c
-index f5cdebd..6482796 100644
---- a/lib/ws2811.c
-+++ b/lib/ws2811.c
-@@ -1286,13 +1286,14 @@ const char * ws2811_get_return_t_str(const ws2811_return_t state)
- 
- void ws2811_set_custom_gamma_factor(ws2811_t *ws2811, double gamma_factor)
- {
--    for (int chan = 0; chan < RPI_PWM_CHANNELS; chan++)
-+    int chan, counter;
-+    for (chan = 0; chan < RPI_PWM_CHANNELS; chan++)
-     {
-         ws2811_channel_t *channel = &ws2811->channel[chan];
- 
-         if (channel->gamma)
-         {
--          for(int counter = 0; counter < 256; counter++)
-+          for(counter = 0; counter < 256; counter++)
-           {
- 
-              channel->gamma[counter] = (gamma_factor > 0)? (int)(pow((float)counter / (float)255.00, gamma_factor) * 255.00 + 0.5) : counter;
--- 
-2.30.2
-
diff --git a/package/python-rpi-ws281x/python-rpi-ws281x.hash b/package/python-rpi-ws281x/python-rpi-ws281x.hash
index cb021a821d..06b2d18607 100644
--- a/package/python-rpi-ws281x/python-rpi-ws281x.hash
+++ b/package/python-rpi-ws281x/python-rpi-ws281x.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/rpi-ws281x/json
-md5  5da00a092ac3755c4913f5a53451744b  rpi_ws281x-4.2.6.tar.gz
-sha256  65a9918fbdd9df1ac612ccc1a385d4a550f1bc74cc6bbf6b9035ad26dc41b3ce  rpi_ws281x-4.2.6.tar.gz
+md5  333dacfc58058d5f485f9af74551c70e  rpi_ws281x-4.3.0.tar.gz
+sha256  0b9549687ab7117acbc4bac0e92742fd2c8290fd204514d72fed91c06ba2e805  rpi_ws281x-4.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  7bbf6337c1eee7169579e6acd398f31ea274dfa3a1689ab7e654ca3585d5a8a9  LICENSE
 sha256  7bbf6337c1eee7169579e6acd398f31ea274dfa3a1689ab7e654ca3585d5a8a9  lib/LICENSE
diff --git a/package/python-rpi-ws281x/python-rpi-ws281x.mk b/package/python-rpi-ws281x/python-rpi-ws281x.mk
index b8ba119919..b711039615 100644
--- a/package/python-rpi-ws281x/python-rpi-ws281x.mk
+++ b/package/python-rpi-ws281x/python-rpi-ws281x.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_RPI_WS281X_VERSION = 4.2.6
+PYTHON_RPI_WS281X_VERSION = 4.3.0
 PYTHON_RPI_WS281X_SOURCE = rpi_ws281x-$(PYTHON_RPI_WS281X_VERSION).tar.gz
-PYTHON_RPI_WS281X_SITE = https://files.pythonhosted.org/packages/7f/1e/ea9ff56d9823fc55c79748630ffe0ceb30f619c9218743050bbf96d08704
+PYTHON_RPI_WS281X_SITE = https://files.pythonhosted.org/packages/cd/b3/eb7ac93376952f165577707ec756f40c9537ed53c59fcbc3290c357370e0
 PYTHON_RPI_WS281X_SETUP_TYPE = setuptools
 PYTHON_RPI_WS281X_LICENSE = BSD-2-Clause
 PYTHON_RPI_WS281X_LICENSE_FILES = LICENSE lib/LICENSE
-- 
2.27.0
