From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue,  5 Nov 2019 13:29:38 -0600
Subject: [Buildroot] [PATCH v2] docs/manual: run-tests run-time test
 framework
Message-ID: <20191105192938.60771-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds a new manual section that captures an overview
of the run-tests tool, how to manually run a test and where to
find the test case script.

A brief set of steps is included to go through how to add a new
test case and suggestions on how to test/debug.

Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Patrick Havelange <patrick.havelange@essensium.com>
Cc: Sam Voss <sam.voss@rockwellcollins.com>
Cc: Jared Bents <jared.bents@rockwellcollins.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
Changes
v1 -> v2
[Patrick
 - Fixed tests folder reference to be plural
 - Added notes about rebuilding and modifying source in the
   output_folder
---
 docs/manual/contribute.txt | 125 +++++++++++++++++++++++++++++++++++++
 1 file changed, 125 insertions(+)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index f339ca50b8..91ebd01b47 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -487,3 +487,128 @@ preserve Unix-style line terminators when downloading raw pastes.
 Following pastebin services are known to work correctly:
 - https://gist.github.com/
 - http://code.bulix.org/
+
+=== Contributing run-time tests
+
+Buildroot includes a run-time testing framework called run-tests built
+upon python scripting and QEMU runtime execution.
+
+* Builds a well defined configuration
+* Boots it under QEMU
+* Runs some test to verify that a given feature is working
+
+These tests are hooked into the Gitlab CI's build and testing
+infrastructure. To see the current job status, visit
+https://gitlab.com/buildroot.org/buildroot/-/jobs.
+
+Within the Buildroot repository, the testing framework is organized at the
+top level in +support/testing/+ by folders of +conf+, +infra+ and +tests+.
+All the test cases live under the +tests+ folder and are organized by +boot+,
++core+, +download+, +fs+, +init+, +package+, +toolchain+, and +utils+.
+
+The Gitlab CI job's execute the +support/testing/run-tests+ tool. For a
+current set of tool options see the help description by executing the tool
+with '-h'. Some common options include setting the download folder, the
+output folder, keeping build output, and for multiple test cases, you
+can set the JLEVEL for each.
+
+Here is an example walk through of running a test case.
+
+* For a first step, lets see what all the test case options are. The test
+cases can be listed by executing +support/testing/run-tests -l+. These tests
+can all be ran individually during test development from the console. Both
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
+* Next let's use the Busybox Init system test case with a read/write rootfs
++tests.init.test_busybox.TestInitSystemBusyboxRw+ as our example test case.
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
+You can also make modifications to the current sources inside the
++output_folder+ (e.g. for debug purposes) and rerun the standard
+buildroot make targets (in order to regenerate the complete image with
+the new modifications) and then rerun the test. Modifying the sources
+directly can speed up debugging compared to adding patches file, wiping
+the output directory, and starting the test again.
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
+The best way to get familiar with how to create a test case is to look at a
+few of the basic file system +support/testing/tests/fs/+ and init
++support/testing/tests/init/+ test scripts. Those tests give good examples
+of a basic build and build with run type of tests. There are other more
+advanced cases that use things like nested +br2-external+ folders to provide
+skeletons and additional packages. Beyond creating the test script, there
+are a couple additional steps that should be taken once you have your initial
+test case script. The first is to add yourself in the +DEVELOPERS+ file to
+be the maintainer of that test case. The second is to update the Gitlab CI
+yml by executing +make .gitlab-ci.yml+.
+
+To test an existing or new test case within Gitlab CI, there is a method of
+invoking a specific test by creating a Buildroot fork in Gitlab under your
+account and then follow the instructions outlined in
+https://git.busybox.net/buildroot/commit/?id=12904c03a7ccbf0c04c5b1f7e3302916c6f37f50.
-- 
2.17.1
