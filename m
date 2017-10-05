From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Thu,  5 Oct 2017 18:42:07 -0300
Subject: [Buildroot] [PATCH v2 1/6] support/testing: allow to indent ccache
	defconfig fragment
In-Reply-To: <20170929022713.2967-1-ricardo.martincoski@gmail.com>
References: <20170929022713.2967-1-ricardo.martincoski@gmail.com>
Message-ID: <20171005214212.27613-1-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
Changes v1 -> v2:
  - reorder patch 2 and 1 (suggested by Yann E. MORIN);
  - keep only the mechanism in this patch, merging the change to
    ccache defconfig fragment to the old patch 1, now patch 2 (suggested
    by Yann E. MORIN);
  - move the code that strips out leadings spaces to the builder class
    instead of to the setUp of BRTest;
  - add newline to jlevel handling to ensure it works fine even if the
    defconfig fragment does not end in a newline;
  - adapt commit message.

Number of warnings reported by flake8 for the test infra:
before: 132
after:  132
---
 support/testing/infra/basetest.py | 4 +---
 support/testing/infra/builder.py  | 3 ++-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
index 493dea5125..d6fcc619b1 100644
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
index 905b127c91..ef66b86113 100644
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
 
-- 
2.13.0
