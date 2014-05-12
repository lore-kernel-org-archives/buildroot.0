From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 May 2014 00:09:19 +0200
Subject: [Buildroot] [PATCH] cppcms: needs NPTL support
Message-ID: <1399932559-12200-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cppcms uses some thread functions that are not available in certain
uClibc thread implementations. Even though a bit more restrictive than
necessary, adding a NPTL dependency is the easiest solution, and is
quite logical for a relatively large and complex package such as
cppcms.

Fixes:

  http://autobuild.buildroot.net/results/a26/a26574419aacbea4140dfca1d503bcab599edd71/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cppcms/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cppcms/Config.in b/package/cppcms/Config.in
index 688d8f2..614abeb 100644
--- a/package/cppcms/Config.in
+++ b/package/cppcms/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_CPPCMS
 	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_LIBGCRYPT
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on !BR2_PREFER_STATIC_LIB # dlopen()
 	help
 	  CppCMS is a Free High Performance Web Development Framework
@@ -39,6 +39,6 @@ comment "icu support needs a toolchain w/ wchar"
 
 endif
 
-comment "cppcms needs a toolchain w/ C++, threads, dynamic library"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+comment "cppcms needs a toolchain w/ C++, NPTL, dynamic library"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		BR2_PREFER_STATIC_LIB
-- 
1.9.2
