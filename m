From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Apr 2017 21:50:59 +0200
Subject: [Buildroot] [git commit] docs/manual: document the test-pkg script
Message-ID: <20170406195114.2DDF6825DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0520b19e4bf4ce8b05d9521ea069ccae3c24521c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-tips.txt | 93 ++++++++++++++++++++++++++++++++++++
 docs/manual/adding-packages.txt      |  3 ++
 2 files changed, 96 insertions(+)

diff --git a/docs/manual/adding-packages-tips.txt b/docs/manual/adding-packages-tips.txt
index 896be00..09cf9d4 100644
--- a/docs/manual/adding-packages-tips.txt
+++ b/docs/manual/adding-packages-tips.txt
@@ -32,6 +32,99 @@ using the following rules:
   with `.` and `-` characters substituted with `_` (e.g.:
   +FOO_BAR_BOO_VERSION+).
 
+[[testing-package]]
+==== How to test your package
+
+Once you have added your new package, it is important that you test it
+under various conditions: does it build for all architectures? Does it
+build with the different C libraries? Does it need threads, NPTL? And
+so on...
+
+Buildroot runs http://autobuild.buildroot.org/[autobuilders] which
+continuously test random configurations. However, these only build the
+`master` branch of the git tree, and your new fancy package is not yet
+there.
+
+Buildroot provides a script in +support/scripts/test-pkg+ that uses the
+same base configurations as used by the autobuilders so you can test
+your package in the same conditions.
+
+First, create a config snippet that contains all the necessary options
+needed to enable your package, but without any architecture or toolchain
+option. For example, let's create a config snippet that just enables
++libcurl+, without any TLS backend:
+
+----
+$ cat libcurl.config
+BR2_PACKAGE_LIBCURL=y
+----
+
+If your package needs more configuration options, you can add them to the
+config snippet. For example, here's how you would test +libcurl+ with
++openssl+ as a TLS backend and the +curl+ program:
+
+----
+$ cat libcurl.config
+BR2_PACKAGE_LIBCURL=y
+BR2_PACKAGE_CURL=y
+BR2_PACKAGE_OPENSSL=y
+----
+
+Then run the +test-pkg+ script, by telling it what config snippet to use
+and what package to test:
+
+----
+$ ./support/scripts/test-pkg -c libcurl.config -p libcurl
+----
+
+This will try to build your package against all the toolchains used
+by the autobuilders (except for the internal toolchains, because it takes
+too long to do so). The output lists all toolchains and the corresponding
+result (excerpt, results are fake):
+
+----
+$ ./support/scripts/test-pkg -c libcurl.config -p libcurl
+                armv5-ctng-linux-gnueabi: OK
+              armv7-ctng-linux-gnueabihf: OK
+                        br-aarch64-glibc: SKIPPED
+                           br-arcle-hs38: SKIPPED
+                            br-arm-basic: FAILED
+                  br-arm-cortex-a9-glibc: OK
+                   br-arm-cortex-a9-musl: FAILED
+                   br-arm-cortex-m4-full: OK
+                             br-arm-full: OK
+                    br-arm-full-nothread: OK
+                      br-arm-full-static: OK
+11 builds, 2 skipped, 2 failed
+----
+
+The results mean:
+
+* `OK`: the build was successful.
+* `SKIPPED`: one or more configuration options listed in the config
+  snippet were not present in the final configuration. This is due to
+  options having dependencies not satisfied by the toolchain, such as
+  for example a package that +depends on BR2_USE_MMU+ with a noMMU
+  toolchain. The missing options are reported in +config.missing+ in
+  the output build directory (+~/br-test-pkg/TOOLCHAIN_NAME/+ by
+  default).
+* `FAILED`: the build failed. Inspect the +logfile+ file in the output
+  build  directory to see what went wrong:
+** the actual build failed,
+** one of the preliminary steps (downloading the config file, applying
+   the configuration, running `dirclean` for the package) failed.
+
+When there are failures, you can just re-run the script with the same
+options (after you fixed your package); the script will attempt to
+re-build the package specified with +-p+ for all toolchains, without
+the need to re-build all the dependencies of that package.
+
+The +test-pkg+ script accepts a few options, for which you can get some
+help by running:
+
+----
+$ ./support/scripts/test-pkg -h
+----
 
 [[github-download-url]]
 ==== How to add a package from GitHub
diff --git a/docs/manual/adding-packages.txt b/docs/manual/adding-packages.txt
index 4595991..d577ff0 100644
--- a/docs/manual/adding-packages.txt
+++ b/docs/manual/adding-packages.txt
@@ -9,6 +9,9 @@ applications) can be integrated into Buildroot. It also shows how
 existing packages are integrated, which is needed for fixing issues or
 tuning their configuration.
 
+When you add a new package, be sure to test it in various conditions;
+see xref:testing-package[]
+
 include::adding-packages-directory.txt[]
 
 include::adding-packages-generic.txt[]
