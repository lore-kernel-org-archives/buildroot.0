From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Apr 2014 22:42:41 +0200
Subject: [Buildroot] [PATCH 5/6] support/graph-depends: don't show toolchain
	dependency for all packages
In-Reply-To: <cover.1397421554.git.yann.morin.1998@free.fr>
References: <cover.1397421554.git.yann.morin.1998@free.fr>
Message-ID: <e626cb1d54ac1756750c7ce473dde8d7d5b784b9.1397421554.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Al packages depend on 'toolchain'. Currently, 'graph-depends' graphs this
dependency. The resulting graph is thus cluttered with less-than-useful
information.

Instead, do not graph the 'toolchain' dependency for any package, save
for the fake 'all' package. The graph is now a bit more readable.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/graph-depends | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index ebf511b..4f532ba 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -162,13 +162,16 @@ def has_redundant_deps(deps, pkg):
 def remove_redundant_deps(deps):
     newdeps = []
     for dep in deps:
-        if dep[0] != "all":
+        if dep[0] == "all" and dep[1] == "toolchain":
+            newdeps.append(dep)
+            continue
+        if dep[0] != "all" and dep[1] != "toolchain":
             newdeps.append(dep)
             continue
         if not has_redundant_deps(deps, dep[1]):
             newdeps.append(dep)
             continue
-        sys.stderr.write("Removing redundant dep all -> %s\n" % dep[1])
+        sys.stderr.write("Removing redundant dep %s -> %s\n" % (dep[0],dep[1]))
     return newdeps
 
 TARGET_EXCEPTIONS = [
-- 
1.8.3.2
