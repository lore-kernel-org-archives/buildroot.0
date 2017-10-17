From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Tue, 17 Oct 2017 14:18:37 +0200
Subject: [Buildroot] [PATCH v2] ghostscript: bump version to 9.22
Message-ID: <20171017121837.18309-1-olivier.schonken@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove patches that has been merged/updated upstream

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
---
v1 -> v2 : The sha1 hash for ghostpdl was mistakenly put in the
           hash file.  v2 fixes this issue.

 .../0002-Host-tool-mkromfs_1-needs-libz.patch      | 48 -----------------
 ...-697799-have-.eqproc-check-its-parameters.patch | 33 ------------
 ...7799-have-.rsdparams-check-its-parameters.patch | 62 ----------------------
 package/ghostscript/ghostscript.hash               |  8 +--
 package/ghostscript/ghostscript.mk                 |  4 +-
 5 files changed, 6 insertions(+), 149 deletions(-)
 delete mode 100644 package/ghostscript/0002-Host-tool-mkromfs_1-needs-libz.patch
 delete mode 100644 package/ghostscript/0003-Bug-697799-have-.eqproc-check-its-parameters.patch
 delete mode 100644 package/ghostscript/0004-Bug-697799-have-.rsdparams-check-its-parameters.patch

diff --git a/package/ghostscript/0002-Host-tool-mkromfs_1-needs-libz.patch b/package/ghostscript/0002-Host-tool-mkromfs_1-needs-libz.patch
deleted file mode 100644
index 341a8368d3..0000000000
--- a/package/ghostscript/0002-Host-tool-mkromfs_1-needs-libz.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From c9e370d7cdf1bb5fbbd5c1e7e9c5431f6112b074 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Mon, 20 Mar 2017 23:43:29 +0100
-Subject: [PATCH] Host tool mkromfs_1 needs libz
-
-Fixes build error
-
-/tmp/ccckTW0s.o: In function `process_path':
-mkromfs.c:(.text+0x2390): undefined reference to `compress'
-/tmp/ccckTW0s.o: In function `process_initfile':
-mkromfs.c:(.text+0x3616): undefined reference to `compress'
-collect2: error: ld returned 1 exit status
-base/unix-aux.mak:103: recipe for target 'obj/aux/mkromfs_1' failed
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- Makefile.in       | 1 +
- base/unix-aux.mak | 2 +-
- 2 files changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index 3a3cae5..600ce3e 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -461,6 +461,7 @@ XPS_LDFLAGS_SO=@XPS_DYNAMIC_LDFLAGS@
- 
- EXTRALIBS=$(XTRALIBS) @LIBS@ @DYNAMIC_LIBS@ @FONTCONFIG_LIBS@ @FT_LIBS@ @JPX_AUTOCONF_LIBS@ @EXPAT_LIBS@
- AUXEXTRALIBS=@AUXEXTRALIBS@
-+AUX_SHARED_ZLIB=@AUX_SHARED_ZLIB@
- 
- # Define the standard libraries to search at the end of linking.
- # Most platforms require -lpthread for the POSIX threads library;
-diff --git a/base/unix-aux.mak b/base/unix-aux.mak
-index c5fa2a4..4ed8369 100644
---- a/base/unix-aux.mak
-+++ b/base/unix-aux.mak
-@@ -100,7 +100,7 @@ MKROMFS_OBJS_1=$(AUX)gscdefs.$(OBJ) \
-  $(AUX)gp_stdia.$(OBJ) $(AUX)gsutil.$(OBJ)
- 
- $(MKROMFS_XE)_1: $(GLSRC)mkromfs.c $(MKROMFS_COMMON_DEPS) $(MKROMFS_OBJS_1) $(UNIX_AUX_MAK) $(MAKEDIRS)
--	$(CCAUX_) $(GENOPTAUX) $(I_)$(GLSRCDIR)$(_I) $(I_)$(GLOBJ)$(_I) $(I_)$(ZSRCDIR)$(_I) $(GLSRC)mkromfs.c $(O_)$(MKROMFS_XE)_1 $(MKROMFS_OBJS_1) $(AUXEXTRALIBS)
-+	$(CCAUX_) $(GENOPTAUX) $(I_)$(GLSRCDIR)$(_I) $(I_)$(GLOBJ)$(_I) $(I_)$(ZSRCDIR)$(_I) $(GLSRC)mkromfs.c $(O_)$(MKROMFS_XE)_1 $(MKROMFS_OBJS_1) $(AUXEXTRALIBS) $(AUX_SHARED_ZLIB)
- 
- $(MKROMFS_XE): $(MKROMFS_XE)_$(SHARE_ZLIB) $(UNIX_AUX_MAK) $(MAKEDIRS)
- 	$(CP_) $(MKROMFS_XE)_$(SHARE_ZLIB) $(MKROMFS_XE)
--- 
-2.7.4
-
diff --git a/package/ghostscript/0003-Bug-697799-have-.eqproc-check-its-parameters.patch b/package/ghostscript/0003-Bug-697799-have-.eqproc-check-its-parameters.patch
deleted file mode 100644
index becdc66054..0000000000
--- a/package/ghostscript/0003-Bug-697799-have-.eqproc-check-its-parameters.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 4f83478c88c2e05d6e8d79ca4557eb039354d2f3 Mon Sep 17 00:00:00 2001
-From: Chris Liddell <chris.liddell@artifex.com>
-Date: Thu, 27 Apr 2017 13:03:33 +0100
-Subject: [PATCH] Bug 697799: have .eqproc check its parameters
-
-The Ghostscript custom operator .eqproc was not check the number or type of
-the parameters it was given.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- psi/zmisc3.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/psi/zmisc3.c b/psi/zmisc3.c
-index 54b304246..37293ff4b 100644
---- a/psi/zmisc3.c
-+++ b/psi/zmisc3.c
-@@ -56,6 +56,12 @@ zeqproc(i_ctx_t *i_ctx_p)
-     ref2_t stack[MAX_DEPTH + 1];
-     ref2_t *top = stack;
- 
-+    if (ref_stack_count(&o_stack) < 2)
-+        return_error(gs_error_stackunderflow);
-+    if (!r_is_array(op - 1) || !r_is_array(op)) {
-+        return_error(gs_error_typecheck);
-+    }
-+
-     make_array(&stack[0].proc1, 0, 1, op - 1);
-     make_array(&stack[0].proc2, 0, 1, op);
-     for (;;) {
--- 
-2.11.0
-
diff --git a/package/ghostscript/0004-Bug-697799-have-.rsdparams-check-its-parameters.patch b/package/ghostscript/0004-Bug-697799-have-.rsdparams-check-its-parameters.patch
deleted file mode 100644
index 9ba170b316..0000000000
--- a/package/ghostscript/0004-Bug-697799-have-.rsdparams-check-its-parameters.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 04b37bbce174eed24edec7ad5b920eb93db4d47d Mon Sep 17 00:00:00 2001
-From: Chris Liddell <chris.liddell@artifex.com>
-Date: Thu, 27 Apr 2017 13:21:31 +0100
-Subject: [PATCH] Bug 697799: have .rsdparams check its parameters
-
-The Ghostscript internal operator .rsdparams wasn't checking the number or
-type of the operands it was being passed. Do so.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- psi/zfrsd.c | 22 +++++++++++++++-------
- 1 file changed, 15 insertions(+), 7 deletions(-)
-
-diff --git a/psi/zfrsd.c b/psi/zfrsd.c
-index 191107d8a..950588d69 100644
---- a/psi/zfrsd.c
-+++ b/psi/zfrsd.c
-@@ -49,13 +49,20 @@ zrsdparams(i_ctx_t *i_ctx_p)
-     ref *pFilter;
-     ref *pDecodeParms;
-     int Intent = 0;
--    bool AsyncRead;
-+    bool AsyncRead = false;
-     ref empty_array, filter1_array, parms1_array;
-     uint i;
--    int code;
-+    int code = 0;
-+
-+    if (ref_stack_count(&o_stack) < 1)
-+        return_error(gs_error_stackunderflow);
-+    if (!r_has_type(op, t_dictionary) && !r_has_type(op, t_null)) {
-+        return_error(gs_error_typecheck);
-+    }
- 
-     make_empty_array(&empty_array, a_readonly);
--    if (dict_find_string(op, "Filter", &pFilter) > 0) {
-+    if (r_has_type(op, t_dictionary)
-+        && dict_find_string(op, "Filter", &pFilter) > 0) {
-         if (!r_is_array(pFilter)) {
-             if (!r_has_type(pFilter, t_name))
-                 return_error(gs_error_typecheck);
-@@ -94,12 +101,13 @@ zrsdparams(i_ctx_t *i_ctx_p)
-                 return_error(gs_error_typecheck);
-         }
-     }
--    code = dict_int_param(op, "Intent", 0, 3, 0, &Intent);
-+    if (r_has_type(op, t_dictionary))
-+        code = dict_int_param(op, "Intent", 0, 3, 0, &Intent);
-     if (code < 0 && code != gs_error_rangecheck) /* out-of-range int is ok, use 0 */
-         return code;
--    if ((code = dict_bool_param(op, "AsyncRead", false, &AsyncRead)) < 0
--        )
--        return code;
-+    if (r_has_type(op, t_dictionary))
-+        if ((code = dict_bool_param(op, "AsyncRead", false, &AsyncRead)) < 0)
-+            return code;
-     push(1);
-     op[-1] = *pFilter;
-     if (pDecodeParms)
--- 
-2.11.0
-
diff --git a/package/ghostscript/ghostscript.hash b/package/ghostscript/ghostscript.hash
index ade17f9de8..e2156d36c0 100644
--- a/package/ghostscript/ghostscript.hash
+++ b/package/ghostscript/ghostscript.hash
@@ -1,4 +1,4 @@
-# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs921/MD5SUMS
-md5 631beea7aa1f70f2cdca14e0308b8801  ghostscript-9.21.tar.xz
-# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs921/SHA1SUMS
-sha1 a93b456a0e18d5c925d26b0b13e961c8e8140f62  ghostscript-9.21.tar.xz
+# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs922/MD5SUMS
+md5 684c5371e52215f7289d2c32737e4def  ghostscript-9.22.tar.xz
+# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs922/SHA1SUMS
+sha1 9dcd527e9bcc636a6a947251a6195f58dd00006b  ghostscript-9.22.tar.xz
diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index c28cd06723..aa3f63b26e 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GHOSTSCRIPT_VERSION = 9.21
-GHOSTSCRIPT_SITE = https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs921
+GHOSTSCRIPT_VERSION = 9.22
+GHOSTSCRIPT_SITE = https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs922
 GHOSTSCRIPT_SOURCE = ghostscript-$(GHOSTSCRIPT_VERSION).tar.xz
 GHOSTSCRIPT_LICENSE = AGPL-3.0
 GHOSTSCRIPT_LICENSE_FILES = LICENSE
-- 
2.11.0
