From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 Oct 2013 09:33:37 +0200
Subject: [Buildroot] [git commit] lmbench: needs mmu
Message-ID: <20131002074535.6D6C59B831@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ebe764c790fa0d763b0346f021d768060c70d491
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix below build error:

./tmp./bin/arm/lmbench.a(lib_timing.o): In function `benchmp':
lib_timing.c:(.text+0x34fc): undefined reference to `fork'
collect2: ld returned 1 exit status.
./bin/arm/lmbench.a(lib_tcp.o): In function `tcp_connect/'cc8Ta2C2.o: Inmake[2]:  function `*** [../bin/arm/bw_file_rd] Error 1
initialize':
lib_tcp.c:make[2]: (.text+0x208): warning: gethostbyname*** Waiting for unfinished jobs....
 is obsolescent, use: getnameinfo
bw_pipe.c(): (instead..text
/+tmp0x134/)cc5yg1Q2.o: :undefined In  referencefunction  to`server_main `'fork:
'bw_tcp.c
.:.(./textbin+/0x298arm)/:lmbench.a (undefinedlib_timing.o )reference:  Into  function`fork '`
benchmp/'tmp:/
cc5yg1Q2.olib_timing.c:: (In.text function+0x34fc `)main: 'undefined:
 bw_tcp.creference: (to. text`fork+0x370'
)collect2: : undefined reference to `fork'
../bin/armld returned 1 exit status/lmbench.a(lib_timing.o): In function
`benchmp':
lib_timing.c:(.text+0x34fc): undefined reference to `fork'
collect2: ld returned 1 exit status
make[2]: *** [../bin/arm/bw_pipe] Error 1
make[2]: *** [../bin/arm/bw_tcp] Error 1
../bin/arm/lmbench.a(lib_timing.o): In function `benchmp':
lib_timing.c:(.text+0x34fc): undefined reference to `fork'
collect2: ld returned 1 exit status
make[2]: *** [../bin/arm/bw_mmap_rd] Error 1
../bin/arm/lmbench.a(lib_timing.o): In function `benchmp':
lib_timing.c:(.text+0x34fc): undefined reference to `fork'
collect2: ld returned 1 exit status
make[2]: *** [../bin/arm/bw_mem] Error 1

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lmbench/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/lmbench/Config.in b/package/lmbench/Config.in
index c7b656c..d0a23ad 100644
--- a/package/lmbench/Config.in
+++ b/package/lmbench/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LMBENCH
 	bool "lmbench"
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC || BR2_TOOLCHAIN_HAS_THREADS # libtirpc
 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	depends on BR2_USE_MMU # fork()
 	help
 	  LMbench is a suite of simple, portable,
 	  ANSI/C microbenchmarks for UNIX/POSIX.
