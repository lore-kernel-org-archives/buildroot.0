From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Jul 2020 13:48:26 +0200
Subject: [Buildroot] [PATCH 4/4 v5] support/run-test: add test for systemd
 using dbus-broker
In-Reply-To: <cover.1595072897.git.yann.morin.1998@free.fr>
References: <cover.1595072897.git.yann.morin.1998@free.fr>
Message-ID: <a63f1dc4a5c32382d5861934aa426cfbe58a490e.1595072897.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add four new tests for systemd (rw and ro in each case):
  - use dbus-broker instead of the original dbus
  - use the original dbus, with dbus-broker installed

The first two extend the existing IfUpDown test cases by just enabling
dbus-broker; the second ones extend this further, by explicitly enabling
the original dbus.

For one of the tests, we overload the test_run() function to test that
the dbus-broker daemon is indeed running as root. We need not replicate
that check in the other dbus-broker-only test, and it does not make
sense to test that in tests that have the original dbus enabled.

Presence of the original dbus and dbus-broker on the same system is
valid: the original dbus is used as the default system bus daemon. We do
not test switching between the two at runtime, though as this is really
too corner-case specific. We just test to ensure the original dbus
system bus daemon is not impacted by the presence of dbus-broker.

Note: the 'full' test-case enables all systemd options, and some of them
do pull the original dbus package, so we can't use that to test the
integration of dbus-broker; instead, we extend the ifupdown case, which
does not enable the original dbus.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Norbert Lange <nolange79@gmail.com>
---
 .gitlab-ci.yml                             |  4 +++
 support/testing/tests/init/test_systemd.py | 37 ++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 673aa8b3e7..5674f6bed3 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -399,9 +399,13 @@ tests.init.test_openrc.TestInitSystemOpenrcRoFull: { extends: .runtime_test }
 tests.init.test_openrc.TestInitSystemOpenrcRwFull: { extends: .runtime_test }
 tests.init.test_systemd.TestInitSystemSystemdRoFull: { extends: .runtime_test }
 tests.init.test_systemd.TestInitSystemSystemdRoIfupdown: { extends: .runtime_test }
+tests.init.test_systemd.TestInitSystemSystemdRoIfupdownDbusbroker: { extends: .runtime_test }
+tests.init.test_systemd.TestInitSystemSystemdRoIfupdownDbusbrokerDbus: { extends: .runtime_test }
 tests.init.test_systemd.TestInitSystemSystemdRoNetworkd: { extends: .runtime_test }
 tests.init.test_systemd.TestInitSystemSystemdRwFull: { extends: .runtime_test }
 tests.init.test_systemd.TestInitSystemSystemdRwIfupdown: { extends: .runtime_test }
+tests.init.test_systemd.TestInitSystemSystemdRwIfupdownDbusbroker: { extends: .runtime_test }
+tests.init.test_systemd.TestInitSystemSystemdRwIfupdownDbusbrokerDbus: { extends: .runtime_test }
 tests.init.test_systemd.TestInitSystemSystemdRwNetworkd: { extends: .runtime_test }
 tests.package.test_atop.TestAtop: { extends: .runtime_test }
 tests.package.test_crudini.TestCrudiniPy2: { extends: .runtime_test }
diff --git a/support/testing/tests/init/test_systemd.py b/support/testing/tests/init/test_systemd.py
index cf952bef44..276165f742 100644
--- a/support/testing/tests/init/test_systemd.py
+++ b/support/testing/tests/init/test_systemd.py
@@ -84,6 +84,29 @@ class TestInitSystemSystemdRoIfupdown(InitSystemSystemdBase):
         self.check_systemd("squashfs")
 
 
+class TestInitSystemSystemdRoIfupdownDbusbroker(TestInitSystemSystemdRoIfupdown):
+    config = TestInitSystemSystemdRoIfupdown.config + \
+        """
+        BR2_PACKAGE_DBUS_BROKER=y
+        """
+
+    def test_run(self):
+        # Parent class' test_run() method does exactly that, no more:
+        self.check_systemd("squashfs")
+
+        # Check that the dbus-broker daemon is running as non-root
+        cmd = "find /proc/$(pidof dbus-broker) -maxdepth 1 -name exe -user dbus"
+        out, _ = self.emulator.run(cmd)
+        self.assertEqual(len(out), 1)
+
+
+class TestInitSystemSystemdRoIfupdownDbusbrokerDbus(TestInitSystemSystemdRoIfupdownDbusbroker):
+    config = TestInitSystemSystemdRoIfupdownDbusbroker.config + \
+        """
+        BR2_PACKAGE_DBUS=y
+        """
+
+
 class TestInitSystemSystemdRwIfupdown(InitSystemSystemdBase):
     config = InitSystemSystemdBase.config + \
         """
@@ -97,6 +120,20 @@ class TestInitSystemSystemdRwIfupdown(InitSystemSystemdBase):
         self.check_systemd("ext2")
 
 
+class TestInitSystemSystemdRwIfupdownDbusbroker(TestInitSystemSystemdRwIfupdown):
+    config = TestInitSystemSystemdRwIfupdown.config + \
+        """
+        BR2_PACKAGE_DBUS_BROKER=y
+        """
+
+
+class TestInitSystemSystemdRwIfupdownDbusbrokerDbus(TestInitSystemSystemdRwIfupdownDbusbroker):
+    config = TestInitSystemSystemdRwIfupdownDbusbroker.config + \
+        """
+        BR2_PACKAGE_DBUS=y
+        """
+
+
 class TestInitSystemSystemdRoFull(InitSystemSystemdBase):
     config = InitSystemSystemdBase.config + \
         """
-- 
2.20.1
