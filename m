Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B1E1E83F15
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 13:54:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEC9640C98;
	Wed,  4 Feb 2026 13:54:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lP0QZY1Ki67w; Wed,  4 Feb 2026 13:54:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C151740C6C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770213257;
	bh=y9ELSIN8V8X41dVvRjNfJtomRncK7W1tuaypaI+FNW8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=tGvad55qc37Oo46p1gJXSKcJhbEm4NMzvQkLFp9LUzMIIBBmAvHHArSNPvcHbZ4Q/
	 7nGQRnSKaDx1znuWNLJNCd/2krqbL4meq+iPgwMSAdCPcXjR65mKWQaKXZkleZS4ts
	 1Li3jctPemuCmynEzwo9zDCUTw9RA9+qcBo5fzMX1ldq/+LqGstYalCJWPVNSKnB3f
	 X+h9aBXmvcTLn7Qh6vHc3L49+HbK72MLaqGFRXA+H7SseVhXDF+vzg7e/iBO2Rcqjg
	 p6s43zcOR77Nad2F4YUJEK5CGpm/AfM32B4gUx6sw+YgD153z0ZAXn+fiESNlXECMn
	 QZxR2fJt6w05Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C151740C6C;
	Wed,  4 Feb 2026 13:54:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B14AF4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B4684064F
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:54:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j756QzmJday1 for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 13:54:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8C3FA40658
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C3FA40658
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8C3FA40658
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:54:05 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4806ce0f97bso58353255e9.0
 for <buildroot@buildroot.org>; Wed, 04 Feb 2026 05:54:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770213243; x=1770818043;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VBQM+jV3fq0HLYQ7aTgyhepv2MtHl1r06GRHHVP+vBg=;
 b=RrjqqKf3WWJ1BDmhvRrwc0ACnHi+DHmmnBqy6fhH4cu+HrObFGtK1xil3O2Rbtz37S
 x7omH9MT6pol8EHt4wzjmv+kKYzbUEyENvUFS0cQwLC/EGqE16mGjEgVRGZ+qG2/h7iu
 30nGyhSw4qO+FsBFmzYeufAT8efgCkZ8fsEyhCFHW7dKvyD0YMxVwGcOo2SDI7OamFbU
 bM8UOee9bhCWaJKsjdgLkElDjpKC38WsDJiX/r3c3ZwuCfs/XRuIK3joCKQpgg84jPCV
 OKEA//2t6j3q01G1AFAzG52U353B+cpEvHTh4TwZpkEXq3mHf0UdCFqff9i2EcfreVZj
 z04Q==
X-Gm-Message-State: AOJu0YyHi40j8ZzfwUw9OKr00PuqdDGw511/JDgWpmU0k7skBkFNnCeE
 K57u2EITuvamcBawGUPd60+i74hO/YS8PY/73mLdIqahVWJTXzHojKg9lpYh/aRnWiHdG2jprWP
 WwXl3
X-Gm-Gg: AZuq6aK452Okf+H0Y37k/GzczL/7/Gv25x9Vmk5laowpl0EniJ7XhqAuVyVcyYQrvAr
 jbzPXX/F4CoZ+5knN/AV+IfMWWyYhiDUMK9LJ4gkt2EzZHnoq0N6w8TEKZnx7LQrU/N9158x6WS
 cBDczJh1Sbtv2R8LXwDunhQ52H+wgzPfzH2JkNFIcsINE4Hu7RvXhfCPSbMjn+zBMVUiEug7zJV
 PE2gcz3OWQ6XnZ/ouraGqgTuHujuUGpivmhHr2w7jr+k+KRNrpEg+EiY5h2iqp55k28s3MjWe10
 XD38IjZhFqd979U60++ggGnadc73PXjHmBRfo8Y5w5jvbZ5KvR9yfINS6pj+ltYZNcEXLCjd4bF
 K1mBbCQp5MWRdBce9KbTlxwbCLH1ZZHLTgyv7oTmO9gPub31jz6Up1igXxQIO+jWnSRznMr6ms+
 6jxx5ge0GiUCB8037XGvB/GjjfAWT9RGlGWA7XNVCoZ8o=
X-Received: by 2002:a05:600c:468b:b0:479:3a86:dc1c with SMTP id
 5b1f17b1804b1-4830e99c72emr41049635e9.36.1770213243042; 
 Wed, 04 Feb 2026 05:54:03 -0800 (PST)
Received: from mindpad (host-109-89-232-55.dynamic.voo.be. [109.89.232.55])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48310880598sm41026035e9.0.2026.02.04.05.54.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Feb 2026 05:54:02 -0800 (PST)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
	titouan.christophe@mind.be
Date: Wed,  4 Feb 2026 14:53:58 +0100
Message-ID: <20260204135400.307638-4-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260204135400.307638-1-thomas.perale@mind.be>
References: <20260204135400.307638-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770213243; x=1770818043; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VBQM+jV3fq0HLYQ7aTgyhepv2MtHl1r06GRHHVP+vBg=;
 b=Veh6tJ8swJhJsnkQuk/zZZOgGChm/bgIcCXsoqNsGow7vHh8tZf2sfuZK/vYYdjxn8
 vzp1dodjAD6gPDDVpBGUShk7lf1gRFX5+/5QpP+qP/hIInV6ftAiaQbsSyxHWabeSFoZ
 S5XFfZ7wR/soUCyxb094EAaelILWQE390980LeHnJ2IDwswxG/WxhdC66DJRzmW/s24D
 wZzDXR22tWIxJv6y8AVeV1ptKfH0f7P8z3V1iptiYbD2t/yWBlT/eAIfqbYO7XiIUXv/
 aJd55f7AJNEJQly84870ksaea+upMSUqvNncZEOkLsMRLoXfH/dx9ywvqNJhOiT7OpLv
 6UTQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Veh6tJ8s
Subject: [Buildroot] [PATCH v3 4/6] utils/generate-cyclonedx: encapsulate
 CycloneDX generation functions
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

Since the script is starting to get bigger, it's also starting to get
more difficult to keep track of all the different functions.
This commit move all the functions that generate a part of the CycloneDX
SBOM spec under the same `CycloneDX` dataclass.

It also allows to avoid to have to deal with a top-level shared context
for the SBOM generation.

Additionnaly, two structure are created: the `Context` and `Filter` one.
They hold arguments passed from the CLI.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 utils/generate-cyclonedx | 485 +++++++++++++++++++++------------------
 1 file changed, 263 insertions(+), 222 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index facbd6c78f..24c15df94e 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -18,7 +18,8 @@ import urllib.request
 import subprocess
 import sys
 import re
-from typing import Tuple
+from typing import Mapping, Tuple
+from dataclasses import dataclass, field
 
 
 CYCLONEDX_VERSION = (1, 6)
@@ -35,13 +36,21 @@ BR2_VERSION_FULL = (
     .strip()
 )
 
-# Set of vulnerabilities that were addressed by a patch present in buildroot
-# tree. This set is used to set the analysis of the ignored CVEs to
-# 'resolved_with_pedigree'.
-VULN_WITH_PEDIGREE = set()
 
-# List of supported SPDX license expression.
-SPDX_LICENSES = []
+@dataclass(frozen=True)
+class Options:
+    cyclonedx_version: Tuple[int, int]
+    """CycloneDX Spec version"""
+    project_name: str
+    """Specify the project name to use in the SBOM metadata"""
+    project_version: str
+    """Specify the project version to use in the SBOM metadata"""
+
+
+@dataclass(frozen=True)
+class Filters:
+    virtual: bool
+    """Includes virtual packages to the output"""
 
 
 def br2_retrieve_spdx_licenses(version: Tuple[int, int]):
@@ -227,179 +236,245 @@ def split_top_level_comma(subj):
     yield substring
 
 
-def cyclonedx_license(lic):
-    """Given the name of a license, create an individual entry in
-    CycloneDX format. In CycloneDX, the 'id' keyword is used for
-    names that are recognized as SPDX License abbreviations. All other
-    license names are placed under the 'name' keyword.
-
-    Args:
-        lic (str): Name of the license
-
-    Returns:
-        dict: An entry for the license in CycloneDX format.
-    """
-    key = "id" if lic in SPDX_LICENSES else "name"
-    return {
-        key: lic,
-    }
-
-
-def cyclonedx_licenses(lic_list):
-    """Create a licenses list formatted for a CycloneDX component
-
-    Args:
-        lic_list (str): A comma separated list of license names.
-
-    Returns:
-        dict: A dictionary with license information for the component,
-        in CycloneDX format.
-    """
-    return {
-        "licenses": [
-            {"license": cyclonedx_license(lic.strip())} for lic in split_top_level_comma(lic_list)
-        ]
-    }
-
-
-def cyclonedx_patches(patch_list: list[str]):
-    """Translate a list of patches from the show-info JSON to a list of
-    patches in CycloneDX format.
-
-    Args:
-        patch_list (list): Array of patch relative paths for a given component.
-
-    Returns:
-        dict: Patch information in CycloneDX format.
-    """
-    patch_contents = []
-    for patch in patch_list:
-        patch_path = brpath / patch
-        if patch_path.exists():
-            try:
-                content = read_patch_file(patch_path)
-            except Exception:
-                # If the patch can't be read it won't be added to
-                # the resulting SBOM.
-                print(f"Failed to handle patch: {patch}", file=sys.stderr)
-                continue
-
-            header = patch_retrieve_header(content)
-
-            issue = {}
-            cves = extract_cves_from_header(header)
-            if cves:
-                VULN_WITH_PEDIGREE.update(cves)
-                issue = {
-                    "resolves": [
-                        {
-                            "type": "security",
-                            "name": cve
-                        } for cve in cves
-                    ]
-                }
+@dataclass
+class CycloneDX:
+    show_info_dict: Mapping
+    """Output of Buildroot `make show-info` converted as a dict."""
+    options: Options
+    """CycloneDX generation options passed from the CLI arguments"""
+    filters: Filters
+    """Filters that apply to the `show_info_dict` content"""
+    _filtered_show_info_dict: Mapping = field(default_factory=dict)
+    """Subset of `show_info_dict` based on the `Filters` passed in the the
+    `filters` argument."""
+    _spdx_licenses: list = field(default_factory=list)
+    """List of supported SPDX license expression. Initialized during the
+    `__post_init__` step, fetched either online or from local copy"""
+    _vuln_with_pedigree: set = field(default_factory=set)
+    """Set of vulnerabilities that were addressed by a patch present in
+    buildroot tree. This set is used to set the analysis of the ignored CVEs to
+    'resolved_with_pedigree'."""
+
+    def __post_init__(self):
+        self._spdx_licenses = br2_retrieve_spdx_licenses(self.options.cyclonedx_version)
+
+        # Remove rootfs and virtual packages if not explicitly included
+        # from the cli arguments
+        self._filtered_show_info_dict = {
+            k: v for k, v in self.show_info_dict.items()
+            if ("rootfs" not in v["type"]) and (self.filters.virtual or v["virtual"] is False)
+        }
+
+    def _component_licenses_license(self, lic: str):
+        """Given the name of a license, create an individual entry in
+        CycloneDX format. In CycloneDX, the 'id' keyword is used for
+        names that are recognized as SPDX License abbreviations. All other
+        license names are placed under the 'name' keyword.
+
+        Args:
+            lic (str): Name of the license
+
+        Returns:
+            dict: An entry for the license in CycloneDX format.
+        """
+        key = "id" if lic in self._spdx_licenses else "name"
+        return {
+            key: lic,
+        }
+
+    def _component_licenses(self, lic_list: str):
+        """Create a licenses list formatted for a CycloneDX component
+
+        Args:
+            lic_list (str): A comma separated list of license names.
+
+        Returns:
+            dict: A dictionary with license information for the component,
+            in CycloneDX format.
+        """
+        return {
+            "licenses": [
+                {"license": self._component_licenses_license(lic.strip())} for lic in split_top_level_comma(lic_list)
+            ]
+        }
+
+    def _component_patches(self, patch_list: list[str]):
+        """Translate a list of patches from the show-info JSON to a list of
+        patches in CycloneDX format.
+
+        Args:
+            patch_list (list): Array of patch relative paths for a given component.
+
+        Returns:
+            dict: Patch information in CycloneDX format.
+        """
+        patch_contents = []
+        for patch in patch_list:
+            patch_path = brpath / patch
+            if patch_path.exists():
+                try:
+                    content = read_patch_file(patch_path)
+                except Exception:
+                    # If the patch can't be read it won't be added to
+                    # the resulting SBOM.
+                    print(f"Failed to handle patch: {patch}", file=sys.stderr)
+                    continue
+
+                header = patch_retrieve_header(content)
+
+                issue = {}
+                cves = extract_cves_from_header(header)
+                if cves:
+                    self._vuln_with_pedigree.update(cves)
+                    issue = {
+                        "resolves": [
+                            {
+                                "type": "security",
+                                "name": cve
+                            } for cve in cves
+                        ]
+                    }
 
-            patch_contents.append({
-                "diff": {
-                    "text": {
-                        "content": content
+                patch_contents.append({
+                    "diff": {
+                        "text": {
+                            "content": content
+                        }
+                    },
+                    **issue
+                })
+            else:
+                # If the patch is not a file it's a tarball or diff url passed
+                # through the `<pkg-name>_PATCH` variable.
+                patch_contents.append({
+                    "diff": {
+                        "url": patch
                     }
+                })
+
+        return {
+            "pedigree": {
+                "patches": [{
+                    "type": "unofficial",
+                    **content
+                } for content in patch_contents]
+            },
+        }
+
+    def _component(self, name: str, comp: dict):
+        """Translate a component from the show-info output, to a component entry in CycloneDX format.
+
+        Args:
+            name (str): Key used for the package in the show-info output.
+            comp (dict): Data about the package as a Python dictionary.
+
+        Returns:
+            dict: Component information in CycloneDX format.
+        """
+        return {
+            "bom-ref": name,
+            "type": "library",
+            **({
+                "name": comp["name"],
+            } if "name" in comp else {}),
+            **({
+                "version": comp["version"],
+                **(self._component_licenses(comp["licenses"]) if "licenses" in comp else {}),
+            } if not comp["virtual"] else {}),
+            **({
+                "cpe": comp["cpe-id"],
+            } if "cpe-id" in comp else {}),
+            **(self._component_patches(comp["patches"]) if comp.get("patches") else {}),
+            "properties": [{
+                "name": "BR_TYPE",
+                "value": comp["type"],
+            }],
+        }
+
+    def _dependency(self, ref: str, depends: list):
+        """Create JSON for dependency relationships between components.
+
+        Args:
+            ref (str): reference to a component bom-ref.
+            depends (list): array of component bom-ref identifier to create the dependencies.
+
+        Returns:
+            dict: Dependency information in CycloneDX format.
+        """
+        return {
+            "ref": ref,
+            "dependsOn": sorted(depends),
+        }
+
+    @property
+    def vulnerabilities(self):
+        """Create a JSON list of vulnerabilities ignored by buildroot and associate
+        the component for which they are solved.
+
+        Args:
+            show_info_dict (dict): The JSON output of the show-info
+                command, parsed into a Python dictionary.
+
+        Returns:
+            list: Solved vulnerabilities list in CycloneDX format.
+        """
+        cves = {}
+
+        for name, comp in self._filtered_show_info_dict.items():
+            for cve in comp.get('ignore_cves', []):
+                cves.setdefault(cve, []).append(name)
+
+        return [{
+            "id": cve,
+            "analysis": {
+                "state": "resolved_with_pedigree" if cve in self._vuln_with_pedigree else "in_triage",
+                "detail": f"The CVE '{cve}' has been marked as ignored by Buildroot"
+            },
+            "affects": [
+                {"ref": bomref} for bomref in components
+            ]
+        } for cve, components in cves.items()]
+
+    @property
+    def cyclonedx(self):
+        return {
+            "bomFormat": "CycloneDX",
+            "$schema": "http://cyclonedx.org/schema/bom-{}.{}.schema.json".format(*self.options.cyclonedx_version),
+            "specVersion": "{}.{}".format(*self.options.cyclonedx_version),
+            "metadata": {
+                "component": {
+                    "bom-ref": self.options.project_name,
+                    "name": self.options.project_name,
+                    "version": self.options.project_version,
+                    "type": "firmware",
                 },
-                **issue
-            })
-        else:
-            # If the patch is not a file it's a tarball or diff url passed
-            # through the `<pkg-name>_PATCH` variable.
-            patch_contents.append({
-                "diff": {
-                    "url": patch
+                "tools": {
+                    "components": [
+                        {
+                            "type": "application",
+                            "name": "Buildroot generate-cyclonedx",
+                            "version": f"{BR2_VERSION_FULL}",
+                            "licenses": [
+                                {
+                                    "license": {
+                                        "id": "GPL-2.0"
+                                    }
+                                }
+                            ]
+                        }
+                    ],
                 }
-            })
-
-    return {
-        "pedigree": {
-            "patches": [{
-                "type": "unofficial",
-                **content
-            } for content in patch_contents]
-        },
-    }
-
-
-def cyclonedx_component(name, comp):
-    """Translate a component from the show-info output, to a component entry in CycloneDX format.
-
-    Args:
-        name (str): Key used for the package in the show-info output.
-        comp (dict): Data about the package as a Python dictionary.
-
-    Returns:
-        dict: Component information in CycloneDX format.
-    """
-    return {
-        "bom-ref": name,
-        "type": "library",
-        **({
-            "name": comp["name"],
-        } if "name" in comp else {}),
-        **({
-            "version": comp["version"],
-            **(cyclonedx_licenses(comp["licenses"]) if "licenses" in comp else {}),
-        } if not comp["virtual"] else {}),
-        **({
-            "cpe": comp["cpe-id"],
-        } if "cpe-id" in comp else {}),
-        **(cyclonedx_patches(comp["patches"]) if comp.get("patches") else {}),
-        "properties": [{
-            "name": "BR_TYPE",
-            "value": comp["type"],
-        }],
-    }
-
-
-def cyclonedx_dependency(ref, depends):
-    """Create JSON for dependency relationships between components.
-
-    Args:
-        ref (str): reference to a component bom-ref.
-        depends (list): array of component bom-ref identifier to create the dependencies.
-
-    Returns:
-        dict: Dependency information in CycloneDX format.
-    """
-    return {
-        "ref": ref,
-        "dependsOn": sorted(depends),
-    }
-
-
-def cyclonedx_vulnerabilities(show_info_dict):
-    """Create a JSON list of vulnerabilities ignored by buildroot and associate
-    the component for which they are solved.
-
-    Args:
-        show_info_dict (dict): The JSON output of the show-info
-            command, parsed into a Python dictionary.
-
-    Returns:
-        list: Solved vulnerabilities list in CycloneDX format.
-    """
-    cves = {}
-
-    for name, comp in show_info_dict.items():
-        for cve in comp.get('ignore_cves', []):
-            cves.setdefault(cve, []).append(name)
-
-    return [{
-        "id": cve,
-        "analysis": {
-            "state": "resolved_with_pedigree" if cve in VULN_WITH_PEDIGREE else "in_triage",
-            "detail": f"The CVE '{cve}' has been marked as ignored by Buildroot"
-        },
-        "affects": [
-            {"ref": bomref} for bomref in components
-        ]
-    } for cve, components in cves.items()]
+            },
+            "components": [
+                self._component(name, comp) for name, comp in self._filtered_show_info_dict.items()
+            ],
+            "dependencies": [
+                self._dependency(self.options.project_name, list(self._filtered_show_info_dict)),
+                *[self._dependency(ref, br2_parse_deps(ref, self.show_info_dict, self.filters.virtual))
+                  for ref in self._filtered_show_info_dict],
+            ],
+            "vulnerabilities": self.vulnerabilities,
+        }
 
 
 def main():
@@ -425,55 +500,21 @@ def main():
         parser.print_help()
         sys.exit(1)
 
-    SPDX_LICENSES.extend(br2_retrieve_spdx_licenses(CYCLONEDX_VERSION))
+    opt = Options(
+        cyclonedx_version=CYCLONEDX_VERSION,
+        project_name=args.project_name,
+        project_version=args.project_version,
+    )
+
+    filters = Filters(
+        virtual=args.virtual
+    )
 
     show_info_dict = json.load(args.in_file)
 
-    # Remove rootfs and virtual packages if not explicitly included
-    # from the cli arguments
-    filtered_show_info_dict = {k: v for k, v in show_info_dict.items()
-                               if ("rootfs" not in v["type"]) and (args.virtual or v["virtual"] is False)}
-
-    cyclonedx_dict = {
-        "bomFormat": "CycloneDX",
-        "$schema": "http://cyclonedx.org/schema/bom-{}.{}.schema.json".format(*CYCLONEDX_VERSION),
-        "specVersion": "{}.{}".format(*CYCLONEDX_VERSION),
-        "metadata": {
-            "component": {
-                "bom-ref": args.project_name,
-                "name": args.project_name,
-                "version": args.project_version,
-                "type": "firmware",
-            },
-            "tools": {
-                "components": [
-                    {
-                        "type": "application",
-                        "name": "Buildroot generate-cyclonedx",
-                        "version": f"{BR2_VERSION_FULL}",
-                        "licenses": [
-                            {
-                                "license": {
-                                    "id": "GPL-2.0"
-                                }
-                            }
-                        ]
-                    }
-                ],
-            }
-        },
-        "components": [
-            cyclonedx_component(name, comp) for name, comp in filtered_show_info_dict.items()
-        ],
-        "dependencies": [
-            cyclonedx_dependency(args.project_name, list(filtered_show_info_dict)),
-            *[cyclonedx_dependency(ref, br2_parse_deps(ref, show_info_dict, args.virtual))
-              for ref in filtered_show_info_dict],
-        ],
-        "vulnerabilities": cyclonedx_vulnerabilities(show_info_dict),
-    }
-
-    args.out_file.write(json.dumps(cyclonedx_dict, indent=2))
+    out = CycloneDX(show_info_dict=show_info_dict, options=opt, filters=filters)
+
+    args.out_file.write(json.dumps(out.cyclonedx, indent=2))
     args.out_file.write('\n')
 
 
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
