From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Aug 2015 11:16:04 +0200
Subject: [Buildroot] [git commit] package/cpio: add argp-standalone
	dependency with musl
Message-ID: <20150808095147.0F0CE7F963@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7d53040f330e68d3ddb611b73e3c8098552ab612
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since argp-standalone is only available for uClibc-ng
and musl toolchains, add the dependendy only if it's
selected.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cpio/Config.in |    2 +-
 package/cpio/cpio.mk   |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cpio/Config.in b/package/cpio/Config.in
index df40fac..1210a0b 100644
--- a/package/cpio/Config.in
+++ b/package/cpio/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_CPIO
 	bool "cpio"
 	# Need argp.h support
-	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC
+	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_USE_WCHAR
 	help
 	  cpio archive utility for creation and extraction.
diff --git a/package/cpio/cpio.mk b/package/cpio/cpio.mk
index aa9dace..e18af81 100644
--- a/package/cpio/cpio.mk
+++ b/package/cpio/cpio.mk
@@ -15,10 +15,10 @@ CPIO_PATCH = \
 	https://projects.archlinux.org/svntogit/packages.git/plain/cpio/trunk/cpio-2.11-check_for_symlinks-CVE-2015-1197.patch \
 	https://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/app-arch/cpio/files/cpio-2.11-stat.patch
 
-# cpio uses argp.h which is not provided by uclibc by default.
+# cpio uses argp.h which is not provided by uclibc or musl by default.
 # Use the argp-standalone package to provide this but make sure
 # the host package does not try to use the host version.
-ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
+ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
 CPIO_DEPENDENCIES += argp-standalone
 endif
 
