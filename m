From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  3 Jan 2015 15:29:12 +0100
Subject: [Buildroot] [V2 1/2] graph-depends: display virtual package with
	italic style
Message-ID: <1420295353-8065-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

virtual packages are found by their version,
so we retrieve the version of all packages

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/pkg-generic.mk        |  3 +++
 support/scripts/graph-depends | 30 +++++++++++++++++++++++++++++-
 2 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 9643a30..87d8dd8 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -565,6 +565,9 @@ $(1)-rsync:		$$($(2)_TARGET_RSYNC)
 $(1)-source:		$$($(2)_TARGET_RSYNC_SOURCE)
 endif
 
+$(1)-show-version:
+			@echo $$($(2)_VERSION)
+
 $(1)-show-depends:
 			@echo $$($(2)_FINAL_DEPENDENCIES)
 
diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index 1ecfeda..28fe2f0 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -76,6 +76,28 @@ host_colour = colours[2]
 
 allpkgs = []
 
+# Execute the "make <pkg>-show-version" command to get the version of a given
+# list of packages, and return the version formatted as a Python dictionary.
+def get_version(pkgs):
+    sys.stderr.write("Getting version for %s\n" % pkgs)
+    cmd = ["make", "-s", "--no-print-directory" ]
+    for pkg in pkgs:
+        cmd.append("%s-show-version" % pkg)
+    p = subprocess.Popen(cmd, stdout=subprocess.PIPE, universal_newlines=True)
+    output = p.communicate()[0]
+    if p.returncode != 0:
+        sys.stderr.write("Error getting version %s\n" % pkgs)
+        sys.exit(1)
+    output = output.split("\n")
+    if len(output) != len(pkgs) + 1:
+        sys.stderr.write("Error getting version\n")
+        sys.exit(1)
+    version = {}
+    for i in range(0, len(pkgs)):
+        pkg = pkgs[i]
+        version[pkg] = output[i]
+    return version
+
 # Execute the "make show-targets" command to get the list of the main
 # Buildroot TARGETS and return it formatted as a Python list. This
 # list is used as the starting point for full dependency graphs
@@ -257,6 +279,8 @@ def remove_extra_deps(deps):
     return deps
 
 dict_deps = remove_extra_deps(dict_deps)
+dict_version = get_version([pkg for pkg in allpkgs
+                                if pkg != "all" and not pkg.startswith("root")])
 
 # Print the attributes of a node: label and fill-color
 def print_attrs(pkg):
@@ -274,7 +298,11 @@ def print_attrs(pkg):
             color = host_colour
         else:
             color = target_colour
-    print("%s [label = \"%s\"]" % (name, label))
+    version = dict_version.get(pkg)
+    if version == "virtual":
+        print("%s [label = <<I>%s</I>>]" % (name, label))
+    else:
+        print("%s [label = \"%s\"]" % (name, label))
     print("%s [color=%s,style=filled]" % (name, color))
 
 # Print the dependency graph of a package
-- 
2.1.0
