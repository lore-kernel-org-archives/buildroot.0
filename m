From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 15 Feb 2017 22:44:29 +0100
Subject: [Buildroot] [PATCH 1/7 v4] docs/manual: document the test-pkg script
In-Reply-To: <cover.1487195062.git.yann.morin.1998@free.fr>
References: <cover.1487195062.git.yann.morin.1998@free.fr>
Message-ID: <85dd7875a12e1ceb9dab2f006dd34a8259836729.1487195062.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 docs/manual/adding-packages-tips.txt | 90 ++++++++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/docs/manual/adding-packages-tips.txt b/docs/manual/adding-packages-tips.txt
index 896be00..732904f 100644
--- a/docs/manual/adding-packages-tips.txt
+++ b/docs/manual/adding-packages-tips.txt
@@ -32,6 +32,96 @@ using the following rules:
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
+needed to enabel your package, but without any architecture or toolchain
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
+Then run the script, by telling it what config snippet to use and what
+package to test:
+
+----
+$ ./support/scripts/test-pkg -c libcurl.config -p libcurl
+----
+
+This will try to build your package against all the toolchains used
+by the autobuilders (but the internal toolchains, because it takes
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
+* `OK`: the build was successful
+* `SKIPPED`: one or more config options from the config snippet were
+  missing in the resulting configuration; inspect the file +config.missing+
+  in the output build directory (+~/br-test-pkg/TOOLCHAIN_NAME/+ by
+  default)
+* `FAILED`: the build failed for one of various reasons; in either case,
+  inspect the +logfile+ file in the output build  directory:
+** the actual build failed,
+** one of the preliminary steps (download the config file, apply the
+   configuration, running `dirclean` for the package) failed;
+
+When there are failures, you can just re-run the script with the same
+options (after you fixed your package); the script will attempt to re-build
+the package for all toolchains, without the need to re-build all the
+dependencies of that package (but it requires the +-p+ optiopn, see below).
+
+The +test-pkg+ script accepts a few options, for which you can get some
+help by running:
+
+----
+$ ./support/scripts/test-pkg -h
+----
 
 [[github-download-url]]
 ==== How to add a package from GitHub
-- 
2.7.4
