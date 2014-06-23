From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 23 Jun 2014 22:11:23 +0200
Subject: [Buildroot] [PATCH 1/2] graph-depends: support calling from
	recursive make
Message-ID: <1403554284-4935-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The graph-depends script calls make. If the outer make was called
recursively, or if it was called with '-C <somedir>', then the
environment will contain "MAKEFLAGS=w --". Therefore, the recursive
make prints 'Entering' and 'Leaving' messages, which clobbers the
output for dot.

To avoid this, add "--no-print-directory" to the recursive make
arguments. Since we require GNU make 3.81, we can be sure that this
option is available.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Tested with:

    echo '======== In-tree'
    make defconfig
    make graph-depends

    echo '======== Out-of-tree, called out of top-dir, relative'
    cd ..
    make -C buildroot O=../br.build-2 defconfig
    make -C buildroot O=../br.build-2 graph-depends

    echo '======== Out-of-tree, called from top-dir, relative'
    cd buildroot
    make O=../br.build-3 defconfig
    make O=../br.build-3 graph-depends

    echo '======== Out-of-tree, called from O-dir, absolute'
    cd ..
    mkdir br.build-4
    cd br.build-4
    make -C ../buildroot O=$(pwd) defconfig
    make graph-depends

    echo '======== Out-of-tree, called out of top-dir, absolute '
    cd ..
    mkdir br.build-5
    make -C buildroot O=$(pwd)/br.build-5 defconfig
    make -C buildroot O=$(pwd)/br.build-5 graph-depends

    echo '======== Out-of-tree, called fromother dir, absolute-relative'
    mkdir br.build-6.1
    cd br.build-6.1
    make -C ../buildroot O=$(pwd)/../br.build-6.2 defconfig
    make -C ../buildroot O=$(pwd)/../br.build-6.2 graph-depends
    cd ..

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/scripts/graph-depends | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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
-- 
2.0.0
