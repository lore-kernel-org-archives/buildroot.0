From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 Aug 2018 23:08:03 +0200
Subject: [Buildroot] [git commit] git-crypt: disable for gcc affected by bug
 #64735
Message-ID: <20180907111604.9DEFF7FEB5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5621911b84bd0a584afce25bc5547367d1fd0e02
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

git-crypt needs exception_ptr. gcc older than 7 don't provide that on
all architectures due to gcc bug #64735.

Fixes:
http://autobuild.buildroot.net/results/2a7/2a76ce39bc639b4f17ff33f8447d9094215e68d8/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/git-crypt/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/git-crypt/Config.in b/package/git-crypt/Config.in
index bb86219cf8..9a270b8f9d 100644
--- a/package/git-crypt/Config.in
+++ b/package/git-crypt/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_GIT_CRYPT
 	bool "git-crypt"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
 	depends on BR2_USE_MMU # git
 	select BR2_PACKAGE_GIT # runtime
 	select BR2_PACKAGE_OPENSSL
@@ -15,3 +16,7 @@ comment "git-crypt needs a toolchain w/ C++, gcc >= 4.9"
 	depends on !BR2_INSTALL_LIBSTDCPP \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on BR2_USE_MMU
+
+comment "git-crypt needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
