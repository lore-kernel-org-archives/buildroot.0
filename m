From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 21 Aug 2020 18:35:31 +0200
Subject: [Buildroot] [PATCH 2/2] support/tests: add runtime test for
 python-rpi-gpio
In-Reply-To: <cover.1598027701.git.yann.morin.1998@free.fr>
References: <cover.1598027701.git.yann.morin.1998@free.fr>
Message-ID: <748705989a4a29b9a0a1bc565d1adf83a8a70f45.1598027701.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Modeled after similar python packages.

However, this one is picky, and throws an exception when it
detects that it is not running on a Raspberry Pi. So we just
catch that exception and check this is what we expect.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Christian Stewart <christian@paral.in>
Cc: Michael Fischer <mf@go-sys.de>
Cc: Asaf Kahlon <asafka7@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Ian Haylock <haylocki@yahoo.co.uk>
---
 .../testing/tests/package/sample_python_rpi_gpio.py   |  6 ++++++
 support/testing/tests/package/test_python_rpi_gpio.py | 11 +++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 support/testing/tests/package/sample_python_rpi_gpio.py
 create mode 100644 support/testing/tests/package/test_python_rpi_gpio.py

diff --git a/support/testing/tests/package/sample_python_rpi_gpio.py b/support/testing/tests/package/sample_python_rpi_gpio.py
new file mode 100644
index 0000000000..5f0d884e07
--- /dev/null
+++ b/support/testing/tests/package/sample_python_rpi_gpio.py
@@ -0,0 +1,6 @@
+try:
+    import RPi.GPIO  # noqa
+except RuntimeError as e:
+    assert(str(e) == 'This module can only be run on a Raspberry Pi!')
+else:
+    raise RuntimeError('Import succeeded when it should not have!')
diff --git a/support/testing/tests/package/test_python_rpi_gpio.py b/support/testing/tests/package/test_python_rpi_gpio.py
new file mode 100644
index 0000000000..c938ea39bb
--- /dev/null
+++ b/support/testing/tests/package/test_python_rpi_gpio.py
@@ -0,0 +1,11 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3RpiGpio(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_RPI_GPIO=y
+        """
+    sample_scripts = ["tests/package/sample_python_rpi_gpio.py"]
-- 
2.20.1
