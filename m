From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 15 Nov 2012 23:59:54 +0100
Subject: [Buildroot] [git commit] manual: add package-make-target.txt
Message-ID: <20121115230541.59CE399E3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0e886fc3f6486268bdc54541d2fe2c32acace648
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/manual/advanced.txt            |    2 +
 docs/manual/package-make-target.txt |   88 +++++++++++++++++++++++++++++++++++
 docs/manual/rebuilding-packages.txt |    4 ++
 3 files changed, 94 insertions(+), 0 deletions(-)

diff --git a/docs/manual/advanced.txt b/docs/manual/advanced.txt
index cd53182..ba6574c 100644
--- a/docs/manual/advanced.txt
+++ b/docs/manual/advanced.txt
@@ -10,3 +10,5 @@ include::external-toolchain.txt[]
 include::ccache-support.txt[]
 
 include::download-location.txt[]
+
+include::package-make-target.txt[]
diff --git a/docs/manual/package-make-target.txt b/docs/manual/package-make-target.txt
new file mode 100644
index 0000000..1813af3
--- /dev/null
+++ b/docs/manual/package-make-target.txt
@@ -0,0 +1,88 @@
+// -*- mode:doc; -*-
+
+[[pkg-build-steps]]
+
+Package make targets
+~~~~~~~~~~~~~~~~~~~~
+
+A +make <package>+ call achieves several _make targets_ with, as a
+result, this particular package and its dependencies built, installed
+in their destination directory (target, staging or host directory).
+
+For packages based on the Buildroot infrastructures (+generic-package+,
++autotools-package+ or +cmake-package+), each of those
+actions/steps/commands. For packages relying on other build system,
+then there is no other choice than looking at the +.mk+ file (see also
+the xref:rebuild-pkg[]).
+
+For packages relying on the Buildroot infrastructures, there are
+numerous special make targets that can be called independently like
+this:
+
+------------
+make <package>-<target>
+------------
+
+In order, the package build commands are:
+
+[width="90%",cols="^1,4",options="header"]
+|===================================================
+| command/target    | Description
+
+| +source+          | Fetch the source (download the tarball, clone
+the source repository, etc)
+
+| +depends+         | Build and install all dependencies required to
+build the package
+
+| +extract+         | Put the source in the package build directory
+(extract the tarball, copy the source, etc)
+
+| +patch+           | Apply the patches if any
+
+| +configure+       | Run the configure command
+
+| +build+           | Compile the source
+
+| +install-staging+ |
+*target package:* Run the installation of the package in the
+staging directory
+
+*host package:* Does nothing
+
+| +install-target+  |
+*target package:* Run the installation of the package in the
+staging directory
+
+*host package:* Does nothing
+
+| +install+         |
+*target package:* Run the 2 previous installation commands for the
+target packages
+
+*host package:* Run the installation of the package in the host
+directory
+
+|===================================================
+
+Additionally, there are some other useful make targets:
+
+[width="90%",cols="^1,4",options="header"]
+|===================================================
+| command/target    | Description
+
+| +show-depends+    | Displays the dependencies required to build the
+package
+
+| +clean+           | Clean the package build directory, also
+uninstall the package from both the target and the staging directory
+
+| +dirclean+        | Remove the whole package build directory
+
+| +rebuild+         | Rebuild only necessary binaries and install them
+again
+
+| +reconfigure+     | Run again the configure command, then rebuild
+only necessary binaries, and lastly install them again
+
+|===================================================
diff --git a/docs/manual/rebuilding-packages.txt b/docs/manual/rebuilding-packages.txt
index 2225200..a723d11 100644
--- a/docs/manual/rebuilding-packages.txt
+++ b/docs/manual/rebuilding-packages.txt
@@ -83,3 +83,7 @@ Buildroot infrastructures.
 use any Buildroot infrastructure).
 - Most packages and toolchain packages, if not all, will progressively
 be ported over to the generic, autotools or CMake infrastructure,
+making it much easier to rebuild individual packages.
+
+Further details about package special make target at the
+xref:pkg-build-steps[].
