Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 779B41125833
	for <buildroot@archiver.kernel.org>; Wed, 11 Mar 2026 14:05:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BAD8422D9;
	Wed, 11 Mar 2026 14:05:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U8BualcB5OF9; Wed, 11 Mar 2026 14:05:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71B4C42326
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773237917;
	bh=rWChFDdxbUR14hRIl9TSYqNJwyqGFkN3EzQDo61Hf0U=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qFyYtq09Usp1qDPTwIWP0JaVRd7IrcxsnOvWiaN11jasGZJa0Wa6y1AhYudjyHPfN
	 n0+IBOOH+MdbeK1f5f0vJUiXc9Vk3UWGcE/2K9IEr580K5O/crOT88GU/+30nI/gnT
	 W8BL0zDC507AN9FtPxUIFjFAvGmd1ZvMgVmpjOfnobbWPaQGqTOLpr/I12tdwDPesr
	 baCRM4Q3ija+OICc5iy7cA3v7OC98TD0IpPrRcC8mO/SNlujCc6Zox8kxnABRLSslc
	 c0DT7A7yhm0u0l1VYxtaBdV8BzWqGUXjdaVpo1VkjaU7ivL88Nh113ueKLPR6LUEPw
	 Flrt+7EDIi+7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71B4C42326;
	Wed, 11 Mar 2026 14:05:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D97D228
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 14:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E48140B3E
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 14:05:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 46OZ4gi0Oyjb for <buildroot@buildroot.org>;
 Wed, 11 Mar 2026 14:05:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 224F040396
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 224F040396
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 224F040396
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 14:05:06 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b936331786dso1573310266b.3
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 07:05:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773237905; x=1773842705;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+O53dRXKLOZUwPCKH1xipfNln9bSZ6Oymu0CwUTB/ho=;
 b=DnOrLCcMTtSUxNFCCp+gYm/KhsCmAzeI5H/OqWElquza8+O30Zo44Ypirs9ytidC+c
 65aD/i4vlwZMPxUEGMBpCm0Y7ey9MVVUL++IfRaZEIUDkbvsJdpL50RLZo+PHluroOQw
 uoocAvOpJeCaHAbI/Dov6njd3GUpOVyW93NicpJ01ddqRjjAFeaUYvf+UkxvfP3OQHW3
 rft49U0dPChAgVb8rM0vz0hDdxViJhCxmay3bfY+FE/q05bvRBgSQImnAkjhsfNNdidQ
 83/9B+muXrJg86SnNMGVuuJerZtO9cUSSouzYMEUpdimUdIrl8ZvMmcuijVmrmOGY+X9
 KYug==
X-Gm-Message-State: AOJu0YytjL4/cT9wmxPFYei2ZcxvPM/MX5k6Hs7u4WNJMIbeENMT0V46
 zWilnuHfT6FEj1gnlVR48by3P4RrFJ0hn94XaIvrGJqnk1RxLnI/9Ze1PnzYGzbzaJRK53HpPw3
 LToo3
X-Gm-Gg: ATEYQzzEEw4lowM/G4UcuuWqnMkhnYWC2GFj/Bd+YPFQCGKHl/lIduALj2K8zVMNfLV
 9Wj5e30q97WWNE+++PRb6HBhzlxaMzDkmUIRUjMqnW+ZLxTo0ZrRNKUrAVplImqQq8hAKyESEjg
 cFlvup+RU2d3GoXJEXsKoMBZUhP4Zybh1sM+XD09ek1yJb8S4/ShPhoL0CsMaFAkAcOBphNIJCY
 a+ph+X9C4Gq0OqF/i33IHfC+d6+Bnrw+0E6EB/Okcc7EO8kjfEIH4Jv9EYZ6mlu3ZQ79v4N5kdO
 DET6FqXK+PCVuhxT4txYuD3iiaY/RaDibdJbepAb8H2HSz/kfqUOsereF02rVUdmHpzXMuEjg8s
 3VAtUmDHNM4zIDwYsSog6BFjGFGwQa+/7/2zRjUIzjtRmlCciyw8TsEZbIFk/sCYuUM2qZwWOPE
 6xFR7SJeZaj20sP5pXDPJnm7iU6g==
X-Received: by 2002:a17:907:2d23:b0:b96:dcc0:2e19 with SMTP id
 a640c23a62f3a-b972e5da905mr151282666b.56.1773237904566; 
 Wed, 11 Mar 2026 07:05:04 -0700 (PDT)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439f81f19dbsm7657610f8f.22.2026.03.11.07.05.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2026 07:05:04 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Wed, 11 Mar 2026 15:04:57 +0100
Message-ID: <20260311140457.140041-9-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260311140457.140041-1-thomas.perale@mind.be>
References: <20260311140457.140041-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1773237905; x=1773842705; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+O53dRXKLOZUwPCKH1xipfNln9bSZ6Oymu0CwUTB/ho=;
 b=P7n1kG/0VOWueATfGkha4DUIUW0g/B+QQgr9mUD9BlUztlSlL3udkB7YP1pHwXw5cc
 mgpSda4nIkeRTEc98Lt0Jylra4w60+UyC+PbiLGO3aE58agCYc1XjhBVqROGCmYujrbS
 7OzJFhEuv4AL0GFVQK7o5//prc/jhJ0S7/r9Lli7Wtjlj5Uv0xkPCBV1jn5kMrudLi2l
 cbOTAL2Wpw4Hpgf+l0KIBGVrnHjvEvcAkYvujPnLndj1cp+dOYsoCjHxnVRV/WFrwHvI
 fwCG7BLsIiPf9qC2WGcnE2NZioqWdv6Gj7Ks6Uc7wmZ+4dReOj6XHrB6f5uH8DbPASEk
 QOlQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=P7n1kG/0
Subject: [Buildroot] [PATCH v5 8/8] utils/generate-cyclonedx: split
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
 utils/generate-cyclonedx | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 43167d12d0..f4e0e8b539 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -249,10 +249,10 @@ class CycloneDX:
     _spdx_licenses: list = field(default_factory=list)
     """List of supported SPDX license expression. Initialized during the
     `__post_init__` step, fetched either online or from local copy"""
-    _vuln_with_pedigree: set = field(default_factory=set)
-    """Set of vulnerabilities that were addressed by a patch present in
-    buildroot tree. This set is used to set the analysis of the ignored CVEs to
-    'resolved_with_pedigree'."""
+    _vuln_with_pedigree: dict = field(default_factory=dict)
+    """Index of vulnerabilities per component ref that were addressed by a
+    patch present in buildroot tree. This index is used to set the analysis of
+    the ignored CVEs to 'resolved_with_pedigree'."""
 
     def __post_init__(self):
         self._spdx_licenses = br2_retrieve_spdx_licenses(self.options.cyclonedx_version)
@@ -297,11 +297,12 @@ class CycloneDX:
             ]
         }
 
-    def _component_patches(self, patch_list: list[str]):
+    def _component_patches(self, comp_ref: str, patch_list: list[str]):
         """Translate a list of patches from the show-info JSON to a list of
         patches in CycloneDX format.
 
         Args:
+            comp_ref (str): Reference of the component the patches are part of.
             patch_list (list): Array of patch relative paths for a given component.
 
         Returns:
@@ -324,7 +325,7 @@ class CycloneDX:
                 issue = {}
                 cves = extract_cves_from_header(header)
                 if cves:
-                    self._vuln_with_pedigree.update(cves)
+                    self._vuln_with_pedigree.setdefault(comp_ref, set()).update(cves)
                     issue = {
                         "resolves": [
                             {
@@ -387,7 +388,7 @@ class CycloneDX:
             **({
                 "cpe": comp["cpe-id"],
             } if "cpe-id" in comp else {}),
-            **(self._component_patches(comp["patches"]) if comp.get("patches") else {}),
+            **(self._component_patches(name, comp["patches"]) if comp.get("patches") else {}),
             "properties": [{
                 "name": "BR_TYPE",
                 "value": comp["type"],
@@ -421,22 +422,31 @@ class CycloneDX:
         Returns:
             list: Solved vulnerabilities list in CycloneDX format.
         """
+        # This will generate an index of affected component per
+        # (<cve-id>, <analysis-state>) tuple.
+        # In the case a CVE have different analysis based on the package they
+        # affects this will enable to create multiple entries with the same
+        # vulnerability id.
         cves = {}
 
         for name, comp in self._filtered_show_info_dict.items():
             for cve in comp.get('ignore_cves', []):
-                cves.setdefault(cve, []).append(name)
+                state = "in_triage"
+                if cve in self._vuln_with_pedigree.get(name, {}):
+                    state = "resolved_with_pedigree"
+
+                cves.setdefault((cve, state), []).append(name)
 
         return [{
             "id": cve,
             "analysis": {
-                "state": "resolved_with_pedigree" if cve in self._vuln_with_pedigree else "in_triage",
+                "state": state,
                 "detail": f"The CVE '{cve}' has been marked as ignored by Buildroot"
             },
             "affects": [
                 {"ref": bomref} for bomref in components
             ]
-        } for cve, components in cves.items()]
+        } for (cve, state), components in cves.items()]
 
     @property
     def cyclonedx(self):
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
