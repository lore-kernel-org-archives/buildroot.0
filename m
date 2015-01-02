From: Francois Perrad <fperrad@gmail.com>
Date: Fri,  2 Jan 2015 09:49:32 +0100
Subject: [Buildroot] [PATCH 1/2] graph-depends: display virtual package with
	italic style
Message-ID: <1420188573-4236-1-git-send-email-francois.perrad@gadz.org>
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
 support/scripts/graph-depends | 34 +++++++++++++++++++++++++++++++++-
 2 files changed, 36 insertions(+), 1 deletion(-)

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
index 1ecfeda..fd94a3c 100755
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
@@ -256,6 +278,13 @@ def remove_extra_deps(deps):
             deps[pkg] = remove_transitive_deps(pkg,deps)
     return deps
 
+all_pkgs = {}
+for deps in dict_deps.values():
+    for dep in deps:
+        all_pkgs[dep] = True
+for dep in dict_deps.keys():
+    all_pkgs[dep] = True
+dict_version = get_version(all_pkgs.keys())
 dict_deps = remove_extra_deps(dict_deps)
 
 # Print the attributes of a node: label and fill-color
@@ -274,7 +303,10 @@ def print_attrs(pkg):
             color = host_colour
         else:
             color = target_colour
-    print("%s [label = \"%s\"]" % (name, label))
+    if dict_version[pkg] == "virtual":
+        print("%s [label = <<I>%s</I>>]" % (name, label))
+    else:
+        print("%s [label = \"%s\"]" % (name, label))
     print("%s [color=%s,style=filled]" % (name, color))
 
 # Print the dependency graph of a package
-- 
2.1.0
