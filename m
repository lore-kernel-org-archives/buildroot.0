Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56652C433F5
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 20:38:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0701240337;
	Mon, 31 Jan 2022 20:38:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2DJ5EtvisFsa; Mon, 31 Jan 2022 20:38:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 367F340324;
	Mon, 31 Jan 2022 20:38:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BF90D1BF36A
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 20:38:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC77440120
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 20:38:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j985e0sNHnYY for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 20:38:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B791400C7
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 20:38:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 0BEB382826; Mon, 31 Jan 2022 20:31:16 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 31 Jan 2022 21:32:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e9b1dffa5d17c7af5d6171de88348431a6260308
X-Git-Newrev: 391f70b6893e0b502b69f40c69df412f24519060
X-Patchwork-Hint: ignore
Message-Id: <20220131203116.0BEB382826@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/size-stats-compare: add package name
 in detail output
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=391f70b6893e0b502b69f40c69df412f24519060
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
 utils/size-stats-compare | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/utils/size-stats-compare b/utils/size-stats-compare
index c679150654..2ccbe7d191 100755
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
 
@@ -73,19 +73,27 @@ def print_results(result, threshold):
 
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
@@ -132,5 +140,5 @@ print('Size difference per %s (bytes), threshold = %s' % (keyword, args.threshol
 print(80*'-')
 print_results(delta, args.threshold)
 print(80*'-')
-print_results({'TOTAL': ('', sum(new_sizes.values()) - sum(old_sizes.values()))},
+print_results({(None, 'TOTAL'): ('', sum(new_sizes.values()) - sum(old_sizes.values()))},
               threshold=None)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
