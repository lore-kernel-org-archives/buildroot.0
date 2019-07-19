From: Victor Huesca <victor.huesca@bootlin.com>
Date: Fri, 19 Jul 2019 15:06:28 +0200
Subject: [Buildroot] [PATCH v3 1/3] support/scripts/pkg-stats: improve
 argparse usage
In-Reply-To: <20190719130630.9967-1-victor.huesca@bootlin.com>
References: <20190719130630.9967-1-victor.huesca@bootlin.com>
Message-ID: <20190719130630.9967-2-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Move the mutual exculsion of the '-n' and '-p' options to be part of the
parser instead of being checked in main.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 support/scripts/pkg-stats | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index b0be7d919b..d65f609d57 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -23,7 +23,6 @@ import os
 from collections import defaultdict
 import re
 import subprocess
-import sys
 import requests  # URL checking
 import json
 import certifi
@@ -700,18 +699,16 @@ def parse_args():
     parser = argparse.ArgumentParser()
     parser.add_argument('-o', dest='output', action='store', required=True,
                         help='HTML output file')
-    parser.add_argument('-n', dest='npackages', type=int, action='store',
+    packages = parser.add_mutually_exclusive_group()
+    packages.add_argument('-n', dest='npackages', type=int, action='store',
                         help='Number of packages')
-    parser.add_argument('-p', dest='packages', action='store',
+    packages.add_argument('-p', dest='packages', action='store',
                         help='List of packages (comma separated)')
     return parser.parse_args()
 
 
 def __main__():
     args = parse_args()
-    if args.npackages and args.packages:
-        print("ERROR: -n and -p are mutually exclusive")
-        sys.exit(1)
     if args.packages:
         package_list = args.packages.split(",")
     else:
-- 
2.21.0
