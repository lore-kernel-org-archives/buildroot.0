From: Axel Lin <axel.lin@ingics.com>
Date: Wed, 02 Oct 2013 13:50:54 +0800
Subject: [Buildroot] [PATCH 2/3] lmbench: needs mmu
In-Reply-To: <1380692976.31880.0.camel@phoenix>
References: <1380692976.31880.0.camel@phoenix>
Message-ID: <1380693054.31880.1.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
 package/lmbench/Config.in | 1 +
 1 file changed, 1 insertion(+)

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
-- 
1.8.1.2
