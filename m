From: Matt Weber <Matthew.Weber@collins.com>
Date: Mon,  3 Dec 2018 22:08:47 -0600
Subject: [Buildroot] [PATCH v5 4/7] testing/infra/basetest: support
 br2-external
In-Reply-To: <1543896530-33550-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1543896530-33550-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1543896530-33550-4-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>

Some upcoming test cases can use one or more br2-external trees as
fixtures that provide packages used only in runtime tests.

Add support for br2-external into the BRTest class. Any test case can
then provide a list of paths for be used as br2-external trees during
the build of the image to be tested.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
Changes
v2
 - New from: http://patchwork.ozlabs.org/patch/912354/

v2 -> v3
[Ricardo
 - Updated patch commit description context.

v4
 - None

v5
 - Rebased post 2018.11 on master
---
 support/testing/infra/basetest.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
index 5014fef..8413943 100644
--- a/support/testing/infra/basetest.py
+++ b/support/testing/infra/basetest.py
@@ -30,6 +30,7 @@ MINIMAL_CONFIG = \
 
 class BRTest(unittest.TestCase):
     config = None
+    br2_external = list()
     downloaddir = None
     outputdir = None
     logtofile = True
@@ -58,7 +59,7 @@ class BRTest(unittest.TestCase):
 
         if not self.b.is_finished():
             self.show_msg("Building")
-            self.b.configure()
+            self.b.configure(["BR2_EXTERNAL={}".format(":".join(self.br2_external))])
             self.b.build()
             self.show_msg("Building done")
 
-- 
1.9.1
