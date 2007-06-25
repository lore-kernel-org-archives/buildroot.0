From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Tue, 26 Jun 2007 01:36:23 +0300 (EEST)
Subject: [Buildroot] PATCH: DirectFB PAGE_SIZE handling
Message-ID: <36606.127.0.0.1.1182810983.squirrel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

DirectFB lib/direct/system.c uses PAGE_SIZE definition and fails to build:
system.c: In function 'direct_pagesize':
system.c:64: error: 'PAGE_SIZE' undeclared (first use in this function)
system.c:64: error: (Each undeclared identifier is reported only once
system.c:64: error: for each function it appears in.)

There is no PAGE_SIZE in <asm/page.h> at least on ARM, the following patch
forces DirectFB to detect PAGE_SIZE via sysconf( _SC_PAGESIZE ) libc call:

diff -urN buildroot.orig/package/directfb/directfb.mk
buildroot.new/package/directfb/directfb.mk
--- buildroot.orig/package/directfb/directfb.mk 2007-05-18 10:15:13.000000000 +0300
+++ buildroot.new/package/directfb/directfb.mk  2007-06-26 00:17:13.000000000 +0300
@@ -26,6 +26,7 @@
        LDFLAGS="$(TARGET_LDFLAGS)" \
        ac_cv_header_linux_wm97xx_h=no \
        ac_cv_header_linux_sisfb_h=no \
+       ac_cv_header_asm_page_h=no \
        ./configure \
                --target=$(GNU_TARGET_NAME) \
                --host=$(GNU_TARGET_NAME) \

Also patch is attached because my mailer breaks formatting.

Best regards,
Ivan
-------------- next part --------------
A non-text attachment was scrubbed...
Name: DirectFB-patch_PAGE_SIZE.diff
Type: application/octet-stream
Size: 493 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070626/f1993d5e/attachment.obj 
