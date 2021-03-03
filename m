From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed,  3 Mar 2021 16:04:51 +0100
Subject: [Buildroot] [PATCHv2 2/2] utils/size-stats-compare: add package
 name in detail output
In-Reply-To: <20210303150451.7963-1-patrickdepinguin@gmail.com>
References: <20210303150451.7963-1-patrickdepinguin@gmail.com>
Message-ID: <20210303150451.7963-2-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

size-stats-compare gives an overview of the size increase/decrease between
two cases, based on packages-file-list.txt. The 'detail' mode gives info per
file, otherwise per package.

But sometimes, you want the detailed per-file info, but only for a specific
package. Since the detailed output no longer lists the package name, you
cannot simply grep for it. A workaround was to filter the input
packages-file-list.txt's first, and then pass these filtered versions to
size-stats-compare.

Make this easier by adding the package name next to the filename in detailed
output. This allows grep'ing normally.
For example:

  $ utils/size-stats-compare orig new  -t 100 -d | grep ebtables

      -67712 removed ebtables             lib/ebtables/libebtc.so
      -66764 removed ebtables             lib/ebtables/libebt_nat.so
      -66752 removed ebtables             sbin/ebtables
      -66704 removed ebtables             lib/ebtables/libebt_arp.so
      -66700 removed ebtables             lib/ebtables/libebt_stp.so
      -66700 removed ebtables             lib/ebtables/libebt_among.so
      -66684 removed ebtables             lib/ebtables/libebt_ip.so
      -66676 removed ebtables             lib/ebtables/libebt_limit.so
      -66656 removed ebtables             lib/ebtables/libebt_log.so
      -66648 removed ebtables             lib/ebtables/libebt_mark.so
      -66636 removed ebtables             lib/ebtables/libebt_pkttype.so
      -66604 removed ebtables             lib/ebtables/libebt_vlan.so
      -66588 removed ebtables             lib/ebtables/libebt_ulog.so
      -66588 removed ebtables             lib/ebtables/libebt_nflog.so
      -66584 removed ebtables             lib/ebtables/libebt_arpreply.so
      -66544 removed ebtables             lib/ebtables/libebt_ip6.so
      -66540 removed ebtables             lib/ebtables/libebt_802_3.so
      -66536 removed ebtables             lib/ebtables/libebt_standard.so
      -66524 removed ebtables             lib/ebtables/libebt_mark_m.so
      -66524 removed ebtables             lib/ebtables/libebt_redirect.so
      -66452 removed ebtables             lib/ebtables/libebtable_filter.so
      -66452 removed ebtables             lib/ebtables/libebtable_broute.so
      -66452 removed ebtables             lib/ebtables/libebtable_nat.so
          45         ebtables             etc/ethertypes
       66752 added   ebtables             usr/sbin/ebtablesd
       66752 added   ebtables             usr/sbin/ebtables-legacy
       66752 added   ebtables             usr/sbin/ebtablesu
      200840 added   ebtables             usr/lib/libebtc.so.0.0.0

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
v2: move package name in front of filename (comment by Yann)


 utils/size-stats-compare | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/utils/size-stats-compare b/utils/size-stats-compare
index de67b72587..ffe894e839 100755
--- a/utils/size-stats-compare
+++ b/utils/size-stats-compare
@@ -40,9 +40,9 @@ def read_file_size_csv(inputf, detail=None):
 
     for row in reader:
         if detail:
-            sizes[row[0]] = int(row[2])
+            sizes[(row[0], row[1])] = int(row[2])
         else:
-            sizes[row[1]] = int(row[3])
+            sizes[(None, row[1])] = int(row[3])
 
     return sizes
 
@@ -73,20 +73,28 @@ def print_results(result, threshold):
 
     from six import iteritems
     list_result = list(iteritems(result))
-    # result is a dictionary: name -> (flag, size difference)
-    # list_result is a list of tuples: (name, (flag, size difference))
+    # result is a dictionary: (filename, pkgname) -> (flag, size difference)
+    # list_result is a list of tuples: ((filename, pkgname), (flag, size difference))
+    # filename may be None if no detail is requested.
+
+    maxpkgname=max(len(pkgname) for filename, pkgname in result)
 
     for entry in sorted(list_result, key=lambda entry: entry[1][1]):
 
         data = dict(
-            name=entry[0],
+            filename=entry[0][0],
+            pkgname=entry[0][1],
             action=entry[1][0],
             size=entry[1][1],
+            maxpkgname=maxpkgname,
         )
 
         if threshold is not None and abs(data['size']) <= threshold:
             continue
-        print('{size:12d} {action:7s} {name}'.format(**data))
+        if data['filename']:
+            print('{size:12d} {action:7s} {pkgname:{maxpkgname}s} {filename}'.format(**data))
+        else:
+            print('{size:12d} {action:7s} {pkgname}'.format(**data))
 
 
 # main #########################################################################
@@ -133,5 +141,5 @@ print('Size difference per %s (bytes), threshold = %s' % (keyword, args.threshol
 print(80*'-')
 print_results(delta, args.threshold)
 print(80*'-')
-print_results({'TOTAL': ('', sum(new_sizes.values()) - sum(old_sizes.values()))},
+print_results({(None, 'TOTAL'): ('', sum(new_sizes.values()) - sum(old_sizes.values()))},
               threshold=None)
-- 
2.26.2
