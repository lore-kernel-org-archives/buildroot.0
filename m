From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon, 28 Jan 2019 18:22:06 -0500
Subject: [Buildroot] [PATCH v3 2/5] testing/infra/basetest: support
 br2-external
In-Reply-To: <20190128232209.17485-1-aduskett@gmail.com>
References: <20190128232209.17485-1-aduskett@gmail.com>
Message-ID: <20190128232209.17485-3-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>

Some upcoming test cases can use one or more br2-external trees as fixtures
that provide packages used only in runtime tests.

Add support for br2-external into the BRTest class. Any test case can
then provide a list of paths for being used as br2-external trees during
the build of the image to test.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Daniel J. Leach <dleach@belcan.com>
Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
Changes v1 -> v3:
  - Added this patch to the series.

 support/testing/infra/basetest.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
index 5014fefafa..84139438bc 100644
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
2.20.1
