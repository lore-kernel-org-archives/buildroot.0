From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 13 Sep 2013 00:20:08 +0200
Subject: [Buildroot] [git commit] ulogd: needs mmu and shared objects
Message-ID: <20130912223325.A301F9B295@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f560d38dc8b832ea32f777bbab22bc2c7f9c7005
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The plugin infrastructure is based on shared objects so it won't build
for static-only scenarios.
And the daemon uses fork() so MMU is required.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ulogd/Config.in |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/ulogd/Config.in b/package/ulogd/Config.in
index 7dc4f11..a524056 100644
--- a/package/ulogd/Config.in
+++ b/package/ulogd/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_ULOGD
 	bool "ulogd"
 	depends on BR2_INET_IPV6
 	depends on BR2_LARGEFILE
+	depends on !BR2_PREFER_STATIC_LIB
+	depends on BR2_USE_MMU
 	select BR2_PACKAGE_LIBMNL
 	select BR2_PACKAGE_LIBNETFILTER_ACCT
 	select BR2_PACKAGE_LIBNETFILTER_CONNTRACK
@@ -12,5 +14,6 @@ config BR2_PACKAGE_ULOGD
 
 	  http://www.netfilter.org/projects/ulogd/
 
-comment "ulogd requires a toolchain with IPV6 and LARGEFILE support"
-	depends on !BR2_INET_IPV6 || !BR2_LARGEFILE
+comment "ulogd requires a toolchain with IPV6, LARGEFILE and dynamic library support"
+	depends on !BR2_INET_IPV6 || !BR2_LARGEFILE || BR2_PREFER_STATIC_LIB
+	depends on BR2_USE_MMU
