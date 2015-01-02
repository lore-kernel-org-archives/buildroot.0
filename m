From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Jan 2015 21:09:40 +0100
Subject: [Buildroot] [git commit] libselinux: needs shared library support
Message-ID: <20150102201013.3A1B2801F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a2dc5e21cfe1fecfe766b67df4f5a1450c053f41
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Even though technically libselinux could make its <dlfcn.h> include
optional, the build system isn't really suited to build and install
only the static variant of libselinux, so let's make libselinux and
its reverse dependency not available in pure-static environments.

Fixes:

  http://autobuild.buildroot.org/results/90d/90dc73980a45b9b0441be3d493b22e3afea3cd6e/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libselinux/Config.in  |    5 +++--
 package/libsemanage/Config.in |    5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/libselinux/Config.in b/package/libselinux/Config.in
index c8a23b3..e4d1309 100644
--- a/package/libselinux/Config.in
+++ b/package/libselinux/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_LIBSELINUX
 	select BR2_PACKAGE_PCRE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_LARGEFILE
+	depends on !BR2_STATIC_LIBS
 	help
 	  libselinux is the runtime SELinux library that provides
 	  interfaces (e.g. library functions for the SELinux kernel
@@ -15,5 +16,5 @@ config BR2_PACKAGE_LIBSELINUX
 
 	  http://selinuxproject.org/page/Main_Page
 
-comment "libselinux needs a toolchain w/ largefile, threads"
-        depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE
+comment "libselinux needs a toolchain w/ largefile, threads, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE || BR2_STATIC_LIBS
diff --git a/package/libsemanage/Config.in b/package/libsemanage/Config.in
index 3f4bfb7..bef5c78 100644
--- a/package/libsemanage/Config.in
+++ b/package/libsemanage/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_LIBSEMANAGE
 	select BR2_PACKAGE_BZIP2
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_LARGEFILE
+	depends on !BR2_STATIC_LIBS
 	help
 	  libsemanage is the policy management library. It uses
 	  libsepol for binary policy manipulation and libselinux for
@@ -26,5 +27,5 @@ config BR2_PACKAGE_LIBSEMANAGE_PYTHON_BINDINGS
 
 endif
 
-comment "libsemanage needs a toolchain w/ largefile, threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE
+comment "libsemanage needs a toolchain w/ largefile, threads, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE || BR2_STATIC_LIBS
