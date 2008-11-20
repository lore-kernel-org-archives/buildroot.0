From: Weber, Bernd <BWEBE@dolby.com>
Date: Thu, 20 Nov 2008 09:00:03 -0800
Subject: [Buildroot] binutils in target system: 'LONG_MIN' undeclared
In-Reply-To: <6c8937b20811200104w374564efu9b8eb7e5d19783c2@mail.gmail.com>
References: <6c8937b20811200104w374564efu9b8eb7e5d19783c2@mail.gmail.com>
Message-ID: <05BB196AB3DA6C4BBE11AB6C957581FE124F9707@sfo-exch-01.dolby.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I think you hit the problem with the last rpath and LDFLAGS patch in
package/Makefile.in -> r24000. Try my patch (remove the rpath-line):

 

--- ../temp/buildroot/package/Makefile.in 2008-11-17 11:04:59.538371000
-0800

+++ package/Makefile.in 2008-11-17 16:02:07.495849000 -0800

@@ -38,8 +38,7 @@

 
########################################################################
#

 ifeq ($(BR2_TOOLCHAIN_SOURCE),y)

 TARGET_CFLAGS=$(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) \

-     -I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include \

-     -Wl,--rpath-link -Wl,$(STAGING_DIR)/lib -Wl,--rpath-link
-Wl,$(STAGING_DIR)/usr/lib

+     -I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include

 TARGET_LDFLAGS+=-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib  ifeq
($(BR2_TOOLCHAIN_SYSROOT),y)  TARGET_CFLAGS+= $(BR2_SYSROOT)
$(BR2_ISYSROOT)

 

 

________________________________

From: buildroot-bounces@uclibc.org [mailto:buildroot-bounces at uclibc.org]
On Behalf Of l m
Sent: Thursday, November 20, 2008 1:04 AM
To: buildroot at uclibc.org
Subject: [Buildroot] binutils in target system: 'LONG_MIN' undeclared

 

Dear All,

 

I found in recent buildroot system, the compiling was not successful,
but the previous version Revision: 23573 is fine. The error is 

 

build_i686/staging_dir/usr/bin/i686-linux-uclibc-gcc -Os
-Ibuild_i686/staging_dir/usr/include -Ibuild_i686/staging_dir/include
-Wl,--rpath-link -Wl,build_i686/staging_dir/lib -Wl,--rpath-link
-Wl,build_i686/staging_dir/usr/lib --sysroot=build_i686/staging_dir/
-isysroot build_i686/staging_dir -mtune=i686 -march=i686 -c
-DHAVE_CONFIG_H -Os  -Ibuild_i686/staging_dir/usr/include
-Ibuild_i686/staging_dir/include -Wl,--rpath-link
-Wl,build_i686/staging_dir/lib -Wl,--rpath-link
-Wl,build_i686/staging_dir/usr/lib --sysroot=build_i686/staging_dir/
-isysroot build_i686/staging_dir -mtune=i686 -march=i686 -I.
-Itoolchain_build_i686/binutils-2.18/libiberty/../include  -W -Wall
-Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic
toolchain_build_i686/binutils-2.18/libiberty/fibheap.c -o fibheap.o
toolchain_build_i686/binutils-2.18/libiberty/fibheap.c: In function
'fibheap_union':
toolchain_build_i686/binutils-2.18/libiberty/fibheap.c:151: warning:
implicit declaration of function 'free'
toolchain_build_i686/binutils-2.18/libiberty/fibheap.c: In function
'fibheap_delete_node':
toolchain_build_i686/binutils-2.18/libiberty/fibheap.c:258: error:
'LONG_MIN' undeclared (first use in this function)
toolchain_build_i686/binutils-2.18/libiberty/fibheap.c:258: error: (Each
undeclared identifier is reported only once
toolchain_build_i686/binutils-2.18/libiberty/fibheap.c:258: error: for
each function it appears in.)
toolchain_build_i686/binutils-2.18/libiberty/fibheap.c: In function
'fibheap_consolidate':
toolchain_build_i686/binutils-2.18/libiberty/fibheap.c:360: warning:
implicit declaration of function 'memset'
toolchain_build_i686/binutils-2.18/libiberty/fibheap.c:360: warning:
incompatible implicit declaration of built-in function 'memset'
make[3]: *** [fibheap.o] Error 1
make[3]: Leaving directory `build_i686/binutils-2.18-target/libiberty'
make[2]: *** [all-libiberty] Error 2
make[2]: Leaving directory `build_i686/binutils-2.18-target'
make[1]: *** [all] Error 2
make[1]: Leaving directory `build_i686/binutils-2.18-target'
make: *** [build_i686/binutils-2.18-target/binutils/objdump] Error 2

Some flags appear twice. There is one "checking for limits.h... no" in
binutils, it seems limits.h from gcc isn't included here, other a few
times checking is "yes". 

 

 I'm using a X86 board, Could you help me to figure this out? Thank you

 

LM

 

 




-----------------------------------------
This message (including any attachments) may contain confidential
information intended for a specific individual and purpose.  If you
are not the intended recipient, delete this message.  If you are
not the intended recipient, disclosing, copying, distributing, or
taking any action based on this message is strictly prohibited.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20081120/9a63b22e/attachment-0001.htm 
