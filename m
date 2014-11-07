From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 7 Nov 2014 08:55:34 +0100
Subject: [Buildroot] [git commit] elfutils: disable for static builds
Message-ID: <20141107075730.79C1BB26A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9406d4dc02b5fa452ff487b1c5ce9a891388b919
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Even when doing static builds, a shared library is built. This causes a
build failure under some circumstances, for instance when building for
MIPS + uClibc + static.

After asking upstream if it would be possible to add a configure option
to not build the shared library, the answer was that doing a static
build is not a good idea. Here is a small snippet of the conversation:

"Note that fully static builds are problematic.  elfutils uses dlopen to
open the EBL backends (the CPU-specific support snippets), so even if
you link statically, the final binaries are still considerably dynamic."

Related:
  https://lists.fedorahosted.org/pipermail/elfutils-devel/2014-November/004223.html

Fixes:
  http://autobuild.buildroot.net/results/691/6913f5af6519463fbed39ef37b6a40ecf6a67b54/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/avrdude/Config.in    |    5 +++--
 package/elfutils/Config.in   |    5 +++--
 package/kexec-lite/Config.in |    2 +-
 package/ltrace/Config.in     |    5 +++--
 4 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/package/avrdude/Config.in b/package/avrdude/Config.in
index 7d9f5eb..84bd091 100644
--- a/package/avrdude/Config.in
+++ b/package/avrdude/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_AVRDUDE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_LARGEFILE # elfutils
 	depends on BR2_USE_WCHAR # elfutils
+	depends on !BR2_PREFER_STATIC_LIB # elfutils
 	depends on !BR2_avr32 # elfutils
 	depends on !BR2_bfin # elfutils
 	help
@@ -15,7 +16,7 @@ config BR2_PACKAGE_AVRDUDE
 
 	  https://github.com/kcuzner/avrdude
 
-comment "avrdude needs a toolchain w/ threads, largefile, wchar"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE || !BR2_USE_WCHAR
+comment "avrdude needs a toolchain w/ threads, largefile, wchar, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE || !BR2_USE_WCHAR || BR2_PREFER_STATIC_LIB
 	depends on !BR2_avr32
 	depends on !BR2_bfin
diff --git a/package/elfutils/Config.in b/package/elfutils/Config.in
index 20a1aaa..5d6e659 100644
--- a/package/elfutils/Config.in
+++ b/package/elfutils/Config.in
@@ -1,7 +1,7 @@
-comment "elfutils needs a toolchain w/ largefile, wchar"
+comment "elfutils needs a toolchain w/ largefile, wchar, dynamic library"
 	depends on !BR2_avr32
 	depends on !BR2_bfin
-	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR
+	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || BR2_PREFER_STATIC_LIB
 
 config BR2_PACKAGE_ELFUTILS
 	bool "elfutils"
@@ -9,6 +9,7 @@ config BR2_PACKAGE_ELFUTILS
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR
+	depends on !BR2_PREFER_STATIC_LIB
 	# canonicalize_file_name() not available on uClibc 0.9.31, used
 	# only for AVR32
 	depends on !BR2_avr32
diff --git a/package/kexec-lite/Config.in b/package/kexec-lite/Config.in
index e98ad3a..8db6058 100644
--- a/package/kexec-lite/Config.in
+++ b/package/kexec-lite/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_KEXEC_LITE
 	bool "kexec-lite"
 	depends on BR2_powerpc || BR2_powerpc64
-	depends on !BR2_PREFER_STATIC_LIB # dtc
+	depends on !BR2_PREFER_STATIC_LIB # dtc, elfutils
 	depends on BR2_LARGEFILE # elfutils
 	depends on BR2_USE_WCHAR # elfutils
 	select BR2_PACKAGE_ELFUTILS
diff --git a/package/ltrace/Config.in b/package/ltrace/Config.in
index dc759d8..08edd45 100644
--- a/package/ltrace/Config.in
+++ b/package/ltrace/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_LTRACE
 	select BR2_PACKAGE_ELFUTILS
 	depends on BR2_LARGEFILE # elfutils
 	depends on BR2_USE_WCHAR # elfutils
+	depends on !BR2_PREFER_STATIC_LIB # elfutils
 	help
 	  Debugging program which runs a specified command until it exits.
 	  While the command is executing, ltrace intercepts and records
@@ -17,5 +18,5 @@ config BR2_PACKAGE_LTRACE
 
 	  http://ltrace.org
 
-comment "ltrace needs toolchain w/ largefile, wchar"
-	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR
+comment "ltrace needs toolchain w/ largefile, wchar, dynamic library"
+	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || BR2_PREFER_STATIC_LIB
