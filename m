From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 24 Feb 2020 22:22:58 +0100
Subject: [Buildroot] [git commit branch/next] support/scripts/pkg-stats:
 iterate over CVEs in streaming
Message-ID: <20200224211109.8FB758E8D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a35f51cee18dfd60232db11b4e0f4ee6712dcb75
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The NVD files that are used to build the list of CVEs affecting
Buildroot packages are quite large (a few hundreds MB of json),
and cause the pkg-stats scripts to have a huge memory footprint
(a few GB with Python 2.7).

However, because we only need to iterate on CVE items one by one,
we can process them in streaming (ie decoding one CVE at a time
from the JSON representation). Because the json module from the
python standard library does not support such a mode of operation,
we switch to the third-party package ijson, which is compatible
with both Python 2 and Python3.

To run the script with these modifications, one should install
the ijson python package. This can be done with pip:
`pip install ijson`. On Debian based distributions, this can
also be done with the apt package manager:
`apt install python-ijson`.

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
Reviewed-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Tested-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/pkg-stats | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 920a2be158..01a0a0d53d 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -25,6 +25,7 @@ import re
 import subprocess
 import requests  # URL checking
 import json
+import ijson
 import certifi
 import distutils.version
 import time
@@ -231,11 +232,11 @@ class CVE:
         for year in range(NVD_START_YEAR, datetime.datetime.now().year + 1):
             filename = CVE.download_nvd_year(nvd_dir, year)
             try:
-                content = json.load(gzip.GzipFile(filename))
+                content = ijson.items(gzip.GzipFile(filename), 'CVE_Items.item')
             except:
                 print("ERROR: cannot read %s. Please remove the file then rerun this script" % filename)
                 raise
-            for cve in content["CVE_Items"]:
+            for cve in content:
                 yield cls(cve['cve'])
 
     def each_product(self):
