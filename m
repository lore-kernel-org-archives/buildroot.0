From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Nov 2014 22:55:26 +0100
Subject: [Buildroot] [git commit] qemu: needs IPv6
Message-ID: <20141103215748.481A2B1944@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=45fe0d3b4698112a438c6199d73e18c4078c1ad1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/f53/f53d4d47a6b65c40c1b122dfad61d9164e533bf0/

Actually only the linux-user code needs it, but with the _CUSTOM_TARGETS
option it is difficult to ensure it only for userland emulation, so just add
it to the main qemu option.

At the same time add the missing wchar/mmu dependencies to the comment.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qemu/Config.in |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index e8d03da..ebd2684 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -1,6 +1,7 @@
-comment "QEMU requires a toolchain with threads"
+comment "QEMU requires a toolchain with IPv6, wchar, threads"
 	depends on BR2_i386 || BR2_x86_64
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
+	depends on !(BR2_TOOLCHAIN_HAS_THREADS && BR2_USE_WCHAR && BR2_INET_IPV6)
 
 config BR2_PACKAGE_QEMU
 	bool "QEMU"
@@ -8,6 +9,7 @@ config BR2_PACKAGE_QEMU
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR # gettext
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_INET_IPV6 # for linux-user
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_PIXMAN
 	select BR2_PACKAGE_ZLIB
