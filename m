From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 May 2015 15:31:59 +0200
Subject: [Buildroot] [git commit] libnftnl: needs kernel headers >= 3.1
Message-ID: <20150513133734.7529C7FADF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d8bef8038dfd43ca24a5f65bbb5c4990890b1b07
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Contrary to what commit f5866484f (libnftnl: exclude for CS PPC toolchains)
stated, a missing sa_family_t definition IS specific to the kernel headers
version, and not something particular to the CS toolchains, so instead
require 3.1+ headers.

The specific kernel change fixing the headers is:
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=6602a4baf4d1a73cc

The only reverse dependency of libnftnl (nftables) already needs 3.4+, so
this dependency doesn't need to be propagated.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnftnl/Config.in |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libnftnl/Config.in b/package/libnftnl/Config.in
index dcbfde0..365ab10 100644
--- a/package/libnftnl/Config.in
+++ b/package/libnftnl/Config.in
@@ -1,7 +1,9 @@
+comment "libnftnl needs a toolchain w/ headers >= 3.1"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
+
 config BR2_PACKAGE_LIBNFTNL
 	bool "libnftnl"
-	# bad headers, no sa_family_t in linux/socket.h
-	depends on !(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103 || BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009)
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
 	select BR2_PACKAGE_LIBMNL
 	help
 	  libnftnl is a userspace library providing a low-level
