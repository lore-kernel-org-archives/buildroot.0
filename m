From: Victor Huesca <victor.huesca@bootlin.com>
Date: Mon,  5 Aug 2019 15:15:41 +0200
Subject: [Buildroot] [PATCH buildroot-test v2 1/4] utils/daily-mail: new
 data: outdated packages
In-Reply-To: <20190805131544.3849-1-victor.huesca@bootlin.com>
References: <20190805131544.3849-1-victor.huesca@bootlin.com>
Message-ID: <20190805131544.3849-2-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch uses the buildroot pkg-stats json output to list all outdated
packages. This will allow to ease the track of new upstream version of
buildroot packages.

This patch requires the non-standard python module 'packaging' in order
to compare the version numbers. This module can be install via the
distro package manager as 'python-packaging'.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 utils/daily-mail | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/utils/daily-mail b/utils/daily-mail
index cf9ebd5..c16af54 100755
--- a/utils/daily-mail
+++ b/utils/daily-mail
@@ -14,11 +14,14 @@ from collections import defaultdict
 import math
 import argparse
 import re
+import json
+from packaging import version
 
 sys.path.append(os.path.join(localconfig.brbase, "utils"))
 import getdeveloperlib  # noqa: E402
 
 RE_DATE = re.compile(r'^\d\d\d\d-\d\d-\d\d$')
+RE_HASH_40 = re.compile(r'.*[a-fA-F0-9]{40}.*')
 
 baseurl = "autobuild.buildroot.net"
 http_baseurl = "http://" + baseurl
@@ -367,6 +370,30 @@ def get_build_results_grouped_by_reason(db, datestr, branches):
     return results_by_reason
 
 
+def get_outdated_pkg(path):
+    with open(path, 'r') as f:
+        stats = json.load(f)
+    s = []
+    for name, pkg in stats['packages'].items():
+        status, latest_ver, p_id = pkg['latest_version']
+        cur_ver = pkg['current_version']
+        if status not in (2, 3):
+            continue  # an upstream version exists
+        if not cur_ver or not latest_ver:
+            continue  # both version and latest version are actual strings
+        if RE_HASH_40.match(cur_ver):
+            continue  # the version is a hash
+        if version.parse(str(cur_ver)) >= version.parse(str(latest_ver)):
+            continue  # up to date
+
+        s.append({'name': str(name),
+                  'id': p_id,
+                  'version': str(cur_ver),
+                  'upstream': str(latest_ver),
+                  'from': 'DISTRO' if status == 2 else 'GUESS'})
+    return sorted(s, key=lambda pkg: pkg['name'])
+
+
 def calculate_notifications(results):
     '''
     Prepare the notifications{} dict for the notifications to individual
-- 
2.21.0
