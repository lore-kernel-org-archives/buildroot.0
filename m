From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 9 Oct 2019 23:10:37 +0200
Subject: [Buildroot] [git commit] package/libselinux: allow building on
 !glibc using musl-fts
Message-ID: <20191009221023.AFCF18B910@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f6b81301e068023cd7dd51e7ec2252647793e56f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libselinux/Config.in     | 8 +++-----
 package/libselinux/libselinux.mk | 5 +++++
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/libselinux/Config.in b/package/libselinux/Config.in
index 6be816db77..8cebd34fb2 100644
--- a/package/libselinux/Config.in
+++ b/package/libselinux/Config.in
@@ -2,12 +2,11 @@ config BR2_PACKAGE_LIBSELINUX
 	bool "libselinux"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
-	# Uses <fts.h>, not available in musl or uClibc
-	depends on BR2_TOOLCHAIN_USES_GLIBC
 	# Toolchain issue: "fixup not contained within frag"
 	depends on !BR2_arc
 	select BR2_PACKAGE_LIBSEPOL
 	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  libselinux is the runtime SELinux library that provides
 	  interfaces (e.g. library functions for the SELinux kernel
@@ -19,7 +18,6 @@ config BR2_PACKAGE_LIBSELINUX
 
 	  http://selinuxproject.org/page/Main_Page
 
-comment "libselinux needs a glibc toolchain w/ threads, dynamic library"
+comment "libselinux needs a toolchain w/ threads, dynamic library"
 	depends on !BR2_arc
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_USES_GLIBC
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index 977f9e2e8b..c707c8a25e 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -25,6 +25,11 @@ LIBSELINUX_MAKE_OPTS = \
 
 LIBSELINUX_MAKE_INSTALL_TARGETS = install
 
+ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)
+LIBSELINUX_DEPENDENCIES += musl-fts
+LIBSELINUX_MAKE_OPTS += FTS_LDLIBS=-lfts
+endif
+
 ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),y)
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
 LIBSELINUX_DEPENDENCIES += python3 host-swig
