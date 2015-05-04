From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  4 May 2015 22:52:32 +0200
Subject: [Buildroot] [PATCH] guile: add patch borrowed from Yocto to fix
	compiler error
Message-ID: <1430772752-23473-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  http://autobuild.buildroot.org/results/85b/85bd849e17c6e5ed6b5b56a4d4ad1a73f7de99c2/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../guile/0004-workaround-ice-ssa-corruption.patch | 64 ++++++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 package/guile/0004-workaround-ice-ssa-corruption.patch

diff --git a/package/guile/0004-workaround-ice-ssa-corruption.patch b/package/guile/0004-workaround-ice-ssa-corruption.patch
new file mode 100644
index 0000000..54f3158
--- /dev/null
+++ b/package/guile/0004-workaround-ice-ssa-corruption.patch
@@ -0,0 +1,64 @@
+libguile/vm-i-system.c: workaround ice ssa corruption while compiling with option -g -O
+
+While compiling with option -g -O, there was a ssa corruption:
+..
+Unable to coalesce ssa_names 48 and 3476 which are marked as MUST COALESCE.
+sp_48(ab) and  sp_3476(ab)
+guile-2.0.11/libguile/vm-engine.c: In function 'vm_debug_engine':
+guile-2.0.11/libguile/vm.c:673:19: internal compiler error: SSA corruption
+ #define VM_NAME   vm_debug_engine
+                   ^
+guile-2.0.11/libguile/vm-engine.c:39:1: note: in expansion of macro 'VM_NAME'
+ VM_NAME (SCM vm, SCM program, SCM *argv, int nargs)
+ ^
+Please submit a full bug report,
+with preprocessed source if appropriate.
+See <http://gcc.gnu.org/bugs.html> for instructions.
+...
+
+Tweak libguile/vm-i-system.c to add boundary value check to workaround it.
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+Fixes Buildroot autobuilder failures on AArch64.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ libguile/vm-i-system.c | 20 ++++++++++++++++----
+ 1 file changed, 16 insertions(+), 4 deletions(-)
+
+diff --git a/libguile/vm-i-system.c b/libguile/vm-i-system.c
+--- a/libguile/vm-i-system.c
++++ b/libguile/vm-i-system.c
+@@ -625,10 +625,22 @@ VM_DEFINE_INSTRUCTION (47, bind_optionals_shuffle, "bind-optionals/shuffle", 6,
+   /* now shuffle up, from walk to ntotal */
+   {
+     scm_t_ptrdiff nshuf = sp - walk + 1, i;
+-    sp = (fp - 1) + ntotal + nshuf;
+-    CHECK_OVERFLOW ();
+-    for (i = 0; i < nshuf; i++)
+-      sp[-i] = walk[nshuf-i-1];
++    /* check the value of nshuf to workaround ice ssa corruption */
++    /* while compiling with -O -g */
++    if (nshuf > 0)
++    {
++      sp = (fp - 1) + ntotal + nshuf;
++      CHECK_OVERFLOW ();
++      for (i = 0; i < nshuf; i++)
++        sp[-i] = walk[nshuf-i-1];
++    }
++    else
++    {
++      sp = (fp - 1) + ntotal + nshuf;
++      CHECK_OVERFLOW ();
++      for (i = 0; i < nshuf; i++)
++        sp[-i] = walk[nshuf-i-1];
++    }
+   }
+   /* and fill optionals & keyword args with SCM_UNDEFINED */
+   while (walk <= (fp - 1) + ntotal)
+-- 
+1.9.1
+
-- 
2.1.0
