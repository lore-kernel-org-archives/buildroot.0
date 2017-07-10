From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Jul 2017 23:51:33 +0200
Subject: [Buildroot] [git commit] support/testing: unbreak run-tests -l
Message-ID: <20170710214801.C18E3807B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=704db1586c1408106e1337bc7a2ab3cfec593899
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit b78b50465c20c1733753a8dd47945cf80c9155f8, the initialisation
of BRTest.builddir was moved to the __init__ function. However, it is
set based on BRTest.outputdir and that is only set when the -o argument
is given to run-tests. When called as "run-tests -l", there is no -o
argument so BRTest.outputdir remains unset.

To fix, keep BRTest.builddir at None when BRTest.outputdir is None.

While we're at it, drop the direct access to the class member. If a
subclass wishes to set outputdir to something else before calling
BRTest.__init__, they are free to do so.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reported-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/testing/infra/basetest.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
index 2a5c9ec..1a082bb 100644
--- a/support/testing/infra/basetest.py
+++ b/support/testing/infra/basetest.py
@@ -39,7 +39,7 @@ class BRTest(unittest.TestCase):
     def __init__(self, names):
         super(BRTest, self).__init__(names)
         self.testname = self.__class__.__name__
-        self.builddir = os.path.join(self.__class__.outputdir, self.testname)
+        self.builddir = self.outputdir and os.path.join(self.outputdir, self.testname)
         self.emulator = None
 
     def show_msg(self, msg):
