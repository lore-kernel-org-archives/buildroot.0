From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Sep 2016 14:28:34 +0200
Subject: [Buildroot] [git commit] supertuxkart: Constrain to x86 architecture
Message-ID: <20160920123859.8DB26820FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eb0863636041cebbcd1dfa24a94886503dd19b36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Our build system has detected that angelscript can't be
cross-compiled properly. This has been also reported to
supertuxkart [1], and although the developers were open
to take patches fixing STK embedded angelscript, it was
pointed out that non-x86 architectures were not officially
supported and of little interest [2].

Hence, let's constrain the package selection and the host
architecture to x86.

[1] https://github.com/supertuxkart/stk-code/issues/2569
[2] https://github.com/supertuxkart/stk-code/pull/2195

Fixes: http://autobuild.buildroot.net/results/655/655f046b3bb5f7a4ea492328b608e409d6769689/
Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/supertuxkart/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/supertuxkart/Config.in b/package/supertuxkart/Config.in
index a1f7074..4919b50 100644
--- a/package/supertuxkart/Config.in
+++ b/package/supertuxkart/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_SUPERTUXKART
 	bool "supertuxkart"
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_INSTALL_LIBSTDCPP # openal
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # openal
@@ -25,6 +27,8 @@ config BR2_PACKAGE_SUPERTUXKART
 	  http://supertuxkart.sourceforge.net/Main_Page
 
 comment "supertuxkart needs an OpenGL backend, a uClibc or glibc toolchain w/ NPTL, C++"
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_XORG7
