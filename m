From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 May 2015 15:31:23 +0200
Subject: [Buildroot] [git commit] dhcpcd: needs kernel headers >= 3.1
Message-ID: <20150513133734.6874481DEB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=80e651db43a9cbd4da7149d091b1ba1fdbb7d678
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

commit dfbfa6ef (dhcpcd: blacklist Sourcery PowerPC toolchains) blacklisted
specific toolchains, but the issue is actually that the kernel headers
before 3.1 didn't define sa_family_t, so instead require 3.1+ headers.

The specific kernel change fixing the headers is:
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=6602a4baf4d1a73cc

The only reverse dependency of dhcpcd (network-manager) already needs 3.7+,
so this dependency doesn't need to be propagated.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dhcpcd/Config.in |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/dhcpcd/Config.in b/package/dhcpcd/Config.in
index f2ca099..88f2e48 100644
--- a/package/dhcpcd/Config.in
+++ b/package/dhcpcd/Config.in
@@ -1,9 +1,11 @@
+comment "dhcpcd needs a toolchain w/ headers >= 3.1"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
+
 config BR2_PACKAGE_DHCPCD
 	bool "dhcpcd"
 	# No support for AI_ADDRCONFIG
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
-	# bad headers, no sa_family_t in linux/socket.h
-	depends on !(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103 || BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009)
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1 # sa_family_t in linux/socket.h
 	help
 	  An RFC2131 compliant DHCP client
 
