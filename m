From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 8 Apr 2010 09:53:47 +0200
Subject: [Buildroot] [git commit master] fbv: add patch to support bgr555
	framebuffer format.
Message-ID: <20100408080323.9F35F7F8EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6620ca7dfe3d3340eee4ea662d97ee611d84814f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: add header to patch, fix file permissions]
Signed-off-by: Josh.Wu <josh.wu@atmel.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                               |    2 +-
 package/fbv/fbv-1.0b-fix-bgr555.patch |   64 +++++++++++++++++++++++++++++++++
 2 files changed, 65 insertions(+), 1 deletions(-)
 create mode 100644 package/fbv/fbv-1.0b-fix-bgr555.patch

diff --git a/CHANGES b/CHANGES
index 2ffd672..948cad5 100644
--- a/CHANGES
+++ b/CHANGES
@@ -11,7 +11,7 @@
 	New packages: librsync, lmbench, netperf, squid
 
 	Updated/fixed packages: busybox, dnsmasq, dosfstools,
-	e2fsprogs, freetype, iperf, iptables, iw, less, libdrm,
+	e2fsprogs, fbv, freetype, iperf, iptables, iw, less, libdrm,
 	libgcrypt, libglib2, libpng, libxml2, matchbox, mdadm, memstat,
 	mtd-utils, nano, openssl, php, pppd, qt, radvd, setserial,
 	squashfs, wget, xlib_libX11, xlib_libXfont
diff --git a/package/fbv/fbv-1.0b-fix-bgr555.patch b/package/fbv/fbv-1.0b-fix-bgr555.patch
new file mode 100644
index 0000000..8f185f0
--- /dev/null
+++ b/package/fbv/fbv-1.0b-fix-bgr555.patch
@@ -0,0 +1,64 @@
+[PATCH] fbv: support bgr555 format
+
+Signed-off-by: Josh.Wu <josh.wu@atmel.com>
+diff -Naur fbv-1.0b-ori/fb_display.c fbv-1.0b/fb_display.c
+--- fbv-1.0b-ori/fb_display.c	2010-04-02 09:38:15.000000000 +0800
++++ fbv-1.0b/fb_display.c	2010-04-01 18:54:15.000000000 +0800
+@@ -297,6 +297,14 @@
+ 	 ((b >> 3) & 31)        );
+ }
+ 
++inline static unsigned short make15color_bgr(unsigned char r, unsigned char g, unsigned char b)
++{
++    return (
++	(((b >> 3) & 31) << 10) |
++	(((g >> 3) & 31) << 5)  |
++	 ((r >> 3) & 31)        );
++}
++
+ inline static unsigned short make16color(unsigned char r, unsigned char g, unsigned char b)
+ {
+     return (
+@@ -313,6 +321,14 @@
+     u_int16_t *s_fbbuff;
+     u_int32_t *i_fbbuff;
+ 
++    int is_bgr555 = 0;
++    struct fb_var_screeninfo var;
++    getVarScreenInfo(fh, &var);
++    if(var.red.offset == 0 && 
++       var.green.offset == 5 && 
++       var.blue.offset == 10)
++	is_bgr555 = 1;
++
+     switch(bpp)
+     {
+ 	case 8:
+@@ -325,15 +341,23 @@
+ 	case 15:
+ 	    *cpp = 2;
+ 	    s_fbbuff = (unsigned short *) malloc(count * sizeof(unsigned short));
+-	    for(i = 0; i < count ; i++)
+-		s_fbbuff[i] = make15color(rgbbuff[i*3], rgbbuff[i*3+1], rgbbuff[i*3+2]);
++	    if(is_bgr555)
++	    	for(i = 0; i < count ; i++)
++		    s_fbbuff[i] = make15color_bgr(rgbbuff[i*3], rgbbuff[i*3+1], rgbbuff[i*3+2]);
++	    else
++	    	for(i = 0; i < count ; i++)
++		    s_fbbuff[i] = make15color(rgbbuff[i*3], rgbbuff[i*3+1], rgbbuff[i*3+2]);
+ 	    fbbuff = (void *) s_fbbuff;
+ 	    break;
+ 	case 16:
+ 	    *cpp = 2;
+ 	    s_fbbuff = (unsigned short *) malloc(count * sizeof(unsigned short));
+-	    for(i = 0; i < count ; i++)
+-		s_fbbuff[i] = make16color(rgbbuff[i*3], rgbbuff[i*3+1], rgbbuff[i*3+2]);
++	    if(is_bgr555)
++	    	for(i = 0; i < count ; i++)
++		    s_fbbuff[i] = make15color_bgr(rgbbuff[i*3], rgbbuff[i*3+1], rgbbuff[i*3+2]);
++	    else
++	    	for(i = 0; i < count ; i++)
++		    s_fbbuff[i] = make16color(rgbbuff[i*3], rgbbuff[i*3+1], rgbbuff[i*3+2]);
+ 	    fbbuff = (void *) s_fbbuff;
+ 	    break;
+ 	case 24:
-- 
1.6.3.3
