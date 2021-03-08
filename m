From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon,  8 Mar 2021 14:45:39 +0100
Subject: [Buildroot] [PATCH 1/2] utils/scanpypi: add setup.py script
 directory as sys.path[0]
Message-ID: <20210308134542.22324-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Even though the directory containing a package's setup.py was added to
sys.path, some setup.py implementations rely on the fact that it is placed
in sys.path[0].

An example package is 'cram' which failed to be added with scanpypi:

    Traceback (most recent call last):
      File "utils/scanpypi", line 756, in <module>
        main()
      File "utils/scanpypi", line 703, in main
        package.load_setup()
      File "utils/scanpypi", line 303, in load_setup
        setup = imp.load_module('setup', s_file, s_path, s_desc)
      File "/usr/lib/python3.8/imp.py", line 234, in load_module
        return load_source(name, filename, file)
      File "/usr/lib/python3.8/imp.py", line 171, in load_source
        module = _load(spec)
      File "<frozen importlib._bootstrap>", line 702, in _load
      File "<frozen importlib._bootstrap>", line 671, in _load_unlocked
      File "<frozen importlib._bootstrap_external>", line 783, in exec_module
      File "<frozen importlib._bootstrap>", line 219, in _call_with_frames_removed
      File "/tmp/scanpypi-2pzc5wb_/python-cram/cram-0.7/setup.py", line 44, in <module>
        long_description=long_description(),
      File "/tmp/scanpypi-2pzc5wb_/python-cram/cram-0.7/setup.py", line 20, in long_description
        return open(os.path.join(sys.path[0], 'README.rst')).read()
    FileNotFoundError: [Errno 2] No such file or directory: '.../buildroot/utils/README.rst'

The corresponding code from cram's setup.py is:

    def long_description():
        """Get the long description from the README"""
        return open(os.path.join(sys.path[0], 'README.rst')).read()

Indeed, the Python documentation says:

https://docs.python.org/3.8/library/sys.html#sys.path
    "...
    As initialized upon program startup, the first item of this list,
    path[0], is the directory containing the script that was used to invoke
    the Python interpreter.
    ..."

Fix this by inserting explicitly at index 0 instead of appending to
sys.path.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 utils/scanpypi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index 47c7c00c60..24c64dddde 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -297,7 +297,7 @@ class BuildrootPackage():
         """
         current_dir = os.getcwd()
         os.chdir(self.tmp_extract)
-        sys.path.append(self.tmp_extract)
+        sys.path.insert(0,self.tmp_extract)
         s_file, s_path, s_desc = imp.find_module('setup', [self.tmp_extract])
         setup = imp.load_module('setup', s_file, s_path, s_desc)
         if self.metadata_name in self.setup_args:
-- 
2.26.2
