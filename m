From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Thu, 17 Nov 2016 15:15:23 +1100
Subject: [Buildroot] [RFC PATCH 1/1] pkg-autotools: generic configure fix
	for powerpc64
Message-ID: <56063c394c473bf4292658511bae0dd99583be07.1479356115.git.sam.bobroff@au1.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Many (100+) packages supported by buildroot contain old configure
scripts (or build them from old versions of autotools) that are unable
to determine how to link shared libraries on powerpc64 and
powerpc64le. This causes that test to erroneously fail on toolchains
that are not "bi-endian" (which is the case for toolchains built by
buildroot), which causes configure to build static libraries instead
of dynamic ones. Although these builds succeed, they tend to cause
linker failures in binaries later linked against them.

Because affected configure files can be discovered automatically, this
patch introduces a hook (enabled only when building for powerpc64 and
powerpc64le) that uses a script to scan and fix each package.

This applies only to packages built for the target.

Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
---
Hi Buildroot,

See the patch commit message for a description of the issue I'm trying
to fix. This is an RFC and here are some things to consider:

I took the approach of automatically patching packages. This
presumably slows the build down a little bit, but only on the affacted
architectures (the code is not enabled otherwise) and has the
advantage of automatically picking up new packages as they are added.

I've added a minimum of code to pkg-autotools.mk to add a
PRE_CONFIGURE hook to the end of the existing hooks. It's important
that it be after the AUTO_RECONFIGURE handling, which may regenerate
configure.

The actual patching work is done in a support script.

The script is fairly simple: affected configure scripts all contain a
unique pattern, so files are selected based on that, and "patch" is
used to correct them. The location of the patch moves around a lot but
there are lots of constant lines of context around them so patch
always succeeds.

The input files used to generate configure are not patched, because
doing so triggers some packages to regenerate configure, and that
step fails for some packages, breaking their build.

It does not handle host packages. I'm not sure how to detect the host
arch correctly, and although libraries may be being built incorrectly
there at the moment, it's not causing any link failures so it seems
unnecessary to fix them at the moment.

Does this seem a reasonable solution?

Would it be better to generalize it in some way? Could we solve some
other problems at the same time?

Should the code go somewhere else?

Would a flag per package be better than checking every package? (It's
not hard to do.)

Cheers,
Sam.

 package/pkg-autotools.mk                   | 17 ++++++++++
 support/scripts/fix-configure-powerpc64.sh | 53 ++++++++++++++++++++++++++++++
 2 files changed, 70 insertions(+)
 create mode 100755 support/scripts/fix-configure-powerpc64.sh

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index d1cdb89..9e6a061 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -79,6 +79,15 @@ define LIBTOOL_PATCH_HOOK
 endef
 
 #
+# Hook to patch common issue with configure on powerpc64{,le} failing
+# to detect shared library support:
+#
+define CONFIGURE_FIX_POWERPC64_HOOK
+	@$(call MESSAGE,"Checking configure (powerpc64/powerpc64le)")
+	support/scripts/fix-configure-powerpc64.sh $($(PKG)_DIR)
+endef
+
+#
 # Hook to gettextize the package if needed
 #
 define GETTEXTIZE_HOOK
@@ -255,6 +264,14 @@ endif
 
 endif
 
+# Must be added after other pre-configure hooks that might regenerate the
+# configure script and overwrite the changes made here.
+ifeq ($(4),target)
+ifeq ($(BR2_powerpc64)$(BR2_powerpc64le),y)
+$(2)_PRE_CONFIGURE_HOOKS += CONFIGURE_FIX_POWERPC64_HOOK
+endif
+endif
+
 #
 # Build step. Only define it if not already defined by the package .mk
 # file.
diff --git a/support/scripts/fix-configure-powerpc64.sh b/support/scripts/fix-configure-powerpc64.sh
new file mode 100755
index 0000000..e4d676e
--- /dev/null
+++ b/support/scripts/fix-configure-powerpc64.sh
@@ -0,0 +1,53 @@
+#!/bin/bash
+
+# This is a script to find, and correct, a problem with old versions of
+# configure that affect powerpc64 and powerpc64le.
+
+# The issue causes configure to incorrectly determine that shared library
+# support is not present in the linker. This causes the package to build a
+# static library rather than a dynamic one and although the build will succeed,
+# it may cause packages that link with the static library it to fail due to
+# undefined symbols.
+
+# This script searches for files named 'configure' that appear to have this
+# issue (by searching for a known bad pattern) and patching them.
+
+set -e
+
+if [ $# -ne 1 ]; then
+	echo "Usage: $0 <package build directory>"
+	exit 2
+fi
+
+pkg="$1"
+files=$(cd "$pkg" && find . -name configure -exec grep -qF 'Generated by GNU Autoconf' {} \; -exec grep -qF 'ppc*-*linux*|powerpc*-*linux*)' {} \; -print)
+suffix=.powerpc64.orig
+
+# --ignore-whitespace is needed because some packages have included
+# copies of configure scripts where tabs have been replaced with spaces.
+for c in $files; do
+	patch --ignore-whitespace --suffix=$suffix "$pkg"/"$c" <<'EOF'
+*** a/configure	2016-11-07 14:04:47.444117880 +1100
+--- b/configure	2016-11-07 14:05:03.652181547 +1100
+***************
+*** 1302,1308 ****
+  	  x86_64-*linux*)
+  	    LD="${LD-ld} -m elf_x86_64"
+  	    ;;
+! 	  ppc*-*linux*|powerpc*-*linux*)
+  	    LD="${LD-ld} -m elf64ppc"
+  	    ;;
+  	  s390*-*linux*|s390*-*tpf*)
+--- 1302,1311 ----
+  	  x86_64-*linux*)
+  	    LD="${LD-ld} -m elf_x86_64"
+  	    ;;
+! 	  powerpcle-*linux*)
+! 	    LD="${LD-ld} -m elf64lppc"
+! 	    ;;
+! 	  powerpc-*linux*)
+  	    LD="${LD-ld} -m elf64ppc"
+  	    ;;
+  	  s390*-*linux*|s390*-*tpf*)
+EOF
+done
-- 
2.10.0.297.gf6727b0
