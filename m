From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Jan 2021 22:11:43 +0100
Subject: [Buildroot] [git commit] package/coremark-pro: fix build with
 uclibc-ng
Message-ID: <20210118205305.1114C7F899@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0f7019601f2b4a312e62c1f1598c037eed744047
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following linking error with uClibc-ng:

/nvme/rc-buildroot-test/scripts/instance-1/output-1/host/bin/arc-buildroot-linux-uclibc-gcc  -o/nvme/rc-buildroot-test/scripts/instance-1/output-1/build/coremark-pro-1.1.2743/builds/linux/gcc/bin/cjpeg-rose7-preset cjpeg-rose7-preset.o /nvme/rc-buildroot-test/scripts/instance-1/output-1/build/coremark-pro-1.1.2743/builds/linux/gcc/obj/bench/consumer_v2/cjpeg/*.o  /nvme/rc-buildroot-test/scripts/instance-1/output-1/build/coremark-pro-1.1.2743/builds/linux/gcc/obj/mith.a -lm -lpthread  -lrt
/nvme/rc-buildroot-test/scripts/instance-1/output-1/host/lib/gcc/arc-buildroot-linux-uclibc/10.2.0/../../../../arc-buildroot-linux-uclibc/bin/ld: /nvme/rc-buildroot-test/scripts/instance-1/output-1/host/lib/gcc/arc-buildroot-linux-uclibc/10.2.0/libgcc.a(unwind-dw2-fde-dip.o): in function `_Unwind_Find_FDE':
/nvme/rc-buildroot-test/scripts/instance-1/output-1/build/host-gcc-final-arc-2020.09-release/build/arc-buildroot-linux-uclibc/libgcc/../../../libgcc/unwind-dw2-fde-dip.c:469: undefined reference to `dl_iterate_phdr'
/nvme/rc-buildroot-test/scripts/instance-1/output-1/host/lib/gcc/arc-buildroot-linux-uclibc/10.2.0/../../../../arc-buildroot-linux-uclibc/bin/ld: /nvme/rc-buildroot-test/scripts/instance-1/output-1/build/host-gcc-final-arc-2020.09-release/build/arc-buildroot-linux-uclibc/libgcc/../../../libgcc/unwind-dw2-fde-dip.c:469: undefined reference to `dl_iterate_phdr'
/nvme/rc-buildroot-test/scripts/instance-1/output-1/host/lib/gcc/arc-buildroot-linux-uclibc/10.2.0/../../../../arc-buildroot-linux-uclibc/bin/ld: GOT and PLT relocations cannot be fixed with a non dynamic linker
/nvme/rc-buildroot-test/scripts/instance-1/output-1/host/lib/gcc/arc-buildroot-linux-uclibc/10.2.0/../../../../arc-buildroot-linux-uclibc/bin/ld: final link failed: bad value
collect2: error: ld returned 1 exit status
/nvme/rc-buildroot-test/scripts/instance-1/output-1/build/coremark-pro-1.1.2743/workloads/cjpeg-rose7-preset//Makefile:65: recipe for target '/nvme/rc-buildroot-test/scripts/instance-1/output-1/build/coremark-pro-1.1.2743/builds/linux/gcc/bin/cjpeg-rose7-preset' failed

Since uClibc-ng 1.0.18 a circular dependency between libc and libgcc
exist, when static linking is used. It can be resolved by the compiler
when -static is correctly passed in the linking step.

So use TARGET_LDFLAGS to pass LDFLAGS

Fixes:
 - http://autobuild.buildroot.org/results/ca86624b09fed961d2b9086fee8b2029845746ea

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/coremark-pro/coremark-pro.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/coremark-pro/coremark-pro.mk b/package/coremark-pro/coremark-pro.mk
index f69279d5cd..515b8eafbd 100644
--- a/package/coremark-pro/coremark-pro.mk
+++ b/package/coremark-pro/coremark-pro.mk
@@ -10,7 +10,7 @@ COREMARK_PRO_LICENSE = Apache-2.0
 COREMARK_PRO_LICENSE_FILES = LICENSE.md
 COREMARK_PRO_DEPENDENCIES = perl
 
-COREMARK_PRO_LDFLAGS = -lm
+COREMARK_PRO_LDFLAGS = $(TARGET_LDFLAGS) -lm
 
 ifeq ($(BR2_ENDIAN),"BIG")
 COREMARK_PRO_DEFINES += \
