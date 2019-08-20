From: Atharva Lele <itsatharva@gmail.com>
Date: Tue, 20 Aug 2019 20:22:28 +0530
Subject: [Buildroot] [PATCH v4 2/5] autobuild-run: initial implementation of
 get_reproducibility_failure_reason()
In-Reply-To: <20190820145231.15507-1-itsatharva@gmail.com>
References: <20190820145231.15507-1-itsatharva@gmail.com>
Message-ID: <20190820145231.15507-2-itsatharva@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Analyze the JSON formatted output from diffoscope and check if
the differences are due to a filesystem reproducibility issue
or a package reproducibility issue.

Also, discard the deltas because they might take up too much space.

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
---
Changes v2 -> v4:
  - Change if-else to try-except
  - remove blank line
Changes v1 -> v2:
  - Refactor using subfunctions and local variables (suggested by Thomas)
  - Added comments (suggested by Thomas)
  - Use more pythonic loops (suggested by Thomas)
---
 scripts/autobuild-run | 88 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 99b57dd..384cf73 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -131,6 +131,7 @@ import csv
 import docopt
 import errno
 import hashlib
+import json
 import mmap
 import multiprocessing
 import os
@@ -599,6 +600,93 @@ class Builder:
         if reject_results():
             return
 
+        def get_reproducibility_failure_reason(reproducible_results):
+            def split_delta(delta):
+                # Take a delta and split it into added, deleted lines.
+                added = []
+                deleted = []
+                for line in delta:
+                    if line.startswith("+"):
+                        added.append(line)
+                    if line.startswith("-"):
+                        deleted.append(line)
+                return added, deleted
+
+            def get_package(sourcef):
+                # Returns which package the source file belongs to.
+                with open(packages_file_list, "r") as packagef:
+                    for line in packagef:
+                        if sourcef in line:
+                            package = line.split(',')[0]
+
+                try:
+                    # Get package version
+                    package_info = json.loads(subprocess.check_output(["make", "--no-print-directory",
+                                                                       "O=%s" % self.outputdir,
+                                                                       "-C", self.srcdir,
+                                                                       "%s-show-info" % package]))
+                    if "version" in package_info[package]:
+                        version = package_info[package]["version"]
+                        return [package, version]
+                    else:
+                        return [package]
+                except:
+                    return ["not found"]
+
+            def cleanup(l):
+                # Takes a list and removes data which is redundant (source2) or data
+                # that might take up too much space (like huge diffs).
+                if "unified_diff" in l:
+                    l.pop("unified_diff")
+                if "source2" in l:
+                    l.pop("source2")
+
+            packages_file_list = os.path.join(self.outputdir, "build", "packages-file-list.txt")
+
+            with open(reproducible_results, "r") as reproduciblef:
+                json_data = json.load(reproduciblef)
+
+            if json_data["unified_diff"] == None:
+                # Remove the file list because it is not useful, i.e. it only shows
+                # which files vary, and nothing more.
+                if json_data["details"][0]["source1"] == "file list":
+                    json_data["details"].pop(0)
+
+                # Iterate over details in the diffoscope output.
+                for item in json_data["details"]:
+                    diff_src = item["source1"]
+                    item["package"] = get_package(diff_src)
+
+                    # In some cases, diffoscope uses multiple commands to get various
+                    # diffs. Due to this, it generates a "details" key for those files
+                    # instead of just storing the diff in the "unified_diff" key.
+                    if item["unified_diff"] == None:
+                        for item_details in item["details"]:
+                            diff = item_details["unified_diff"].split("\n")
+                            split_deltas = split_delta(diff)
+                            item_details["added"] = split_deltas[0][:100]
+                            item_details["deleted"] = split_deltas[1][:100]
+                            cleanup(item_details)
+                    else:
+                        diff = item["unified_diff"].split("\n")
+                        split_deltas = split_delta(diff)
+                        item["added"] = split_deltas[0][:100]
+                        item["deleted"] = split_deltas[1][:100]
+                    cleanup(item)
+                # We currently just set the reason from first non-reproducible package in the
+                # dictionary.
+                reason = json_data["details"][0]["package"]
+
+                # If there does exist a unified_diff directly for the .tar images, it is probably
+                # a filesystem reproducibility issue.
+            else:
+                reason = ["filesystem"]
+
+            with open(reproducible_results, "w") as reproduciblef:
+                json.dump(json_data, reproduciblef, sort_keys=True, indent=4)
+
+            return reason
+
         def get_failure_reason():
             # Output is a tuple (package, version), or None.
             lastlines = decode_bytes(subprocess.Popen(
-- 
2.22.0
