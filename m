Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF5E2EDA688
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 15:16:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A022F408F8;
	Tue,  3 Mar 2026 15:16:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vAr8r6YYJUrk; Tue,  3 Mar 2026 15:16:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A85F408A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772551018;
	bh=2WtXP32b9Dk/h8pxKBkDXIgIy2dfrfgde+qN5m7XK/4=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=oPXqIFMW7SX2dcWGW4QzIIw1aVQ9SPyoMQQw3gYZC30e6YY9HUGL/Ok/vlcw0tN17
	 kNShvYx4QqsgClV4wfKnA5sjD3KpLofL2VX4U6R+wYyzWFDexxtIUbAnDXxtwtkMEM
	 To2SFC695usqG04DMj3sKrHW3/rvXsmcKrDp/xpNYi8E6uSxNXnmu5r68Cnb1I15vi
	 4UgcuoxBkOU70JUw2XfOnT5dABbhjJW4mb5Iw21G60tr1w75utdsOFGbO7CsZLAm81
	 L2d8mXlO0FVqZny8Yt75t1yGFX6PPzi0c3NJPpkfuCmAdJuFlff50rfHHXKL0XH9P/
	 uXLK1f1/kXFnA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A85F408A3;
	Tue,  3 Mar 2026 15:16:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3833F1EB
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 15:16:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A17780BBC
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 15:16:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VS2Agjag_AGg for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 15:16:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CFC6B80BA9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFC6B80BA9
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CFC6B80BA9
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 15:16:54 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-482f454be5bso62436085e9.0
 for <buildroot@buildroot.org>; Tue, 03 Mar 2026 07:16:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772551012; x=1773155812;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=cXRJZy0qmccc67db2/7xy+HoxIe04qj1mu1AxETkjI4=;
 b=VJkcgLC4FsnhpFlobDJRh75O9cCySkxaOWzpqccRiXQJYxEIwfgUHEeabX5yCp1t24
 GFSnISjVB00ZvzWxVPYdjAcZUAnRJABFiwpcVrzoLaAIBnwdEgIfHNOvAsQVOlDMhY6F
 vnfwtaWJ4NbE9iaYy0mypYgw1B4uxlUmaX8Brf+Fw5I1b6zEdQTrDKAg7xH4ocCRzN/H
 yu51YRySZMoO67wsEpsAn2AeZKbtIvbaujRc0/QN4rF3IX43EXhpvDL/1Ws2BbEBykqk
 uqEv+TlYV65AR9OTa4D6LUbIAxarS3E+yXB+1JS0nqTizdUOSuoUrhe5Fv7G+O4NEF/W
 kjig==
X-Gm-Message-State: AOJu0YzfbL5xklY0MdpAx+I7eA8VghxfMsAUWKS7Pa3gP9de9MDSpw0f
 Kc46BIXcudTEugkBX4U3nm0HIDMw4a4m9YCWJ/n8MJCA/uz8FN7L2fmqmc/bbj0rnsLOJi0s+be
 SACX/
X-Gm-Gg: ATEYQzwix6lWAc4RUucM7/vW4R4Y3QiseU20TMG0wnEHnZBNC/pmXE+jzNyIO6ac6dc
 11egM3pFK17DzRAzL0xO6Tvuw8cqKMARY88+5aISvKP03yvIsBGTwqbu9uS09AEYrFdlAvVn9ej
 4XLLC9fnPZ+OmiVKeMHB8UBIEi5RKM03LX5zGrAi/C0BCSoMLTObpL/1woIEInfD6UMlXZ57tmV
 prboDfUM93Y0lgdADOXZAwmUX46BcWYLw8DsMMGneMKoaNx2FVbMWiQvFrUJIKrkrcHCergdoOM
 ffHz8A2hGRZ/taHQtaIIDs9vtObnnZmZNSI4pYOOR8uN7FCAlHfDwSI6rQmOgWet3F9tT2jGy4c
 Z1KVTEa6ZW/Ye6xPBjFfMX1oKcFfil2WQYklpINoUgdFruZjD4GtlUBxY+SAPpvahD51vwqtXmr
 zEalH+h5b9Nb+xLg8=
X-Received: by 2002:a05:600c:35c3:b0:47e:e2b8:66e6 with SMTP id
 5b1f17b1804b1-48513c752cbmr48356955e9.14.1772551012053; 
 Tue, 03 Mar 2026 07:16:52 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485135d52f6sm17839655e9.31.2026.03.03.07.16.49
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 07:16:50 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue,  3 Mar 2026 16:16:36 +0100
Message-ID: <20260303151641.382820-5-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303151641.382820-1-thomas.perale@mind.be>
References: <20260303151641.382820-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772551012; x=1773155812; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cXRJZy0qmccc67db2/7xy+HoxIe04qj1mu1AxETkjI4=;
 b=VBU0JI5Z6yA0hi9pLxPZ8EGn+2hI+3izOuwWvuA5IGDi2hYoeSDX86crhdDnY7kQvb
 oK43tdYdvoocmdTlJ1LOOYQz2xInzkky0aUByHtncteplZnpgxQImsVB9QLt/zZUYGap
 WQkC2cIfIS1442uv9UMGVMd6VaqWechSp0ghcHVCvm5rwhA+OuswPqY6Ad1l9aiwV7VU
 Jr2MfW5khx9rmxzL4eyJf1q+ibUnBrlVMnMTRPm/VfXxHV01xI5dJfzlpShlh2oOyA25
 ECTH6cF0j2yt8bJ7pb4a0yNXAZAPfu4W5c0JRvwm6aqDgXi2VV6I000gQbrxi7DWOw7T
 QxIQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=VBU0JI5Z
Subject: [Buildroot] [PATCH v4 4/8] utils/generate-cyclonedx: encapsulate
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
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
