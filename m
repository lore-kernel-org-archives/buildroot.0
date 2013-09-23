From: Axel Lin <axel.lin@ingics.com>
Date: Mon, 23 Sep 2013 17:16:50 +0800
Subject: [Buildroot] [PATCH RESEND] package/Makefile.in: Fix dependency for
 selecting uclinux as TARGET_OS
Message-ID: <1379927810.16071.2.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Current setting only allows blackfin to select uclinux as TARGET_OS.
However, some noMMU ARM platforms that using FLAT binary format also need to
select uclinux as TARGET_OS. Fix the dependency.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
This patch was sent on
http://lists.busybox.net/pipermail/buildroot/2013-September/077488.html

I found that without this patch, I hit below build error:
__uClibc_main.c:(.text+0x240): undefined reference to `__preinit_array_start'
__uClibc_main.c:(.text+0x244): undefined reference to `__preinit_array_end'
__uClibc_main.c:(.text+0x248): undefined reference to `__init_array_start'
__uClibc_main.c:(.text+0x24c): undefined reference to `__init_array_end'
/opt/test/buildroot/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/bin/ld.real: ./libgcc_s.so.1.tmp: hidden symbol `__fini_array_end' isn't defined
/opt/test/buildroot/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/bin/ld.real: final link failed: Bad value
collect2: ld returned 1 exit status
make[3]: *** [libgcc_s.so] Error 1
make[3]: Leaving directory `/opt/test/buildroot/buildroot/output/build/host-gcc-final-4.5.4/build/arm-buildroot-linux-uclibcgnueabi/libgcc'
make[2]: *** [all-target-libgcc] Error 2
make[2]: Leaving directory `/opt/test/buildroot/buildroot/output/build/host-gcc-final-4.5.4/build'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/opt/test/buildroot/buildroot/output/build/host-gcc-final-4.5.4/build'
make: *** [/opt/test/buildroot/buildroot/output/build/host-gcc-final-4.5.4/.stamp_built] Error 2

I remember that someone has reported the same build error on the maillist.
With this patch, the build result looks OK.

 package/Makefile.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 170ad78..1699fdf 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -23,8 +23,8 @@ MAKE:=$(HOSTMAKE) -j$(PARALLEL_JOBS)
 # Compute GNU_TARGET_NAME
 GNU_TARGET_NAME=$(ARCH)-buildroot-$(TARGET_OS)-$(LIBC)$(ABI)
 
-# Blackfin FLAT needs uclinux
-ifeq ($(BR2_bfin)$(BR2_BINFMT_FLAT),yy)
+# FLAT binary format needs uclinux
+ifeq ($(BR2_BINFMT_FLAT),y)
 TARGET_OS=uclinux
 else
 TARGET_OS=linux
-- 
1.8.1.2
