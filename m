From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue,  5 Feb 2019 10:46:03 +0100
Subject: [Buildroot] [WIP] support/testing: add test to verify 'scp'
 download via BR2_PRIMARY_SITE
Message-ID: <20190205094603.28989-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Recently it was found that the scp download infrastructure was broken.
To avoid future failures, create a test that verifies that the scp command
receives the expected arguments.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 .../tests/download/br2-external/scp/Config.in |  0
 .../download/br2-external/scp/external.desc   |  1 +
 .../download/br2-external/scp/external.mk     |  1 +
 .../br2-external/scp/package/nohash/nohash.mk | 10 +++
 support/testing/tests/download/scp-wrapper    | 62 +++++++++++++++++++
 support/testing/tests/download/test_scp.py    | 45 ++++++++++++++
 6 files changed, 119 insertions(+)
 create mode 100644 support/testing/tests/download/br2-external/scp/Config.in
 create mode 100644 support/testing/tests/download/br2-external/scp/external.desc
 create mode 100644 support/testing/tests/download/br2-external/scp/external.mk
 create mode 100644 support/testing/tests/download/br2-external/scp/package/nohash/nohash.mk
 create mode 100755 support/testing/tests/download/scp-wrapper
 create mode 100644 support/testing/tests/download/test_scp.py

diff --git a/support/testing/tests/download/br2-external/scp/Config.in b/support/testing/tests/download/br2-external/scp/Config.in
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/support/testing/tests/download/br2-external/scp/external.desc b/support/testing/tests/download/br2-external/scp/external.desc
new file mode 100644
index 0000000000..0ca0389a32
--- /dev/null
+++ b/support/testing/tests/download/br2-external/scp/external.desc
@@ -0,0 +1 @@
+name: SCP
diff --git a/support/testing/tests/download/br2-external/scp/external.mk b/support/testing/tests/download/br2-external/scp/external.mk
new file mode 100644
index 0000000000..2636c7da24
--- /dev/null
+++ b/support/testing/tests/download/br2-external/scp/external.mk
@@ -0,0 +1 @@
+include $(sort $(wildcard $(BR2_EXTERNAL_SCP_PATH)/package/*/*.mk))
diff --git a/support/testing/tests/download/br2-external/scp/package/nohash/nohash.mk b/support/testing/tests/download/br2-external/scp/package/nohash/nohash.mk
new file mode 100644
index 0000000000..cfd49370cd
--- /dev/null
+++ b/support/testing/tests/download/br2-external/scp/package/nohash/nohash.mk
@@ -0,0 +1,10 @@
+################################################################################
+#
+# nohash
+#
+################################################################################
+
+NOHASH_VERSION = 123
+NOHASH_SITE = http://realsite.example.org/foo
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/download/scp-wrapper b/support/testing/tests/download/scp-wrapper
new file mode 100755
index 0000000000..3d09ebb121
--- /dev/null
+++ b/support/testing/tests/download/scp-wrapper
@@ -0,0 +1,62 @@
+#!/usr/bin/env python
+import argparse
+import os
+import sys
+
+# expected command-line is:
+#   scp [options] <host:path> <target>
+#
+# environment variables set up by test suite:
+# - SCP_WRAPPER_EXPECTED_HOST
+# - SCP_WRAPPER_EXPECTED_BASEPATH
+# - SCP_WRAPPER_EXPECTED_FILEPATH
+
+def main():
+    parser = argparse.ArgumentParser(description='Scp wrapper for Buildroot tests')
+    parser.add_argument('source', help='source path')
+    parser.add_argument('target', help='target path')
+
+    args = parser.parse_args()
+
+    error = False
+
+    expected_source_host_basepath = '%s:%s' % (
+            os.environ['SCP_WRAPPER_EXPECTED_HOST'],
+            os.environ['SCP_WRAPPER_EXPECTED_BASEPATH'])
+    if not args.source.startswith(expected_source_host_basepath):
+        print("")
+        print("ERROR: unexpected source host and/or base path.")
+        print("Got     : '%s'" % args.source)
+        print("Expected: '%s...'" % expected_source_host_basepath)
+        print("")
+        error = True
+
+    expected_source_filepath = '%s' % (os.environ['SCP_WRAPPER_EXPECTED_FILEPATH'])
+    if not args.source.endswith(expected_source_filepath):
+        print("")
+        print("ERROR: unexpected source file path.")
+        print("Got     : '%s'" % args.source)
+        print("Expected: '...%s'" % expected_source_filepath)
+        print("")
+        error = True
+
+    # Really make sure that the source is a tarball.
+    # The test is using .tar.gz only so we don't check other extensions.
+    if not args.source.endswith('.tar.gz'):
+        print("")
+        print("ERROR: the source path does not seem like a tarball.")
+        print("Got     : '%s'" % args.source)
+        print("Expected: '*.tar.gz'")
+        print("")
+        error = True
+
+    if not error:
+        # create a dummy file to let the build succeed
+        open(args.target, 'a').close()
+
+    return error
+
+if __name__ == "__main__":
+    error = main()
+    if error:
+        sys.exit(1)
diff --git a/support/testing/tests/download/test_scp.py b/support/testing/tests/download/test_scp.py
new file mode 100644
index 0000000000..95f76b718e
--- /dev/null
+++ b/support/testing/tests/download/test_scp.py
@@ -0,0 +1,45 @@
+import infra
+import os
+
+class TestScpPrimarySite(infra.basetest.BRTest):
+    host = 'user at server.example.org'
+    basepath = 'some/directory'
+    scp_wrapper = infra.filepath("tests/download/scp-wrapper")
+    br2_external = [infra.filepath("tests/download/br2-external/scp")]
+
+    def __init__(self, names):
+        self.config = \
+        """
+        BR2_PRIMARY_SITE="scp://%s:%s"
+        BR2_PRIMARY_SITE_ONLY=y
+        BR2_BACKUP_SITE=""
+        BR2_SCP="%s"
+        """ % (self.host, self.basepath, self.scp_wrapper)
+
+        super(TestScpPrimarySite, self).__init__(names)
+
+    def tearDown(self):
+        self.show_msg("Cleaning up")
+        if self.b and not self.keepbuilds:
+            self.b.delete()
+
+    def test_download(self):
+        package = 'nohash'
+        # store downloaded tarball inside the output dir so the test infra
+        # cleans it up at the end
+        env = {
+            "BR2_DL_DIR": os.path.join(self.builddir, "dl"),
+            "SCP_WRAPPER_EXPECTED_HOST": self.host,
+            "SCP_WRAPPER_EXPECTED_BASEPATH": self.basepath,
+            "SCP_WRAPPER_EXPECTED_FILEPATH": '%s-123.tar.gz' % package
+        }
+        try:
+            self.b.build(["{}-dirclean".format(package),
+                          "{}-source".format(package)],
+                         env)
+        except SystemError as e: # FIXME: introduce specific Exception classes
+            if str(e) == 'Build failed':
+                self.assertFalse('Download error, search for ERROR in the log')
+            else:
+                # an unexpected error
+                raise
-- 
2.19.2
