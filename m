From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  3 Apr 2021 14:36:13 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/python-rpi-ws281w: fix build with gcc 4.8
Message-ID: <20210403123613.2218193-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix build failure with gcc 4.8 which is raised since bump to version
4.2.6 in commit f21d46bf99e2c3a86a86586bc3e82b214104cd30

Fixes:
 - http://autobuild.buildroot.org/results/3d037922484bfc45d0f985f87b38f20c5a4ab064

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Update upstream status

 ...0001-ws2811.c-fix-build-with-gcc-4.8.patch | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 package/python-rpi-ws281x/0001-ws2811.c-fix-build-with-gcc-4.8.patch

diff --git a/package/python-rpi-ws281x/0001-ws2811.c-fix-build-with-gcc-4.8.patch b/package/python-rpi-ws281x/0001-ws2811.c-fix-build-with-gcc-4.8.patch
new file mode 100644
index 0000000000..9b534ac67a
--- /dev/null
+++ b/package/python-rpi-ws281x/0001-ws2811.c-fix-build-with-gcc-4.8.patch
@@ -0,0 +1,51 @@
+From 8faa5c2fb2b04b4fb062255aa807abafc50bff66 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 3 Apr 2021 10:27:20 +0200
+Subject: [PATCH] ws2811.c: fix build with gcc 4.8
+
+Fix the following build failure with gcc 4.8 (which has been added by
+commit 391f6e856d28510bd9ae4efd3a166da7f73613ab):
+
+lib/ws2811.c: In function 'ws2811_set_custom_gamma_factor':
+lib/ws2811.c:1289:5: error: 'for' loop initial declarations are only allowed in C99 mode
+     for (int chan = 0; chan < RPI_PWM_CHANNELS; chan++)
+     ^
+lib/ws2811.c:1289:5: note: use option -std=c99 or -std=gnu99 to compile your code
+lib/ws2811.c:1295:11: error: 'for' loop initial declarations are only allowed in C99 mode
+           for(int counter = 0; counter < 256; counter++)
+           ^
+
+Fixes:
+ - http://autobuild.buildroot.org/results/3d037922484bfc45d0f985f87b38f20c5a4ab064
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/jgarff/rpi_ws281x/commit/0814bae544f0184ab1600bc2660486874eef5970]
+---
+ ws2811.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/ws2811.c b/ws2811.c
+index f5cdebd..6482796 100644
+--- a/lib/ws2811.c
++++ b/lib/ws2811.c
+@@ -1286,13 +1286,14 @@ const char * ws2811_get_return_t_str(const ws2811_return_t state)
+ 
+ void ws2811_set_custom_gamma_factor(ws2811_t *ws2811, double gamma_factor)
+ {
+-    for (int chan = 0; chan < RPI_PWM_CHANNELS; chan++)
++    int chan, counter;
++    for (chan = 0; chan < RPI_PWM_CHANNELS; chan++)
+     {
+         ws2811_channel_t *channel = &ws2811->channel[chan];
+ 
+         if (channel->gamma)
+         {
+-          for(int counter = 0; counter < 256; counter++)
++          for(counter = 0; counter < 256; counter++)
+           {
+ 
+              channel->gamma[counter] = (gamma_factor > 0)? (int)(pow((float)counter / (float)255.00, gamma_factor) * 255.00 + 0.5) : counter;
+-- 
+2.30.2
+
-- 
2.30.2
