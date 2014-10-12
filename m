From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 17:23:06 +0200
Subject: [Buildroot] [git commit] scripts/graph-build-time: properly warn
	about missing modules
Message-ID: <20141012152402.2F88DB275F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9722381c0da7203c725c8f589cd84b4c55f8c9a7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently the graph-build-time script prints a python exception if a
needed module cannot be imported. Catch the exception and tell the user
which packages are missing, as we do for other missing dependencies.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/graph-build-time |   11 ++++++++---
 1 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/support/scripts/graph-build-time b/support/scripts/graph-build-time
index 433cd41..7eb3e47 100755
--- a/support/scripts/graph-build-time
+++ b/support/scripts/graph-build-time
@@ -49,8 +49,14 @@
 #   * argparse (by default in Python 2.7, requires python-argparse if
 #     Python 2.6 is used)
 
-import matplotlib as mpl
-import numpy
+import sys
+
+try:
+    import matplotlib as mpl
+    import numpy
+except ImportError:
+    sys.stderr.write("You need python-matplotlib and python-numpy to generate build graphs\n")
+    exit(1)
 
 # Use the Agg backend (which produces a PNG output, see
 # http://matplotlib.org/faq/usage_faq.html#what-is-a-backend),
@@ -62,7 +68,6 @@ import matplotlib.pyplot as plt
 import matplotlib.font_manager as fm
 import csv
 import argparse
-import sys
 
 steps = [ 'extract', 'patch', 'configure', 'build',
           'install-target', 'install-staging', 'install-images',
