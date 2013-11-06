From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 Nov 2013 22:49:37 +0100
Subject: [Buildroot] [git commit] connman: disable on avr32
Message-ID: <20131106215120.344579BAEE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=de0b7e9ff30b6202f0e4f093aad9fe18837b3d0a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The inotify_init1 syscall is not available on avr32. Fixes build failures
such as the following.

  http://autobuild.buildroot.net/results/0d8/0d8e7bd8bd3f227fabfb0d5feb59a5d316026d3f

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/connman/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/connman/Config.in b/package/connman/Config.in
index c74618a..c8b640f 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_CONNMAN
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_IPTABLES
 	select BR2_PACKAGE_GNUTLS
+	depends on !BR2_avr32 # no inotify_init1
 	depends on !BR2_UCLIBC_VERSION_0_9_32
 	depends on BR2_USE_WCHAR # libglib2 and gnutls
 	depends on BR2_INET_IPV6
@@ -50,5 +51,6 @@ config BR2_PACKAGE_CONNMAN_CLIENT
 endif # BR2_PACKAGE_CONNMAN
 
 comment "connman needs a toolchain w/ IPv6, wchar, threads, resolver"
+	depends on !BR2_avr32
 	depends on BR2_UCLIBC_VERSION_0_9_32 || \
 		!BR2_USE_WCHAR || !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
