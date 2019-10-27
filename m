From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Sun, 27 Oct 2019 17:10:35 -0500
Subject: [Buildroot] RFC: Contributing runtime tests
Message-ID: <CANQCQpa34vCJ5nUhei0W-S-c887bAXu+oLW-_foL6wPWThe2+A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

21.7 Contributing runtime tests

Buildroot includes a runtime testing framework called run-tests.
These tests are hooked into the Gitlab CI's build and testing
infrastructure.  As an example,
https://gitlab.com/buildroot.org/buildroot/-/jobs shows the current
yml jobs and selecting a successful "test*" job would give you an
example of the expected output.

The testing framework is organized at the top level (support/testing/)
by categories of conf, infra and tests.  For the specific tests, they
live under the "test" category and are organized by boot, core,
download, fs, init, package, toolchain, and utils.

The Gitlab CI test jobs each execute the "support/testing/run-tests"
tool.  This tool has a great help description and can be executed
without any arguments to see the complete set of options.  Some common
options include setting the download folder, the output folder,
keeping build output, and for multiple test cases, you can set the
JLEVEL for each.

At this point it is probably best to walk through an example from
identifying the test, running, viewing results and location of the
script being executed on the backend.
1) List all the test cases which are supported by executing
*support/testing/run-tests -l*. These tests can all be ran
individually during test development on the console.

# support/testing/run-tests -l
List of tests
test_run (tests.utils.test_check_package.TestCheckPackage)
Test the various ways the script can be called in a simple top to ... ok
test_run (tests.toolchain.test_external.TestExternalToolchainBuildrootMusl)
... ok
test_run (tests.toolchain.test_external.TestExternalToolchainBuildrootuClibc)
... ok
test_run (tests.toolchain.test_external.TestExternalToolchainCCache) ... ok
test_run (tests.toolchain.test_external.TestExternalToolchainCtngMusl) ... ok
test_run (tests.toolchain.test_external.TestExternalToolchainLinaroArm) ... ok
test_run (tests.toolchain.test_external.TestExternalToolchainSourceryArmv4)
... ok
test_run (tests.toolchain.test_external.TestExternalToolchainSourceryArmv5)
... ok
test_run (tests.toolchain.test_external.TestExternalToolchainSourceryArmv7)
... ok
[snip]
test_run (tests.init.test_systemd.TestInitSystemSystemdRoFull) ... ok
test_run (tests.init.test_systemd.TestInitSystemSystemdRoIfupdown) ... ok
test_run (tests.init.test_systemd.TestInitSystemSystemdRoNetworkd) ... ok
test_run (tests.init.test_systemd.TestInitSystemSystemdRwFull) ... ok
test_run (tests.init.test_systemd.TestInitSystemSystemdRwIfupdown) ... ok
test_run (tests.init.test_systemd.TestInitSystemSystemdRwNetworkd) ... ok
test_run (tests.init.test_busybox.TestInitSystemBusyboxRo) ... ok
test_run (tests.init.test_busybox.TestInitSystemBusyboxRoNet) ... ok
test_run (tests.init.test_busybox.TestInitSystemBusyboxRw) ... ok
test_run (tests.init.test_busybox.TestInitSystemBusyboxRwNet) ... ok

----------------------------------------------------------------------
Ran 157 tests in 0.021s

OK

2) Let's find the Busybox Init system test case with a read/write
rootfs (tests.init.test_busybox.TestInitSystemBusyboxRw) for this
example.
3) Build up a command line to run that test.  The command line options
used would include '-d' which points to your dl folder, '-o' to an
output folder, and '-k' to keep any output on both pass/fail. This
test will provide some output giving status of the build and execution
of the test case.

# support/testing/run-tests -d dl -o output_folder -k
tests.init.test_busybox.TestInitSystemBusyboxRw
15:03:26 TestInitSystemBusyboxRw                  Starting
15:03:28 TestInitSystemBusyboxRw                  Building
15:08:18 TestInitSystemBusyboxRw                  Building done
15:08:27 TestInitSystemBusyboxRw                  Cleaning up
.
----------------------------------------------------------------------
Ran 1 test in 301.140s

OK

5) For a successful build, the output in the "output_folder" would
include the folder with the actual build, a build and runtime log.  If
the build failed, the status output provides notification of it being
either a build or runtime failure. If the build needs to be inspected,
it is still a full Buildroot out of tree build in a working state
(output_folder/<test name>/) and can be instrumented for debug like a
normal Buildroot build.  NOTE: The runtime log also provides the
example QEMU launch command if the runtime portion needs recreation.
# ls output_folder
TestInitSystemBusyboxRw/
TestInitSystemBusyboxRw-build.log
TestInitSystemBusyboxRw-run.log

6) Lastly, for this Busybox test case, the source file used to
implement the test is found under
support/testing/tests/init/test_busybox.py.  This file outlines the
minimal defconfig that creates the build, QEMU configuration to launch
the built images and the test case assertions.  The best way to get
familiar with these is to look at some of the basic file system and
init test cases.

NOTE: If you add a new test case, remember that the Gitlab CI requires
the yml to be updated.  Execute "make .gitlab-ci.yml" to populate your
new package in the yml and commit this with your test case script.


Let me know what you think of the first draft before I format it.

Matt
