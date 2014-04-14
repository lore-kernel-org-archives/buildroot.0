From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Apr 2014 21:00:38 +0200
Subject: [Buildroot] [git commit] support/graph-depends: don't show
	toolchain dependency for all packages
Message-ID: <20140414201322.72F079C79B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ede3e5fec3951d85d464d7c0dbc4a65365048199
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Al packages depend on 'toolchain'. Currently, 'graph-depends' graphs this
dependency. The resulting graph is thus cluttered with less-than-useful
information.

Instead, do not graph the 'toolchain' dependency for any package, save
for the fake 'all' package. The graph is now a bit more readable.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/graph-depends |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

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
