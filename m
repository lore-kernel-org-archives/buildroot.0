From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Oct 2020 23:43:14 +0100
Subject: [Buildroot] [git commit] package/sispmctl: fix build with gcc 4.8
Message-ID: <20201031223125.EEBB48699B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cc5089a9c9a50c6162fc40c1d1aeedc30128ef02
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/079f1454121d38a83c49529c0f6cc8ed61fd5abb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...001-src-schedule.c-fix-build-with-gcc-4.8.patch | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/package/sispmctl/0001-src-schedule.c-fix-build-with-gcc-4.8.patch b/package/sispmctl/0001-src-schedule.c-fix-build-with-gcc-4.8.patch
new file mode 100644
index 0000000000..69dc31e353
--- /dev/null
+++ b/package/sispmctl/0001-src-schedule.c-fix-build-with-gcc-4.8.patch
@@ -0,0 +1,56 @@
+From 3ccbb67c71aa13b9a37a58363d37a18b8fdbf300 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 29 Oct 2020 13:36:00 +0100
+Subject: [PATCH] src/schedule.c: fix build with gcc 4.8
+
+Fix the following build failure with gcc 4.8:
+
+schedule.c:19:2: error: 'for' loop initial declarations are only allowed in C99 mode
+  for (int i = 0; i < 4; ++i) {
+  ^
+schedule.c:19:2: note: use option -std=c99 or -std=gnu99 to compile your code
+schedule.c: In function 'pms2_read_block':
+schedule.c:39:2: error: 'for' loop initial declarations are only allowed in C99 mode
+  for (int i = 0; i < 4; ++i) {
+  ^
+
+Fixes:
+ - http://autobuild.buildroot.org/results/079f1454121d38a83c49529c0f6cc8ed61fd5abb
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://sourceforge.net/p/sispmctl/git/merge-requests/1]
+---
+ src/schedule.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/schedule.c b/src/schedule.c
+index 4dd908d..1725421 100644
+--- a/src/schedule.c
++++ b/src/schedule.c
+@@ -15,8 +15,9 @@
+ static unsigned char
+ *pms2_write_block(uint8_t action, uint32_t time, unsigned char *ptr)
+ {
++	int i;
+ 	*ptr++ = action;	
+-	for (int i = 0; i < 4; ++i) {
++	for (i = 0; i < 4; ++i) {
+ 		*ptr++ = (uint8_t)time;
+ 		time >>= 8;
+ 	}
+@@ -34,9 +35,10 @@ static unsigned char
+ static const unsigned char
+ *pms2_read_block(uint8_t *action, uint32_t *time, const unsigned char *ptr)
+ {
++	int i;
+ 	*action = *ptr++;
+ 	*time = 0;
+-	for (int i = 0; i < 4; ++i) {
++	for (i = 0; i < 4; ++i) {
+ 		*time >>= 8;
+ 		*time += (uint32_t)*ptr++ << 24;
+ 	}
+-- 
+2.28.0
+
