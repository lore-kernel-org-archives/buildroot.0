From: Axel Lin <axel.lin@ingics.com>
Date: Mon, 23 Sep 2013 09:53:42 +0800
Subject: [Buildroot] [PATCH] iputils: needs mmu
Message-ID: <1379901222.31674.0.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
This fixes below build errors with nommu:
/tmp/ccHDVaoW.o: Inrarp_lookup function '`do_fork':
rdisc.c::(.text+0x988
): undefined reference to `fork'
collect2: rarpd.cld returned 1 exit status:
(.text+0x690): make[1]: warning*** [rdisc] Error 1
:make[1]: *** Waiting for unfinished jobs....
 gethostbyname is obsolescent, use getnameinfo() instead.
/tmp/ccTnxssg.o: In function `main':    
rarpd.c:(.text+0xffc): undefined reference to `fork'
collect2: ld returned 1 exit status
make[1]: *** [rarpd] Error 1

 package/iputils/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/iputils/Config.in b/package/iputils/Config.in
index 0c77b5f..d4d2829 100644
--- a/package/iputils/Config.in
+++ b/package/iputils/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_IPUTILS
 	bool "iputils"
 	select BR2_OPENSSL if BR2_INET_IPV6
+	depends on BR2_USE_MMU # fork()
 	help
 	  This package is set of small useful utilities for Linux networking.
 	  It includes complete versions of ping, traceroute, etc.
-- 
1.8.1.2
