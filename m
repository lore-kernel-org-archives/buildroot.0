From: Atharva Lele <itsatharva@gmail.com>
Date: Tue,  6 Aug 2019 23:42:50 +0530
Subject: [Buildroot] [PATCH 5/6] autobuild-run: initial implementation of
 get_reproducibility_failure_reason()
In-Reply-To: <20190806181251.21885-1-itsatharva@gmail.com>
References: <20190806181251.21885-1-itsatharva@gmail.com>
Message-ID: <20190806181251.21885-5-itsatharva@gmail.com>
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
 scripts/autobuild-run | 71 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 520cfe2..f2f6460 100755
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
@@ -596,6 +597,76 @@ class Builder:
         if reject_results():
             return
 
+        def get_reproducibility_failure_reason(reproducible_results):
+            def clean_delta(delta):
+                added = []
+                deleted = []
+                for line in delta:
+                    if line.startswith("+"):
+                        added.append(line)
+                    if line.startswith("-"):
+                        deleted.append(line)
+                return added, deleted
+
+            with open(reproducible_results, "r") as reproduciblef:
+                json_data = json.load(reproduciblef)
+
+            packages_file_list = os.path.join(self.outputdir, "build", "packages-file-list.txt")
+
+            if json_data["unified_diff"] == None:
+                if json_data["details"][0]["source1"] == "file list":
+                    json_data["details"].pop(0)
+
+                for i in range(0, len(json_data["details"])):
+                    diff_source = json_data["details"][i]["source1"]
+                    with open(packages_file_list, "r") as packagef:
+                        for line in packagef:
+                            if diff_source in line:
+                                package = line.split(',')[0]
+
+                    # Get package version
+                    package_info = json.loads(subprocess.check_output(["make", "--no-print-directory",
+                                                                       "O=%s" % self.outputdir,
+                                                                       "-C", self.srcdir,
+                                                                       "%s-show-info" % package]))
+                    if "version" in package_info[package]:
+                        version = package_info[package]["version"]
+                        reason = [package, version]
+                    else:
+                        reason = [package]
+                    json_data["details"][i]["package"] = reason
+                    json_data["details"][i].pop("source2")
+                    if json_data["details"][i]["unified_diff"] == None:
+                        json_data["details"][i].pop("unified_diff")
+                        for j in range(0, len(json_data["details"][i]["details"])):
+                            delta = json_data["details"][i]["details"][j]["unified_diff"].split("\n")
+                            deltas = clean_delta(delta)
+                            json_data["details"][i]["details"][j]["added"] = deltas[0][:100]
+                            json_data["details"][i]["details"][j]["deleted"] = deltas[1][:100]
+                            try:
+                                json_data["details"][i]["details"][j].pop("unified_diff")
+                                json_data["details"][i]["details"][j].pop("source2")
+                            except KeyError as e:
+                                log_write(self.log, "KeyError: %s not found in JSON details[%d][%d]" % (e, i, j))
+                    else:
+                        delta = json_data["details"][i]["unified_diff"]
+                        deltas = clean_delta(delta)
+                        json_data["details"][i]["added"] = deltas[0][:100]
+                        json_data["details"][i]["deleted"] = deltas[1][:100]
+                        try:
+                            json_data["details"][i].pop("unified_diff")
+                            json_data["details"][i].pop("source2")
+                        except KeyError as e:
+                            log_write(self.log, "KeyError: %s not found in JSON details[%d]" % (e, i))
+                reason = json_data["details"][0]["package"]
+            else:
+                reason = "filesystem"
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
