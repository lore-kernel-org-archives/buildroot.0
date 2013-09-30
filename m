From: Axel Lin <axel.lin@ingics.com>
Date: Mon, 30 Sep 2013 17:18:47 +0800
Subject: [Buildroot] [PATCH] pppd: needs mmu and shared objects
Message-ID: <1380532727.13663.1.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The plugin infrastructure is based on shared objects so it won't build
for static-only scenarios.
And the daemon uses fork() so MMU is required.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/pppd/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/pppd/Config.in b/package/pppd/Config.in
index 879b263..074c2fd 100644
--- a/package/pppd/Config.in
+++ b/package/pppd/Config.in
@@ -1,10 +1,16 @@
 config BR2_PACKAGE_PPPD
 	bool "pppd"
+	depends on !BR2_PREFER_STATIC_LIB
+	depends on BR2_USE_MMU
 	help
 	  An implementation of the Point-to-point protocol.
 
 	  http://www.samba.org/ppp/
 
+comment "pppd requires a toolchain with dynamic library support"
+	depends on BR2_PREFER_STATIC_LIB
+	depends on BR2_USE_MMU
+
 config BR2_PACKAGE_PPPD_FILTER
 	depends on BR2_PACKAGE_PPPD
 	select BR2_PACKAGE_LIBPCAP
-- 
1.8.1.2
