From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Jul 2017 23:46:09 +0200
Subject: [Buildroot] [git commit] support/tests: allow properly indented
	config fragment
Message-ID: <20170718214252.54A9781979@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cf3cd4388a652c9af27ef1c35622e2d0a55b99a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, defining a config fragment in the runtime test infra requires
that the fragment not to be indented. This is beark, and causes grievance
when looking at the code (e.g. to fix it).

Just strip out all leading spaces/tabs when writing the configuration
lines into the config file, allowing in-line indented config fragments,
like so:

    class TestFoo(bla):
        config = bla.config + \
            """
            FOO=y
            # BAR is not set
            """

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/testing/infra/basetest.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
index 1a082bb..07c180e 100644
--- a/support/testing/infra/basetest.py
+++ b/support/testing/infra/basetest.py
@@ -41,6 +41,7 @@ class BRTest(unittest.TestCase):
         self.testname = self.__class__.__name__
         self.builddir = self.outputdir and os.path.join(self.outputdir, self.testname)
         self.emulator = None
+        self.config = '\n'.join([line.lstrip() for line in self.config.splitlines()])
 
     def show_msg(self, msg):
         print "{} {:40s} {}".format(datetime.datetime.now().strftime("%H:%M:%S"),
