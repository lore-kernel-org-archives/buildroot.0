From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 27 Nov 2015 23:39:09 +0100
Subject: [Buildroot] [PATCH 2/7 v3] autobuild: store PID to PID file
In-Reply-To: <cover.1448663846.git.yann.morin.1998@free.fr>
References: <cover.1448663846.git.yann.morin.1998@free.fr>
Message-ID: <f019be8cc9f667ab1cc5fc03dbce926482790945.1448663846.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Let the autobuild script store its own PID file, rather than retrieve it
from the init script.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 scripts/autobuild-run | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index db60f5c..397c770 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -65,6 +65,7 @@ defaults = {
     '--submitter': 'N/A',
     '--make-opts': '',
     '--nice': 0,
+    '--pid-file': '/tmp/buildroot-autobuild.pid',
 }
 
 doc = """autobuild-run - run Buildroot autobuilder
@@ -92,6 +93,8 @@ Options:
   --make-opts OPTSTRING          string of extra options to pass to Buildroot
                                  make, such as specific command wrappers
                                  Empty by default.
+  --pid-file PATH                path to a file where to store the PID
+                                 Defaults to %(--pid-file)s.
   -c, --config CONFIG            path to configuration file
                                  Not set by default.
 
@@ -807,6 +810,10 @@ def main():
     # load in defaults at lowest priority
     args = merge(args, defaults)
 
+    # Save our PID very early, so we can be stopped
+    with open(args['--pid-file'], "w+") as pidf:
+        pidf.write("%d" % os.getpid())
+
     # http_login/password could theoretically be allowed as empty, so check
     # explicitly on None.
     upload = (args['--http-login'] is not None) \
-- 
1.9.1
