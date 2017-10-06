From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 6 Oct 2017 18:53:13 +0200
Subject: [Buildroot] [git commit] support/testing: allow to indent ccache
	defconfig fragment
Message-ID: <20171006165925.76F9580489@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4a1d220d9eeebd8394a190c4d82a00139c4baa51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Move the strip out of leading spaces in defconfig fragments from the
BRTest class to the Builder class. It actually postpones the strip out,
consequentially allowing test cases to post-process the defconfig in
their own __init__ before calling the __init__ method from BRTest.

Moving this code to the Builder class also allows any new test class
that inherits from BRTest to reuse the same code even if the new class
overrides the setUp method.

At same time, prepend a newline to the jlevel handling otherwise it
would stop working for defconfig fragments that don't end in a newline.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/testing/infra/basetest.py | 4 +---
 support/testing/infra/builder.py  | 3 ++-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
index 493dea5..d6fcc61 100644
--- a/support/testing/infra/basetest.py
+++ b/support/testing/infra/basetest.py
@@ -42,9 +42,7 @@ class BRTest(unittest.TestCase):
         self.testname = self.__class__.__name__
         self.builddir = self.outputdir and os.path.join(self.outputdir, self.testname)
         self.emulator = None
-        self.config = '\n'.join([line.lstrip() for line in
-                                 self.config.splitlines()]) + '\n'
-        self.config += "BR2_JLEVEL={}\n".format(self.jlevel)
+        self.config += "\nBR2_JLEVEL={}\n".format(self.jlevel)
 
     def show_msg(self, msg):
         print "{} {:40s} {}".format(datetime.datetime.now().strftime("%H:%M:%S"),
diff --git a/support/testing/infra/builder.py b/support/testing/infra/builder.py
index 905b127..ef66b86 100644
--- a/support/testing/infra/builder.py
+++ b/support/testing/infra/builder.py
@@ -6,7 +6,8 @@ import infra
 
 class Builder(object):
     def __init__(self, config, builddir, logtofile):
-        self.config = config
+        self.config = '\n'.join([line.lstrip() for line in
+                                 config.splitlines()]) + '\n'
         self.builddir = builddir
         self.logfile = infra.open_log_file(builddir, "build", logtofile)
 
