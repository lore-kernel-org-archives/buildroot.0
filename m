From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  7 Feb 2016 22:34:27 +0100
Subject: [Buildroot] [PATCH 4/6 v3] support/graph-depends: detect circular
	dependencies
In-Reply-To: <cover.1454880734.git.yann.morin.1998@free.fr>
References: <cover.1454880734.git.yann.morin.1998@free.fr>
Message-ID: <d99bf2cd9742fb5b63f9ecdc41322d10d2e2ba3e.1454880734.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, if there is a circular dependency in the packages, the
graph-depends script just errors out with a Python RuntimeError which is
not caught, resulting in a very-long backtrace which does not provide
any hint as what the real issue is (even if "RuntimeError: maximum
recursion depth exceeded" is a pretty good hint at it).

We fix that by recursing the dependency chain of each package, until we
either end up with a package with no dependency, or with a package
already seen along the current dependency chain.

We need to introduce a new function, check_circular_deps(), because we
can't re-use the existing ones:

  - remove_mandatory_deps() does not iterate,

  - remove_transitive_deps() does iterate, but we do not call it for the
    top-level package if it is not 'all'

  - it does not make sense to use those functions anyway, as they were
    not designed to _check_ but to _act_ on the dependency chain.

Since we've had time-related issues in the past, we do not want to
introduce yet another time-hog, so here are timings with the circular
dependency check:

    $ time python -m cProfile -s cumtime support/scripts/graph-depends
    [...]
             28352654 function calls (20323050 primitive calls) in 87.292 seconds

       Ordered by: cumulative time

       ncalls  tottime  percall  cumtime  percall filename:lineno(function)
            1    0.012    0.012   87.292   87.292 graph-depends:24(<module>)
           21    0.000    0.000   73.685    3.509 subprocess.py:473(_eintr_retry_call)
            7    0.000    0.000   73.655   10.522 subprocess.py:768(communicate)
            7   73.653   10.522   73.653   10.522 {method 'read' of 'file' objects}
          5/1    0.027    0.005   43.488   43.488 graph-depends:164(get_all_depends)
            5    0.003    0.001   43.458    8.692 graph-depends:135(get_depends)
            1    0.001    0.001   25.712   25.712 graph-depends:98(get_version)
            1    0.001    0.001   13.457   13.457 graph-depends:337(remove_extra_deps)
         1717    1.672    0.001   13.050    0.008 graph-depends:290(remove_transitive_deps)
    9784086/2672326    5.079    0.000   11.363    0.000 graph-depends:274(is_dep)
    2883343/1980154    2.650    0.000    6.942    0.000 graph-depends:262(is_dep_uncached)
            1    0.000    0.000    4.529    4.529 graph-depends:121(get_targets)
      2883343    1.123    0.000    1.851    0.000 graph-depends:246(is_dep_cache_insert)
      9784086    1.783    0.000    1.783    0.000 graph-depends:255(is_dep_cache_lookup)
      2881580    0.728    0.000    0.728    0.000 {method 'update' of 'dict' objects}
            1    0.001    0.001    0.405    0.405 graph-depends:311(check_circular_deps)
    12264/1717    0.290    0.000    0.404    0.000 graph-depends:312(recurse)
    [...]
    real    1m27.371s
    user    1m15.075s
    sys     0m12.673s

The cumulative time spent in check_circular_deps is just below 0.5s,
which is largely less than 1% of the total run time.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Samuel Martin <s.martin49@gmail.com>

---
Note: I'm not completely happy with the way the code detects the end of
the dependency chain, but at least it works and is a starting point for
further discussion. Python experts will happily point me in the right
direction! ;-)

---
Chamges v1 -> v2:
  - store packages known to not cause loops, to cut short on the
    visiting algorithm
  - use the local variable 'deps', not the global 'dict_deps'
  - add timing report
---
 support/scripts/graph-depends | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index 74ba995..ec32b20 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -313,6 +313,32 @@ def remove_transitive_deps(pkg,deps):
 def remove_mandatory_deps(pkg,deps):
     return [p for p in deps[pkg] if p not in ['toolchain', 'skeleton']]
 
+# This function will check that there is no loop in the dependency chain
+# As a side effect, it builds up the dependency cache.
+def check_circular_deps(deps):
+    def recurse(pkg):
+        if not pkg in list(deps.keys()):
+            return
+        if pkg in not_loop:
+            return
+        not_loop.append(pkg)
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
+    not_loop = []
+    chain = []
+    for pkg in list(deps.keys()):
+        recurse(pkg)
+
 # This functions trims down the dependency list of all packages.
 # It applies in sequence all the dependency-elimination methods.
 def remove_extra_deps(deps):
@@ -324,6 +350,7 @@ def remove_extra_deps(deps):
             deps[pkg] = remove_transitive_deps(pkg,deps)
     return deps
 
+check_circular_deps(dict_deps)
 dict_deps = remove_extra_deps(dict_deps)
 dict_version = get_version([pkg for pkg in allpkgs
                                 if pkg != "all" and not pkg.startswith("root")])
-- 
1.9.1
