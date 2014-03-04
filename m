From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  3 Mar 2014 22:58:50 -0300
Subject: [Buildroot] [PATCH] libnftnl: exclude for CS PPC toolchains
Message-ID: <1393898330-20409-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The CS PPC 2011.3 and 2010.9 toolchains have a bad linux/socket.h header
that doesn't define sa_family_t which is used by linux/netlink.h (and
libnftnl).
Patching external toolchain headers wouldn't be too nice and they seem
to be the only CS toolchains affected.
It's definitely NOT a kernel header version issue, the toolchain is
based on 2.6.38 headers and vanilla 2.6.38 has the proper definitions in
place. Fixes:
http://autobuild.buildroot.net/results/1e2/1e2cac84f0faa9b8915a628260ef41765d86e174/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libnftnl/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libnftnl/Config.in b/package/libnftnl/Config.in
index 75ca519..ffd9d5b 100644
--- a/package/libnftnl/Config.in
+++ b/package/libnftnl/Config.in
@@ -3,6 +3,8 @@ config BR2_PACKAGE_LIBNFTNL
 	depends on BR2_INET_IPV6
 	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	# bad headers, no sa_family_t in linux/socket.h
+	depends on !(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103 || BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009)
 	select BR2_PACKAGE_LIBMNL
 	help
 	  libnftnl is a userspace library providing a low-level
-- 
1.8.3.2
