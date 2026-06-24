Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5425FCDE004
	for <buildroot@archiver.kernel.org>; Wed, 24 Jun 2026 10:13:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26FC840C5A;
	Wed, 24 Jun 2026 10:13:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lQ_MwVEWbLrH; Wed, 24 Jun 2026 10:13:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB89940C58
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782296035;
	bh=XuOCVYL1OL8ZX4uLE85e7JhJcCk6Y2d7a8lrYJBIBck=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=HiQ48M8H1O2kK6pEwORQc3mbS2zKOpfGjXMX5JvyESmkirhqx25Vv2ZOFuo3l5tDh
	 H6jzcNql7uevfDpcOXYzNFXPAFDtuPxAkKnSIVvE58SkN2tMkhpwXwkcbIpPkP+mBJ
	 fmioc5obrmKXw+u2H58jBMNTfC/BR2wMAXti3PUPgogjI7dGgSqvje8b9tax4dz10+
	 MOf+s8LtXfTql3MT5tlgeJNU1RIL3FH4T9bScR5BORiaIUnKRJjnvPUrVL4eeZuF6A
	 vtpyOmTZFImRIBZ5nFa4/DflSkE/7PxxjM8aM9s+IsdSV3fZXZgaa0x51ALgiMqFe3
	 vLjOnI0Ak/2OQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB89940C58;
	Wed, 24 Jun 2026 10:13:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D6469367
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 10:13:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D580404C4
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 10:13:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xPDbIZLBNWpH for <buildroot@buildroot.org>;
 Wed, 24 Jun 2026 10:13:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5D109404BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D109404BC
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5D109404BC
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 10:13:48 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-4627adcf4d6so644532f8f.3
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 03:13:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782296026; x=1782900826;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yqzuJ1z6FJHC5H5fBtRRg5UzAh320YAlICcfXqQ2Eyc=;
 b=DAKXNdapmRFjmHIGh584UnvlLDSaoUMleYs8aER7c3B4sjcMCzTbXTQzffDWXvm7WE
 k/iBRsIWh54eKSxMz62ly8W+wPwuvl6eFMtPmixeF59UFQF8kUEb9nujGK/DYXK7zlma
 3LJmQCj5JnpxAccFf2CE3NYYGDigEbUtdrZql2lfk1QN3RGJoeMnMKNu/14u/bx4Jcjm
 3Hgv1TrPUlDTP5pcb8u+/Uwz3KZ4aroyS/olJji5+DsKzqwuub6zmAtP7AFY/0wHpkAE
 g5C6URgkFapej8SM/1S1eQTCCFgXTaW/2UTcPXR2IZ3dSQr2t5+akrcg1qPgS3XT2zn6
 fejw==
X-Gm-Message-State: AOJu0YwjCEmGpCSjpUNa3IbxKFQnrC53+pN2DEmA4mBT7q2z9p795QZ3
 HvrRWIYAWJvk9wf+vo2sfNAb2AxtVmVOxPehaY9guWXMUFHA7XTtrft53Kc3GEup94Ix3zrAPsx
 8u2aF
X-Gm-Gg: AfdE7clzcReQKymVYUYLsSoK4o2fYMSSk38F6knqqriLtwIkGwBMXD7OMeY3RronVYD
 /fL1DTlcxbKOJXx8JdtDsnWPigEnD0GUtXWpUvU2ZfUmJrDsBu9x9LeUgF6GOoouEXYsubx2c9c
 VjXNbThQlQaw8t/Aqr5jVygACbj1aqLjcEEFC1MTHc0t9HcjkFyrjrPGvVn6nMe5SE28CYW2OS3
 n+4k/ChwR5p8i77NyYyawCvO4gsNka/2iCevkEZyBeszKhL7Xb7oeb2luO9TcefeRplDyV893q4
 +TeRbe15V+FHhR9cyYnsvXsgSUBMVTFJZxE8UUhl8se7T/XUHoNUZVk2m4symHxY+knE3uUv/fx
 CPLjKtGrCXbTpORnsJGd9SMt8GczL4x5fjg0hytfj0v8vHMobS82Tjf1y/tAiRAkrUtGYk2+vWb
 lDHgb3
X-Received: by 2002:a05:6000:400e:b0:468:6ce0:ef1a with SMTP id
 ffacd0b85a97d-46c0a3936e3mr4671648f8f.11.1782296026323; 
 Wed, 24 Jun 2026 03:13:46 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c221d9a22sm5441002f8f.19.2026.06.24.03.13.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 03:13:45 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 24 Jun 2026 12:13:39 +0200
Message-ID: <20260624101340.80670-8-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624101340.80670-1-thomas.perale@mind.be>
References: <20260624101340.80670-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782296026; x=1782900826; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yqzuJ1z6FJHC5H5fBtRRg5UzAh320YAlICcfXqQ2Eyc=;
 b=KTbgMBokFQBJF7491knhUjTaq6RKv7f10IAJFpU1k684k/9PnZa8IM58quaD+aLcVt
 QFdMsJRC7PgYmlcjyC44wBdasOUYvcWkcOewVTnxo1Qb4DdR39nu/hwdswHwVtiPlUTu
 FZ01Ruqm+Kiz5hxRlGfy76tTuG3iDEo2LMtIBys+1K7LoL0LuGL2nPVC0X293YATgjiP
 PRQyP3Ruw31q28kBOE5oD1KRSsTUDl6I0Toow3RXFR/igsmISP0R0DSWb6JrKovCZyLl
 uTdqM70g5K5JkZRI64ALbDsndR9yCna+ZtzMFeCN2yg0Aft94gZdrnbVrzxm8KS4yWJl
 PHyg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=KTbgMBok
Subject: [Buildroot] [PATCH 8/9] utils/generate-cyclonedx: split
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: Quentin Schulz <quentin.schulz@cherry.de>,
 Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
 utils/generate-cyclonedx | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 672e7ed815..e12a9a4629 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -14,6 +14,7 @@ import json
 import os
 from pathlib import Path
 from typing import Iterator
+from collections import defaultdict
 import urllib.parse
 import urllib.request
 import urllib.error
@@ -39,7 +40,7 @@ BR2_VERSION_FULL = (
 # Set of vulnerabilities that were addressed by a patch present in buildroot
 # tree. This set is used to set the analysis of the ignored CVEs to
 # 'resolved_with_pedigree'.
-VULN_WITH_PEDIGREE = set()
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
+            if cve in VULN_WITH_PEDIGREE.get(name, {}):
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
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
