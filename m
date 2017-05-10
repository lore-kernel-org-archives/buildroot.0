From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 May 2017 23:42:13 +0200
Subject: [Buildroot] [git commit] support/testing: show messages in a more
	readable format
Message-ID: <20170510214233.7500E8215B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=08151c6aec559b68c0991dadf0147673cbae851f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently messages from run-tests are quite unpleasant:

[br-tests/TestPostScripts/2017-05-09 15:51:57] Building
[br-tests/TestPostScripts/2017-05-09 15:52:23] Building done
[br-tests/TestPostScripts/2017-05-09 15:52:23] Cleaning up
.[br-tests/TestNoTimezone/2017-05-09 15:52:23] Starting
[br-tests/TestNoTimezone/2017-05-09 15:52:23] Building
[br-tests/TestNoTimezone/2017-05-09 15:53:17] Building done
[br-tests/TestNoTimezone/2017-05-09 15:53:22] Cleaning up
.[br-tests/TestGlibcNonDefaultLimitedTimezone/2017-05-09 15:53:22] Starting
[br-tests/TestGlibcNonDefaultLimitedTimezone/2017-05-09 15:53:22] Building
[br-tests/TestGlibcNonDefaultLimitedTimezone/2017-05-09 15:54:33] Building done
[br-tests/TestGlibcNonDefaultLimitedTimezone/2017-05-09 15:54:37] Cleaning up
[...]

Change them in a more readable way by removing the date and using a
columnar style:

15:12:22 TestPostScripts                          Starting
15:12:25 TestPostScripts                          Building
15:12:48 TestPostScripts                          Building done
15:12:48 TestPostScripts                          Cleaning up
.15:12:48 TestNoTimezone                           Starting
15:12:54 TestNoTimezone                           Building
15:13:44 TestNoTimezone                           Building done
15:13:49 TestNoTimezone                           Cleaning up
.15:13:49 TestGlibcNonDefaultLimitedTimezone       Starting
15:14:00 TestGlibcNonDefaultLimitedTimezone       Building
15:14:56 TestGlibcNonDefaultLimitedTimezone       Building done
15:15:01 TestGlibcNonDefaultLimitedTimezone       Cleaning up
[...]

Note the '.' and other characters presented by nose2 are still
printed. They are not affected by this change.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/testing/infra/basetest.py | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
index eb9da90..cb5d210 100644
--- a/support/testing/infra/basetest.py
+++ b/support/testing/infra/basetest.py
@@ -36,10 +36,8 @@ class BRTest(unittest.TestCase):
     keepbuilds = False
 
     def show_msg(self, msg):
-        print "[%s/%s/%s] %s" % (os.path.basename(self.__class__.outputdir),
-                                 self.testname,
-                                 datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
-                                 msg)
+        print "{} {:40s} {}".format(datetime.datetime.now().strftime("%H:%M:%S"),
+                                    self.testname, msg)
     def setUp(self):
         self.testname = self.__class__.__name__
         self.builddir = os.path.join(self.__class__.outputdir, self.testname)
