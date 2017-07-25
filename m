From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Jul 2017 23:56:56 +0200
Subject: [Buildroot] [git commit branch/2017.05.x] dieharder: fix link issue
	with inline function not declared static
Message-ID: <20170725222212.4E78081D5C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7d62ce62bbe2a2184777c334b837cf555c7cbf0b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.05.x

Fixes:

  http://autobuild.buildroot.net/results/b629754c6a820446ff38df8202ea1ed0041bc4ac
  http://autobuild.buildroot.net/results/e02325e06866618d9d3ee90600dc3326465c56a1
  http://autobuild.buildroot.net/results/c1db73dcb25ea1db4be0f9d6ce2bf2d02f5bd5bb
  http://autobuild.buildroot.net/results/bd93120ee7cbfeb4fe7cbcd7f845f131743caf05
  http://autobuild.buildroot.net/results/273ba504de31bc17fd41e91ee5d6c0b34797a4f9
  http://autobuild.buildroot.net/results/37920b26f9c4853a0d620eb4a33b50b53e548888
  http://autobuild.buildroot.net/results/ee668405ed234fbbd644a01d49e8d9d41d216cf6
  http://autobuild.buildroot.net/results/5b76d62ad03d0cbe483792b32ea14ce7d7432983
  http://autobuild.buildroot.net/results/cf08d42be8fcb659d59288e2cedf3f18b660e8a6
  http://autobuild.buildroot.net/results/e1309fd2eea5daf854f4314b92ec441092239cd5

Signed-off-by: Julien Viard de Galbert <julien@vdg.name>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 21133ada326c87627f7bdee4493d8086587c3cca)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0004-Add-static-to-inline-functions.patch      | 65 ++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/package/dieharder/0004-Add-static-to-inline-functions.patch b/package/dieharder/0004-Add-static-to-inline-functions.patch
new file mode 100644
index 0000000..64cde1d
--- /dev/null
+++ b/package/dieharder/0004-Add-static-to-inline-functions.patch
@@ -0,0 +1,65 @@
+From 9c71a211dcf20f53f747326f5bc3fee9fabe3f52 Mon Sep 17 00:00:00 2001
+From: Julien Viard de Galbert <julien@vdg.name>
+Date: Tue, 27 Jun 2017 00:16:11 +0200
+Subject: [PATCH] Add static to inline functions
+
+This is needed to avoid a link error where the inline functions appear
+missing at link time.
+From c99 standard inline function should either be declared static or
+have an extern instance in a c file for linking.
+This fix is necessary to build with gcc 7; for some reason it was not
+trigerred before.
+
+Signed-off-by: Julien Viard de Galbert <julien@vdg.name>
+---
+ libdieharder/dab_filltree.c  | 4 ++--
+ libdieharder/dab_filltree2.c | 4 ++--
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/libdieharder/dab_filltree.c b/libdieharder/dab_filltree.c
+index 9cc5ce7..a377c3d 100644
+--- a/libdieharder/dab_filltree.c
++++ b/libdieharder/dab_filltree.c
+@@ -34,7 +34,7 @@ static double targetData[] = {
+ 0.0, 0.0, 0.0, 0.0, 0.13333333, 0.20000000, 0.20634921, 0.17857143, 0.13007085, 0.08183633, 0.04338395, 0.01851828, 0.00617270, 0.00151193, 0.00023520, 0.00001680, 0.00000000, 0.00000000, 0.00000000, 0.00000000
+ };
+ 
+-inline int insert(double x, double *array, unsigned int startVal);
++static inline int insert(double x, double *array, unsigned int startVal);
+ 
+ int dab_filltree(Test **test,int irun) {
+  int size = (ntuple == 0) ? 32 : ntuple;
+@@ -105,7 +105,7 @@ int dab_filltree(Test **test,int irun) {
+ }
+ 
+ 
+-inline int insert(double x, double *array, unsigned int startVal) {
++static inline int insert(double x, double *array, unsigned int startVal) {
+  uint d = (startVal + 1) / 2;
+  uint i = startVal;
+  while (d > 0) {
+diff --git a/libdieharder/dab_filltree2.c b/libdieharder/dab_filltree2.c
+index 1e33af2..59cbd52 100644
+--- a/libdieharder/dab_filltree2.c
++++ b/libdieharder/dab_filltree2.c
+@@ -92,7 +92,7 @@ static double targetData[128] = {  // size=128, generated from 6e9 samples
+ 0.00000000000e+00,0.00000000000e+00,0.00000000000e+00,0.00000000000e+00,
+ };
+ 
+-inline int insertBit(uint x, uchar *array, uint *i, uint *d);
++static inline int insertBit(uint x, uchar *array, uint *i, uint *d);
+ 
+ int dab_filltree2(Test **test, int irun) {
+  int size = (ntuple == 0) ? 128 : ntuple;
+@@ -181,7 +181,7 @@ int dab_filltree2(Test **test, int irun) {
+  * The function returns >= 0 if the path went too deep; the
+  * returned value is the last position of the path.
+  */
+-inline int insertBit(uint x, uchar *array, uint *i, uint *d) {
++static inline int insertBit(uint x, uchar *array, uint *i, uint *d) {
+  if (x != 0) {
+    *i += *d;
+  } else {
+-- 
+2.13.2
+
