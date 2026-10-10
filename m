Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98270CA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 20:26:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CC1F6070C;
	Sat, 10 Oct 2026 20:26:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oq3O45qLDpz5; Sat, 10 Oct 2026 20:26:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 16E0A60711
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791663964;
	b=Ipx19xxHnsh0Ss8zb2mA+BaK0EByEBbpieimIM935O4FgS+mjJrTKStU2iZD9cIsbEOV
	 ra/b8Bz6vR7ntYOxodOrbZxmuHzZyS3UrN3/SCUNTaEdjImlOuqHulN5NRSr0OoKOt3UP
	 PLdjUDKvS7aPbYOLAYHalOBZSQWwKA0NFHaYOc6LjFn5XeHh6Q+43PJquwfFr62CkoUEb
	 42FjGekQp7FTEawBM5ljq8HZe9QDNg35rvdHTANAl9AfDO9ikGAutaTWtmvHfD9W14uUt
	 fc9MsRDqqC3ka24j9jMvDb6dwWXc2qKz3XQPEJZ43H4ilo1O5cZzdJm2A6IIuvCI2Uw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791663964;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=W0hk4Cu4HsA+lWnWAW4C0MFMc10ZoqdyHMrwdHYurVU=;
	b=ZSPhESut/cpigfc8bme7eRmDqOaWossnxzzIbkyl1emgKM22oteCPLJDEv0xoNqv8Lvf
	 8sQkxVjvz/I7ej2ucfrj6QwuaJZpz7iPgVhEtbnLin6JWTLbJN6tPwqc8JQcxW2NWxq+y
	 lHZcav37S4U3WYis9YfSeRsr04hLzVMzfnCsyedQOFheIuNkAcko07maLJ+iNjkWMnEkF
	 gDBWrRpiPFuN93WrsTC1hxy9g1Q/fx/Sf42esVL4ivgqls81jNpFHd2sl1qSiCLkT1Obo
	 MTIC1Rbmo0aWcQFg9K4LP22fpv4FB9SgBtGWokpG3hXNalmddlgVTBGhqqCIOYX4HyQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791663964;
	bh=W0hk4Cu4HsA+lWnWAW4C0MFMc10ZoqdyHMrwdHYurVU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cfLSd73yAhJrH4Q3WK7Q0b4jTBUbe35fJ0h+n5DSP9gwDZ09vaCZlMvRFNVlSwrlB
	 2U++gLguKTW0EpSqdthYj6bUF2K5RBjSBnIPCuVModN2WR0zENFyxa5BYwSFNKDIga
	 SPfwth6YbRtduiS8gcrwDmawNodwzytUPlmfm0g6VfJFDti2w2kNMuMTQGuTLXO3zi
	 RyHS4WnCXaep0MYn0luDfUKSIySeeFUC/17LOWbsmr779sJc6uDJ1bbDvRn0jsh48x
	 hV3CJbMmEUtOuDwchxUVx6XAC+WM1pwdnkwiHkcuRwBUP6QqTIMeZkIWBh9rYChodc
	 lgI35CjHgMUVg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16E0A60711;
	Sat, 10 Oct 2026 20:26:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1437D356
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:25:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 064726061D
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:25:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8tzG41orXGTz for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 20:25:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4287560632
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791663954;
 b=ntW+OBlS6qC6E9QKhRwaZyYy0ZlUNrqgKbAacNHODDL78lATIZT2/1vhAv0ColcIDIe5
 j7dW5E8utIajV90RKTz67vFGMsmSBBaCpGHhimjh+Osy8i45tK7eruFBovq59vB1BIY8G
 AQuMTOWd1UFcw2SeUg6PbmyGLH3clSK+hYilBy/vLsNNqeoowT7eGKnP6/iJITstXBckC
 RkJCkZlT/Ls1L5pbLn14BzvOenXzYCYeVG2j2uQWDRK5L5aQLizGGYR0dF4//LkzWJ9kj
 5DdK6AwMaJlubW0AsKtFjx3RKLptqDl3JjlwSq5m2C3rc6/sp17lpUvQlAs+pZuklnA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791663954;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=aTBkh1qqudLEWWMWniDf91EVsH3pFmJNZJ4tf0QQzzY=;
 b=SLsxh8DbJQJj9/ZXTHdCDpAsCuWqck4G9GdTSLuiupZEvv8YQfdGzjRj4sauAiAeBEx6
 65O88+EpZaR/KbRlDRKCxdxE77zgC3s0KUL1PXQeFfreUX+xMqWLsPYsATpcFHV3XKQSo
 zMTbin5PidJibsXoAMSGYfvJDQGeJbPU68P0lCujdqDKZutMF6ZRUuYmOkqDIL5g5+4HR
 4eGsVJ8FYHqgq358wFqJ81Mk7RB7PB5hRRs6eHzyPKnxjb1sbh0PVE/7cqmMvScpkmJbK
 A6IbwqJEfGdSmfd+BBYqzzm4dSwrHuSzpGBZmqRzqbGU9NwFpw1q48S5etAnQxsO2CQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4287560632
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:25:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EA0C69353A; Sat, 10 Oct 2026 20:24:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 22:24:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6e77b6ff697103dd2d961c3260d581b670ab9adc
X-Git-Newrev: 345c8ffc9693d1880168e2eb704b5fba5d928c42
X-Patchwork-Hint: ignore
Message-Id: <20261010202435.EA0C69353A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/generate-cyclonedx: split
 vulnerabilities per state
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/345c8ffc9693d1880168e2eb704b5fba5d928c42
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
