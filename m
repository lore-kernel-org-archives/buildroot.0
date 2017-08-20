From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Aug 2017 15:34:16 +0200
Subject: [Buildroot] [PATCH 2/2] cc-tool: add patch fixing boost.m4 logic
	for static linking
In-Reply-To: <20170820133416.11231-1-thomas.petazzoni@free-electrons.com>
References: <20170820133416.11231-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170820133416.11231-2-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds a patch to cc-tool that fixes the boost.m4 logic used
to detect the linker rpath option so that it works properly with
static linking and additional libraries passed in LIBS.

This is the second step to fix static linking of cc-tool on
architectures like SPARC that need to link against libatomic:

  http://autobuild.buildroot.net/results/ed9f2524d0ccef318ff1bc99e5dea980111de989/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-fix-rpath-option-check-for-static-linkin.patch | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 package/cc-tool/0004-m4-boost.m4-fix-rpath-option-check-for-static-linkin.patch

diff --git a/package/cc-tool/0004-m4-boost.m4-fix-rpath-option-check-for-static-linkin.patch b/package/cc-tool/0004-m4-boost.m4-fix-rpath-option-check-for-static-linkin.patch
new file mode 100644
index 0000000..acff107
--- /dev/null
+++ b/package/cc-tool/0004-m4-boost.m4-fix-rpath-option-check-for-static-linkin.patch
@@ -0,0 +1,44 @@
+From 5e74a15ce1e093b4d8e83cdade60a43b09d698de Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sun, 20 Aug 2017 15:25:06 +0200
+Subject: [PATCH] m4/boost.m4: fix rpath option check for static linking
+
+When statically linking, the order in which -l options are passed is
+important. The contents of the LIBS option passed to the configure
+environment should be passed *after* other -l options used internally
+by the package.
+
+For example, libboost_program_options may used symbols from the
+libatomic library, and in this case, one need to pass LIBS="-latomic"
+to cc-tool's configure script. When using dynamic linking, this works
+fine, because the rpath test does "-latomic
+-lboost_program_options". However, when statically linking, this
+doesn't work because libboost_program_options uses symbols from
+libatomic, so -latomic must be passed *after* -lboost_program_options.
+
+Therefore, this commit inverts the list of variables used to construct
+LIBS before doing the _BOOST_AC_LINK_IFELSE() test detecting the rpath
+option to be used. Indeed, $boost_save_LIBS contains the previously
+saved LIBS variable, and should be passed after $Boost_lib_LIBS.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ m4/boost.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/m4/boost.m4 b/m4/boost.m4
+index be470a7..f1825ba 100644
+--- a/m4/boost.m4
++++ b/m4/boost.m4
+@@ -479,7 +479,7 @@ dnl generated only once above (before we start the for loops).
+            *)
+             for boost_cv_rpath_link_ldflag in -Wl,-R, -Wl,-rpath,; do
+               LDFLAGS="$boost_save_LDFLAGS -L$boost_ldpath $boost_cv_rpath_link_ldflag$boost_ldpath"
+-              LIBS="$boost_save_LIBS $Boost_lib_LIBS"
++              LIBS="$Boost_lib_LIBS $boost_save_LIBS"
+               _BOOST_AC_LINK_IFELSE([],
+                 [boost_rpath_link_ldflag_found=yes
+                 break],
+-- 
+2.9.4
+
-- 
2.9.4
