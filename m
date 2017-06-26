From: Julien Viard de Galbert <julien@vdg.name>
Date: Tue, 27 Jun 2017 01:53:51 +0200
Subject: [Buildroot] [PATCH 1/1] dieharder: fix link issue with inline
	function not declared static
Message-ID: <1498521231-21206-1-git-send-email-julien@vdg.name>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Viard de Galbert <julien@vdg.name>
---
 .../0004-Add-static-to-inline-functions.patch      | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 package/dieharder/0004-Add-static-to-inline-functions.patch

diff --git a/package/dieharder/0004-Add-static-to-inline-functions.patch b/package/dieharder/0004-Add-static-to-inline-functions.patch
new file mode 100644
index 000000000..188641cd8
--- /dev/null
+++ b/package/dieharder/0004-Add-static-to-inline-functions.patch
@@ -0,0 +1,61 @@
+From b6c7f2c326af051b7cdffcba7660f55770308aaa Mon Sep 17 00:00:00 2001
+From: Julien Viard de Galbert <julien@vdg.name>
+Date: Tue, 27 Jun 2017 00:16:11 +0200
+Subject: [PATCH] Add static to inline functions
+
+This is needed to avoid a link error where the inline functions appear
+missing at link time.
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
+2.11.0
+
-- 
2.11.0
