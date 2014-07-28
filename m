From: Anton Kolesov <Anton.Kolesov@synopsys.com>
Date: Mon, 28 Jul 2014 22:02:08 +0400
Subject: [Buildroot] [PATCH 9/9] thrift: arc: Disable if ARC atomics are
	disabled
In-Reply-To: <1406570528-31516-1-git-send-email-Anton.Kolesov@synopsys.com>
References: <1406570528-31516-1-git-send-email-Anton.Kolesov@synopsys.com>
Message-ID: <1406570528-31516-9-git-send-email-Anton.Kolesov@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thrift requires GCC built-in atomic functions which are optional in ARC
toolchain.

Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
---
 package/thrift/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/thrift/Config.in b/package/thrift/Config.in
index ac99801..6ea5751 100644
--- a/package/thrift/Config.in
+++ b/package/thrift/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_THRIFT
 	depends on BR2_USE_WCHAR
 	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_arc # atomic builtins
+	depends on !BR2_arc || BR2_ARC_ATOMIC_EXT
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_LIBEVENT
 	select BR2_PACKAGE_OPENSSL
@@ -22,4 +22,6 @@ config BR2_PACKAGE_THRIFT
 comment "thrift needs a toolchain w/ C++, largefile, wchar, threads"
 	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_arc
+
+comment "thrift needs an ARC CPU w/ atomic extension"
+        depends on BR2_arc && !BR2_ARC_ATOMIC_EXT
-- 
1.8.4.1
