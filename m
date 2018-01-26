From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri, 26 Jan 2018 14:32:50 +0100
Subject: [Buildroot] [RFC] scanpypi: handle packages with wrong metadata
Message-ID: <1516973570-7732-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Some packages like python-adafruit-ads1x15 have different values in
PyPI metadata and setup.py or tar file name.

Use package name (self.pkg_name) derived from tar file name instead
of metadata_name taken from JSON.

Also output the missing key when trying to setup arguments.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 utils/scanpypi | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index 7392c50..0add12b 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -130,6 +130,7 @@ class BuildrootPackage():
         self.md5_sum = None
         self.metadata = None
         self.metadata_name = None
+        self.pkg_name = None
         self.metadata_url = None
         self.pkg_req = None
         self.setup_metadata = None
@@ -249,10 +250,12 @@ class BuildrootPackage():
                     os.makedirs(tmp_pkg)
                 as_tarfile.extractall(tmp_pkg)
 
+        index_of_pkg_version = self.filename.index(self.version) - 1
+        self.pkg_name = self.filename[:index_of_pkg_version]
         tmp_extract = '{folder}/{name}-{version}'
         self.tmp_extract = tmp_extract.format(
             folder=tmp_pkg,
-            name=self.metadata_name,
+            name=self.pkg_name,
             version=self.version)
 
     def load_setup(self):
@@ -265,14 +268,15 @@ class BuildrootPackage():
         s_file, s_path, s_desc = imp.find_module('setup', [self.tmp_extract])
         setup = imp.load_module('setup', s_file, s_path, s_desc)
         try:
-            self.setup_metadata = self.setup_args[self.metadata_name]
-        except KeyError:
+            self.setup_metadata = self.setup_args[self.pkg_name]
+        except KeyError as err:
+            print('Following key is missing: {}'.format(err))
             # This means setup was not called which most likely mean that it is
             # called through the if __name__ == '__main__' directive.
             # In this case, we can only pray that it is called through a
             # function called main() in setup.py.
             setup.main()  # Will raise AttributeError if not found
-            self.setup_metadata = self.setup_args[self.metadata_name]
+            self.setup_metadata = self.setup_args[self.pkg_name]
         # Here we must remove the module the hard way.
         # We must do this because of a very specific case: if a package calls
         # setup from the __main__ but does not come with a 'main()' function,
-- 
2.1.4
