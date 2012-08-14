From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Aug 2012 15:09:21 +0200
Subject: [Buildroot] [git commit] support/graph-depends: fix out-of-tree
	usage
Message-ID: <20120814130938.91F0497136@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a293d4ab338c84f450261371085cef1cf69bcf96
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

graph-depends calls make to get the list of packages, and the
dependencies of each package.

When called out-of-tree, the Makefile is a wrapper that calls
the real Makefile, so make will spit out a line like:
  make -C /path/to/buildroot O=/path/to/build-dir show-targets

which graph-depends wrongly believes is part of the target list.

Be silent when calling make, as we really only want the target
and dependency lists.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
