From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat, 10 Aug 2019 22:35:35 -0300
Subject: [Buildroot] [PATCH 1/4] support/testing: make treq tests to ignore
 warning
Message-ID: <20190811013538.26614-1-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Newer versions of python-treq display a warning at runtime when
service_identity is not installed:
"Without the service_identity module, Twisted can perform only
rudimentary TLS client hostname verification."

This warning message confuses the test that looks for another string in
stdout. Make the test ignore other messages while still expecting
"Connection refused".

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/269139449
https://gitlab.com/buildroot.org/buildroot/-/jobs/269139450

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/270022950
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/270022951
---
 support/testing/tests/package/test_python_treq.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_python_treq.py b/support/testing/tests/package/test_python_treq.py
index 7108b95696..e24ae845be 100644
--- a/support/testing/tests/package/test_python_treq.py
+++ b/support/testing/tests/package/test_python_treq.py
@@ -7,7 +7,8 @@ class TestPythonTreq(TestPythonPackageBase):
     def run_sample_scripts(self):
         cmd = self.interpreter + " sample_python_treq.py"
         output, exit_code = self.emulator.run(cmd, timeout=20)
-        self.assertIn("Connection refused", output[0])
+        refuse_msgs = [1 for l in output if "Connection refused" in l]
+        self.assertGreater(sum(refuse_msgs), 0)
         self.assertEqual(exit_code, 0)
 
 
-- 
2.17.1
