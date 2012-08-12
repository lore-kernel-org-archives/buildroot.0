From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Aug 2012 22:27:07 +0200
Subject: [Buildroot] [PATCH] support/graph-depends: fix out-of-tree usage
Message-ID: <1344803227-9472-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

graph-depends calls make to get the list of packages, and the
dependencies of each package.

When called out-of-tree, the Makefile is a wrapper that calls
the real Makefile, so make will spit out a line like:
  make -C /path/to/buildroot O=/path/to/build-dir show-targets

which graph-depends wrongly believes is part of the target list.

Be silent when calling make, as we really only want the target
and dependency lists.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Note we do not silence the Makefile wrapper, because it can be
usefull to see what buildroot dir is being used during the build.
For example, I happen to have a few buildroot clones, and seeing
the one being actually being used allows me to be sure I am not
using the wrong once.
---
 support/scripts/graph-depends |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index da050da..409c123 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -53,7 +53,7 @@ unknownpkgs = []
 # list is used as the starting point for full dependency graphs
 def get_targets():
     sys.stderr.write("Getting targets\n")
-    cmd = ["make", "show-targets"]
+    cmd = ["make", "-s", "show-targets"]
     p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
     output = p.communicate()[0].strip()
     if p.returncode != 0:
@@ -67,7 +67,7 @@ def get_targets():
 # formatted as a Python list.
 def get_depends(pkg):
     sys.stderr.write("Getting dependencies for %s\n" % pkg)
-    cmd = ["make", "%s-show-depends" % pkg]
+    cmd = ["make", "-s", "%s-show-depends" % pkg]
     p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
     output = p.communicate()[0].strip()
     if p.returncode != 0:
-- 
1.7.2.5
