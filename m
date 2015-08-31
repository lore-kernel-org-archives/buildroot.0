From: Denis THULIN <denis.thulin@openwide.fr>
Date: Mon, 31 Aug 2015 11:59:09 +0200
Subject: [Buildroot] [PATCH 4/6] tests: Adds user manual entry
In-Reply-To: <1441015151-3108-1-git-send-email-denis.thulin@openwide.fr>
References: <1441015151-3108-1-git-send-email-denis.thulin@openwide.fr>
Message-ID: <1441015151-3108-5-git-send-email-denis.thulin@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adds user manual section about how to use and write tests

The documentation covers everything from writing your own tests to setting up
your configuration to test throught telnet and qemu.

Signed-off-by: Denis THULIN <denis.thulin@openwide.fr>
---

Signed-off-by: Denis THULIN <denis.thulin@openwide.fr>
---
 docs/manual/common-usage.txt        |   2 +
 docs/manual/test-infrastructure.txt | 239 ++++++++++++++++++++++++++++++++++++
 2 files changed, 241 insertions(+)
 create mode 100644 docs/manual/test-infrastructure.txt

diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
index 5b27b1f..69c90b6 100644
--- a/docs/manual/common-usage.txt
+++ b/docs/manual/common-usage.txt
@@ -276,3 +276,5 @@ BR2_GRAPH_OUT=png make graph-build
 include::eclipse-integration.txt[]
 
 include::advanced.txt[]
+
+include::test-infrastructure.txt[]
diff --git a/docs/manual/test-infrastructure.txt b/docs/manual/test-infrastructure.txt
new file mode 100644
index 0000000..2a74660
--- /dev/null
+++ b/docs/manual/test-infrastructure.txt
@@ -0,0 +1,239 @@
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
+
+=== Test Infrastructure
+
+You may want to test your packages in Buildroot. Buildroot provides a test
+generation infrastructure. Those tests are Robot Framework tests,
+see https://github.com/Robotframework/Robotframework/blob/master/INSTALL.rst[here]
+for installation instructions.
+
+There can be two kinds of tests: host tests and target tests.
+
+If you want to run host tests, run:
+
+----------------------------
+make tests-host
+----------------------------
+
+or
+
+----------------------------
+make tests
+----------------------------
+
+==== Host tests
+
+Host tests are NOT tests for host packages. Host tests are tests that are ran
+from your build machine, on your build machine.
+
+Those tests are mostly meant to make sure that some files are correctly
+installed in the output/target directory.
+
+You should use Keywords from the http://Robotframework.org/Robotframework/latest/libraries/OperatingSystem.html[OperatingSystem Library]
+to make sure that the installation happened correctly (+File Should Exist+,
++File Should Not Exist+, +Directory Should Exist+,
++Directory Should Not Be Empty+, etc...).
+
+==== Target Tests
+
+Target tests are ran from a running target on itself, and thus require
+Robot Framework to be installed on the target. You also need to manually copy
+the target tests to your board.
+
+Target tests are useful when you already have tests written for packages.
+
+==== Writing tests
+
+Tests can either be written in full flegged Robot Framework tests files or
+directly in the <package>.mk file.
+
+===== Configuration dependent tests
+
+You should avoid writing tests directly inside the <package>.mk file unless a
+test depends on your configuration.
+
+Let's see what the <package>.mk looks like.
+
+------------------------------
+01: ################################################################################
+02: #
+03: # libfoo
+04: #
+05: ################################################################################
+06:
+07: LIBFOO_VERSION = 1.0
+08: LIBFOO_SOURCE = libfoo-$(LIBFOO_VERSION).tar.gz
+09: LIBFOO_SITE = http://www.foosoftware.org/download
+10: LIBFOO_LICENSE = GPLv3+
+11: LIBFOO_LICENSE_FILES = COPYING
+12: LIBFOO_INSTALL_STAGING = YES
+13: LIBFOO_CONFIG_SCRIPTS = libfoo-config
+14: LIBFOO_DEPENDENCIES = host-libaaa libbbb
+15:
+16: ifeq ($(BR2_INT_BUSYBOX)$(BR2_INIT_SYSV),y)
+17: LIBFOO_TEST_INSTALL_LOCATION = /etc/init.d/S90libfoo
+18: else ifeq ($(BR2_INIT_SYSTEMD),y)
+19: LIBFOO_TEST_INSTALL_LOCATION = /usr/lib/systemd/system/libfoo.service
+20: endif
+21:
+22: LIBFOO_HOST_TEST_VARIABLES = bar=/path/to/bar
+23: define LIBFOO_HOST_TEST_CASES =
+24: 'File Bar Exists\n'\
+25: '    File Should Exist    ${bar}\n\n'
+26: endef
+27:
+28: LIBFOO_TEST_ORIGINAL =  libfoo.robot
+29: ifeq ($(BR2_INT_BUSYBOX)$(BR2_INIT_SYSV),y)
+30: LIBFOO_TEST_VARIABLES = expected_result=1
+31: else ifeq ($(BR2_INIT_SYSTEMD),y)
+32: LIBFOO_TEST_VARIABLES = expected_result=0
+33: endif
+34:
+35: $(eval $(generic-package))
+--------------------------------
+
+From Line 16 to 20, we specify an installation file for libfoo that depends on
+the init system. When writing tests, make will automatically create a host test
+called +Libfoo Is Installed+ if variable +LIBFOO_TEST_INSTALL_LOCATION+ is
+defined.
+
+On line 22, we specify that host tests will use a variable +bar+ whose value is
+'/path/to/bar' using LIBFOO_HOST_TEST_VARIABLES. In the test suite, it will look
+like
+
+--------------------------------
+${bar}=    /path/to/bar
+--------------------------------
+
+From line 23 to 26, we define a host test case which checks that the file bar
+exists. Test are stored into a multiline variable called
++LIBFOO_HOST_TEST_CASES+.
+
+On line 28, we define the original file for target tests. This file will be
+meged with information from the mk file.
+From line 28 to 31, we define a variable that will be used by target tests.
+See the '<libfoo>package/libfoo.robot' file:
+
+------------------------------
+01: *** Settings ***
+02: Documentation       Target tests of buildroot package libfoo
+03: Library             Process
+04: *** Test Cases ***
+05: Example
+06:     ${out}=     Run Process     libfoo
+07:     Should Be Equal As Integers     ${expected_result}      ${out.rc}
+--------------------------------
+
+===== Independent tests
+
+Most tests for packages will depend on your configuration. You should specify
+those files inside variables +$(TARGET_TEST_MATERIAL)+ and
++$(HOST_TEST_MATERIAL)+.
+The content of those folder is always copied to the
+'output/tests/<test_kind>/libfoo/' folder.
+
+Those will be ran as different test suites from the one created by the
+makefile.
+
+==== Test syntax reference
+
+Variables for host tests are specified with +LIBFOO_HOST_TEST+ and those for
+target tests are just +LIBFOO_TEST+.
+
+The list of test related variables that can be set in a .mk file without test
+kind (assuming thepackage name is +libfoo+)
+
+* +LIBFOO_TEST_ORIGINAL+ is a Robot Framework test file that is merged with
+  the test suite being built. Test should preferably be  written there rather
+  than in the .mk file (and use variables as much as  possible).
+
+* +LIBFOO_TEST_VARIABLES+ is a list of variables used by test suites.
+  Those should look like myvar=Itsvalue. Those variables will be formated
+  to work inside the test suite.
+
+* +LIBFOO_TEST_CASES+ contains all test cases that are written inside the .mk
+  file. Use a define to write your tests this way. Please use
+  +LIBFOO_TEST_ORIGINAL+ rather than this if you can (for readability).
+
+The list of variables that do not depend on the test kind:
+
+* +LIBFOO_TEST_INSTALL_LOCATION+ should contain a file or a folder that exists
+  in the target directory if the package was installed correctly. A host test
+  is automatically created if it is present.
+
+==== General advices about writing tests
+
+Even though you can use both the original file and the .mk file to write tests,
+it is not a very good idea to use both a lot if you don't need to.
+
+Variables are easier to write in the original file, especially lists and
+dictionnaries. Hence, in the +.mk+ file, you should create Robot Framework
+variables directly from existing variables in your configuration and in the
+original file, you should use those variables.
+Example: If you need libfoo's version to create Robot Framework variables
+version_minor and version major. +libfoo.mk+ will be :
+
+------------------------------
+...
+LIBFOO_VERSION = 1.0
+...
+LIBFOO_TEST_ORIGINAL = target_test_original.robot
+LIBFOO_TEST_VARIABLES += version=$(LIBFOO_VERSION)
+...
+------------------------------
+
+And +target_test_original.robot+ will look like
+
+------------------------------
+...
+*** Variables ***
+${version_major}=    ${version.split('.')[0]}
+${version_minor}=    ${version.split('.')[1]}
+*** Test cases ***
+...
+------------------------------
+
+Where to write test cases depends on your situation, if your tests do not
+change when your configuration change, you should write those either in
+external test suites (inside <test-kind>_test_material) or in the original
+file.
+
+If your whole test suite drastically change because of a single variable,
+you should probably have multiple original files and chose the correct one
+according to the variable in the +.mk+ file.
+Example: When you want to test d?mons, you test will difer wether you use
+systemd or System V.
+
+If most of your tests individually depends on different variables having
+different values. You should have those tests in the mkfile.
+
+If a lot of your test suites require keywords or variables, you should write
+those inside resource files/variable files/librairies located in
+'<buildroot>/tests/<test-kind>/<yourfile>' and in your test suite, there should
+be:
+
+------------------------------
+*** Settings ***
+...
+Librairy     ../resources/<your-librairy>.py
+Variables    ../resources/<your-variable-file>.py
+Resource     ../resources/<your-resource-file>.robot
+...
+------------------------------
+
+==== Useful links for writing tests:
+
+The Robot Framework documentation page contain a lot of usefull links:
+see http://Robotframework.org/#documentation[here]
+
+You should start with the https://github.com/Robotframework/QuickStartGuide/blob/master/QuickStart.rst[Quick Start Guide]
+
+Documentation for librairies provided with Robot Framework can be found inside
+the http://Robotframework.org/Robotframework/#user-guide[User Guide]
+
+Also very useful:
+
+* http://www.slideshare.net/pekkaklarck/robot-framework-dos-and-donts[dos and don't]
+
+* https://code.google.com/p/Robotframework/wiki/HowToWriteGoodTestCases[How to write good test cases]
-- 
2.5.0
