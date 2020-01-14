From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 14 Jan 2020 17:29:23 +0100
Subject: [Buildroot] [git commit] docs/manual: run-tests test framework
Message-ID: <20200114162011.D46CC81F02@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e2e57d56787b7a7d24ed3f9a97902d2bbd58c190
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds a new manual section that captures an overview
of the run-tests tool, how to manually run a test and where to
find the test case script.

A brief set of steps is included to go through how to add a new
test case and suggestions on how to test/debug.

Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
[yann.morin.1998 at free.fr:
  - switch the creating and debugging sections
  - minor reformatting
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/manual/contribute.txt | 168 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 168 insertions(+)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index f339ca50b8..bde7543c25 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -487,3 +487,171 @@ preserve Unix-style line terminators when downloading raw pastes.
 Following pastebin services are known to work correctly:
 - https://gist.github.com/
 - http://code.bulix.org/
+
+=== Using the run-tests framework
+
+Buildroot includes a run-time testing framework called run-tests built
+upon Python scripting and QEMU runtime execution. There are two types of
+test cases within the framework, one for build time tests and another for
+run-time tests that have a QEMU dependency. The goals of the framework are
+the following:
+
+* build a well defined configuration
+* optionally, verify some properties of the build output
+* if it is a run-time test:
+** boot it under QEMU
+** run some test condition to verify that a given feature is working
+
+The run-tests tool has a series of options documented in the tool's help '-h'
+description. Some common options include setting the download folder, the
+output folder, keeping build output, and for multiple test cases, you can set
+the JLEVEL for each.
+
+Here is an example walk through of running a test case.
+
+* For a first step, let us see what all the test case options are. The test
+cases can be listed by executing +support/testing/run-tests -l+. These tests
+can all be run individually during test development from the console. Both
+one at a time and selectively as a group of a subset of tests.
+
+---------------------
+$ support/testing/run-tests -l
+List of tests
+test_run (tests.utils.test_check_package.TestCheckPackage)
+Test the various ways the script can be called in a simple top to ... ok
+test_run (tests.toolchain.test_external.TestExternalToolchainBuildrootMusl) ... ok
+test_run (tests.toolchain.test_external.TestExternalToolchainBuildrootuClibc) ... ok
+test_run (tests.toolchain.test_external.TestExternalToolchainCCache) ... ok
+test_run (tests.toolchain.test_external.TestExternalToolchainCtngMusl) ... ok
+test_run (tests.toolchain.test_external.TestExternalToolchainLinaroArm) ... ok
+test_run (tests.toolchain.test_external.TestExternalToolchainSourceryArmv4) ... ok
+test_run (tests.toolchain.test_external.TestExternalToolchainSourceryArmv5) ... ok
+test_run (tests.toolchain.test_external.TestExternalToolchainSourceryArmv7) ... ok
+[snip]
+test_run (tests.init.test_systemd.TestInitSystemSystemdRoFull) ... ok
+test_run (tests.init.test_systemd.TestInitSystemSystemdRoIfupdown) ... ok
+test_run (tests.init.test_systemd.TestInitSystemSystemdRoNetworkd) ... ok
+test_run (tests.init.test_systemd.TestInitSystemSystemdRwFull) ... ok
+test_run (tests.init.test_systemd.TestInitSystemSystemdRwIfupdown) ... ok
+test_run (tests.init.test_systemd.TestInitSystemSystemdRwNetworkd) ... ok
+test_run (tests.init.test_busybox.TestInitSystemBusyboxRo) ... ok
+test_run (tests.init.test_busybox.TestInitSystemBusyboxRoNet) ... ok
+test_run (tests.init.test_busybox.TestInitSystemBusyboxRw) ... ok
+test_run (tests.init.test_busybox.TestInitSystemBusyboxRwNet) ... ok
+
+Ran 157 tests in 0.021s
+
+OK
+---------------------
+
+Those runtime tests are regularly executed by Buildroot Gitlab CI
+infrastructure, see .gitlab.yml and https://gitlab.com/buildroot.org/buildroot/-/jobs.
+
+==== Creating a test case
+
+The best way to get familiar with how to create a test case is to look at a
+few of the basic file system +support/testing/tests/fs/+ and init
++support/testing/tests/init/+ test scripts. Those tests give good examples
+of a basic build and build with run type of tests. There are other more
+advanced cases that use things like nested +br2-external+ folders to provide
+skeletons and additional packages.
+
+The test cases by default use a br-arm-full-* uClibc-ng toolchain and the
+prebuild kernel for a armv5/7 cpu. It is recommended to use the default
+defconfig test configuration except when Glibc/musl or a newer kernel are
+necessary. By using the default it saves build time and the test would
+automatically inherit a kernel/std library upgrade when the default is
+updated.
+
+The basic test case definition involves
+
+* Creation of a new test file
+* Defining a unique test class
+* Determining if the default defconfig plus test options can be used
+* Implementing a +def test_run(self):+ function to optionally startup the
+emulator and provide test case conditions.
+
+Beyond creating the test script, there are a couple of additional steps that
+should be taken once you have your initial test case script. The first is
+to add yourself to the +DEVELOPERS+ file to be the maintainer of that test
+case. The second is to update the Gitlab CI yml by executing
++make .gitlab-ci.yml+.
+
+==== Debugging a test case
+
+Within the Buildroot repository, the testing framework is organized at the
+top level in +support/testing/+ by folders of +conf+, +infra+ and +tests+.
+All the test cases live under the +test+ folder and are organized in various
+folders representing the catagory of test.
+
+Lets walk through an example.
+
+* Using the Busybox Init system test case with a read/write rootfs
++tests.init.test_busybox.TestInitSystemBusyboxRw+
+* A minimal set of command line arguments when debugging a test case would
+include '-d' which points to your dl folder, '-o' to an output folder, and
+'-k' to keep any output on both pass/fail. With those options, the test will
+retain logging and build artifacts providing status of the build and
+execution of the test case.
+
+---------------------
+$ support/testing/run-tests -d dl -o output_folder -k tests.init.test_busybox.TestInitSystemBusyboxRw
+15:03:26 TestInitSystemBusyboxRw                  Starting
+15:03:28 TestInitSystemBusyboxRw                  Building
+15:08:18 TestInitSystemBusyboxRw                  Building done
+15:08:27 TestInitSystemBusyboxRw                  Cleaning up
+.
+Ran 1 test in 301.140s
+
+OK
+---------------------
+
+* For the case of a successful build, the +output_folder+ would contain a
+<test name> folder with the Buildroot build, build log and run-time log. If
+the build failed, the console output would show the stage at which it failed
+(setup / build / run). Depending on the failure stage, the build/run logs
+and/or Buildroot build artifacts can be inspected and instrumented. If the
+QEMU instance needs to be launched for additional testing, the first few
+lines of the run-time log capture it and it would allow some incremental
+testing without re-running +support/testing/run-tests+.
+
+* You can also make modifications to the current sources inside the
++output_folder+ (e.g. for debug purposes) and rerun the standard
+Buildroot make targets (in order to regenerate the complete image with
+the new modifications) and then rerun the test. Modifying the sources
+directly can speed up debugging compared to adding patch files, wiping the
+output directoy, and starting the test again.
+
+---------------------
+$ ls output_folder/
+TestInitSystemBusyboxRw/
+TestInitSystemBusyboxRw-build.log
+TestInitSystemBusyboxRw-run.log
+---------------------
+
+* The source file used to implement this example test is found under
++support/testing/tests/init/test_busybox.py+. This file outlines the
+minimal defconfig that creates the build, QEMU configuration to launch
+the built images and the test case assertions.
+
+To test an existing or new test case within Gitlab CI, there is a method of
+invoking a specific test by creating a Buildroot fork in Gitlab under your
+account. This can be handy when adding/changing a run-time test or fixing a
+bug on a use case tested by a run-time test case.
+
+
+In the examples below, the <name> component of the branch name is a unique
+string you choose to identify this specific job being created.
+
+* to trigger all run-test test case jobs:
+
+---------------------
+ $ git push gitlab HEAD:<name>-runtime-tests
+---------------------
+
+* to trigger one test case job, a specific branch naming string is used that
+includes the full test case name.
+
+---------------------
+ $ git push gitlab HEAD:<name>-<test case name>
+---------------------
