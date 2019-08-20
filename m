From: Atharva Lele <itsatharva@gmail.com>
Date: Tue, 20 Aug 2019 20:22:31 +0530
Subject: [Buildroot] [PATCH v4 5/5] autobuild-run: initial implementation of
 categorization() of nonreproducibility
In-Reply-To: <20190820145231.15507-1-itsatharva@gmail.com>
References: <20190820145231.15507-1-itsatharva@gmail.com>
Message-ID: <20190820145231.15507-5-itsatharva@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build ID and Build Path reproducibility issues are easy to identify and thus we
start categorization with these issues.

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
---
 scripts/autobuild-run | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index c25413b..83acaad 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -131,6 +131,7 @@ import csv
 import docopt
 import errno
 import hashlib
+from itertools import izip
 import json
 import mmap
 import multiprocessing
@@ -641,6 +642,26 @@ class Builder:
                 if "source2" in l:
                     l.pop("source2")
 
+            def categorize(added, deleted):
+                # In some deltas, the only part of output directory is captured.
+                # For eg. "put-1" or "tput-2", thus we must check all such possibilities.
+                # Start with 3 letter combinations to avoid false positives.
+                path_1 = "output-1"
+                path_2 = "output-2"
+                paths = [path_1[i:j] for i in range(len(path_1)) for j in range(i+3, len(path_1)+1)]
+                paths_2 = [path_2[i:j] for i in range(len(path_1)) for j in range(i+3, len(path_1)+1)]
+                paths = paths + paths_2
+                # We need to iterate over the deltas simultaneously.
+                for a, d in izip(added, deleted):
+                    for p in paths:
+                        if p in a or p in d:
+                            return "Embedded Path"
+                    if "Build ID" in a or "Build ID" in d:
+                        return "Build ID variation"
+                    else:
+                        continue
+                return "not found"
+
             packages_file_list = os.path.join(self.outputdir, "build", "packages-file-list.txt")
 
             with open(reproducible_results, "r") as reproduciblef:
@@ -667,12 +688,18 @@ class Builder:
                             item_details["added"] = split_deltas[0][:100]
                             item_details["deleted"] = split_deltas[1][:100]
                             cleanup(item_details)
+                            category = categorize(item_details["added"], item_details["deleted"])
+                            if category is not "not found":
+                                item["category"] = category
+                                break
                     else:
                         diff = item["unified_diff"].split("\n")
                         split_deltas = split_delta(diff)
                         item["added"] = split_deltas[0][:100]
                         item["deleted"] = split_deltas[1][:100]
                     cleanup(item)
+                    if "added" in item or "deleted" in item:
+                        item["category"] = categorize(item["added"], item["deleted"])
                 # We currently just set the reason from first non-reproducible package in the
                 # dictionary.
                 reason = json_data["details"][0]["package"]
-- 
2.22.0
