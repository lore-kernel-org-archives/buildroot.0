From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 May 2021 13:57:38 +0200
Subject: [Buildroot] [git commit] support/scripts/gen-missing-cpe: add new
 script
Message-ID: <20210516113857.8F1DB84396@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fffc5534854b7077bd534dde9005f34d4b3025d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This script queries the list of CPE IDs for the packages of the
current configuration (based on the "make show-info" output), and:

 - for CPE IDs that do not have any matching entry in the CPE
   database, it emits a warning

 - for CPE IDs that do have a matching entry, but not with the same
   version, it generates a snippet of XML that can be used to propose
   an updated version to NIST.

Ref: NIST has a group email (cpe_dictionary at nist.gov) used to
recieve these version update and new entry xml files.  They do
process the XML and provide feedback. In some cases they will
propose back something different where the vendor or version is
slightly different.

Limitations
 - Currently any use of non-number version identifiers isn't
   supported by NIST as they use ranges to determine impact
   of a CVE
 - Any Linux version from a non-upstream is also not supported
   without manually adjusting the information as the custom
   kernel will more then likely not match the upstream version
   used in the dictionary

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
[yann.morin.1998 at free.fr:
  - codestyles as spotted by Arnout
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/scripts/gen-missing-cpe | 65 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/support/scripts/gen-missing-cpe b/support/scripts/gen-missing-cpe
new file mode 100755
index 0000000000..0b222f2659
--- /dev/null
+++ b/support/scripts/gen-missing-cpe
@@ -0,0 +1,65 @@
+#!/usr/bin/env python3
+
+import argparse
+import sys
+import json
+import subprocess
+import os
+from cpedb import CPEDB, CPE
+
+
+def gen_update_xml_reports(cpeids, cpedb, output):
+    cpe_need_update = []
+
+    for cpe in cpeids:
+        result = cpedb.find(cpe)
+        if not result:
+            result = cpedb.find_partial(CPE.no_version(cpe))
+            if result:
+                cpe_need_update.append(cpe)
+            else:
+                print("WARNING: no match found for '%s'" % cpe)
+
+    for cpe in cpe_need_update:
+        xml = cpedb.gen_update_xml(cpe)
+        fname = CPE.product(cpe) + '-' + CPE.version(cpe) + '.xml'
+        print("Generating %s" % fname)
+        with open(os.path.join(output, fname), 'w+') as fp:
+            fp.write(xml)
+
+    print("Generated %d update files out of %d CPEs" % (len(cpe_need_update), len(cpeids)))
+
+
+def get_cpe_ids():
+    print("Getting list of CPE for enabled packages")
+    cmd = ["make", "--no-print-directory", "show-info"]
+    js = json.loads(subprocess.check_output(cmd).decode("utf-8"))
+    return set([v["cpe-id"] for k, v in js.items() if "cpe-id" in v])
+
+
+def resolvepath(path):
+    return os.path.abspath(os.path.expanduser(path))
+
+
+def parse_args():
+    parser = argparse.ArgumentParser()
+    parser.add_argument('--output', dest='output',
+                        help='Path to the output CPE update files', type=resolvepath, required=True)
+    parser.add_argument('--nvd-path', dest='nvd_path',
+                        help='Path to the local NVD database', type=resolvepath, required=True)
+    return parser.parse_args()
+
+
+def __main__():
+    args = parse_args()
+    if not os.path.isdir(args.output):
+        print("ERROR: output directory %s does not exist" % args.output)
+        sys.exit(1)
+    cpedb = CPEDB(args.nvd_path)
+    cpedb.get_xml_dict()
+    cpeids = get_cpe_ids()
+    gen_update_xml_reports(cpeids, cpedb, args.output)
+
+
+if __name__ == "__main__":
+    __main__()
