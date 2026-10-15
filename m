Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E11CC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E4FF611B5;
	Fri, 16 Oct 2026 13:11:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QOEKv0kledp6; Fri, 16 Oct 2026 13:11:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A0B106117F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156307;
	b=J5ZhF5y5rifJDhucQfckAPqvDotslvsDRnPCnUbk/B61DQY4TVo2e5F7GqDVEDYGD2c2
	 euJ3QBNnefrE4RphG8wfxz40xxZEphaePwSsMJlXBlUe8SqeTsyfTZvOS26OttXcrosxh
	 W6wnvsvFaQ4wB4KLd3ABQlwkLXIcWiy40BWQr9e6E4hbge/EHOjClHQ6DoUyuOyDqZ/Mo
	 Twohic9N02la331E1e5sVWWdyZlkSc6Bh8xKa2A4GApwJKEMSCvY/XQ3TFMNbb2KXoqdD
	 EFkebLQ8LwXRnMCQHGFZ9uI7DLc9ox4hpcZHyP3m87q8q+OtEfHz6eppT3QmcQHgBdg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156307;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=m29EaJiuHIBV5fzjFP1HZGSm7KgpKqU3sqgsjCZ8JjQ=;
	b=mGrZ5Oo+gK3v21XqiQX5Rn6xeVBYRUB9iOt8pKweAYp0uYuBD5kkmqWuutHYL6Y3YCYy
	 fO/Jnz3jJG8SAxRE22HmxFVt04Rycm1Ic196dnn6gJ1HXo/WXZ/GuS2lnvZQMTszA6PYz
	 RJna8/Hsrzyll/0mtSsuJi8rdfn9XodwJfJIQLlfl5uYFS1CyfZfhq/o14uUE34/vHecs
	 b6ia8Gjhfgy7YunuWVnUfB2J+Q5IzoFH0NK73GyegtnzKKV6kd3Pi//4VTBzJ0n1FYVGR
	 xUwFcVGm+GzKjJfvKUB6RsNMfrESna6ScdpyDCVCNpButTaESinYOsHYKVfbO93kV+Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156307;
	bh=m29EaJiuHIBV5fzjFP1HZGSm7KgpKqU3sqgsjCZ8JjQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Q91nrtooW6DZGKib0ZrxJiTCGFarDIwPu7IsDunum7Z+4/QbaKxalUiB80isZQjkd
	 BRyjSkbUKjvMm6nb7LAGDhOV1RTV3Jv9T8ja4MsqVlSRrxn9FW92FdN+yBcCzGJDHA
	 l8lVlQ9nucMLF6WDdmsD8gU3Qkb8Q76y85n9Dm58KLpJDmg9rPxSvmevpIH/kS5uTK
	 Ma4KRyy4AlWaR+kO6f0jlY1nPcOWnTYw4W1r5xaDACTQqWPTxb2i4KOtwSw8MOabFz
	 3wT5PhYyUkhJEaeQr+zN8RuVxYp4xri+aB/PZi2gt2mBmJjGjA83FtBos9jU1dG6EJ
	 5W1E3mgK9KcyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0B106117F;
	Fri, 16 Oct 2026 13:11:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 86F2B769
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D08F40042
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oPbte_Rc_VW5 for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:09:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org A63E140489
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156193;
 b=rnWsfu/24w8qiq7IQjTpSRhi6WB4SQPwVRh6svawDLDL1+qlfyTeSVu/8B/+Pz1+XfCW
 3UHcy2f7zvZIAdXLbUB2YM9dY8PJlNEIdHuGtk+NzCQv/nlsKN4WIgMg+B40kqDIx88Vn
 XmJaHS4hKHXNda+bxz6wkWdb9BKNbdIpNTUue/eC2/gvJl0ag6BJ27QVMBVju560G75MM
 BXWb1nWeCYdY35UYODDbgVLZBBoeITzU2H72kTTp0qRQzFP7Jpld8W/YS5zl2KWzoBAKK
 NB8pyNR1+4d32WYQjXaOeadACFsfgl/Ja4hdMQ/uIybXW0XnGbgWVixUdm7ijlJ3LRw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156193;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=vabICp8dBpisfwVDMDDGVT6Jh0Bv/ru1rWLqf7BZocU=;
 b=TK9Muz/MV6tgpCrydBvRrXx+JpcuLdbC41VisZ8SrFX9mWKTkn8nZ/WazsMJNHbvAe6r
 amTzLfi3tDWUdGNU4+0nGoUiMYrvVQv4uJ7zT931oFzB4bqhLoSZqFV2pQFgZW/D4CcNV
 IsmxqYqUpXNX3a1hbtEBCo5FNczM1WMXMMor2ZHK9kr12yEzzvJ44yfXQGlAvhpvXkFHI
 Jss2oFMlts/abvtiy2IB03kCIfwVGKLcyrrPzxk+/1PxhwVrvG+Ga/d3bXXM/6JDuaivU
 QhA/89XyRxoOIQ+Svgv6suHQ3pbc82H62GdD78Uf0NZwoCJwq30PGQupdHgrPlJI5Cw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A63E140489
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9663F960CB; Fri, 16 Oct 2026 13:08:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 15:15:27 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 5e2d464641533ab244f938dc6b67464a641a5dc6
X-Git-Newrev: d3ad19688db4360bf33fc0336fed200eecce793e
X-Patchwork-Hint: ignore
Message-Id: <20261016130832.9663F960CB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] utils/generate-cyclonedx:
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7851980319411787050=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7851980319411787050==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d3ad19688db4360bf33fc0336fed200eecce793e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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

--===============7851980319411787050==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7851980319411787050==--
