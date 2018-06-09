From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  9 Jun 2018 10:43:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/libvorbis: add upstream security
 patch to fix CVE-2017-14160
Message-ID: <20180609084337.16238-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...ounds-check-on-very-low-sample-rates.patch | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/libvorbis/0001-CVE-2017-14160-fix-bounds-check-on-very-low-sample-rates.patch

diff --git a/package/libvorbis/0001-CVE-2017-14160-fix-bounds-check-on-very-low-sample-rates.patch b/package/libvorbis/0001-CVE-2017-14160-fix-bounds-check-on-very-low-sample-rates.patch
new file mode 100644
index 0000000000..e84f3d4799
--- /dev/null
+++ b/package/libvorbis/0001-CVE-2017-14160-fix-bounds-check-on-very-low-sample-rates.patch
@@ -0,0 +1,28 @@
+From: Thomas Daede <daede003@umn.edu>
+Date: Wed, 9 May 2018 21:56:59 +0000 (-0700)
+Subject: CVE-2017-14160: fix bounds check on very low sample rates.
+X-Git-Url: https://git.xiph.org/?p=vorbis.git;a=commitdiff_plain;h=018ca26dece618457dd13585cad52941193c4a25
+
+CVE-2017-14160: fix bounds check on very low sample rates.
+
+Downloaded from upstream commit
+https://git.xiph.org/?p=vorbis.git;a=commitdiff;h=018ca26dece618457dd13585cad52941193c4a25
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+
+diff --git a/lib/psy.c b/lib/psy.c
+index 422c6f1..1310123 100644
+--- a/lib/psy.c
++++ b/lib/psy.c
+@@ -602,8 +602,9 @@ static void bark_noise_hybridmp(int n,const long *b,
+   for (i = 0, x = 0.f;; i++, x += 1.f) {
+ 
+     lo = b[i] >> 16;
+-    if( lo>=0 ) break;
+     hi = b[i] & 0xffff;
++    if( lo>=0 ) break;
++    if( hi>=n ) break;
+ 
+     tN = N[hi] + N[-lo];
+     tX = X[hi] - X[-lo];
-- 
2.17.1
