From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Jul 2017 17:50:52 +0200
Subject: [Buildroot] [git commit] support/testing: fix run-tests -j
Message-ID: <20170724154703.554558057D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=78c89586191d6b2f9bfefcd1a75cc0f3c0a7d43d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit cf3cd4388a652c9af27ef1c35622e2d0a55b99a9 the -j option is
silently ignored.

The configuration lines are processed using '\n'.join().
This function adds intervening occurrences of the separator, but the
resulting string does not end at a separator.
 >>> "n".join(["a","b"])
 'anb'
It results in a defconfig that does not end in a newline.

When BR2_JLEVEL is added by -j logic to the defconfig it ends up
concatenated to the last line of the defconfig.
 BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM=yBR2_JLEVEL=7
The resulting .config has the default BR2_JLEVEL=0.

Instead of just workaround this problem by adding a newline before
BR2_JLEVEL when -j is used, make the defconfig to end in a newline since
it is a more future-proof solution.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/testing/infra/basetest.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
index 07c180e..29e7872 100644
--- a/support/testing/infra/basetest.py
+++ b/support/testing/infra/basetest.py
@@ -41,7 +41,8 @@ class BRTest(unittest.TestCase):
         self.testname = self.__class__.__name__
         self.builddir = self.outputdir and os.path.join(self.outputdir, self.testname)
         self.emulator = None
-        self.config = '\n'.join([line.lstrip() for line in self.config.splitlines()])
+        self.config = '\n'.join([line.lstrip() for line in
+                                 self.config.splitlines()]) + '\n'
 
     def show_msg(self, msg):
         print "{} {:40s} {}".format(datetime.datetime.now().strftime("%H:%M:%S"),
