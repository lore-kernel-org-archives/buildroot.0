Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E5BCA0EE4
	for <buildroot@archiver.kernel.org>; Sat, 23 Aug 2025 18:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1CBB83D6E;
	Sat, 23 Aug 2025 18:01:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E6bVHdOw10hI; Sat, 23 Aug 2025 18:01:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF3CC83D65
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF3CC83D65;
	Sat, 23 Aug 2025 18:01:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AAC3519C
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 18:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9BCEE40B22
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 18:01:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NuF-jwAP6KB5 for <buildroot@buildroot.org>;
 Sat, 23 Aug 2025 18:01:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFDD640AA9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CFDD640AA9
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 18:01:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BE17F8770D; Sat, 23 Aug 2025 18:01:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Aug 2025 19:58:23 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4ad582298c7cef72fd72c73575971f461fe50624
X-Git-Newrev: 67422b9d9cd02d29393081d83af4dd16093c43b1
X-Patchwork-Hint: ignore
Message-Id: <20250823180140.BE17F8770D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/scripts/cve.py: handle
 CVEs with 'configurations' but no 'nodes' inside
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

commit: https://git.buildroot.net/buildroot/commit/?id=67422b9d9cd02d29393081d83af4dd16093c43b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
  - a similar patch was sent by Daniel Lang (thanks!)]
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
