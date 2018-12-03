From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Date: Mon,  3 Dec 2018 20:54:30 +0300
Subject: [Buildroot] [PATCH] utils/genrandconfig: Add level 2 optimization
 option
Message-ID: <20181203175430.24360-1-Evgeniy.Didin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently all random defconfigs which are used in autobuilder 
use size optimizaion(-Os).
Adding "-O2" optimization will give better test coverage.
In many cases software gets built with speed optimization rather 
than size optimization. So let's add Level 2 optimizaion option 
to be genertated in random defconfigs, so we could be able to test
how packages are built with "-O2" in autobuilder.

Signed-off-by: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: arc-buildroot at synopsys.com
---
 utils/genrandconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 1d6ff990f5..35c7cbd14c 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -366,6 +366,8 @@ def gen_config(args):
         configlines.append("BR2_STATIC_LIBS=y\n")
     if randint(0, 20) == 0:
         configlines.append("BR2_PACKAGE_PYTHON_PY_ONLY=y\n")
+    if randint(0,5) == 0:
+	configlines.append("BR2_OPTIMIZE_2=y\n")
 
     # Write out the configuration file
     if not os.path.exists(args.outputdir):
-- 
2.16.2
