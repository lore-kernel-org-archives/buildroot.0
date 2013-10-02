From: Axel Lin <axel.lin@ingics.com>
Date: Wed, 02 Oct 2013 13:51:55 +0800
Subject: [Buildroot] [PATCH 3/3] netkitbase: needs mmu
In-Reply-To: <1380692976.31880.0.camel@phoenix>
References: <1380692976.31880.0.camel@phoenix>
Message-ID: <1380693115.31880.2.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix below build error:

/opt/test/buildroot/buildroot/output/host/usr/bin/arm-buildroot-uclinux-uclibcgnueabi-gcc  inetd.o servtab.o builtins.o sig.o daemon.o setproctitle.o mysleep.o  -o inetd
servtab.o: In function `loadconfigfile.clone.0':
servtab.c:(.text+0x98c): warning: gethostbyname is obsolescent, use getnameinfo() instead.
inetd.o: In function `main':
inetd.c:(.text+0x8a4): undefined reference to `fork'
inetd.c:(.text+0x974): undefined reference to `fork'
daemon.o: In function `daemon':
daemon.c:(.text+0xc): undefined reference to `fork'
collect2: ld returned 1 exit status
make[2]: *** [inetd] Error 1

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/netkitbase/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/netkitbase/Config.in b/package/netkitbase/Config.in
index dd9166c..40833ad 100644
--- a/package/netkitbase/Config.in
+++ b/package/netkitbase/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_NETKITBASE
 	bool "netkitbase"
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	depends on BR2_USE_MMU # fork()
 	depends on BR2_DEPRECATED
 	help
 	  Old-style inetd.
-- 
1.8.1.2
