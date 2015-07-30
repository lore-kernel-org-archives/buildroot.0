From: Brendan Heading <brendanheading@gmail.com>
Date: Thu, 30 Jul 2015 20:45:30 +0100
Subject: [Buildroot] [PATCH RFC 1/1] package/libpthsem: cannot be sanely
	cross-compiled
Message-ID: <1438285530-320-1-git-send-email-brendanheading@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following :
http://autobuild.buildroot.net/results/675df26d7b47e02bad0b22f3e1cb404076a84a91/
http://autobuild.buildroot.net/results/003c4313676cc79c72a9296159ff63dce177f079/
http://autobuild.buildroot.net/results/86bd9fd83278a5468856f4abf700df57749d8e09/
http://autobuild.buildroot.net/results/97205d8fce8d0851208d167fc3fc7ccce40d391a/
http://autobuild.buildroot.net/results/1764c8f7f84fc5bad950fdb41ecadff571ceb36b/
http://autobuild.buildroot.net/results/e733cb648398df7efd7ccae6493af3c92713a9bd/

I'm submitting this as RFC as it seems strange that I've come across this
only now, but I don't see how libpthsem ever cross compiled in its current
form.

During the configure stage, libpthsem attempts to compile and run an
executable to detect capabilities such as which direction the stack grows,
behaviour of setjmp, etc. Obviously these fail to execute on non-Intel
architectures, leading to defaults which cause the build to fail even
on architectures where libpthsem is supposed to work.

I've tested mipsel, sparcv8 and aarch64 here but I expect it will fail
for all the other non-Intel architectures too.

There are flags to force some (but not all) of these settings to certain
fallbacks. It's not clear, without access to each of these architectures,
what the correct default fallback settings should be.

This patch therefore disables libpthsem and its dependents on non-Intel
architectures.

Signed-off-by: Brendan Heading <brendanheading@gmail.com>
---
 package/bcusdk/Config.in    | 3 +++
 package/gnupg2/Config.in    | 3 +++
 package/libpthsem/Config.in | 2 ++
 package/linknx/Config.in    | 3 +++
 4 files changed, 11 insertions(+)

diff --git a/package/bcusdk/Config.in b/package/bcusdk/Config.in
index 72deef1..a712941 100644
--- a/package/bcusdk/Config.in
+++ b/package/bcusdk/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_BCUSDK
 	bool "bcusdk"
 	depends on BR2_USE_MMU # libpthsem
 	depends on BR2_INSTALL_LIBSTDCPP
+	# libpthsem cannot be sensibly cross compiled
+	depends on BR2_i386 || BR2_x86_64
 	select BR2_PACKAGE_LIBPTHSEM
 	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC
 	help
@@ -22,4 +24,5 @@ config BR2_PACKAGE_BCUSDK
 
 comment "bcusdk needs a toolchain w/ C++"
 	depends on BR2_USE_MMU
+	depends on BR2_i386 || BR2_x86_64
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/gnupg2/Config.in b/package/gnupg2/Config.in
index e246fd7..0a9dd30 100644
--- a/package/gnupg2/Config.in
+++ b/package/gnupg2/Config.in
@@ -1,6 +1,7 @@
 comment "gnupg2 needs a toolchain w/ dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS
+	depends on BR2_i386 || BR2_x86_64
 
 config BR2_PACKAGE_GNUPG2
 	bool "gnupg2"
@@ -13,6 +14,8 @@ config BR2_PACKAGE_GNUPG2
 	select BR2_PACKAGE_LIBPTHSEM_COMPAT
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	depends on BR2_USE_MMU # libassuan
+	# libpthsem cannot be sensibly cross compiled
+	depends on BR2_i386 || BR2_x86_64
 	depends on !BR2_STATIC_LIBS
 	help
 	  GnuPG is the GNU project's complete and free implementation
diff --git a/package/libpthsem/Config.in b/package/libpthsem/Config.in
index 3219de1..6ebc173 100644
--- a/package/libpthsem/Config.in
+++ b/package/libpthsem/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_LIBPTHSEM
 	bool "libpthsem"
 	depends on BR2_USE_MMU # fork()
+	# libpthsem cannot be sensibly cross compiled
+	depends on BR2_i386 || BR2_x86_64
 	help
 	  GNU pth is a user mode multi threading library. pthsem is an extend
 	  version, with support for semaphores added.
diff --git a/package/linknx/Config.in b/package/linknx/Config.in
index 9982f31..c2ea713 100644
--- a/package/linknx/Config.in
+++ b/package/linknx/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_LINKNX
 	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # libpthsem
+	# libpthsem cannot be sensibly cross compiled
+	depends on BR2_i386 || BR2_x86_64
 	help
 	  Linknx is an automation platform providing high level functionalities
 	  to EIB/KNX installation.
@@ -12,4 +14,5 @@ config BR2_PACKAGE_LINKNX
 
 comment "linknx needs a toolchain w/ C++"
 	depends on BR2_USE_MMU
+	depends on BR2_i386 || BR2_x86_64
 	depends on !BR2_INSTALL_LIBSTDCPP
-- 
2.4.3
