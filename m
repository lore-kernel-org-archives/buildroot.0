From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 10 Jul 2017 01:21:20 +0200
Subject: [Buildroot] [PATCH 4/7] support/testing: move BRTest initialisation
	to __init__
In-Reply-To: <20170709232123.30120-1-arnout@mind.be>
References: <20170709232123.30120-1-arnout@mind.be>
Message-ID: <20170709232123.30120-5-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BRTest's setUp() method contains a few assignments that initialize its
member variables. Since we will want to use these in test case
overrides, move them to the __init__ function.

Also allow the config member to be overridden, rather than always
taking the class member.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/testing/infra/basetest.py | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
index d75458a02c..2a5c9ec939 100644
--- a/support/testing/infra/basetest.py
+++ b/support/testing/infra/basetest.py
@@ -36,15 +36,18 @@ class BRTest(unittest.TestCase):
     keepbuilds = False
     jlevel = None
 
+    def __init__(self, names):
+        super(BRTest, self).__init__(names)
+        self.testname = self.__class__.__name__
+        self.builddir = os.path.join(self.__class__.outputdir, self.testname)
+        self.emulator = None
+
     def show_msg(self, msg):
         print "{} {:40s} {}".format(datetime.datetime.now().strftime("%H:%M:%S"),
                                     self.testname, msg)
     def setUp(self):
-        self.testname = self.__class__.__name__
-        self.builddir = os.path.join(self.__class__.outputdir, self.testname)
-        self.emulator = None
         self.show_msg("Starting")
-        config = self.__class__.config
+        config = self.config
         if self.jlevel:
             config += "BR2_JLEVEL={}\n".format(self.jlevel)
         self.b = Builder(config, self.builddir, self.logtofile)
-- 
2.13.2
