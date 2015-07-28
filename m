From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2015 22:56:09 +0200
Subject: [Buildroot] [git commit] iproute2: needs headers >= 3.0
Message-ID: <20150728205615.DF9317FF4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=869af2ad3de46c79677699f007a5ee942aa0bb3d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The newest iproute2 version requires a toolchain with headers >= 3.0 for
proper namespace & bpf support, so adjust the dependencies and
dependants accordingly. Fixes:

http://autobuild.buildroot.net/results/fa8/fa810f310c7540e02c0ed84c4a3ce74ab602daa5/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ifupdown/Config.in |    6 ++++--
 package/iproute2/Config.in |    5 +++++
 package/openswan/Config.in |    5 +++++
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/package/ifupdown/Config.in b/package/ifupdown/Config.in
index 10cf2be..1e11e4e 100644
--- a/package/ifupdown/Config.in
+++ b/package/ifupdown/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_IFUPDOWN
 	bool "ifupdown"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # iproute2
 	# Default/our uclibc lacks wordexp()
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC
 	# runtime for ip binary
@@ -12,6 +13,7 @@ config BR2_PACKAGE_IFUPDOWN
 
 	  https://tracker.debian.org/pkg/ifupdown
 
-comment "ifupdown needs an (e)glibc or musl toolchain"
+comment "ifupdown needs an (e)glibc or musl toolchain w/ headers >= 3.0"
 	depends on BR2_USE_MMU
-	depends on BR2_TOOLCHAIN_USES_UCLIBC
+	depends on BR2_TOOLCHAIN_USES_UCLIBC || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
diff --git a/package/iproute2/Config.in b/package/iproute2/Config.in
index 0662492..fd373a8 100644
--- a/package/iproute2/Config.in
+++ b/package/iproute2/Config.in
@@ -1,8 +1,13 @@
 config BR2_PACKAGE_IPROUTE2
 	bool "iproute2"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # bpf, namespaces
 	help
 	  Kernel routing and traffic control utilities. Provides things
 	  like ip and tc.
 
 	  http://www.linuxfoundation.org/collaborate/workgroups/networking/iproute2
+
+comment "iproute2 needs a toolchain w/ headers >= 3.0"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
diff --git a/package/openswan/Config.in b/package/openswan/Config.in
index 932a75f..0370143 100644
--- a/package/openswan/Config.in
+++ b/package/openswan/Config.in
@@ -1,9 +1,14 @@
 config BR2_PACKAGE_OPENSWAN
 	bool "openswan"
 	depends on BR2_USE_MMU # iproute2
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # iproute2
 	select BR2_PACKAGE_GMP
 	select BR2_PACKAGE_IPROUTE2
 	help
 	  Openswan is an implementation of IPsec for Linux
 
 	  http://www.openswan.org
+
+comment "openswan needs a toolchain w/ headers >= 3.0"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
