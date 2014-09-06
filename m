From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 6 Sep 2014 22:15:27 +0200
Subject: [Buildroot] [git commit] cppcms: really depend on wchar
Message-ID: <20140906202005.0B0169D618@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0b29df3f1941adea0d9e7a76171594222e9ab0e1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit f8993ebb34823b301ea2bf4f1f57495ec29b906b ("cppcms: needs
wchar support even without icu"), Peter wanted to move the wchar
dependency from the ICU sub-option of cppcms to the main cppcms option
itself. However, for some reason it didn't do the entire change, and
the commit was lacking:

 * Removing the wchar dependency from BR2_PACKAGE_CPPCMS_ICU

 * Adding the wchar dependency to BR2_PACKAGE_CPPCMS.

It was only handling the two comments.

This should really fix:

  http://autobuild.buildroot.net/results/6f8/6f8e8b68235f6cf0dfef13e3ed11f97a3ab50a06/

and other similar build failures that are still occuring after
f8993ebb34823b301ea2bf4f1f57495ec29b906b has been applied.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cppcms/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/cppcms/Config.in b/package/cppcms/Config.in
index 460c875..f02ff17 100644
--- a/package/cppcms/Config.in
+++ b/package/cppcms/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_CPPCMS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on !BR2_PREFER_STATIC_LIB # dlopen()
+	depends on BR2_USE_WCHAR
 	help
 	  CppCMS is a Free High Performance Web Development Framework
 	  (not a CMS) aimed for Rapid Web Application Development. It
@@ -25,7 +26,6 @@ if BR2_PACKAGE_CPPCMS
 config BR2_PACKAGE_CPPCMS_ICU
 	bool "enable icu support"
 	depends on !BR2_BINFMT_FLAT # icu
-	depends on BR2_USE_WCHAR # icu
 	depends on BR2_ARCH_HAS_ATOMICS # icu
 	select BR2_PACKAGE_ICU
 	help
