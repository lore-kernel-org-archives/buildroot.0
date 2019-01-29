From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 29 Jan 2019 22:16:33 +0100
Subject: [Buildroot] [git commit] support/testing/infra/basetest: support
 br2-external
Message-ID: <20190129215346.CF97882285@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4d5d0124c795a4269e9ae81efcdd1a121dd2f739
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some upcoming test cases can use one or more br2-external trees as
fixtures that provide packages used only in runtime tests.

Add support for br2-external into the BRTest class. Any test case can
then provide a list of paths for being used as br2-external trees
during the build of the image to test.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Daniel J. Leach <dleach@belcan.com>
Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Tested-by: Matthew Weber <matthew.weber@rockwellcollins.com>
[Thomas: use named argument for make_extra_opts.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/infra/basetest.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
index 5014fefafa..e67bf1af23 100644
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
+            self.b.configure(make_extra_opts=["BR2_EXTERNAL={}".format(":".join(self.br2_external))])
             self.b.build()
             self.show_msg("Building done")
 
