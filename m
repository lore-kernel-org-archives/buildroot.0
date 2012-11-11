From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 11 Nov 2012 14:14:56 +0100
Subject: [Buildroot] [PATCH 18/23] manual: add patch-policy.txt
In-Reply-To: <1352639701-27829-1-git-send-email-s.martin49@gmail.com>
References: <1352639701-27829-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1352639701-27829-19-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel Martin <s.martin49@gmail.com>

 create mode 100644 docs/manual/patch-policy.txt

diff --git a/docs/manual/developer-guide.txt b/docs/manual/developer-guide.txt
index f3fc1dd..5002897 100644
--- a/docs/manual/developer-guide.txt
+++ b/docs/manual/developer-guide.txt
@@ -7,6 +7,8 @@ include::writing-rules.txt[]
 
 include::adding-packages.txt[]
 
+include::patch-policy.txt[]
+
 include::download-infra.txt[]
 
 include::board-support.txt[]
diff --git a/docs/manual/patch-policy.txt b/docs/manual/patch-policy.txt
new file mode 100644
index 0000000..551ea12
--- /dev/null
+++ b/docs/manual/patch-policy.txt
@@ -0,0 +1,128 @@
+// -*- mode:doc; -*-
+
+[[patch-policy]]
+
+Patch Policy
+------------
+
+While integrating a new package or updating an existing one, it may be
+necessary to patch the source of the software to get it built within
+Buildroot.
+
+Buildroot offers an infrastructure to automatically handle this during
+the builds. It support several ways of applying patch sets:
+
+Provinding patches
+~~~~~~~~~~~~~~~~~~
+
+Additionnal tarball
+^^^^^^^^^^^^^^^^^^^
+
+If there needs to apply a patch set available as a tarball and
+downloadable, then add the patch tarball to the +<packagename>_PATCH+
+variable.
+
+Note that the patch tarballs are downloaded from the same site as the
+sources.
+
+Within Buildroot
+^^^^^^^^^^^^^^^^
+
+Most of the patches are provided within Buildroot, in the package
+directory, because they aim to fix cross-compilation, +libc+ support,
+or whatever the reason is.
+
+These patch files should have the extension +*.patch+.
+
+A +series+ file, like +quilt+ uses it, may also be added in the
+package directory. In that case, the +series+ file defines the patch
+application order.
+
+How patches are applied
+~~~~~~~~~~~~~~~~~~~~~~~
+
+. Run the +<packagename>_PRE_PATCH_HOOKS+ commands if defined;
+
+. Cleanup the build directory from any existing +*.rej+ files;
+
+. If +<packagename>_PATCH+ is defined, then patches from these
+  tarballs are applied;
+
+. If there are some +*.patch+ files in the package directory or in the
+  a package subdirectory named +<packagename>-<packageversion>+, then:
++
+* If a +series+ file exists in the package directory, then patches are
+  applied according to the +series+ file;
++
+* Otherwise, patch files matching `<packagename>-*.patch` or
+  `<packagename>-*.patch.<arch>` (where +<arch>+ is the architecture
+  name) are applied following the +ls+ command order.
+
+. Run the +<packagename>_POST_PATCH_HOOKS+ commands if defined.
+
+If something goes wrong in the steps _3_ or _4_, then the build fails.
+
+Format and licensing of the package patches
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Patches are released under the same license the software that is
+modified.
+
+A message explaining what does the patch and why should be add in the
+patch's header.
+
+You should add a +signed-off-by+ statement in the header of the each
+patch to help keeping track of the changes.
+
+If the software is under versionning, it is recommended to use the SCM
+software to generate the patch set.
+
+Otherwise, concatenate the header with the output of the
++diff -purN source.c.orig source.c+ command.
+
+At the end, the patch should look like:
+
+---------------
+configure.ac: add C++ support test
+
+signed-off-by John Doe <john.doe@noname.org>
+
+--- configure.ac.orig
++++ configure.ac
+@@ -40,2 +40,12 @@
+
+AC_PROG_MAKE_SET
++
++AC_CACHE_CHECK([whether the C++ compiler works],
++               [rw_cv_prog_cxx_works],
++               [AC_LANG_PUSH([C++])
++                AC_LINK_IFELSE([AC_LANG_PROGRAM([], [])],
++                               [rw_cv_prog_cxx_works=yes],
++                               [rw_cv_prog_cxx_works=no])
++                AC_LANG_POP([C++])])
++
++AM_CONDITIONAL([CXX_WORKS], [test "x$rw_cv_prog_cxx_works" = "xyes"])
+---------------
+
+Integrating patches found on the Web
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+When integrating a patch whom you are not the author, you have to add
+few things in the header of the patch itself.
+
+Depending on whether the patch has been pick-up from the project
+repository itself, or from somewhere on the web, add one of the
+following tags:
+
+---------------
+Backported from: <some commit id>
+---------------
+
+or
+
+---------------
+Fetch from: <some url>
+---------------
+
+It is also possible to add few words about the changes that may have
+been necessary if any.
-- 
1.8.0
