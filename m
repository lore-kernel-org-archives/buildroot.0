From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed,  4 Apr 2018 18:40:25 +0200
Subject: [Buildroot] [PATCH v2] autobuild-run: prepare_build(): ignore
 directories in dldir
Message-ID: <20180404164025.24814-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With the change to use subdirs in dldir, prepare_build may end up trying to
remove a non-empty subdir, causing an exception:

Process Process-1:
Traceback (most recent call last):
  File "/usr/lib64/python2.7/multiprocessing/process.py", line 258, in _bootstrap
    self.run()
  File "/usr/lib64/python2.7/multiprocessing/process.py", line 114, in run
    self._target(*self._args, **self._kwargs)
  File "/home/peko/buildroot-test/scripts/autobuild-run", line 627, in run_instance
    ret = prepare_build(**kwargs)
  File "/home/peko/buildroot-test/scripts/autobuild-run", line 301, in prepare_build
    os.remove(os.path.join(dldir, f))
OSError: [Errno 21] Is a directory: 'instance-0/dl/mtools'

We only want to delete individual download files, so recursively search for
files under dldir.

With this change, flist contains the full path to the files, so also adjust
the printing/removal logic.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 scripts/autobuild-run | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 0f1c7d7..33d0ae9 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -288,17 +288,24 @@ def prepare_build(**kwargs):
     if not os.path.exists(dldir):
         os.mkdir(dldir)
 
+    # recursively find files under root
+    def find_files(root):
+        for r, d, f in os.walk(root):
+            for i in f:
+                yield os.path.join(r, i)
+
     # Remove 5 random files from the download directory. Removing
     # random files from the download directory allows to ensure we
     # regularly re-download files to check that their upstream
     # location is still correct.
     for i in range(0, 5):
-        flist = os.listdir(dldir)
+        flist = list(find_files(dldir))
         if not flist:
             break
         f = flist[randint(0, len(flist) - 1)]
-        log_write(log, "INFO: removing %s from downloads" % f)
-        os.remove(os.path.join(dldir, f))
+        log_write(log, "INFO: removing %s from downloads" %
+                  os.path.relpath(f, dldir))
+        os.remove(f)
 
     branch = get_branch()
     log_write(log, "INFO: testing branch '%s'" % branch)
-- 
2.11.0
