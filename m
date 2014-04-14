From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Apr 2014 22:13:04 +0200
Subject: [Buildroot] [git commit] graphs: make graphs with lots of packages
	nicer to look at
Message-ID: <20140414201322.7968D9BF11@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ef8b8d950f336f6209addfb1269efbff955ac3d9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some magic numbers obtained with trial-and-error and successive
iterations, to eventually get a nice graph.

[Thomas: remove excessive spaces in expressions.]

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/graph-build-time |   17 +++++++++++------
 1 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/support/scripts/graph-build-time b/support/scripts/graph-build-time
index 00c2349..45f9435 100755
--- a/support/scripts/graph-build-time
+++ b/support/scripts/graph-build-time
@@ -126,12 +126,17 @@ def pkg_histogram(data, output, order="build"):
     # Draw the package names
     plt.xticks(ind + .6, [ p.name for p in data ], rotation=-60, rotation_mode="anchor", fontsize=8, ha='left')
 
-    # Adjust size of graph (double the width)
-    sz = plt.gcf().get_size_inches()
-    plt.gcf().set_size_inches(sz[0] * 2, sz[1])
-
-    # Add more space for the package names at the bottom
-    plt.gcf().subplots_adjust(bottom=0.2)
+    # Adjust size of graph depending on the number of packages
+    # Ensure a minimal size twice as the default
+    # Magic Numbers do Magic Layout!
+    ratio = max(((n_pkgs + 10) / 48, 2))
+    borders = 0.1 / ratio
+    sz = plt.gcf().get_figwidth()
+    plt.gcf().set_figwidth(sz * ratio)
+
+    # Adjust space at borders, add more space for the
+    # package names at the bottom
+    plt.gcf().subplots_adjust(bottom=0.2, left=borders, right=1-borders)
 
     # Remove ticks in the graph for each package
     axes = plt.gcf().gca()
