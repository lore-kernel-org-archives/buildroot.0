From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 Jul 2017 22:38:39 +0200
Subject: [Buildroot] [PATCHv3] support/tests: allow properly indented config
	fragment
Message-ID: <20170718203839.14913-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

---
Changes v2 -> v3:
  - use and fix code snippet provided by Arnout, thanks! ;-)
  - do it in our base test class, not on the builder class  (Arnout)

Changes v1 -> v2:
  - add example in commit log  (Thomas)
---
 support/testing/infra/basetest.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
index 1a082bb441..07c180e232 100644
--- a/support/testing/infra/basetest.py
+++ b/support/testing/infra/basetest.py
@@ -41,6 +41,7 @@ class BRTest(unittest.TestCase):
         self.testname = self.__class__.__name__
         self.builddir = self.outputdir and os.path.join(self.outputdir, self.testname)
         self.emulator = None
+        self.config = '\n'.join([line.lstrip() for line in self.config.splitlines()])
 
     def show_msg(self, msg):
         print "{} {:40s} {}".format(datetime.datetime.now().strftime("%H:%M:%S"),
-- 
2.11.0
