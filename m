From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Dec 2015 23:26:22 +0100
Subject: [Buildroot] [git commit] graph-depends: optimize
	remove_transitive_deps()
Message-ID: <20151229222734.A219F826ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5ed60cee1ed5f8a8e93866fc9db9ff890184afce
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For large configurations, the execution time of
remove_transitive_deps() becomes really high, due to the number of
nested loops + the is_dep() function being recursive.

For an allyespackageconfig, the remove_extra_deps() function takes 334
seconds to execute, and the overall time to generate the .dot file is
6 minutes and 39 seconds. Here is a timing of the different
graph-depends steps and the overall execution time:

  Getting dependencies:   42.5735 seconds
  Turn deps into a dict:   0.0023 seconds
  Remove extra deps:     334.1542 seconds
  Get version:            22.4919 seconds
  Generate .dot:           0.0197 seconds

  real	6m39.289s
  user	6m16.644s
  sys	0m8.792s

By adding a very simple cache for the results of is_dep(), we bring
down the execution time of the "Remove extra deps" step from 334
seconds to just 4 seconds, reducing the overall execution time to 1
minutes and 10 seconds:

  Getting dependencies:  42.9546 seconds
  Turn deps into a dict:  0.0025 seconds
  Remove extra deps:      4.9643 seconds
  Get version:           22.1865 seconds
  Generate .dot:          0.0207 seconds

  real	1m10.201s
  user	0m47.716s
  sys	0m7.948s

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
[yann.morin.1998 at free.fr:
  - rename is_dep() to is_dep_uncached(), keep existig code as-is
  - add is_dep() as a cached-version of is_dep_uncached()
  - use constructs more conform with 2to3
  - use exceptions (EAFP) rather than check-before-use (LBYL) to be more
    pythonist; that even decreases the duration yet a little bit more!
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/scripts/graph-depends | 34 ++++++++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index 5f77038..e91c9c5 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -237,18 +237,48 @@ for dep in dependencies:
         dict_deps[dep[0]] = []
     dict_deps[dep[0]].append(dep[1])
 
+# Basic cache for the results of the is_dep() function, in order to
+# optimize the execution time. The cache is a dict of dict of boolean
+# values. The key to the primary dict is "pkg", and the key of the
+# sub-dicts is "pkg2".
+is_dep_cache = {}
+
+def is_dep_cache_insert(pkg, pkg2, val):
+    try:
+        is_dep_cache[pkg].update({pkg2: val})
+    except KeyError:
+        is_dep_cache[pkg] = {pkg2: val}
+
+# Retrieves from the cache whether pkg2 is a transitive dependency
+# of pkg.
+# Note: raises a KeyError exception if the dependency is not known.
+def is_dep_cache_lookup(pkg, pkg2):
+    return is_dep_cache[pkg][pkg2]
+
 # This function return True if pkg is a dependency (direct or
 # transitive) of pkg2, dependencies being listed in the deps
 # dictionary. Returns False otherwise.
-def is_dep(pkg,pkg2,deps):
-    if pkg2 in deps:
+# This is the un-cached version.
+def is_dep_uncached(pkg,pkg2,deps):
+    try:
         for p in deps[pkg2]:
             if pkg == p:
                 return True
             if is_dep(pkg,p,deps):
                 return True
+    except KeyError:
+        pass
     return False
 
+# See is_dep_full() above; this is the cached version.
+def is_dep(pkg,pkg2,deps):
+    try:
+        return is_dep_cache_lookup(pkg, pkg2)
+    except KeyError:
+        val = is_dep_uncached(pkg, pkg2, deps)
+        is_dep_cache_insert(pkg, pkg2, val)
+        return val
+
 # This function eliminates transitive dependencies; for example, given
 # these dependency chain: A->{B,C} and B->{C}, the A->{C} dependency is
 # already covered by B->{C}, so C is a transitive dependency of A, via B.
