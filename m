From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 28 Aug 2018 14:17:42 +0300
Subject: [Buildroot] [PATCH next] git-crypt: disable for gcc affected by bug
 #64735
Message-ID: <3ba001ca8c4a2e548c47bdb7b52573b4ab2803a8.1535455062.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

git-crypt needs exception_ptr. gcc older than 7 don't provide that on
all architectures due to gcc bug #64735.

Fixes:
http://autobuild.buildroot.net/results/2a7/2a76ce39bc639b4f17ff33f8447d9094215e68d8/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/git-crypt/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/git-crypt/Config.in b/package/git-crypt/Config.in
index bb86219cf89f..9a270b8f9d07 100644
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
-- 
2.18.0
