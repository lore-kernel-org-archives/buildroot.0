Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C38C6CA0FE8
	for <buildroot@archiver.kernel.org>; Sat, 23 Aug 2025 20:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A962613F1;
	Sat, 23 Aug 2025 20:04:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1mbHhWCn0D2P; Sat, 23 Aug 2025 20:04:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF1D8613F4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF1D8613F4;
	Sat, 23 Aug 2025 20:04:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D539319C
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 20:04:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC5AC41685
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 20:04:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nPM4iSF_wbCw for <buildroot@buildroot.org>;
 Sat, 23 Aug 2025 20:04:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08F25414F1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 08F25414F1
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 20:04:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E71C687534; Sat, 23 Aug 2025 20:04:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Aug 2025 22:02:17 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 4e1d278fa7fad7f5c5302cbad7893263d23c2e6d
X-Git-Newrev: 5d46fcafe60f216126d3f396f73c60a0df694e6a
X-Patchwork-Hint: ignore
Message-Id: <20250823200413.E71C687534@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] support/scripts/cve.py:
 handle CVEs with 'configurations' but no 'nodes' inside
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5d46fcafe60f216126d3f396f73c60a0df694e6a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

The each_cpe() method is careful that some CVEs have no
"configurations", but some CVEs such as
https://nvd.nist.gov/vuln/detail/CVE-2025-32915 apparently have a
"configurations" node, but no "nodes" inside the "configurations",
causing an exception:

Traceback (most recent call last):
  File "/home/buildroot/buildroot-stats/./support/scripts/pkg-stats", line 1382, in <module>
    __main__()
  File "/home/buildroot/buildroot-stats/./support/scripts/pkg-stats", line 1371, in __main__
    check_package_cves(args.nvd_path, packages)
  File "/home/buildroot/buildroot-stats/./support/scripts/pkg-stats", line 679, in check_package_cves
    check_package_cve_affects(cve, cpe_product_pkgs)
  File "/home/buildroot/buildroot-stats/./support/scripts/pkg-stats", line 638, in check_package_cve_affects
    for product in cve.affected_products:
                   ^^^^^^^^^^^^^^^^^^^^^
  File "/home/buildroot/buildroot-stats/support/scripts/cve.py", line 185, in affected_products
    return set(cpe_product(p['id']) for p in self.each_cpe())
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/buildroot/buildroot-stats/support/scripts/cve.py", line 185, in <genexpr>
    return set(cpe_product(p['id']) for p in self.each_cpe())
              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/buildroot/buildroot-stats/support/scripts/cve.py", line 173, in each_cpe
    for node in nodes['nodes']:
                ~~~~~^^^^^^^^^
KeyError: 'nodes'

Fixes:
  54f8d97c91 ("support/scripts/pkg-stats: adapt to NVD v2 json format")

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Romain:
  - add reference to buildroot commit introducing the issue
  - a similar patch was sent by Daniel Lang (thanks!)
  - needed on 2025.05.x to fix "Daily results" email]
(cherry picked from commit 67422b9d9cd02d29393081d83af4dd16093c43b1)
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/scripts/cve.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/cve.py b/support/scripts/cve.py
index 1cbe24c02d..ba41762fa0 100755
--- a/support/scripts/cve.py
+++ b/support/scripts/cve.py
@@ -170,7 +170,7 @@ class CVE:
 
     def each_cpe(self):
         for nodes in self.nvd_cve.get('configurations', []):
-            for node in nodes['nodes']:
+            for node in nodes.get('nodes', []):
                 for cpe in self.parse_node(node):
                     yield cpe
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
