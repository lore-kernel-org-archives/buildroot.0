Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FAEEC433EF
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 19:11:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22B3860241
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 19:11:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 22B3860241
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C21EE4054E;
	Sat,  9 Oct 2021 19:11:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fS7CckWhyGrt; Sat,  9 Oct 2021 19:11:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1C4C40558;
	Sat,  9 Oct 2021 19:11:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DA1331BF31A
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 19:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C97BC60701
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 19:10:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G6XIiDEKouGn for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 19:10:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8DBEC6070F
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 19:10:50 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id C17C6E0004;
 Sat,  9 Oct 2021 19:10:48 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Buildroot List <buildroot@buildroot.org>
Date: Sat,  9 Oct 2021 21:10:42 +0200
Message-Id: <20211009191043.1075544-4-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211009191043.1075544-1-thomas.petazzoni@bootlin.com>
References: <20211009191043.1075544-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] docs/manual/contribute.txt: rewrite the
 section dedicated to runtime tests
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Romain Naour <romain.naour@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The current documentation was poorly organized, with for example the
"Here is an example walk through of running a test case" sentence
followed by the explanation of how to list available test cases, but
not how to run one.

Many other aspects of the wording were confusing, or not really
accurate.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/contribute.txt | 189 ++++++++++++++++++++-----------------
 1 file changed, 101 insertions(+), 88 deletions(-)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index f3b8b75fab..df21bd82d1 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -519,24 +519,22 @@ Following pastebin services are known to work correctly:
 - https://gist.github.com/
 - http://code.bulix.org/
 
-=== Using the run-tests framework
+=== Using the runtime tests framework
 
-Buildroot includes a run-time testing framework called run-tests built
-upon Python scripting and QEMU runtime execution. There are two types of
-test cases within the framework, one for build time tests and another for
-run-time tests that have a QEMU dependency. The goals of the framework are
+Buildroot includes a run-time testing framework built upon Python
+scripting and QEMU runtime execution. The goals of the framework are
 the following:
 
-* build a well defined configuration
+* build a well defined Buildroot configuration
 * optionally, verify some properties of the build output
-* if it is a run-time test:
-** boot it under QEMU
-** run some test condition to verify that a given feature is working
+* optionally, boot the build results under Qemu, and verify that a
+  given feature is working as expected
 
-The run-tests tool has a series of options documented in the tool's help '-h'
-description. Some common options include setting the download folder, the
-output folder, keeping build output, and for multiple test cases, you can set
-the JLEVEL for each.
+The entry point to use the runtime tests framework is the
++support/testing/run-tests+ tool, which has a series of options
+documented in the tool's help '-h' description. Some common options
+include setting the download folder, the output folder, keeping build
+output, and for multiple test cases, you can set the JLEVEL for each.
 
 Here is an example walk through of running a test case.
 
@@ -549,7 +547,6 @@ one at a time and selectively as a group of a subset of tests.
 $ support/testing/run-tests -l
 List of tests
 test_run (tests.utils.test_check_package.TestCheckPackage)
-Test the various ways the script can be called in a simple top to ... ok
 test_run (tests.toolchain.test_external.TestExternalToolchainBuildrootMusl) ... ok
 test_run (tests.toolchain.test_external.TestExternalToolchainBuildrootuClibc) ... ok
 test_run (tests.toolchain.test_external.TestExternalToolchainCCache) ... ok
@@ -575,52 +572,7 @@ Ran 157 tests in 0.021s
 OK
 ---------------------
 
-Those runtime tests are regularly executed by Buildroot Gitlab CI
-infrastructure, see .gitlab.yml and https://gitlab.com/buildroot.org/buildroot/-/jobs.
-
-==== Creating a test case
-
-The best way to get familiar with how to create a test case is to look at a
-few of the basic file system +support/testing/tests/fs/+ and init
-+support/testing/tests/init/+ test scripts. Those tests give good examples
-of a basic build and build with run type of tests. There are other more
-advanced cases that use things like nested +br2-external+ folders to provide
-skeletons and additional packages.
-
-The test cases by default use a br-arm-full-* uClibc-ng toolchain and the
-prebuild kernel for a armv5/7 cpu. It is recommended to use the default
-defconfig test configuration except when Glibc/musl or a newer kernel are
-necessary. By using the default it saves build time and the test would
-automatically inherit a kernel/std library upgrade when the default is
-updated.
-
-The basic test case definition involves
-
-* Creation of a new test file
-* Defining a unique test class
-* Determining if the default defconfig plus test options can be used
-* Implementing a +def test_run(self):+ function to optionally startup the
-emulator and provide test case conditions.
-
-After creating the test script, add yourself to the +DEVELOPERS+ file to
-be the maintainer of that test case.
-
-==== Debugging a test case
-
-Within the Buildroot repository, the testing framework is organized at the
-top level in +support/testing/+ by folders of +conf+, +infra+ and +tests+.
-All the test cases live under the +tests+ folder and are organized in various
-folders representing the catagory of test.
-
-Lets walk through an example.
-
-* Using the Busybox Init system test case with a read/write rootfs
-+tests.init.test_busybox.TestInitSystemBusyboxRw+
-* A minimal set of command line arguments when debugging a test case would
-include '-d' which points to your dl folder, '-o' to an output folder, and
-'-k' to keep any output on both pass/fail. With those options, the test will
-retain logging and build artifacts providing status of the build and
-execution of the test case.
+* Then, to run one test case:
 
 ---------------------
 $ support/testing/run-tests -d dl -o output_folder -k tests.init.test_busybox.TestInitSystemBusyboxRw
@@ -634,21 +586,57 @@ Ran 1 test in 301.140s
 OK
 ---------------------
 
-* For the case of a successful build, the +output_folder+ would contain a
-<test name> folder with the Buildroot build, build log and run-time log. If
-the build failed, the console output would show the stage at which it failed
-(setup / build / run). Depending on the failure stage, the build/run logs
-and/or Buildroot build artifacts can be inspected and instrumented. If the
-QEMU instance needs to be launched for additional testing, the first few
-lines of the run-time log capture it and it would allow some incremental
-testing without re-running +support/testing/run-tests+.
+The standard output indicates if the test is successful or not. By
+default, the output folder for the test is deleted automatically
+unless the option +-k+ is passed to *keep* the output directory.
 
-* You can also make modifications to the current sources inside the
-+output_folder+ (e.g. for debug purposes) and rerun the standard
-Buildroot make targets (in order to regenerate the complete image with
-the new modifications) and then rerun the test. Modifying the sources
-directly can speed up debugging compared to adding patch files, wiping the
-output directoy, and starting the test again.
+==== Creating a test case
+
+Within the Buildroot repository, the testing framework is organized at the
+top level in +support/testing/+ by folders of +conf+, +infra+ and +tests+.
+All the test cases live under the +tests+ folder and are organized in various
+folders representing the catagory of test.
+
+The best way to get familiar with how to create a test case is to look
+at a few of the basic file system +support/testing/tests/fs/+ and init
++support/testing/tests/init/+ test scripts. Those tests give good
+examples of a basic tests that include both checking the build
+results, and doing runtime tests. There are other more advanced cases
+that use things like nested +br2-external+ folders to provide
+skeletons and additional packages.
+
+Creating a basic test case involves:
+
+* Defining a test class that inherits from +infra.basetest.BRTest+
+
+* Defining the +config+ member of the test class, to the Buildroot
+  configuration to build for this test case. It can optionally rely on
+  configuration snippets provided by the runtime test infrastructure:
+  +infra.basetest.BASIC_TOOLCHAIN_CONFIG+ to get a basic
+  architecture/toolchain configuration, and
+  +infra.basetest.MINIMAL_CONFIG+ to not build any filesystem. The
+  advantage of using +infra.basetest.BASIC_TOOLCHAIN_CONFIG+ is that a
+  matching Linux kernel image is provided, which allows to boot the
+  resulting image in Qemu without having to build a Linux kernel image
+  as part of the test case, therefore significant decreasing the build
+  time required for the test case.
+
+* Implementing a +def test_run(self):+ function to implement the
+  actual tests to run after the build has completed. They may be tests
+  that verify the build output, by running command on the host using
+  the +run_cmd_on_host()+ helper function. Or they may boot the
+  generated system in Qemu using the +Emulator+ object available as
+  +self.emulator+ in the test case. For example +self.emulator.boot()+
+  allows to boot the system in Qemu, +self.emulator.login()+ allows to
+  login, +self.emulator.run()+ allows to run shell commands inside
+  Qemu.
+
+After creating the test script, add yourself to the +DEVELOPERS+ file to
+be the maintainer of that test case.
+
+==== Debugging a test case
+
+When a test case runs, the +output_folder+ will contain the following:
 
 ---------------------
 $ ls output_folder/
@@ -657,29 +645,54 @@ TestInitSystemBusyboxRw-build.log
 TestInitSystemBusyboxRw-run.log
 ---------------------
 
-* The source file used to implement this example test is found under
-+support/testing/tests/init/test_busybox.py+. This file outlines the
-minimal defconfig that creates the build, QEMU configuration to launch
-the built images and the test case assertions.
++TestInitSystemBusyboxRw/+ is the Buildroot output directory, and it
+is preserved only if the +-k+ option is passed.
+
++TestInitSystemBusyboxRw-build.log+ is the log of the Buildroot build.
+
++TestInitSystemBusyboxRw-run.log+ is the log of the Qemu boot and
+test. This file will only exist if the build was successful and the
+test case involves booting under Qemu.
+
+If you want to manually run Qemu to do manual tests of the build
+result, the first few lines of +TestInitSystemBusyboxRw-run.log+
+contain the Qemu command line to use.
+
+You can also make modifications to the current sources inside the
++output_folder+ (e.g. for debug purposes) and rerun the standard
+Buildroot make targets (in order to regenerate the complete image with
+the new modifications) and then rerun the test.
+
+==== Runtime tests and Gitlab CI
+
+All runtime tests are regularly executed by Buildroot Gitlab CI
+infrastructure, see .gitlab.yml and
+https://gitlab.com/buildroot.org/buildroot/-/jobs.
+
+You can also use Gitlab CI to test your new test cases, or verify that
+existing tests continue to work after making changes in Buildroot.
 
-To test an existing or new test case within Gitlab CI, there is a method of
-invoking a specific test by creating a Buildroot fork in Gitlab under your
-account. This can be handy when adding/changing a run-time test or fixing a
-bug on a use case tested by a run-time test case.
+In order to achieve this, you need to create a fork of the Buildroot
+project on Gitlab, and be able to push branches to your Buildroot fork
+on Gitlab.
 
+The name of the branch that you push will determine if a Gitlab CI
+pipeline will be triggered or not, and for which test cases.
 
-In the examples below, the <name> component of the branch name is a unique
-string you choose to identify this specific job being created.
+In the examples below, the <name> component of the branch name is an
+arbitrary string you choose.
 
-* to trigger all run-test test case jobs:
+* To trigger all run-test test case jobs, push a branch that ends with
+  +-runtime-tests+:
 
 ---------------------
  $ git push gitlab HEAD:<name>-runtime-tests
 ---------------------
 
-* to trigger one or several test case jobs, a specific branch naming
-string is used that includes either the full test case name, or the
-beginning of a series of tests to run:
+* To trigger one or several test case jobs, push a branch that ends
+  with the complete test case name
+  (+tests.init.test_busybox.TestInitSystemBusyboxRo+) or with the name
+  of a category of tests (+tests.init.test_busybox+):
 
 ---------------------
  $ git push gitlab HEAD:<name>-<test case name>
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
