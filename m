From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  7 Jun 2020 19:44:50 +0200
Subject: [Buildroot] [PATCH 3/3] support/run-test: add test for systemd
 using dbus-broker
In-Reply-To: <cover.1591551884.git.yann.morin.1998@free.fr>
References: <cover.1591551884.git.yann.morin.1998@free.fr>
Message-ID: <f95931fc0eccd42e1aedeb83187ee01098903e3a.1591551884.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add four new tests for systemd (rw and ro in each case):
  - use dbus-broker instead of the original dbus
  - use the original dbus, with dbus-broker installed

The first two extend the existing TestInitSystemSystemdRoIfupdown test,
by just enabling dbus-broker; the second ones extend this further, by
explicitly enabling the original dbus.

Presence of the original dbus and dbus-broker on the same system is
valid: the original dbus is used as the system bus daemon, while
dbus-broker is used for (some of) the session bus(es). We do not test
the session bus for now, but the new test ensures the system bus daemon
is not impacted by the presence of dbus-broker.

Note: the 'full' test-case enables all systemd options, and some of them
do pull the original dbus package, so we can't use that to test the
integration of dbus-broker; instead, we extend the ifupdown case, which
does not enable the original dbus.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Norbert Lange <nolange79@gmail.com>
---
 support/testing/tests/init/test_systemd.py | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/support/testing/tests/init/test_systemd.py b/support/testing/tests/init/test_systemd.py
index 371be4ad7d..2b3888dfdd 100644
--- a/support/testing/tests/init/test_systemd.py
+++ b/support/testing/tests/init/test_systemd.py
@@ -86,6 +86,20 @@ class TestInitSystemSystemdRoIfupdown(InitSystemSystemdBase):
         self.check_network("eth0")
 
 
+class TestInitSystemSystemdRoIfupdownDbusbroker(TestInitSystemSystemdRoIfupdown):
+    config = TestInitSystemSystemdRoIfupdown.config + \
+        """
+        BR2_PACKAGE_DBUS_BROKER=y
+        """
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
@@ -101,6 +115,20 @@ class TestInitSystemSystemdRwIfupdown(InitSystemSystemdBase):
         self.check_network("eth0")
 
 
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
