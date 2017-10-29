From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 29 Oct 2017 12:06:04 -0200
Subject: [Buildroot] [PATCH v3 5/9] testing/infra/basetest: support
	br2-external
In-Reply-To: <20171029140608.26200-1-ricardo.martincoski@datacom.ind.br>
References: <20171029140608.26200-1-ricardo.martincoski@datacom.ind.br>
Message-ID: <20171029140608.26200-6-ricardo.martincoski@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This change will be needed when adding a common class to test the git
download infra.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
Changes v2 -> v3:
  - new patch
  - search for "support for BR2_EXTERNAL directly in BRTest" in
    http://patchwork.ozlabs.org/patch/806161/
---
 support/testing/infra/basetest.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
index 4773312585..641f1961f2 100644
--- a/support/testing/infra/basetest.py
+++ b/support/testing/infra/basetest.py
@@ -29,6 +29,7 @@ MINIMAL_CONFIG = \
 
 class BRTest(unittest.TestCase):
     config = None
+    br2_external = None
     downloaddir = None
     outputdir = None
     logtofile = True
@@ -55,7 +56,10 @@ class BRTest(unittest.TestCase):
             self.b.delete()
 
         if not self.b.is_finished():
-            self.b.configure()
+            if self.br2_external is None:
+                self.b.configure()
+            else:
+                self.b.configure(["BR2_EXTERNAL={}".format(self.br2_external)])
 
     def tearDown(self):
         self.show_msg("Cleaning up")
-- 
2.14.2
