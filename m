Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FCBAE87830
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 13:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFF48606F1;
	Tue,  3 Feb 2026 13:52:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PqdjEiaUv5Yz; Tue,  3 Feb 2026 13:52:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 622A660830
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770126769;
	bh=RcjINKViQjOf8DDnSdav3kTViBCRVfgRjXd9ZnzPPQA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SKHfjbmQcMwll9j3F/qv6UvnKRzpBgErELjUwd7qbHuF0CTyXpzaIodUBkKn6G5jo
	 BdwE3JYWRNAVj+jcJNdI4/nzDncnDVYiCK4WnZicbRMbSiepoQVBJX7VsUHfGN1Bn+
	 u/AbBJsInNn+fHu/TUodXDJFyjWd/SKNQgLZsB8S40IAk3a/8IB8FJlP/bGvM1VOy5
	 Y5lvq+8r5HhZhbMKXPrFRgDERCbV+uEU4EYwTRKp3KMhwitXLV3FocX+kyFo6u2LFh
	 bOUw19lN1HUPhsIIgfzJhG1MdVYXXPOdW7keMAHa7hfa8GljIFO0GtBhWXXy8Nekdw
	 AdqEF9erPK44g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 622A660830;
	Tue,  3 Feb 2026 13:52:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 252BE13D
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 13:52:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A3B7821C4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 13:52:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hciqYEpPShtz for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 13:52:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1ACDC81992
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1ACDC81992
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1ACDC81992
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 13:52:42 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-435f177a8f7so4477377f8f.1
 for <buildroot@buildroot.org>; Tue, 03 Feb 2026 05:52:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770126761; x=1770731561;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2Pywx5BpHO0tTJeecTVO+lahhKf/n8D4leRRYOXTGVg=;
 b=XyeA8QpGkObCsbGzxDi4iI4pi7ib3ySCOdcDa7OxjcAj4JIVVkMCSsFgnHesAZmK8t
 zciCx3VuAMxz6g3sfe4ho7cqBWELqOLToR/HiHgUo9T5cKZPv4IlOaapNwu70GCf13WT
 250g7fpY2fsC+XRazPTwpdddw9+QHySldx8W7MP03JYOMYCd8GztZOlWODmZMsQdAaIV
 pwwrHzvZfR/Dyx+McLrO6yQZSSMtWw0PnZpwzdkrdfOpg6jxL/XLiogsTT2u+HOTio4x
 R0NPEEaddCp5i1IkUbC2C997O1mOwIOy2K3m8Q8C+QOAoXD3M3ViaAEQwwZJJTfm5iKa
 FOYg==
X-Gm-Message-State: AOJu0YzEWcfii0FJ9EAGt1FueA9npz4PXZdDBEy24dTnE4ukhHUNK7rN
 eW+bT+nUnGtH9HVceketgzGvJcVI5Kv72/ajlE4pfQjjbGHJAQydYGSVW4FetDIs579Wn64Im4I
 WyxH6
X-Gm-Gg: AZuq6aJEwpBdWLji0b4PcTRB25Cm6n6WZjk+uIFpAIaCOSDsP0TQeCbNtJBzmLYgD9f
 tjIdGnrEoqmmhjLRO4yn0kByDDiGS9VOFgTCKqRcANfqclIA50QPyp9XXtEq5JDIvttTCkW56ZG
 /myO9uDI0RhQGCIJgybaYloCEWkww9vLL3A8n3rGgJkqS8TooSqAIXQqJFj4ACmmUuVovamwJPs
 SqfgHfm0hWni3Ca0HBs4xPSM4H8UsFD+hTX1yFjb9q7wjI6oxJWlOXL0cVdben3ljaO3A15kWFn
 257SF/GKIW/Yvg/RwJfoT8MDQMg7JqLvqu48l105lBx0DZ+9WgCybqK3DIcfPugov5IIum7CPIY
 ykxRH3iInRly4TUk3orX4TntCiLt0tOG4vsgI2ink2FHhCkXivbtAefjf3Q5B9v4/O1boYzxs1a
 jMklkEOcEf6nCSSaIM8EgpSE+w7b52ts4A1vCTB1jAquQ=
X-Received: by 2002:a05:6000:4285:b0:430:fa52:9ea9 with SMTP id
 ffacd0b85a97d-435f3abb546mr25060285f8f.62.1770126760543; 
 Tue, 03 Feb 2026 05:52:40 -0800 (PST)
Received: from mindpad (host-109-89-232-55.dynamic.voo.be. [109.89.232.55])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e10e4757sm54227388f8f.5.2026.02.03.05.52.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Feb 2026 05:52:39 -0800 (PST)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
	titouan.christophe@mind.be
Date: Tue,  3 Feb 2026 14:52:33 +0100
Message-ID: <20260203135235.184869-3-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260203135235.184869-1-thomas.perale@mind.be>
References: <20260203135235.184869-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770126761; x=1770731561; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2Pywx5BpHO0tTJeecTVO+lahhKf/n8D4leRRYOXTGVg=;
 b=ZKIxQL2dYkFgbhvwvmexN3JMPYIoGn4uTKWA+jN404fHRFPtj7FnRX5s3vCGKh2b2K
 O16Ky1nZaGLjai0XmcY1FjVLK7zeqUTvs8O9xM87nCWQ/pOAp1M2eZNCdyLdigNTG7Kb
 aioX8aUljQp8XWPiUbPFOCPuFprwiqirOSH0b8ZKMI71s6FmvyVf4faz0WOz5x5n67yF
 hosFAXV997ZtLfmK2dcbRBGeSFRfKliKjUiyqdhMS4Qe3p+Yb1f+rlqWiFKVxA5GuRNk
 8RRcDalyqe99QsyJQGzjP+nERyZsqFKtecKgtSzP8auUyAxlfNtJ7PJsrh4IBx/ofn81
 YTXA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ZKIxQL2d
Subject: [Buildroot] [PATCH v2 3/5] utils/generate-cyclonedx: encapsulate
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
 utils/generate-cyclonedx | 487 +++++++++++++++++++++------------------
 1 file changed, 265 insertions(+), 222 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index f5faec09b4..805c69c92c 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -18,6 +18,9 @@ import urllib.request
 import subprocess
 import sys
 import re
+from typing import Mapping
+from dataclasses import dataclass, field
+from packaging.version import Version
 
 
 CYCLONEDX_VERSION = "1.6"
@@ -34,16 +37,24 @@ BR2_VERSION_FULL = (
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
+    cyclonedx_version: Version
+    """CycloneDX Spec version"""
+    project_name: str
+    """Specify the project name to use in the SBOM metadata"""
+    project_version: str
+    """Specify the project version to use in the SBOM metadata"""
 
 
-def br2_retrieve_spdx_licenses(version: str):
+@dataclass(frozen=True)
+class Filters:
+    virtual: bool
+    """Includes virtual packages to the output"""
+
+
+def br2_retrieve_spdx_licenses(version: Version):
     """Populate the list of supported SPDX licenses for a given CycloneDX
     version. If the list is not present locally it will be downloaded
     externally.
@@ -224,179 +235,245 @@ def split_top_level_comma(subj):
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
+            "$schema": f"http://cyclonedx.org/schema/bom-{self.options.cyclonedx_version}.schema.json",
+            "specVersion": f"{self.options.cyclonedx_version}",
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
@@ -422,55 +499,21 @@ def main():
         parser.print_help()
         sys.exit(1)
 
-    SPDX_LICENSES.extend(br2_retrieve_spdx_licenses(CYCLONEDX_VERSION))
+    opt = Options(
+        cyclonedx_version=Version(CYCLONEDX_VERSION),
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
-        "$schema": f"http://cyclonedx.org/schema/bom-{CYCLONEDX_VERSION}.schema.json",
-        "specVersion": f"{CYCLONEDX_VERSION}",
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
