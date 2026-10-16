Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3752CCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A72B61026;
	Fri, 16 Oct 2026 13:10:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DyFQMh38t9Jo; Fri, 16 Oct 2026 13:10:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EE7306101A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156248;
	b=AMWduWtTHk9Lu0MTNQnMrCFhB3vsMeFc1xc7H9MJX+CP7/eunI0NAwSIO85jQNlsi6ti
	 drZoDM/ZbLU72sFImBaRWfWNgYcXZ5mf5EqYSeDT869CxsB5J+y7a48yBgf+JoFQ6MQPB
	 N38inkoyBrAGW+WFnkEY90WFzzxbYwSj5mIyAANOAG7NfHO6c7hoi64zvBnaGBvAQk+95
	 2Yy7BLsygVw/yOb9wLNdTG50e8vj+u8S/SFIOCGGZcUi5MGUaMq7ImzTi5+dsCZl1JjMQ
	 KPBCjDtc5wJIErScKNBW3IRzqcUvpR7tttwIoZEdawpc6N60U/nQUy9fGYUgq/4JDag==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156248;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=+ytzVxa91QtuwzMqtRxtJGX8JrieVWMpQFlzysqrHF0=;
	b=DwJBFf9Iwly5vFoXerko7Go07fynAPfgJA4fy6Em9hs2PPWGLBQ4YyHQcAYsZIXvUz6Q
	 jyHR3wgaxGcfX8Eh4/l4UPwVYQMbCCRPl/Z+zguQGfe9W22nmPkoxea9cwwL84coNlIIo
	 Ht+NqdqGDRSD3Xcr9yt4yWjQ7pFyVNBFdgQoh0LtDsgM9k/3Vw5Yw3GPFT8fQ24VLkooV
	 ixVuy6yZ2hTDrz3rY/7y51bgDNm1jeav71bEuNbUi5nrLCNkbm9AeQkgqJAgOMENimv9t
	 wv75/5HnGphEbTbuQ9ubFQJ1XAd7yhee2wkQLyl5INr7UDzsiA1D7R1k82BNFUxQ6Fg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156248;
	bh=+ytzVxa91QtuwzMqtRxtJGX8JrieVWMpQFlzysqrHF0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LBexe2vfEmCBQ+xKM5Ra8A4x+F2fqvcppgZVq0Rv6yJr9eaz2LpM769Bfh9PmQvmo
	 jBpNA6lOPfZxRrBz4JFgEvnS7A/LzX8OGP8anuW4HZZCKxpF3BReQezQz2MHJvrfuH
	 GwTkHeKIRnnMzl+ux42zpui7RC451wwWodsRu3hAD+mlcXJ79JcIrWguIGWh+BtLDn
	 KYNkjPGvClcbhJzRleTZ/mXp9iEnSg+vAJPlA9qbJSo4JuiQ37dPZleGunkwNhkTZ2
	 G8EYopUy7KlQjPpX+sF9De7nuF/8ZENP9mFu7bznmpYt6+D794Bsr2LeryDgcRnRJ7
	 6ju8tHh/BMu0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE7306101A;
	Fri, 16 Oct 2026 13:10:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 34E0A151A
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24A02814BA
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rqx_5QM1yML1 for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A56FC814C3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156108;
 b=mdgABgwRovP3NKZez31oY/eJKMCzvfEk1kArHlwg0MismP/Vv2GuBM1NIeIZk5b+CT/m
 RSUJouAHKrQ0gJKxiM3OgL5F9Wj5V1HANFptN9gE6ZnY8sDCcs+hLseOtwNHAUXct3sZm
 YfL+qRyqacLILACVNFy9p6vmMWkuC6dJebS87dCZssW3/2C5m0qixSQVR/KfZcP3mNArK
 UAC6lzeJ5ValykIDK80cVv0VUDB1Tw+4S00lOHQOo/qy5l5RzoUMkhpADNkYFvih09IY2
 vpxKtPZKLLabHaNjESXGuKBtSGNS219nz/47pA26tNk66DVuC7IWHfH2VunYz5B5lug==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156108;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=zv0JZzvbAelrIh9ZaTSRhO44sPmNXqY3LojZjgxqbLU=;
 b=SnNDPoX7tGqS7f84a1Pwiv/cxV2vgyIbSwXtAAubP9Se6PI4wVIXdlyROzoSpcMgoNyu
 MDLw8E6EvlrPVhlp9Jx8T7AZPM9YifQIs9h4Ht/YI1IkGTmSCLk8kEyxZLb3p/id6cKDy
 WOSXW5XB5ORh5pYzZMO5eNDw8a/CfLE+68LPqnF4wIBQoq7dT3n31dlbEp68PE8YASo4x
 WBJBuyPES5jEwNpAr7u1/wLHefSmLNIq/U7FVlN7/PRUzBEQ9y1dY3G6fWTwufhKEfnvy
 UY27NIA2+PkRmQtNVYn9RRY7dVTUeSbhFsVwQpMB6gnI4MNIknWy3ApkWJhgLfaolrA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A56FC814C3
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 96825960D5; Fri, 16 Oct 2026 13:07:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 8d80b2751bc0fde1ea81396008c9757c6d26e318
X-Git-Newrev: 8c060cf938222f0b06e8ae3c95558b8af4bd572f
X-Patchwork-Hint: ignore
Message-Id: <20261016130707.96825960D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] utils/generate-cyclonedx:
 split vulnerabilities per state
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5166562707864248455=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5166562707864248455==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8c060cf938222f0b06e8ae3c95558b8af4bd572f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

If a vulnerability is present in multiple components and only one of
them has a patch that addresses that vulnerability, all components will
currently have that vulnerability marked as `resolved_with_pedigree`.

Right now, this issue does not affect any packages, but in the future it
might affect packages that provide multiple version options (e.g.
gnupg and gnupg2).

There is a small chance this happens in a real-world use case, but it
may occur in the context of maintenance when running
`make show-info-all`.

This commit changes how vulnerabilities fixed by a patch are stored.
Instead of placing all vulnerabilities into a single set, it now keeps an
index of the component for which the patch has been applied.

When generating the vulnerability list, the component reference is
checked instead of only the vulnerability ID. If a vulnerability ID has
multiple states for different references, multiple vulnerability
entries are created with distinct analyses.

Consider the hypothetical case where gnupg ignores a vulnerability
because it was introduced in a later version, while gnupg2 has patched
that vulnerability. This would result in the following JSON:

```json
[
    {
        "id": "CVE-1234-1234",
        "analysis": {
            "state": "in_triage",
            "detail": "The CVE 'CVE-1234-1234' has been marked as ignored by Buildroot"
        },
        "affects": [
            {"ref": "gnupg"}
        ]
    },
    {
        "id": "CVE-1234-1234",
        "analysis": {
            "state": "resolved_with_pedigree",
            "detail": "The CVE 'CVE-1234-1234' has been marked as ignored by Buildroot"
        },
        "affects": [
            {"ref": "gnupg2"}
        ]
    }
]
```

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
[Arnout:
 - update the VULN_WITH_PEDIGREE comment to match the code
 - use set() as default instead of {}]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 345c8ffc9693d1880168e2eb704b5fba5d928c42)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 utils/generate-cyclonedx | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index fa20f6c1cf..98009cef98 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -12,6 +12,7 @@ import argparse
 import importlib.util
 import json
 import os
+from collections import defaultdict
 from pathlib import Path
 from typing import Iterator
 import urllib.error
@@ -36,10 +37,10 @@ BR2_VERSION_FULL = (
     .strip()
 )
 
-# Set of vulnerabilities that were addressed by a patch present in buildroot
-# tree. This set is used to set the analysis of the ignored CVEs to
-# 'resolved_with_pedigree'.
-VULN_WITH_PEDIGREE = set()
+# Vulnerabilities that were addressed by a patch present in buildroot tree,
+# as a set per component reference. This is used to set the analysis of the
+# ignored CVEs of that component to 'resolved_with_pedigree'.
+VULN_WITH_PEDIGREE = defaultdict(set)
 
 SPDX_LICENSES = []
 
@@ -218,11 +219,12 @@ def read_patch_file(patch_path: Path) -> str:
         return f.read()
 
 
-def cyclonedx_patches(patch_list: list[str]):
+def cyclonedx_patches(comp_ref: str, patch_list: list[str]):
     """Translate a list of patches from the show-info JSON to a list of
     patches in CycloneDX format.
 
     Args:
+        comp_ref (str): Reference of the component the patches are part of.
         patch_list (list): Array of patch relative paths for a given component.
 
     Returns:
@@ -245,7 +247,7 @@ def cyclonedx_patches(patch_list: list[str]):
             issue = {}
             cves = extract_cves_from_header(header)
             if cves:
-                VULN_WITH_PEDIGREE.update(cves)
+                VULN_WITH_PEDIGREE[comp_ref].update(cves)
                 issue = {
                     "resolves": [
                         {
@@ -402,7 +404,7 @@ def cyclonedx_component(name, comp):
             "cpe": comp["cpe-id"],
         } if "cpe-id" in comp else {}),
         **cyclonedx_external_refs(comp),
-        **(cyclonedx_patches(comp["patches"]) if comp.get("patches") else {}),
+        **(cyclonedx_patches(name, comp["patches"]) if comp.get("patches") else {}),
         "properties": [{
             "name": "BR_TYPE",
             "value": comp["type"],
@@ -437,11 +439,14 @@ def cyclonedx_vulnerabilities(show_info_dict):
     Returns:
         list: Solved vulnerabilities list in CycloneDX format.
     """
-    cves = {}
+    cves = defaultdict(list)
 
     for name, comp in show_info_dict.items():
         for cve in comp.get('ignore_cves', []):
-            cves.setdefault(cve, []).append(name)
+            state = "in_triage"
+            if cve in VULN_WITH_PEDIGREE.get(name, set()):
+                state = "resolved_with_pedigree"
+            cves[(cve, state)].append(name)
 
     return [{
         "id": cve,
@@ -450,13 +455,13 @@ def cyclonedx_vulnerabilities(show_info_dict):
             "url": "https://nvd.nist.gov/vuln/detail/" + cve
         },
         "analysis": {
-            "state": "resolved_with_pedigree" if cve in VULN_WITH_PEDIGREE else "in_triage",
+            "state": state,
             "detail": f"The CVE '{cve}' has been marked as ignored by Buildroot"
         },
         "affects": [
             {"ref": bomref} for bomref in components
         ]
-    } for cve, components in cves.items()]
+    } for (cve, state), components in cves.items()]
 
 
 def br2_virtual_is_provided_by(ref, show_info_dict) -> list:

--===============5166562707864248455==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5166562707864248455==--
