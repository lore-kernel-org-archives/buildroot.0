From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 21 Apr 2018 11:10:50 +0200
Subject: [Buildroot] [PATCH 1/7] support/graph-depends: ensure all packages
 get graphed
In-Reply-To: <cover.1524301847.git.yann.morin.1998@free.fr>
References: <cover.1524301847.git.yann.morin.1998@free.fr>
Message-ID: <a240856bd5f15f9cfe2822d9cd1ece5948cd21c2.1524301847.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When a package:
  - has no dependency,
  - is not a first-level target,
  - is a cut-off point,

then this package is omitted from the dependency graph.

We currently have no such package, but the next commit will make
host-skeleton, which already matches the first two conditions, a cut-off
point too, and thus host-skeleton would not appear on the graph.

To ensure that all packages, whatever their conditions, are displayed,
we add them as a dependency of 'all'.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/graph-depends | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index 621e603278..6ce90d872c 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -391,6 +391,15 @@ def main():
         deps = get_all_depends(filtered_targets, get_depends_func)
         if deps is not None:
             dependencies += deps
+            # 'all' depends on everything, so add any newly discovered
+            # package. d[0] was a target, above, or a d[1] of another
+            # tuple, so it's already in the list.
+            for d in deps:
+                if d[1] in TARGET_EXCEPTIONS:
+                    continue
+                if ('all', d[1]) in dependencies:
+                    continue
+                dependencies.append(('all', d[1]))
         rootpkg = 'all'
 
     # In pkg mode, start directly with get_all_depends() on the requested
-- 
2.14.1
