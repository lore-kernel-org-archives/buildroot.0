From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 12 Apr 2015 16:34:44 +0200
Subject: [Buildroot] [autobuild 3/4] autobuild-run: sanitize make options
In-Reply-To: <1428849285-21092-1-git-send-email-s.martin49@gmail.com>
References: <1428849285-21092-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1428849285-21092-3-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

So far, --make-opts allows the user to override any make option or
variable, especially '-C' and 'O=' which should not in the autobuild
context.

So, this change drop '-C' option and 'O=' and 'BR2_JLEVEL=' variables
from the --make-opts arguments.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 scripts/autobuild-run | 37 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index a7cdc12..dbfc33e 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -773,6 +773,40 @@ def merge(dict_1, dict_2):
     return dict((str(key), dict_1.get(key) or dict_2.get(key))
                 for key in set(dict_2) | set(dict_1))
 
+def sanitize_make_opts(make_opts):
+    """ sanitize make options
+
+    - do not allow to override '-C' option
+    - do not allow to user deifined 'O=' and 'BR2_JLEVEL='
+    - print log when overloading 'BR2_DL_DIR='
+
+    Return the sanitized make options string.
+    """
+    make_opts = make_opts.split(" ")
+    for i, arg in enumerate(make_opts):
+        if arg.startswith("-C"):
+            # remove both '-C<path>' and '-C' arguments
+            warn = "WARN: sanitizing make-opts (removing arguments '%s" % arg
+            make_opts.remove(arg)
+            if arg == '-C':
+                # remove '<path>' in case of '-C <path>'
+                # (no need for incrementing i since make_opts[i] already points
+                # to '<path>' after arg (i.e. '-C') has been removed
+                warn += " %s" % make_opts[i]
+                make_opts.remove(make_opts[i])
+            warn += "')"
+            print(warn)
+        elif "=" in arg:
+            var = arg.split("=", 1)[0]
+            if var in ("BR2_DL_DIR",):
+                print("INFO: using user defined '%s' (%s)" % (var, arg))
+            elif var in ("BR2_JLEVEL", "O",):
+                warn = "WARN: sanitizing make variable (removing arguments '%s')" % arg
+                make_opts.remove(arg)
+                print(warn)
+    return " ".join(make_opts)
+
+
 def main():
 
     # Avoid locale settings of autobuilder machine leaking in, for example
@@ -833,6 +867,7 @@ def main():
         sys.exit(1)
 
     buildpid = multiprocessing.Array('i', int(args['--ninstances']))
+    make_opts = sanitize_make_opts(args['--make-opts'])
     processes = []
     for i in range(0, int(args['--ninstances'])):
         p = multiprocessing.Process(target=run_instance, kwargs=dict(
@@ -842,7 +877,7 @@ def main():
                 http_login = args['--http-login'],
                 http_password = args['--http-password'],
                 submitter = args['--submitter'],
-                make_opts = args['--make-opts'],
+                make_opts = make_opts,
                 upload = upload,
                 buildpid = buildpid
             ))
-- 
2.3.5
