From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 27 Mar 2015 21:55:07 +0100
Subject: [Buildroot] [PATCH] BINFMT_FLAT_SHARED: is not really shared for
	buildroot purposes
Message-ID: <1427489707-22707-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sonic Zhang <sonic.zhang@analog.com>

Although BINFMT_FLAT_SHARED is indeed a shared library format, it does
not support dynamic library loading with dlopen(). So for buildroot
purposes, BR2_STATIC_LIBS shouldn't be selected.

As it happens, the compiler options that are added for
BINFMT_FLAT_SHARED also make the compiler ignore the -static option, so
we can simply force BR2_STATIC_LIBS and things work out perfectly.

Therefore, remove the select of BR2_BINFMT_SUPPORTS_SHARED from
BINFMT_FLAT_SHARED, which in turn makes sure that BR2_STATIC_LIBS is
selected.

[Arnout: rewrite commit message, add explanatory comment]

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 arch/Config.in                          | 7 ++++++-
 docs/manual/adding-packages-generic.txt | 5 +++--
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index 16ad8be..59bf84a 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -295,7 +295,12 @@ config BR2_BINFMT_FLAT_SEP_DATA
 
 config BR2_BINFMT_FLAT_SHARED
 	bool "Shared binary"
-	select BR2_BINFMT_SUPPORTS_SHARED
+	# Even though this really generates shared binaries, there is no libdl
+	# and dlopen() cannot be used. So packages that require shared
+	# libraries cannot be built. Therefore, we don't select
+	# BR2_BINFMT_SUPPORTS_SHARED and therefore force BR2_STATIC_LIBS.
+	# Although this adds -static to the compilation, that's not a problem
+	# because the -mid-shared-library option overrides it.
 	help
 	  Allow to load and link indiviual FLAT binaries at run time.
 
diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index b6615ce..7508cfa 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -208,8 +208,9 @@ information is (assuming the package name is +libfoo+) :
   which Buildroot will use to download the tarball from
   +LIBFOO_SITE+. If +HOST_LIBFOO_SOURCE+ is not specified, it defaults
   to +LIBFOO_SOURCE+. If none are specified, then the value is assumed
-  to be +libfoo-$(LIBFOO_VERSION).tar.gz+. + Example: +LIBFOO_SOURCE =
-  foobar-$(LIBFOO_VERSION).tar.bz2+
+  to be +libfoo-$(LIBFOO_VERSION).tar.gz+.
+  +
+  Example: +LIBFOO_SOURCE = foobar-$(LIBFOO_VERSION).tar.bz2+
 
 * +LIBFOO_PATCH+ may contain a space-separated list of patch file
   names, that Buildroot will download and apply to the package source
-- 
2.1.4
