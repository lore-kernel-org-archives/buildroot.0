From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Dec 2013 12:50:20 +0100
Subject: [Buildroot] [PATCH] package: deprecate some more development tools
Message-ID: <1388145020-2082-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since some time, we have removed the support to build a toolchain for
the target, and therefore the support for several development tools on
the target.

This commit deprecates a few additional development tools: m4, bison,
flex and gob2. For flex, we retain the ability to build libfl, we only
deprecated the ability to build the flex binary itself.

The original motivation for this patch is that m4 is causing build
issues in some configurations, but there isn't really much incentive
to fix this package for the target, since it is not really useful for
embedded Linux systems.

Bison, Flex and Gob2 are deprecated because they are reverse
dependencies of m4.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bison/Config.in | 2 ++
 package/flex/Config.in  | 2 ++
 package/gob2/Config.in  | 2 ++
 package/m4/Config.in    | 2 ++
 4 files changed, 8 insertions(+)

diff --git a/package/bison/Config.in b/package/bison/Config.in
index 4a50f41..cd0dbc4 100644
--- a/package/bison/Config.in
+++ b/package/bison/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_BISON
 	select BR2_PACKAGE_M4
 	# m4 uses fork()
 	depends on BR2_USE_MMU
+	# development tool, useless on the target
+	depends on BR2_DEPRECATED
 	help
 	  General-purpose parser generator that converts a
 	  grammar description for an LALR context-free grammar into a C
diff --git a/package/flex/Config.in b/package/flex/Config.in
index 52f7fe7..6af9951 100644
--- a/package/flex/Config.in
+++ b/package/flex/Config.in
@@ -15,6 +15,8 @@ config BR2_PACKAGE_FLEX_BINARY
 	depends on BR2_USE_MMU
 	# runtime dependency
 	select BR2_PACKAGE_M4
+	# development tool, useless on the target
+	depends on BR2_DEPRECATED
 	depends on BR2_USE_WCHAR # m4
 	help
 	  Install the flex binary tool in the target filesystem.
diff --git a/package/gob2/Config.in b/package/gob2/Config.in
index 092d51b..faeb8b3 100644
--- a/package/gob2/Config.in
+++ b/package/gob2/Config.in
@@ -6,6 +6,8 @@ config BR2_PACKAGE_GOB2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_FLEX
 	select BR2_PACKAGE_BISON
+	# development tool, useless on the target
+	depends on BR2_DEPRECATED
 	help
 	  GOB (GTK+ Object Builder) is a preprocessor which simplifies
 	  the writing of GObjects in C.
diff --git a/package/m4/Config.in b/package/m4/Config.in
index 4d651a2..7830b22 100644
--- a/package/m4/Config.in
+++ b/package/m4/Config.in
@@ -3,6 +3,8 @@ config BR2_PACKAGE_M4
 	depends on BR2_USE_WCHAR
 	# uses fork()
 	depends on BR2_USE_MMU
+	# development tool, useless on the target
+	depends on BR2_DEPRECATED
 	help
 	  An implementation of the traditional Unix macro processor.
 
-- 
1.8.3.2
