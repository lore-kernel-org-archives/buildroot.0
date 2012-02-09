From: Trevor Woerner <twoerner@gmail.com>
Date: Thu,  9 Feb 2012 12:40:39 -0500
Subject: [Buildroot] [PATCH fbdirect] Font handling in directfb requires
	libbz2
Message-ID: <1328809239-12021-1-git-send-email-twoerner@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Trevor Woerner <twoerner@gmail.com>

One of the libraries which is built by directfb, libidirectfbfont_ft2.so,
requires libbz2:

        libdirect-1.4.so.6 => /usr/lib/libdirect-1.4.so.6 (0x40107000)
        libdirectfb-1.4.so.6 => /usr/lib/libdirectfb-1.4.so.6 (0x40123000)
        libfusion-1.4.so.6 => /usr/lib/libfusion-1.4.so.6 (0x401c6000)
        libz.so.1 => /usr/lib/libz.so.1 (0x40003000)
        libfreetype.so.6 => /usr/lib/libfreetype.so.6 (0x401fb000)
        libm.so.6 => /lib/libm.so.6 (0x4026d000)
        libdl.so.2 => /lib/libdl.so.2 (0x40047000)
        libpthread.so.0 => /lib/libpthread.so.0 (0x4007c000)
        libc.so.6 => /lib/libc.so.6 (0x402e0000)
        libgcc_s.so.1 => /lib/libgcc_s.so.1 (0x40052000)
        libbz2.so.1 => /usr/lib/libbz2.so.1 (0x400ae000)
        /lib/ld-2.9.so (0x400e1000)

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 package/directfb/directfb.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

Although this dependency is necessary this patch is still not complete but
I'm not sure how to fix it. When I try to fun a fbdirect demo on my device
it still complains because the demo is looking to link to libbz2.so.1 and
that link is not created by default:

# df_dok
...
(!) Direct/Interface: Unable to dlopen `/usr/lib/directfb-1.4-6/interfaces/IDirectFBFont/libidirectfbfont_ft2.so'!
    --> libbz2.so.1: cannot open shared object file: No such file or directory

# ls -l /usr/lib/libbz2*
lrwxrwxrwx    1 root     root            15 Feb  9 16:32 /usr/lib/libbz2.so -> libbz2.so.1.0.4
lrwxrwxrwx    1 root     root            15 Feb  9 16:32 /usr/lib/libbz2.so.1.0 -> libbz2.so.1.0.4
-rwxr-xr-x    1 root     root         58064 Feb  9 16:34 /usr/lib/libbz2.so.1.0.4

So something still needs to be tweaked to create the /usr/lib/libbz2.so.1
link.

diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index 977d272..8fd8d5e 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -23,7 +23,7 @@ DIRECTFB_CONF_OPT = \
 	--disable-video4linux2 \
 	--without-tools
 
-DIRECTFB_DEPENDENCIES = freetype zlib
+DIRECTFB_DEPENDENCIES = freetype zlib bzip2
 
 ifeq ($(BR2_PACKAGE_DIRECTFB_MULTI),y)
 DIRECTFB_CONF_OPT += --enable-multi --enable-fusion
-- 
1.7.9.GIT
