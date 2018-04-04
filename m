From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed,  4 Apr 2018 09:07:28 +0200
Subject: [Buildroot] [PATCH] autobuild-run: prepare_build(): ignore
 directories in dldir
Message-ID: <20180404070728.18851-1-peter@korsgaard.com>
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

We only want to delete individual download files, so drop directories from
the list of removal candidates.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 scripts/autobuild-run | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 0f1c7d7..d2eb8a6 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -293,7 +293,9 @@ def prepare_build(**kwargs):
     # regularly re-download files to check that their upstream
     # location is still correct.
     for i in range(0, 5):
-        flist = os.listdir(dldir)
+        # ignore directories
+        flist = [f for f in os.listdir(dldir)
+                 if os.path.isfile(os.path.join(dldir, f))]
         if not flist:
             break
         f = flist[randint(0, len(flist) - 1)]
-- 
2.11.0
