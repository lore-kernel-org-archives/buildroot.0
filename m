Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A1FC5478C
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 19:32:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DDA8829BB;
	Wed, 28 Feb 2024 19:32:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KVHZgc2MLdwX; Wed, 28 Feb 2024 19:32:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57726828DE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57726828DE;
	Wed, 28 Feb 2024 19:32:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F05DE1BF955
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 19:32:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E928C40102
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 19:32:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OROe__-THhdM for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 19:32:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B02A9400FC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B02A9400FC
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 19:32:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9833087CA6; Wed, 28 Feb 2024 19:32:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 28 Feb 2024 20:12:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f71d9f49e5466f31b53bb2cdc0201182104c86c0
X-Git-Newrev: 54f8d97c913e3c38073d6a31ed3ff02dd71cf9cb
X-Patchwork-Hint: ignore
Message-Id: <20240228193247.9833087CA6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: adapt to NVD v2
 json format
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=54f8d97c913e3c38073d6a31ed3ff02dd71cf9cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 22b69455526f (support/scripts/cve.py: switch from NVD to FKIE for
the JSON files) missed the fact that the layout of the FKIE data files
are different from the original NVD ones. They are formatted according
to the NVD v2 API.

Most differences are relatively trivial fields renaming, and those are
easily spotted in this patch.

There is however one key difference in the layout of the configurations.
Where the NVD had "configurations" as an object with a "nodes" key, the
FKIE has a "configurations" as a list of objects with a single "nodes"
key; i.e. it is one-level deeper.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 support/scripts/cve.py | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/support/scripts/cve.py b/support/scripts/cve.py
index f12a8048cd..747ad881c9 100755
--- a/support/scripts/cve.py
+++ b/support/scripts/cve.py
@@ -128,7 +128,7 @@ class CVE:
             filename = CVE.download_nvd_year(nvd_dir, year)
             try:
                 uncompressed = subprocess.check_output(["xz", "-d", "-c", filename])
-                content = ijson.items(uncompressed, 'CVE_Items.item')
+                content = ijson.items(uncompressed, 'cve_items.item')
             except:  # noqa: E722
                 print("ERROR: cannot read %s. Please remove the file then rerun this script" % filename)
                 raise
@@ -155,11 +155,11 @@ class CVE:
             for parsed_node in self.parse_node(child):
                 yield parsed_node
 
-        for cpe in node.get('cpe_match', ()):
+        for cpe in node.get('cpeMatch', ()):
             if not cpe['vulnerable']:
                 return
-            product = cpe_product(cpe['cpe23Uri'])
-            version = cpe_version(cpe['cpe23Uri'])
+            product = cpe_product(cpe['criteria'])
+            version = cpe_version(cpe['criteria'])
             # ignore when product is '-', which means N/A
             if product == '-':
                 return
@@ -191,7 +191,7 @@ class CVE:
                     v_end = cpe['versionEndExcluding']
 
             yield {
-                'id': cpe['cpe23Uri'],
+                'id': cpe['criteria'],
                 'v_start': v_start,
                 'op_start': op_start,
                 'v_end': v_end,
@@ -199,14 +199,15 @@ class CVE:
             }
 
     def each_cpe(self):
-        for node in self.nvd_cve['configurations']['nodes']:
-            for cpe in self.parse_node(node):
-                yield cpe
+        for nodes in self.nvd_cve.get('configurations', []):
+            for node in nodes['nodes']:
+                for cpe in self.parse_node(node):
+                    yield cpe
 
     @property
     def identifier(self):
         """The CVE unique identifier"""
-        return self.nvd_cve['cve']['CVE_data_meta']['ID']
+        return self.nvd_cve['id']
 
     @property
     def affected_products(self):
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
