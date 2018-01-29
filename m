From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Jan 2018 23:14:24 +0100
Subject: [Buildroot] [git commit] scanpypi: fix code style
Message-ID: <20180129221638.179E087745@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2455e5a091051ad7062556d45d9c8c079598a9d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix these warnings:
E101 indentation contains mixed spaces and tabs
E128 continuation line under-indented for visual indent
E231 missing whitespace after ','
E261 at least two spaces before inline comment
E302 expected 2 blank lines, found 1
E305 expected 2 blank lines after class or function definition, found 1
W191 indentation contains tabs

Ignore these warnings:
E402 module level import not at top of file

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 utils/scanpypi | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index 23a2fb8c7b..55bfb2fedb 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -35,6 +35,7 @@ except ImportError:
           'pip install spdx_lookup')
     liclookup = None
 
+
 def setup_decorator(func, method):
     """
     Decorator for distutils.core.setup and setuptools.setup.
@@ -55,11 +56,12 @@ def setup_decorator(func, method):
     return closure
 
 # monkey patch
-import setuptools
+import setuptools  # noqa E402
 setuptools.setup = setup_decorator(setuptools.setup, 'setuptools')
-import distutils
+import distutils   # noqa E402
 distutils.core.setup = setup_decorator(setuptools.setup, 'distutils')
 
+
 def find_file_upper_case(filenames, path='./'):
     """
     List generator:
@@ -91,9 +93,11 @@ def pkg_buildroot_name(pkg_name):
     name = pattern.sub(r'python-\1', name)
     return name
 
+
 class DownloadFailed(Exception):
     pass
 
+
 class BuildrootPackage():
     """This class's methods are not meant to be used individually please
     use them in the correct order:
@@ -267,14 +271,14 @@ class BuildrootPackage():
             # called through the if __name__ == '__main__' directive.
             # In this case, we can only pray that it is called through a
             # function called main() in setup.py.
-            setup.main() # Will raise AttributeError if not found
+            setup.main()  # Will raise AttributeError if not found
             self.setup_metadata = self.setup_args[self.metadata_name]
         # Here we must remove the module the hard way.
         # We must do this because of a very specific case: if a package calls
         # setup from the __main__ but does not come with a 'main()' function,
         # for some reason setup.main() will successfully call the main
         # function of a previous package...
-        sys.modules.pop('setup',None)
+        sys.modules.pop('setup', None)
         del setup
         os.chdir(current_dir)
         sys.path.remove(self.tmp_extract)
@@ -695,5 +699,6 @@ def main():
     finally:
         shutil.rmtree(tmp_path)
 
+
 if __name__ == "__main__":
     main()
