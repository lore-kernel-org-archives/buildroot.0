From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 11 Apr 2020 16:57:50 +0200
Subject: [Buildroot] [PATCH] support/testing: test_python_django: use the
 timeout_multiplier value
Message-ID: <20200411145750.7655-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As reported by our gitlab runtime test [1] and on the mailing list [2],
the test_python_django is failing only on gitlab due to slow (but free)
gitlab runners. This is due to django server taking a lot of time to
start. Since the django server is started in background through pexpect,
we can't easily wait for the last startup line:

"January 01, 1970 - 00:00:41

Django version 3.0.4, using settings 'testsite.settings'

Starting development server at http://0.0.0.0:1234/

Quit the server with CONTROL-C."

In the failing gitlab job, we don't see such lines.

If we increase a lot the timout, the test pass.

Use timeout_multiplier introduced by [3] in order to adjust the
timeout.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/488816222

Tested:
https://gitlab.com/kubu93/buildroot/-/jobs/507458355

[1] https://gitlab.com/buildroot.org/buildroot/-/jobs/488816222
[2] http://lists.busybox.net/pipermail/buildroot/2020-April/279598.html
[3] 6e45e33f27d5ae6fa0ab5aad3f032d886a886037

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Adam Duskett <Aduskett@gmail.com>
---
This patch should be backported to 2020.02.x
---
 support/testing/tests/package/test_python_django.py | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/support/testing/tests/package/test_python_django.py b/support/testing/tests/package/test_python_django.py
index 6b31833a0f..0b7d35bb6a 100644
--- a/support/testing/tests/package/test_python_django.py
+++ b/support/testing/tests/package/test_python_django.py
@@ -6,18 +6,20 @@ class TestPythonDjango(TestPythonPackageBase):
     sample_scripts = ["tests/package/sample_python_django.py"]
 
     def run_sample_scripts(self):
+        timeout = 35 * self.emulator.timeout_multiplier
+
         cmd = "cd /opt && /usr/bin/django-admin startproject testsite"
-        self.assertRunOk(cmd, timeout=30)
+        self.assertRunOk(cmd, timeout=timeout)
 
         cmd = "cd /opt/testsite && " + self.interpreter + " ./manage.py migrate"
-        output, exit_code = self.emulator.run(cmd, timeout=30)
+        output, exit_code = self.emulator.run(cmd, timeout=timeout)
         self.assertIn("Operations to perform:", output[0])
         self.assertEqual(exit_code, 0)
 
         cmd = "cd /opt/testsite && " + self.interpreter + " ./manage.py runserver 0.0.0.0:1234 & "
         # give some time to setup the server
-        cmd += "sleep 30"
-        self.assertRunOk(cmd, timeout=35)
+        cmd += "sleep {}".format(str(30 * self.emulator.timeout_multiplier))
+        self.assertRunOk(cmd, timeout=timeout)
 
         cmd = "netstat -ltn 2>/dev/null | grep 0.0.0.0:1234"
         self.assertRunOk(cmd)
-- 
2.25.2
