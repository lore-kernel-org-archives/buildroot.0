From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 Oct 2017 22:54:20 +0200
Subject: [Buildroot] [git commit] wireguard: needs 3.10+ kernel
Message-ID: <20171005204737.493D37FA99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1afda25ed281b0e842833cf85c3f3aa7cca343df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The dependency is actually only for the kernel module (and thus on the
runtime kernel version rather than kernel headers), but as we don't know the
runtime version in kconfig and the user space part doesn't make much sense
without the kernel module this will have to do.

[Peter: extend commit message, add comment to Config.in as suggested by
	Arnout, fix off-by-one in comment text]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireguard/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/wireguard/Config.in b/package/wireguard/Config.in
index 0321755..fe92fd6 100644
--- a/package/wireguard/Config.in
+++ b/package/wireguard/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_WIREGUARD
 	bool "wireguard"
+	# kernel module requires 3.10+, userspace makes no sense without it
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
 	select BR2_PACKAGE_LIBMNL
 	help
 	  WireGuard is an extremely simple yet fast and modern VPN
@@ -16,3 +18,6 @@ config BR2_PACKAGE_WIREGUARD
 	  VPN solution in the industry.
 
 	  https://www.wireguard.com
+
+comment "wireguard needs a toolchain w/ headers >= 3.10"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
