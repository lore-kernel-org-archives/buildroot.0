From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Aug 2020 18:59:19 +0200
Subject: [Buildroot] [git commit branch/next] package/guile: bump to version
 3.0.4
Message-ID: <20200808165521.CAA4F84059@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=84b9f07b87a302294cabd9c2d9e5b26373a78a31
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Remove patch that is no longer needed as of upstream commit
1c33be992e8120abd20add8021e4d91d226f5b6a which removed the old VM.

We need to add an exclusion rule for guile modules to check-bin-arch
as they appear as valid ELF binaries but with an architecture of
"None".

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Thomas:
 - bump to 3.0.4
 - rework how check-bin-arch excludes checking the Guile .go files]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../guile/0003-workaround-ice-ssa-corruption.patch | 64 ----------------------
 package/guile/guile.hash                           |  2 +-
 package/guile/guile.mk                             |  2 +-
 support/scripts/check-bin-arch                     |  3 +
 4 files changed, 5 insertions(+), 66 deletions(-)

diff --git a/package/guile/0003-workaround-ice-ssa-corruption.patch b/package/guile/0003-workaround-ice-ssa-corruption.patch
deleted file mode 100644
index 54f3158a91..0000000000
--- a/package/guile/0003-workaround-ice-ssa-corruption.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-libguile/vm-i-system.c: workaround ice ssa corruption while compiling with option -g -O
-
-While compiling with option -g -O, there was a ssa corruption:
-..
-Unable to coalesce ssa_names 48 and 3476 which are marked as MUST COALESCE.
-sp_48(ab) and  sp_3476(ab)
-guile-2.0.11/libguile/vm-engine.c: In function 'vm_debug_engine':
-guile-2.0.11/libguile/vm.c:673:19: internal compiler error: SSA corruption
- #define VM_NAME   vm_debug_engine
-                   ^
-guile-2.0.11/libguile/vm-engine.c:39:1: note: in expansion of macro 'VM_NAME'
- VM_NAME (SCM vm, SCM program, SCM *argv, int nargs)
- ^
-Please submit a full bug report,
-with preprocessed source if appropriate.
-See <http://gcc.gnu.org/bugs.html> for instructions.
-...
-
-Tweak libguile/vm-i-system.c to add boundary value check to workaround it.
-
-Upstream-Status: Pending
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
-Fixes Buildroot autobuilder failures on AArch64.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- libguile/vm-i-system.c | 20 ++++++++++++++++----
- 1 file changed, 16 insertions(+), 4 deletions(-)
-
-diff --git a/libguile/vm-i-system.c b/libguile/vm-i-system.c
---- a/libguile/vm-i-system.c
-+++ b/libguile/vm-i-system.c
-@@ -625,10 +625,22 @@ VM_DEFINE_INSTRUCTION (47, bind_optionals_shuffle, "bind-optionals/shuffle", 6,
-   /* now shuffle up, from walk to ntotal */
-   {
-     scm_t_ptrdiff nshuf = sp - walk + 1, i;
--    sp = (fp - 1) + ntotal + nshuf;
--    CHECK_OVERFLOW ();
--    for (i = 0; i < nshuf; i++)
--      sp[-i] = walk[nshuf-i-1];
-+    /* check the value of nshuf to workaround ice ssa corruption */
-+    /* while compiling with -O -g */
-+    if (nshuf > 0)
-+    {
-+      sp = (fp - 1) + ntotal + nshuf;
-+      CHECK_OVERFLOW ();
-+      for (i = 0; i < nshuf; i++)
-+        sp[-i] = walk[nshuf-i-1];
-+    }
-+    else
-+    {
-+      sp = (fp - 1) + ntotal + nshuf;
-+      CHECK_OVERFLOW ();
-+      for (i = 0; i < nshuf; i++)
-+        sp[-i] = walk[nshuf-i-1];
-+    }
-   }
-   /* and fill optionals & keyword args with SCM_UNDEFINED */
-   while (walk <= (fp - 1) + ntotal)
--- 
-1.9.1
-
diff --git a/package/guile/guile.hash b/package/guile/guile.hash
index 47ac009757..a163f59fce 100644
--- a/package/guile/guile.hash
+++ b/package/guile/guile.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  e8442566256e1be14e51fc18839cd799b966bc5b16c6a1d7a7c35155a8619d82  guile-2.0.14.tar.xz
+sha256  6b7947dc2e3d115983846a268b8f5753c12fd5547e42fbf2b97d75a3b79f0d31  guile-3.0.4.tar.xz
 # Locally computed
 sha256  b51c6f20e6d029cb5b3e5bf235ac562c9a188c5bdc4ffcdc663897772d6e0260  LICENSE
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/guile/guile.mk b/package/guile/guile.mk
index 4992861071..5750b85f49 100644
--- a/package/guile/guile.mk
+++ b/package/guile/guile.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GUILE_VERSION = 2.0.14
+GUILE_VERSION = 3.0.4
 GUILE_SOURCE = guile-$(GUILE_VERSION).tar.xz
 GUILE_SITE = $(BR2_GNU_MIRROR)/guile
 GUILE_INSTALL_STAGING = YES
diff --git a/support/scripts/check-bin-arch b/support/scripts/check-bin-arch
index 3449bd1aeb..27cc59bca0 100755
--- a/support/scripts/check-bin-arch
+++ b/support/scripts/check-bin-arch
@@ -25,6 +25,9 @@ declare -a IGNORES=(
 	# it for a different architecture (e.g. i386 grub on x86_64).
 	"/lib/grub"
 	"/usr/lib/grub"
+
+	# Guile modules are ELF files, with a "None" machine
+	"/usr/lib/guile"
 )
 
 while getopts p:l:r:a:i: OPT ; do
