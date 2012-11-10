From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Nov 2012 23:36:02 +0100
Subject: [Buildroot] [PATCH 1/2] Deprecate the support for the toolchain on
	target
In-Reply-To: <cover.1352586949.git.thomas.petazzoni@free-electrons.com>
References: <cover.1352586949.git.thomas.petazzoni@free-electrons.com>
Message-ID: <4afe9c298939f3701caa09c2cc5c4bc04f6d4408.1352586949.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As discussed during the ELCE 2012 Buildroot Developers Meeting, we no
longer want to support the possibility of building a toolchain for the
target. None of the core developers have any use for this, it has been
known to be broken or cause problems for a long time without anyone
providing fixes for it.

In addition to this, Buildroot is inherently a cross-compilation tool,
so the usage of a native toolchain on the target is not really
useful. Many newcomers are tempted to use this possibility even though
it is clearly not the intended usage of Buildroot.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in                 |    4 ++++
 toolchain/gcc/Config.in.2 |    5 ++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/Config.in b/Config.in
index 68190a5..eaafece 100644
--- a/Config.in
+++ b/Config.in
@@ -393,6 +393,8 @@ config BR2_PREFER_STATIC_LIB
 
 config BR2_HAVE_DOCUMENTATION
 	bool "documentation on the target"
+	# We no longer want to support a toolchain on the target
+	depends on BR2_DEPRECATED
 	help
 	  Install the documentation, including manual pages and info
 	  pages, on the target.
@@ -401,6 +403,8 @@ config BR2_HAVE_DOCUMENTATION
 
 config BR2_HAVE_DEVFILES
 	bool "development files in target filesystem"
+	# We no longer want to support a toolchain on the target
+	depends on BR2_DEPRECATED
 	help
 	  Install headers and static libraries in the
 	  target filesystem
diff --git a/toolchain/gcc/Config.in.2 b/toolchain/gcc/Config.in.2
index d060a80..c8a8cf6 100644
--- a/toolchain/gcc/Config.in.2
+++ b/toolchain/gcc/Config.in.2
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_GCC_TARGET
 	bool "gcc"
+	# We no longer want to support a toolchain on the target
+	depends on BR2_DEPRECATED
 	depends on BR2_HAVE_DEVFILES && BR2_TOOLCHAIN_BUILDROOT
 	select BR2_PACKAGE_BINUTILS
 	select BR2_PACKAGE_BINUTILS_TARGET
@@ -30,6 +32,3 @@ config BR2_EXTRA_TARGET_GCC_CONFIG_OPTIONS
 	  Any additional target gcc options you may want to include....
 	  Including, but not limited to --disable-checking etc.
 	  Refer to */configure in your gcc sources.
-
-comment "gcc needs development files in target filesystem"
-	depends on !BR2_HAVE_DEVFILES && BR2_TOOLCHAIN_BUILDROOT
-- 
1.7.9.5
