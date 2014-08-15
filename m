From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Aug 2014 22:28:51 +0200
Subject: [Buildroot] [git commit] gd: add patch for CVE-2014-2497
Message-ID: <20140815202909.42BA19D439@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=60332f38f5ceea5c66d31ec24b1421d7e6d722a1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2014-2497 - NULL pointer dereference
Patch from upstream:
https://bitbucket.org/libgd/gd-libgd/commits/463c3bd09bfe8e924e19acad7a2a6af16953a704

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gd/gd-04-CVE-2014-2497.patch |   33 +++++++++++++++++++++++++++++++++
 1 files changed, 33 insertions(+), 0 deletions(-)

diff --git a/package/gd/gd-04-CVE-2014-2497.patch b/package/gd/gd-04-CVE-2014-2497.patch
new file mode 100644
index 0000000..d30bfbb
--- /dev/null
+++ b/package/gd/gd-04-CVE-2014-2497.patch
@@ -0,0 +1,33 @@
+From 463c3bd09bfe8e924e19acad7a2a6af16953a704 Mon Sep 17 00:00:00 2001
+From: Remi Collet <fedora@famillecollet.com>
+Date: Mon, 4 Aug 2014 10:31:25 +0200
+Subject: [PATCH] CVE-2014-2497, NULL pointer dereference, fix #126
+
+---
+ src/gdxpm.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/src/gdxpm.c b/src/gdxpm.c
+index ae6e336..15603a6 100644
+--- a/src/gdxpm.c
++++ b/src/gdxpm.c
+@@ -83,6 +83,16 @@ BGD_DECLARE(gdImagePtr) gdImageCreateFromXpm(char *filename)
+ 	if(overflow2(sizeof(int), number)) {
+ 		goto done;
+ 	}
++	for(i = 0; i < number; i++) {
++		/*
++		   avoid NULL pointer dereference
++		   TODO better fix need to manage monochrome/monovisual
++		   see m_color or g4_color or g_color
++		*/
++		if (!image.colorTable[i].c_color) {
++			goto done;
++		}
++	}
+ 
+ 	colors = (int *)gdMalloc(sizeof(int) * number);
+ 	if(colors == NULL) {
+-- 
+1.8.5.2
+
