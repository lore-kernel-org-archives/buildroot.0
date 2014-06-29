From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jun 2014 10:43:37 +0200
Subject: [Buildroot] [git commit] graph-depends: support calling from
	recursive make
Message-ID: <20140629084431.2AFBD9CDAB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b82f66cf404ef74509212de0d035737c75c5e6d6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The graph-depends script calls make. If the outer make was called
recursively, or if it was called with '-C <somedir>', then the
environment will contain "MAKEFLAGS=w --". Therefore, the recursive
make prints 'Entering' and 'Leaving' messages, which clobbers the
output for dot.

To avoid this, add "--no-print-directory" to the recursive make
arguments. Since we require GNU make 3.81, we can be sure that this
option is available.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/graph-depends |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index 58401a2..52c16ce 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -81,7 +81,7 @@ allpkgs = []
 # list is used as the starting point for full dependency graphs
 def get_targets():
     sys.stderr.write("Getting targets\n")
-    cmd = ["make", "-s", "show-targets"]
+    cmd = ["make", "-s", "--no-print-directory", "show-targets"]
     p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
     output = p.communicate()[0].strip()
     if p.returncode != 0:
@@ -95,7 +95,7 @@ def get_targets():
 # dependencies formatted as a Python dictionary.
 def get_depends(pkgs):
     sys.stderr.write("Getting dependencies for %s\n" % pkgs)
-    cmd = ["make", "-s" ]
+    cmd = ["make", "-s", "--no-print-directory" ]
     for pkg in pkgs:
         cmd.append("%s-show-depends" % pkg)
     p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
