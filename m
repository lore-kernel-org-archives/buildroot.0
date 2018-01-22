From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 21 Jan 2018 22:44:36 -0200
Subject: [Buildroot] [PATCH 08/14] diffconfig: fix code style
In-Reply-To: <1516581882-30582-1-git-send-email-ricardo.martincoski@gmail.com>
References: <1516581882-30582-1-git-send-email-ricardo.martincoski@gmail.com>
Message-ID: <1516581882-30582-9-git-send-email-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix these warnings:
E225 missing whitespace around operator
E231 missing whitespace after ','
E302 expected 2 blank lines, found 1
E305 expected 2 blank lines after class or function definition, found 1
E401 multiple imports on one line

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 utils/diffconfig | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/utils/diffconfig b/utils/diffconfig
index 5862a62..c8cd04c 100755
--- a/utils/diffconfig
+++ b/utils/diffconfig
@@ -8,7 +8,9 @@
 # Adapted to Buildroot 2017 by Marcus Folkesson
 #
 
-import sys, os
+import sys
+import os
+
 
 def usage():
     print("""Usage: diffconfig [-h] [-m] [<config1> <config2>]
@@ -40,6 +42,7 @@ Example usage:
 """)
     sys.exit(0)
 
+
 # returns a dictionary of name/value pairs for config items in the file
 def readconfig(config_file):
     d = {}
@@ -52,23 +55,25 @@ def readconfig(config_file):
             d[line[6:-11]] = "n"
     return d
 
+
 def print_config(op, config, value, new_value):
     global merge_style
 
     if merge_style:
         if new_value:
-            if new_value=="n":
+            if new_value == "n":
                 print("# BR2_%s is not set" % config)
             else:
                 print("BR2_%s=%s" % (config, new_value))
     else:
-        if op=="-":
+        if op == "-":
             print("-%s %s" % (config, value))
-        elif op=="+":
+        elif op == "+":
             print("+%s %s" % (config, new_value))
         else:
             print(" %s %s -> %s" % (config, value, new_value))
 
+
 def main():
     global merge_style
 
@@ -82,15 +87,15 @@ def main():
         sys.argv.remove("-m")
 
     argc = len(sys.argv)
-    if not (argc==1 or argc == 3):
+    if not (argc == 1 or argc == 3):
         print("Error: incorrect number of arguments or unrecognized option")
         usage()
 
     if argc == 1:
         # if no filenames given, assume .config and .config.old
-        build_dir=""
+        build_dir = ""
         if "KBUILD_OUTPUT" in os.environ:
-            build_dir = os.environ["KBUILD_OUTPUT"]+"/"
+            build_dir = os.environ["KBUILD_OUTPUT"] + "/"
         configa_filename = build_dir + ".config.old"
         configb_filename = build_dir + ".config"
     else:
@@ -102,7 +107,7 @@ def main():
         b = readconfig(open(configb_filename))
     except (IOError):
         e = sys.exc_info()[1]
-        print("I/O error[%s]: %s\n" % (e.args[0],e.args[1]))
+        print("I/O error[%s]: %s\n" % (e.args[0], e.args[1]))
         usage()
 
     # print items in a but not b (accumulate, sort and print)
@@ -133,4 +138,5 @@ def main():
     for config in new:
         print_config("+", config, None, b[config])
 
+
 main()
-- 
2.7.4
