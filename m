Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98941C02194
	for <buildroot@archiver.kernel.org>; Thu,  6 Feb 2025 18:06:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9CF0846AC;
	Thu,  6 Feb 2025 18:06:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rNRskfSoeqjq; Thu,  6 Feb 2025 18:06:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 585DC846BB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 585DC846BB;
	Thu,  6 Feb 2025 18:06:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0631FE2
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 18:06:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF7D44281F
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 18:06:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Yd6o9jgd89q for <buildroot@buildroot.org>;
 Thu,  6 Feb 2025 18:06:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4F4194274A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F4194274A
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4F4194274A
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 18:06:34 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4363ae65100so14931115e9.0
 for <buildroot@buildroot.org>; Thu, 06 Feb 2025 10:06:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738865192; x=1739469992;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f+qoNQ7GIaGwyaOEmrwionicOWc8i2YrxzastM2ToMU=;
 b=GAKLg7aig19of4/SFzW8WNWbIs9XSDtF4DcoVZH6Tcy2nUg795YOGY8Mw3pMBp15jc
 wAKgoc7XMvS5w/dMqYObFzcIGg2uBZ8XiEY3WVsXYdBrunjASVKX5pxBoWMX7D2Sukxq
 v143y9b43qPqG9qode8tIS83FKtek+NZktw0XgiNS9QVp7DEK1N4khcFdB36RYR3PyRs
 hrA8vs7O0h1oeJk98+G4ve01A5NBgfPPXxQ/zINF0jBntwzdC4Ioz0mbO4+Kf7Q+BEr4
 6ji4zn9liZj3+c2T3PnZX+3JyxxzTrZjbl2s8fPcH79V0oLodfOso94NuVysmVi6RgoB
 7W7Q==
X-Gm-Message-State: AOJu0YyShVbLn/v7z3oeamNNvdbdzkoV+PE4tAf2+1Z/YuKWoFg2m7fI
 iGpj/POxSGWgmPjAaRI9+ij7wIYcI8x7CIVoHked6dGBo68yu24F65zB9mnfuotK3TqMI/SCmR2
 BoHM=
X-Gm-Gg: ASbGncuNqvZzTMJvE6AIuWXG7HZ7MBWMqVF92GPMFg5lXJJA8HotfNwN78TShNre23r
 95JutEniems5uWyC9Y9P32lrfXmNLIDG+zTuZWVV4Rmx42FoYw5DZKxoqob/orCQRSAnihuI//a
 JrBd8xVwYfZVaDIacqt4RDjIsuqoaBzVD8IVrZODFoHO84VRq7TrMBvxkTsupA62emYIpycUP04
 bmx6wzcag0gqjyGVUX2i+AMJgcffCINsqLzPzV+CmoIKqFgdnDB3q8f3tZIb6LpI5u6xzNdAzhQ
 xt7KS4MlAVcxDB410L0vDpxxxJZzAsw=
X-Google-Smtp-Source: AGHT+IGN+bg1E3TJiF8pnk5+7I8pDHTEyZBLeYcSaRo40RKw3ydi3Bg6vqPvkxarUHuZpwHbDEXREA==
X-Received: by 2002:a05:6000:2cd:b0:38c:2745:2df3 with SMTP id
 ffacd0b85a97d-38db49009a6mr7699062f8f.37.1738865191715; 
 Thu, 06 Feb 2025 10:06:31 -0800 (PST)
Received: from localhost.localdomain ([79.132.233.153])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dbde1dfaesm2342370f8f.90.2025.02.06.10.06.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 10:06:31 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu,  6 Feb 2025 19:06:14 +0100
Message-ID: <20250206180614.984105-3-thomas.perale@mind.be>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250206180614.984105-1-thomas.perale@mind.be>
References: <20250206180614.984105-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1738865192; x=1739469992; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f+qoNQ7GIaGwyaOEmrwionicOWc8i2YrxzastM2ToMU=;
 b=ZaNVkR6uilMi86FOV7gmaEzZDH5a2mwVYnXkSOMTsNS1iJPWL+Usn5rb7daGxOBRZU
 C/+66/ej2KQMoz5XV7c5wIeBvEdP2nyow+uOmJvOE+16nEOm47QP/2a7pex5HYx/Vrdd
 Pa94+fGcr7k4Kb6Z5m10CKCAU6BlQzs2N74Od/Xhd2ZqrTuQjwrvaKs1ErrDsem5gyGG
 WDFwBo823Eo7xe6c1fon1B9GbF+wq5lZhIedBhFlihVPuHGDXutlBnUSsh4YDMrCXYzY
 mhGwZHuDRvYg6UCxoFfMB5OBLpKRrgmO3aW/TDhVp7fd30mvE/zxfA4Pnq4jK5Mh/9/5
 ceyA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ZaNVkR6u
Subject: [Buildroot] [v3, RFC,
 PATCH 2/2] support/scripts/generate-cyclonedx.py: add script to
 generate CycloneDX-style SBOM
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
Cc: Matthias Swiggers <matthias.swiggers@mind.be>,
 Thomas Perale <thomas.perale@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vincent Jardin <vjardin@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

There is a growing need to generate software bill of materials (SBOM) from
buildroot configurations. Right now there are different solutions available
for buildroot users `show-info`, `legal-info` and `pkg-stats`.
They all generate similar information but in a format that is specific
to buildroot.

CycloneDX is a SBOM specification that can be consumed by different services.

This patch introduces a Python script, that converts the JSON output of the
show-info Makefile target to a CycloneDX-style SBOM.
The script output contains the following information.
    - A list of all packages, or "components" with information about
      version, cpe (if available), applied patches.
    - By default virtual packages are not listed in the SBOM.
    - Additional information is added to the component 'properties' to
      specify wheter the component is present on the target or the host
      under the `BR_TYPE` property name.
    - An overview of the licenses applicable to each package. If possible,
      the names of these licenses have been matched to known SPDX license
      identifiers.
    - Per package, a list of (recursive) dependencies on other packages.
    - A list of ignored CVE and their associated component.

More information on CycloneDX at https://cyclonedx.org/.

Usage:
    make show-info | utils/generate-cyclonedx.py | jq '.'

Example output:

```
{
  "bomFormat": "CycloneDX",
  "$schema": "http://cyclonedx.org/schema/bom-1.6.schema.json",
  "specVersion": "1.6",
  "components": [
    {
      "bom-ref": "busybox",
      "type": "library",
      "name": "busybox",
      "version": "1.36.1",
      "licenses": [
        {
          "license": {
            "id": "GPL-2.0"
          }
        },
        ...
      ],
      "cpe": "cpe:2.3:a:busybox:busybox:1.36.1:*:*:*:*:*:*:*",
      "pedigree": {
        "patches": [
          {
            "type": "unofficial",
            "diff": {
              "text": {
                "content": "..."
              }
            }
          }
        ]
      }
      "properties": [
        {
          "name": "BR_TYPE",
          "value": "target"
        }
      ]
    },
    ...
  ],
  "dependencies": [
    {
      "ref": "busybox",
      "dependsOn": [
        "host-skeleton",
        "skeleton",
        "skeleton-init-sysv",
        "skeleton-init-common",
        ...
    }
    ...
  ],
  "vulnerabilities": [
    {
      "id": "CVE-2022-28391",
      "analysis": {
        "state": "in_triage",
        "detail": "The CVE 'CVE-2022-28391' has been marked as ignored by Buildroot"
      },
      "affects": [
        {
          "ref": "busybox"
        }
      ]
    },
    ...
  ],
  "metadata": {
    "component": {
      "bom-ref": "buildroot",
      "name": "buildroot",
      "type": "firmware",
      "version": "2024.02-4744-gafea667f00-dirty"
    }
  }
}
```

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Co-authored-by: Matthias Swiggers <matthias.swiggers@mind.be>
Reviewed-by: Vincent Jardin <vjardin@free.fr>
---
 DEVELOPERS                  |   1 +
 utils/generate-cyclonedx.py | 313 ++++++++++++++++++++++++++++++++++++
 2 files changed, 314 insertions(+)
 create mode 100755 utils/generate-cyclonedx.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 837fa93f4d..919a968a05 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3179,6 +3179,7 @@ F:	package/xorcurses/
 
 N:	Thomas Perale <thomas.perale@mind.be>
 F:	package/go/
+F:	utils/generate-cyclonedx.py
 
 N:	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 F:	arch/Config.in.arm
diff --git a/utils/generate-cyclonedx.py b/utils/generate-cyclonedx.py
new file mode 100755
index 0000000000..ba0e79905e
--- /dev/null
+++ b/utils/generate-cyclonedx.py
@@ -0,0 +1,313 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+# This script converts the output of the show-info make target
+# to CycloneDX format.
+#
+# Example usage:
+# > make show-info | utils/generate-cyclonedx.py | jq '.'
+
+
+import argparse
+import json
+import os
+from pathlib import Path
+import urllib.request
+import subprocess
+import sys
+import gzip
+import bz2
+
+CYCLONEDX_VERSION = "1.6"
+SPDX_SCHEMA_URL = f"https://raw.githubusercontent.com/CycloneDX/specification/{CYCLONEDX_VERSION}/schema/spdx.schema.json"
+
+brpath = Path(__file__).parent.parent
+
+cyclonedxpath = Path(os.getenv("BR2_DL_DIR", brpath / "dl")) / "cyclonedx"
+SPDX_SCHEMA_PATH = cyclonedxpath / f"spdx-{CYCLONEDX_VERSION}.schema.json"
+
+BR2_VERSION_FULL = (
+    subprocess.check_output(
+        ["make", "--no-print-directory", "-C", brpath, "print-version"]
+    )
+    .decode()
+    .strip()
+)
+
+SPDX_LICENSES = []
+
+if not SPDX_SCHEMA_PATH.exists():
+    # Download the CycloneDX SPDX schema JSON, and cache it locally
+    cyclonedxpath.mkdir(parents=True, exist_ok=True)
+    urllib.request.urlretrieve(SPDX_SCHEMA_URL, SPDX_SCHEMA_PATH)
+
+try:
+    with SPDX_SCHEMA_PATH.open() as f:
+        SPDX_LICENSES = json.load(f).get("enum", [])
+except json.JSONDecodeError:
+    # In case of error the license will just not be matched to the SPDX names
+    # but the SBOM generation still work.
+    print(f"Failed to load the SPDX licenses file: {SPDX_SCHEMA_PATH}", file=sys.stderr)
+
+
+def split_top_level_comma(subj):
+    """Split a string at comma's, but do not split at comma's in between parentheses.
+
+    Args:
+        subj (str): String to be split.
+
+    Returns:
+        list: A list of substrings
+    """
+    counter = 0
+    substring = ""
+
+    for char in subj:
+        if char == "," and counter == 0:
+            yield substring
+            substring = ""
+        else:
+            if char == "(":
+                counter += 1
+            elif char == ")":
+                counter -= 1
+            substring += char
+
+    yield substring
+
+
+def cyclonedx_license(lic):
+    """Given the name of a license, create an individual entry in
+    CycloneDX format. In CycloneDX, the 'id' keyword is used for
+    names that are recognized as SPDX License abbreviations. All other
+    license names are placed under the 'name' keyword.
+
+    Args:
+        lic (str): Name of the license
+
+    Returns:
+        dict: An entry for the license in CycloneDX format.
+    """
+    key = "id" if lic in SPDX_LICENSES else "name"
+    return {
+        key: lic,
+    }
+
+
+def cyclonedx_licenses(lic_list):
+    """Create a licenses list formatted for a CycloneDX component
+
+    Args:
+        lic_list (str): A comma separated list of license names.
+
+    Returns:
+        dict: A dictionary with license information for the component,
+        in CycloneDX format.
+    """
+    return {
+        "licenses": [
+            {"license": cyclonedx_license(lic.strip())} for lic in split_top_level_comma(lic_list)
+        ]
+    }
+
+
+def cyclonedx_patches(patch_list):
+    """Translate a list of patches from the show-info JSON to a list of
+    patches in CycloneDX format.
+
+    Args:
+        patch_list (dict): Information about the patches as a Python dictionary.
+
+    Returns:
+        dict: Patch information in CycloneDX format.
+    """
+    patch_contents = []
+    for patch in patch_list:
+        patch_path = brpath / patch
+        if patch_path.exists():
+            f = None
+            if '.gz' in patch:
+                f = gzip.open(patch_path, mode="rt")
+            elif '.bz' in patch:
+                f = bz2.open(patch_path, mode="rt")
+            else:
+                f = open(patch_path)
+
+            try:
+                patch_contents.append({
+                    "text": {
+                        "content": f.read()
+                    }
+                })
+            except Exception:
+                # If the patch can't be read it won't be added to
+                # the resulting SBOM.
+                print(f"Failed to handle patch: {patch}", file=sys.stderr)
+
+            f.close()
+        else:
+            # If the patch is not a file it's a tarball or diff url passed
+            # through the `<pkg-name>_PATCH` variable.
+            patch_contents.append({
+                "url": patch
+            })
+
+    return {
+        "pedigree": {
+            "patches": [{
+                "type": "unofficial",
+                "diff": content
+            } for content in patch_contents]
+        },
+    }
+
+
+def cyclonedx_component(name, comp):
+    """Translate a component from the show-info output, to a component entry in CycloneDX format.
+
+    Args:
+        name (str): Key used for the package in the show-info output.
+        comp (dict): Data about the package as a Python dictionary.
+
+    Returns:
+        dict: Component information in CycloneDX format.
+    """
+    return {
+        "bom-ref": name,
+        "type": "library",
+        **({
+            "name": comp["name"],
+        } if "name" in comp else {}),
+        **({
+            "version": comp["version"],
+            **(cyclonedx_licenses(comp["licenses"]) if "licenses" in comp else {}),
+        } if not comp["virtual"] else {}),
+        **({
+            "cpe": comp["cpe-id"],
+        } if "cpe-id" in comp else {}),
+        **(cyclonedx_patches(comp["patches"]) if comp.get("patches") else {}),
+        "properties": [{
+            "name": "BR_TYPE",
+            "value": comp["type"],
+        }],
+    }
+
+
+def cyclonedx_dependency(ref, depends):
+    """Create JSON for dependency relationships between components.
+
+    Args:
+        ref (str): reference to a component bom-ref.
+        depends (list): array of component bom-ref identifier to create the dependencies.
+
+    Returns:
+        dict: Dependency information in CycloneDX format.
+    """
+    return {
+        "ref": ref,
+        "dependsOn": depends,
+    }
+
+
+def cyclonedx_vulnerabilities(show_info_dict):
+    """Create a JSON list of vulnerabilities ignored by buildroot and associate
+    the component for which they are solved.
+
+    Args:
+        show_info_dict (dict): The JSON output of the show-info
+            command, parsed into a Python dictionary.
+
+    Returns:
+        list: Solved vulnerabilities list in CycloneDX format.
+    """
+    cves = {}
+
+    for name, comp in show_info_dict.items():
+        for cve in comp.get('ignore_cves', []):
+            cves.setdefault(cve, []).append(name)
+
+    return [{
+        "id": cve,
+        "analysis": {
+            "state": "in_triage",
+            "detail": f"The CVE '{cve}' has been marked as ignored by Buildroot"
+        },
+        "affects": [
+            {"ref": bomref} for bomref in components
+        ]
+    } for cve, components in cves.items()]
+
+
+def br2_parse_deps_recursively(ref, show_info_dict, virtual=False, deps=[]):
+    """Parse dependencies from the show-info output. This function will
+    recursively collect all dependencies, and return a list where each dependency
+    is stated at most once.
+    The dependency on virtual package will collect the final dependency without
+    including the virtual one.
+
+    Args:
+        ref (str): The identifier of the package for which the dependencies have
+            to be looked up.
+        show_info_dict (dict): The JSON output of the show-info
+            command, parsed into a Python dictionary.
+
+    Kwargs:
+        deps (list): A list, to which dependencies will be appended. If set to None,
+            a new empty list will be created. Defaults to None.
+
+    Returns:
+        list: A list of dependencies of the 'ref' package.
+    """
+    for dep in show_info_dict.get(ref, {}).get("dependencies", []):
+        if dep not in deps:
+            if virtual or show_info_dict.get(dep, {}).get("virtual") is False:
+                deps.append(dep)
+            br2_parse_deps_recursively(dep, show_info_dict, virtual, deps)
+
+    return deps
+
+
+def main():
+    parser = argparse.ArgumentParser()
+    parser.add_argument("-i", "--in-file", nargs="?", type=argparse.FileType("r"), default=sys.stdin)
+    parser.add_argument("-o", "--out-file", nargs="?", type=argparse.FileType("w"), default=sys.stdout)
+    parser.add_argument("--virtual", default=False, action='store_true',
+                        help="This option include virtual packages to the CycloneDX output")
+
+    args = parser.parse_args()
+
+    show_info_dict = json.load(args.in_file)
+
+    # Remove rootfs and virtual packages if not explicitly included
+    # from the cli arguments
+    filtered_show_info_dict = {k: v for k, v in show_info_dict.items()
+                               if ("rootfs" not in v["type"]) and (args.virtual or v["virtual"] is False)}
+
+    cyclonedx_dict = {
+        "bomFormat": "CycloneDX",
+        "$schema": f"http://cyclonedx.org/schema/bom-{CYCLONEDX_VERSION}.schema.json",
+        "specVersion": f"{CYCLONEDX_VERSION}",
+        "components": [
+            cyclonedx_component(name, comp) for name, comp in filtered_show_info_dict.items()
+        ],
+        "dependencies": [
+            cyclonedx_dependency("buildroot", list(filtered_show_info_dict)),
+            *[cyclonedx_dependency(ref, br2_parse_deps_recursively(ref, show_info_dict, args.virtual))
+              for ref in filtered_show_info_dict],
+        ],
+        "vulnerabilities": cyclonedx_vulnerabilities(show_info_dict),
+        "metadata": {
+            "component": {
+                "bom-ref": "buildroot",
+                "name": "buildroot",
+                "type": "firmware",
+                "version": f"{BR2_VERSION_FULL}",
+            },
+        },
+    }
+
+    args.out_file.write(json.dumps(cyclonedx_dict))
+
+
+if __name__ == "__main__":
+    main()
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
