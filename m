From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed,  3 Mar 2021 16:04:50 +0100
Subject: [Buildroot] [PATCHv2 1/2] utils/size-stats-compare: clarify meaning
 of variables in print_result
Message-ID: <20210303150451.7963-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

print_result is juggling with entry[x][y] which is not very readable.
While a better solution would be to use a class and reference named
attributes, that would require some bigger changes in the script.

Instead, make a minimal improvement by assigning the entry[x][y] values to
intermediate variables. Store them in a dict for easy usage from a format
string.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
v2: new patch

 utils/size-stats-compare | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/utils/size-stats-compare b/utils/size-stats-compare
index a3d7f250c6..de67b72587 100755
--- a/utils/size-stats-compare
+++ b/utils/size-stats-compare
@@ -77,9 +77,16 @@ def print_results(result, threshold):
     # list_result is a list of tuples: (name, (flag, size difference))
 
     for entry in sorted(list_result, key=lambda entry: entry[1][1]):
-        if threshold is not None and abs(entry[1][1]) <= threshold:
+
+        data = dict(
+            name=entry[0],
+            action=entry[1][0],
+            size=entry[1][1],
+        )
+
+        if threshold is not None and abs(data['size']) <= threshold:
             continue
-        print('%12s %7s %s' % (entry[1][1], entry[1][0], entry[0]))
+        print('{size:12d} {action:7s} {name}'.format(**data))
 
 
 # main #########################################################################
-- 
2.26.2
