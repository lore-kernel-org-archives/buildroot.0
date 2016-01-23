From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 23 Jan 2016 23:04:45 +0100
Subject: [Buildroot] [PATCH] support/graph-depends: detect circular
	dependencies
Message-ID: <1453586685-24190-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, if there is a circular dependency in the packages, the
graph-depends script just errors out with a Python RunteimError which is
not caught, resulting in a very-long backtrace which does not provide
any hint as what the real issue is (even if "RuntimeError: maximum
recursion depth exceeded" is a pretty good hint at it).

We fix that by recusrsing the dependency chain of each package, until we
either end up with a package with no dependency, or with a package
already seen along the current dependency chain.

We need to introduce a new function, check_circular_deps(), because we
can't re-use the existing ones:

  - remove_mandatory_deps() does not iterate,

  - remove_transitive_deps() does iterate, but we do not call it for the
    top-level package if it is not 'all'

  - it does not make sense to use those functions anyway, as they were
    not designed to _check_ but to _at_ on the dependency chain.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Samuel Martin <s.martin49@gmail.com>

---
Note: I'm not completely happy with the way the code detects the end of
the dependency chain, but at least it works and is a starting point for
further discussion. Python experts will happily point me in the right
direction! ;-)
---
 support/scripts/graph-depends | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index fd8ad2f..2a357d8 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -306,9 +306,32 @@ def remove_transitive_deps(pkg,deps):
 def remove_mandatory_deps(pkg,deps):
     return [p for p in deps[pkg] if p not in ['toolchain', 'skeleton']]
 
+# This function will check that there is no loop in the dependency chain
+# As a side effect, it builds up the dependency cache.
+def check_circular_deps(deps):
+    def recurse(pkg):
+        if not pkg in list(deps.keys()):
+            return
+        chain.append(pkg)
+        for p in deps[pkg]:
+            if p in chain:
+                sys.stderr.write("\nRecursion detected for  : %s\n" % (p))
+                while True:
+                    _p = chain.pop()
+                    sys.stderr.write("which is a dependency of: %s\n" % (_p))
+                    if p == _p:
+                        sys.exit(1)
+            recurse(p)
+        chain.pop()
+
+    chain = []
+    for pkg in list(deps.keys()):
+        recurse(pkg)
+
 # This functions trims down the dependency list of all packages.
 # It applies in sequence all the dependency-elimination methods.
 def remove_extra_deps(deps):
+    check_circular_deps(dict_deps)
     for pkg in list(deps.keys()):
         if not pkg == 'all':
             deps[pkg] = remove_mandatory_deps(pkg,deps)
-- 
1.9.1
