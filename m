From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Aug 2015 22:54:45 +0200
Subject: [Buildroot] [git commit] mono: depend on shared library support
Message-ID: <20150819205612.C304380453@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=93f6baf135866adcea7a3d77b033fb2cad931d61
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The mono source code includes <dlfcn.h>, which is only available when
shared library support is available. While it might be possible to do
a fully static installation of Mono, it probably isn't very useful.

While we're at it, this commit also makes sure that the Config.in
comment is not visible when the architecture doesn't support Mono.

Fixes:

  http://autobuild.buildroot.net/results/5d99bdf77f1942fa403081267c362aa1f8fd0dab/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mono/Config.in |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/mono/Config.in b/package/mono/Config.in
index 0c7129b..0f57703 100644
--- a/package/mono/Config.in
+++ b/package/mono/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_MONO
 	bool "mono"
 	depends on BR2_PACKAGE_MONO_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  An open source, cross-platform, implementation of C#
@@ -14,5 +15,6 @@ config BR2_PACKAGE_MONO
 
 	  http://download.mono-project.com/sources/mono/
 
-comment "mono needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "mono needs a toolchain w/ threads, dynamic library"
+	depends on BR2_PACKAGE_MONO_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
