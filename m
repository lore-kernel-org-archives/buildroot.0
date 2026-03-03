Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0BF8EDA685
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 15:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 901BD41A73;
	Tue,  3 Mar 2026 15:17:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3xQfUDumUu6w; Tue,  3 Mar 2026 15:17:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C81EF41A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772551025;
	bh=T9Q0BYJhWBqekfZXRrmrp7Mt6lk82ThUtGKybH32cYY=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=grfdXkw+F1jmvrCbtPDml60HeLtSZvT3AYCyOdFKdZjVz4LKmu9nS28miBBV0EjNC
	 4+GcseVA/YsKNGVHc+bSeYlw5F0Y3CaTq7fwlTaUG73+GfryOaHpuVIxz3QaFqY6T1
	 xq3K3+nCBIhH/iDnGkHUK9YPahta/RevGK4q4e9fGBObzGcwHCLwCGkjHr0lJvmkLO
	 ndVkWgPWimRruG6dOtTGtllX/sv8yu07ydZ31hrRE6SK59apZxDNWwjdzrNv1wWcu1
	 oQsKcu03Bkgn5dyAP5aMATENeFAxK2TlgxnfLqNumNv7Pu1tr7hhcE42gD8FG/SxPV
	 +6s769woOj3tw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C81EF41A4B;
	Tue,  3 Mar 2026 15:17:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 76D46231
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 15:17:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 68E5640281
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 15:17:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R89DOmjS_T9m for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 15:17:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3F4DC4018D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F4DC4018D
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3F4DC4018D
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 15:17:03 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4836f363ad2so68749275e9.1
 for <buildroot@buildroot.org>; Tue, 03 Mar 2026 07:17:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772551021; x=1773155821;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YzU7Wx3Fx35x3grlNU5ax/Z8kbgZd5Its6YU5BwBew0=;
 b=tVEsT4w9qSpLxsESHd2IWU2vqhc8H6IC1lwLwkJryC5GWim8mN6dK02SmPT/IEXfAQ
 Xw9OeNcR5vzamzrReBCdxDBCXeFI4HPA4ShHhZlnr0zMMJPy7wMGsMhBf1qcnp5a3W74
 nXJzoLqv6NASthV3pL+sYLgI79+IfRduE9omBSFD6RO+Qey2KryU845ssAoJAserytlo
 dV+9/MYVRi/23OVDkhwjqQSvWdpMlLQUZqUHodAnVRpeEur22faxDwK9/oaga4g2jJ1c
 KgJ0TAxEO6qZjE+IG99TxuActu9/c/6RLyeeYiGgesN/WFb1o0ocfmvhLmi2K8iMFUit
 BgNw==
X-Gm-Message-State: AOJu0YzTNsQu63ko+V87iBJkGLii611s4i+QLUgN5jnZMW8cguYiunft
 sOYEeM/YslXXcNvtKZy5Xc9SDv1lGokJzFttipKXQsGBzZ2VFXFTBTK35B8tnKf5xuv3R1NWxlF
 8L76V
X-Gm-Gg: ATEYQzwIRah7nCs/4VVL9j9YTLzpaHZGwwLUCCPSaV8sFrvPmQG0RS/LLHiFfRDrKr/
 3EeNO/WMkasDUE6eg6YeAciV2zk94PIH9iKw0BZw3w9ZkwFC62UHllmO1o3bbJfiKJv/8oLyfLf
 03uITszcReApNhVtkP5k2HyTZhNTayypWRZw5Cti5LXZEHHzVh9+d+zO4GllXj1r3xBA49vlCyG
 UCVAHJvMxcPnRV5WKsACSo9nhZ/jMtYHYdLStWBE2T/83UX0SIH6wNqTfFiMvIklE68VAs15EKa
 xjA1VRzNVnWbUtswc9psbKXNNWi42LpXYrKfxlboYQtnftmAO8FktyEUvOay9zQ/ZnRcglsTMyJ
 KT1VD32uTUCL3Rf1EoiW2THUuljtz9wyqFmhF/LCeJ8II/M/+v79uvX8TDBMq76boKXvKyNaGDk
 FjO2S4GBtKeyEcVNY=
X-Received: by 2002:a05:600c:6994:b0:477:c478:46d7 with SMTP id
 5b1f17b1804b1-483c9c0b88amr279977935e9.22.1772551020687; 
 Tue, 03 Mar 2026 07:17:00 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485135d52f6sm17839655e9.31.2026.03.03.07.16.58
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 07:16:59 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue,  3 Mar 2026 16:16:40 +0100
Message-ID: <20260303151641.382820-9-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303151641.382820-1-thomas.perale@mind.be>
References: <20260303151641.382820-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772551021; x=1773155821; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YzU7Wx3Fx35x3grlNU5ax/Z8kbgZd5Its6YU5BwBew0=;
 b=eTX7xZOr2Ih6QUyzfGS2nTLaWlFvVueYzOU5k/ZwrVrsKLwDJ0Vs6JDc9jCdPPePPj
 XJyZUbdbRtiZG0gpNfKzEfyZJWX1V77i3AwnPXsA2QjnMWSb7BDNoB/OsKPnWlut/+nH
 9tVriCHxUzv+323AgUoV5fj4bm3U3t1nCuosBc+E9k/zhCyRCTVTns5Y4+3DFfu84ciq
 Znr2HD/odrIcwYNOosQ6/tyqie0YUGmB4/f3TdXpCCshXYRskfR1uu32Uq08jbH0RUru
 J5hPIUyDqDNWriBfBrp4zVDWRG/WY6B0Qj0KEMuTjMGnIcD/AH5vA4ek+qGDlbMzV2mU
 wlgA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=eTX7xZOr
Subject: [Buildroot] [PATCH v4 8/8] utils/generate-cyclonedx: split
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
index f3e3102f2a..57e581fd35 100755
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
