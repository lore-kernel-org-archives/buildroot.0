From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  3 Jun 2018 00:19:33 +0200
Subject: [Buildroot] [PATCH 3/4] support/testing: fix python syntax
In-Reply-To: <cover.1527977964.git.yann.morin.1998@free.fr>
References: <cover.1527977964.git.yann.morin.1998@free.fr>
Message-ID: <141e1e33fdf6b4601677642ab64e7d76969ca96a.1527977964.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We're about to switch to using the flake8 from the distro, and that one
uncovers two more issues that the previously used pip-provided one did
not catch:

  - 'print' is now a function,
  - exceptions need to be caught-assigned with the 'as' keyword,

Additionally, old-style "%s"%() formatting is deprecated.

Fix those three issues.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 support/testing/infra/__init__.py | 6 +++---
 support/testing/infra/basetest.py | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/support/testing/infra/__init__.py b/support/testing/infra/__init__.py
index b03e891771..a9352a652b 100644
--- a/support/testing/infra/__init__.py
+++ b/support/testing/infra/__init__.py
@@ -34,17 +34,17 @@ def download(dldir, filename):
         os.makedirs(dldir)
 
     tmpfile = tempfile.mktemp(dir=dldir)
-    print "Downloading to {}".format(tmpfile)
+    print("Downloading to {}".format(tmpfile))
 
     try:
         url_fh = urlopen(os.path.join(ARTIFACTS_URL, filename))
         with open(tmpfile, "w+") as tmpfile_fh:
             tmpfile_fh.write(url_fh.read())
-    except (HTTPError, URLError), err:
+    except (HTTPError, URLError) as err:
         os.unlink(tmpfile)
         raise err
 
-    print "Renaming from %s to %s" % (tmpfile, finalpath)
+    print("Renaming from {0} to {1}".format(tmpfile, finalpath))
     os.rename(tmpfile, finalpath)
     return finalpath
 
diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
index f3f13ad97f..5014fefafa 100644
--- a/support/testing/infra/basetest.py
+++ b/support/testing/infra/basetest.py
@@ -46,8 +46,8 @@ class BRTest(unittest.TestCase):
         self.config += "\nBR2_JLEVEL={}\n".format(self.jlevel)
 
     def show_msg(self, msg):
-        print "{} {:40s} {}".format(datetime.datetime.now().strftime("%H:%M:%S"),
-                                    self.testname, msg)
+        print("{} {:40s} {}".format(datetime.datetime.now().strftime("%H:%M:%S"),
+                                    self.testname, msg))
 
     def setUp(self):
         self.show_msg("Starting")
-- 
2.14.1
