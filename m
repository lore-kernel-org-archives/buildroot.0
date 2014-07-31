From: Anton Kolesov <Anton.Kolesov@synopsys.com>
Date: Thu, 31 Jul 2014 17:24:50 +0400
Subject: [Buildroot] [PATCH v2 9/9] thrift: Add dependency on atomic
	intrinsics
In-Reply-To: <1406813090-32472-1-git-send-email-Anton.Kolesov@synopsys.com>
References: <20140730084548.05bd6dec@free-electrons.com>
 <1406813090-32472-1-git-send-email-Anton.Kolesov@synopsys.com>
Message-ID: <1406813090-32472-9-git-send-email-Anton.Kolesov@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thrift requires GCC built-in atomic functions which are architecture specific
and may not be implemented.

Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
---
 package/thrift/Config.in | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/thrift/Config.in b/package/thrift/Config.in
index ac99801..071c85c 100644
--- a/package/thrift/Config.in
+++ b/package/thrift/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_THRIFT
 	depends on BR2_USE_WCHAR
 	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_arc # atomic builtins
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_LIBEVENT
 	select BR2_PACKAGE_OPENSSL
@@ -19,7 +19,8 @@ config BR2_PACKAGE_THRIFT
 
 	  http://thrift.apache.org/
 
-comment "thrift needs a toolchain w/ C++, largefile, wchar, threads"
+comment "thrift needs a toolchain w/ C++, largefile, wchar, threads, atomic intrinsics"
 	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_arc
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
+
-- 
1.8.4.1
