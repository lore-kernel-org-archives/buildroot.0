From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Jul 2014 13:19:20 +0200
Subject: [Buildroot] [git commit] python3: improve isolation of build
	environment and error handling
Message-ID: <20140709111952.0693B9CB24@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5364b22b6c309073d59f593c3b5b1a9b3246e957
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit mainly fixes bug #7268 by improving the isolation of
the build environment by making sure some host environment header
paths do not leak into the target build. The investigation was done by
David <buildroot-2014@inbox.com>. This is done by not calling the
add_multiarch_paths() function of setup.py when we're cross-compiling,
a change made in the newly introduced
python3-012-dont-add-multiarch-path.patch.

In addition to this, another patch is added to make sure the build is
aborted when one of the Python module fails to build. This is done in
python3-013-abort-on-failed-modules.patch. Without this, the Python
setup.py script simply logs which module failed to build, but doesn't
abort, so it's hard to notice when there is a problem.

[Peter: slightly reword commit message]
Cc: David <buildroot-2014@inbox.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../python3-012-dont-add-multiarch-path.patch      |   28 ++++++++++++++++++++
 .../python3-013-abort-on-failed-modules.patch      |   21 +++++++++++++++
 2 files changed, 49 insertions(+), 0 deletions(-)

diff --git a/package/python3/python3-012-dont-add-multiarch-path.patch b/package/python3/python3-012-dont-add-multiarch-path.patch
new file mode 100644
index 0000000..cfd88b2
--- /dev/null
+++ b/package/python3/python3-012-dont-add-multiarch-path.patch
@@ -0,0 +1,28 @@
+Don't add multiarch paths
+
+The add_multiarch_paths() function leads, in certain build
+environments, to the addition of host header paths to the CFLAGS,
+which is not appropriate for cross-compilation. This patch fixes that
+by simply removing the call to add_multiarch_paths() when we're
+cross-compiling.
+
+Investigation done by David <buildroot-2014@inbox.com>.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/setup.py
+===================================================================
+--- a/setup.py
++++ b/setup.py
+@@ -461,10 +461,10 @@
+         if not cross_compiling:
+             add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
+             add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
++            self.add_multiarch_paths()
+         # only change this for cross builds for 3.3, issues on Mageia
+         if cross_compiling:
+             self.add_gcc_paths()
+-        self.add_multiarch_paths()
+ 
+         # Add paths specified in the environment variables LDFLAGS and
+         # CPPFLAGS for header and library files.
diff --git a/package/python3/python3-013-abort-on-failed-modules.patch b/package/python3/python3-013-abort-on-failed-modules.patch
new file mode 100644
index 0000000..c54c72e
--- /dev/null
+++ b/package/python3/python3-013-abort-on-failed-modules.patch
@@ -0,0 +1,21 @@
+Abort on failed module build
+
+When building a Python module fails, the setup.py script currently
+doesn't exit with an error, and simply continues. This is not a really
+nice behavior, so this patch changes setup.py to abort with an error,
+so that the build issue is clearly noticeable.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/setup.py
+===================================================================
+--- a/setup.py
++++ b/setup.py
+@@ -278,6 +278,7 @@
+             print("Failed to build these modules:")
+             print_three_column(failed)
+             print()
++            sys.exit(1)
+ 
+     def build_extension(self, ext):
+ 
