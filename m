From: Max Filippov <jcmvbkbc@gmail.com>
Date: Fri, 20 Mar 2015 04:29:01 +0300
Subject: [Buildroot] [PATCH] package/gcc: fix ICE building QT5 on xtensa
Message-ID: <1426814941-25089-1-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add fix for GCC PR 64896 from the gcc-4_9-branch of gcc.
This fixes bugzilla bug 7961.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 package/gcc/4.9.2/110-pr64896.patch |   59 +++++++++++++++++++++++++++++++++++
 1 files changed, 59 insertions(+), 0 deletions(-)
 create mode 100644 package/gcc/4.9.2/110-pr64896.patch

diff --git a/package/gcc/4.9.2/110-pr64896.patch b/package/gcc/4.9.2/110-pr64896.patch
new file mode 100644
index 0000000..92b6cb8
--- /dev/null
+++ b/package/gcc/4.9.2/110-pr64896.patch
@@ -0,0 +1,59 @@
+From fc39d7d6f0ac90086814306a43de38ad65c13f13 Mon Sep 17 00:00:00 2001
+From: yroux <yroux@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Tue, 10 Mar 2015 19:20:30 +0000
+Subject: [PATCH] gcc/ 2015-03-10  Yvan Roux  <yvan.roux@linaro.org>
+
+	Backport from trunk r220489.
+	2015-02-06  Jakub Jelinek  <jakub@redhat.com>
+
+	PR ipa/64896
+	* cgraphunit.c (cgraph_node::expand_thunk): If
+	restype is not is_gimple_reg_type nor the thunk_fndecl
+	returns aggregate_value_p, set restmp to a temporary variable
+	instead of resdecl.
+
+gcc/testsuite/
+2015-03-10  Yvan Roux  <yvan.roux@linaro.org>
+
+	Backport from trunk r220489.
+	2015-02-06  Jakub Jelinek  <jakub@redhat.com>
+
+	PR ipa/64896
+	* g++.dg/ipa/pr64896.C: New test.
+
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-4_9-branch at 221333 138bc75d-0d04-0410-961f-82ee72b054a4
+---
+ gcc/ChangeLog                      | 11 +++++++++++
+ gcc/cgraphunit.c                   | 11 ++++++++---
+ gcc/testsuite/ChangeLog            |  8 ++++++++
+ gcc/testsuite/g++.dg/ipa/pr64896.C | 29 +++++++++++++++++++++++++++++
+ 4 files changed, 56 insertions(+), 3 deletions(-)
+ create mode 100644 gcc/testsuite/g++.dg/ipa/pr64896.C
+
+diff --git a/gcc/cgraphunit.c b/gcc/cgraphunit.c
+index 8f57607..130fc0d 100644
+--- a/gcc/cgraphunit.c
++++ b/gcc/cgraphunit.c
+@@ -1572,9 +1572,14 @@ expand_thunk (struct cgraph_node *node, bool output_asm_thunks)
+ 	    restmp = gimple_fold_indirect_ref (resdecl);
+ 	  else if (!is_gimple_reg_type (restype))
+ 	    {
+-	      restmp = resdecl;
+-	      add_local_decl (cfun, restmp);
+-	      BLOCK_VARS (DECL_INITIAL (current_function_decl)) = restmp;
++	      if (aggregate_value_p (resdecl, TREE_TYPE (thunk_fndecl)))
++		{
++		  restmp = resdecl;
++		  add_local_decl (cfun, restmp);
++		  BLOCK_VARS (DECL_INITIAL (current_function_decl)) = restmp;
++		}
++	      else
++		restmp = create_tmp_var (restype, "retval");
+ 	    }
+ 	  else
+ 	    restmp = create_tmp_reg (restype, "retval");
+-- 
+1.8.1.4
+
-- 
1.7.7.6
