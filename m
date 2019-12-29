From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Dec 2019 21:38:33 +0100
Subject: [Buildroot] [git commit] support/testing: add test for python-avro
Message-ID: <20191229203355.75E7A8E6F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9fa2add810c0bda2c727ce55e68b4776a944d141
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This adds a test case for python-avro, with a script that
performs a simple deserialization.

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../testing/tests/package/sample_python_avro.py    | 23 ++++++++++++++++++++++
 support/testing/tests/package/test_python_avro.py  | 11 +++++++++++
 2 files changed, 34 insertions(+)

diff --git a/support/testing/tests/package/sample_python_avro.py b/support/testing/tests/package/sample_python_avro.py
new file mode 100644
index 0000000000..79d2dcdb22
--- /dev/null
+++ b/support/testing/tests/package/sample_python_avro.py
@@ -0,0 +1,23 @@
+from io import BytesIO
+from avro.schema import Parse
+from avro.io import DatumReader, BinaryDecoder
+
+schema = Parse("""{
+"namespace": "org.buildroot.package.python_avro",
+"type": "record",
+"name": "Developer",
+"fields": [
+    {"name": "email", "type": "string"},
+    {"name": "maintainer_of", "type": "string"}
+]
+}""")
+
+example = b'<titouan.christophe at railnova.eu\x16python_avro'
+
+reader = DatumReader(schema)
+deserialized = reader.read(BinaryDecoder(BytesIO(example)))
+
+assert deserialized == {
+    'email': 'titouan.christophe@railnova.eu',
+    'maintainer_of': 'python_avro',
+}
diff --git a/support/testing/tests/package/test_python_avro.py b/support/testing/tests/package/test_python_avro.py
new file mode 100644
index 0000000000..6eee2760da
--- /dev/null
+++ b/support/testing/tests/package/test_python_avro.py
@@ -0,0 +1,11 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonAvro(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_AVRO=y
+        """
+    sample_scripts = ["tests/package/sample_python_avro.py"]
