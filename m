From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Jul 2017 17:51:06 +0200
Subject: [Buildroot] [git commit] testing/infra/basetest: move jlevel logic
	to constructor
Message-ID: <20170724154703.77C9E806B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b6bbb0782a13e49c43199a335bc51447b78f62d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As suggested by Arnout in [1].

While at it, simplify the logic by always appending the BR2_JLEVEL and
defaulting to 0 (the value copied from Config.in is used for 5 years now
and is very unlikely to change).

[1] http://patchwork.ozlabs.org/patch/790525/

Suggested-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/testing/infra/basetest.py | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
index 29e7872..431605b 100644
--- a/support/testing/infra/basetest.py
+++ b/support/testing/infra/basetest.py
@@ -34,7 +34,7 @@ class BRTest(unittest.TestCase):
     outputdir = None
     logtofile = True
     keepbuilds = False
-    jlevel = None
+    jlevel = 0
 
     def __init__(self, names):
         super(BRTest, self).__init__(names)
@@ -43,16 +43,14 @@ class BRTest(unittest.TestCase):
         self.emulator = None
         self.config = '\n'.join([line.lstrip() for line in
                                  self.config.splitlines()]) + '\n'
+        self.config += "BR2_JLEVEL={}\n".format(self.jlevel)
 
     def show_msg(self, msg):
         print "{} {:40s} {}".format(datetime.datetime.now().strftime("%H:%M:%S"),
                                     self.testname, msg)
     def setUp(self):
         self.show_msg("Starting")
-        config = self.config
-        if self.jlevel:
-            config += "BR2_JLEVEL={}\n".format(self.jlevel)
-        self.b = Builder(config, self.builddir, self.logtofile)
+        self.b = Builder(self.config, self.builddir, self.logtofile)
 
         if not self.keepbuilds:
             self.b.delete()
