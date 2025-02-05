Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32FA5C02194
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 14:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF0DC4131A;
	Wed,  5 Feb 2025 14:10:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MkdqUTlnXcyC; Wed,  5 Feb 2025 14:10:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36021413DE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36021413DE;
	Wed,  5 Feb 2025 14:10:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E2D02CD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 14:10:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE4064131A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 14:10:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AHuvvFpvk8Ki for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 14:10:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D9776413DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9776413DE
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D9776413DE
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 14:10:17 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-38daf09d37fso1145266f8f.1
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 06:10:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738764615; x=1739369415;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nVV6pSxk64Z0/y8/7yuupugd7w+Us7Q5pIDhgMw2+hU=;
 b=QFHGwebbn0y6Lg8I1mmm8MmbSPNFSRsFUgPfyVp1TgVHm2NzjQrwK8hKg+f+r+OuAu
 wrXiSs64mZ60ELB74osMcgGTXwgx+OlzJr+j94jrGVnWxNxbOCS8L7MV96c86gFoXfxe
 RDRdvOOhB5w///bkB0t9WUeoEec26wsYyAklAh3GiiwXEUbu9B6yvixgB8Yc5r5AOzoj
 k68bfh8wBelJBAA+N84zsm0y5aiiibLg4WvgBUMYK7BCHWkhuf1jhwMQdshdMbH3dyaQ
 ByTFVTICZ6da55FslMg4tick2ObRP6sfHXY2kLeMNBLeDoK/5VJ+71oIisFigypr/a0d
 dVWw==
X-Gm-Message-State: AOJu0YzV6c3XpW0JxVx4rMdsQ7Ro0P2ypeIRqLO6CvUl95qOBEr3U9JY
 lxuslTlP/ZrTdKVvuvZKDGfUi7T/2M47TZ9Sw+BVWnq3WvZn/gDi6bglYzJDskM8JhqfofyeCK4
 5Q1w=
X-Gm-Gg: ASbGncukoMXRZu2VE/NDMrmarowUSXg8IJc5m0mhQCmTY48DlH6mRzKqIkzBPadk3j+
 cCqg7ux4mIRGOLo5LKt16+xDe6s3mOwtau2qh424CPlgpcm9ggE8XEU3+5Vp0lVTG6y5b0qHjTV
 VmUWv/90q5sgj8DFD6dYUx3Ppm9UHy0k3LQogD4txfG35HcO+u15k7DJF0krBUyS6QGttasX7VT
 zeEYGCXtDdivoNczrXcrCBQf32vVMxRKk/zCb0R8VvcKPCt/0GBaBDycTdNEfVWfdrJ6uUAK5K9
 2CCDSNQUZIVtLaRBN26QEJWc3LPFwH2vWGs0NhY02PSOyN0PAlxXfOvU/U3XUaCG9A==
X-Google-Smtp-Source: AGHT+IFYvFeBCMIhruqfBvm6aU8LSuVME5+r2+/8KnCIaky0KAyGjsLGx2Da4pAtK7qEMabaVI+bfQ==
X-Received: by 2002:a5d:5f93:0:b0:38d:b448:8ffc with SMTP id
 ffacd0b85a97d-38db48cb2d3mr2361523f8f.27.1738764615139; 
 Wed, 05 Feb 2025 06:10:15 -0800 (PST)
Received: from localhost.localdomain (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43907f19247sm34913945e9.1.2025.02.05.06.10.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2025 06:10:14 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed,  5 Feb 2025 15:09:47 +0100
Message-ID: <20250205140947.843661-3-thomas.perale@mind.be>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250205140947.843661-1-thomas.perale@mind.be>
References: <20250205140947.843661-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1738764615; x=1739369415; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nVV6pSxk64Z0/y8/7yuupugd7w+Us7Q5pIDhgMw2+hU=;
 b=DDLtsdahBQZhUeX2DPysgvco82SDHDye4MSdfqfptbOUT7XipV6Na/6G+xGFpdwADC
 KcdjmyW3F0iEUyGC9gzTSG8NqkkKVaVXTxi9Hop4d3GJUrNaX6jIWug1p9ZeANN/7NDz
 PzadkOLS5Z5TnGI2hMawTAlmrMFtNrxvjwlM9IEJ3nyhE1wGSyspe22R9U8P/A5fTQGl
 xELwffYiSnu1FDBsqKoDpfOHHce4gvTrEbU8QD55czbsiHCGH1WXjQBxqHuw/laGXvWw
 Lf2JLNda2SLpC4PjhY5Q6THJNoTiD9XHf6cXR8pE8ca3cj0O3ffy82JixXlCAfahh1ej
 n9hg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DDLtsdah
Subject: [Buildroot] [v2, RFC,
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
They all generate similar informations but in a format that is specific
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
  "vulnaribilities": [
    {
      "id": "CVE-2022-28391",
      "analysis": {
        "state": "resolved"
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
 utils/generate-cyclonedx.py | 307 ++++++++++++++++++++++++++++++++++++
 1 file changed, 307 insertions(+)
 create mode 100755 utils/generate-cyclonedx.py

diff --git a/utils/generate-cyclonedx.py b/utils/generate-cyclonedx.py
new file mode 100755
index 0000000000..e263876134
--- /dev/null
+++ b/utils/generate-cyclonedx.py
@@ -0,0 +1,307 @@
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
+cyclonedxpath = os.getenv("BR2_DL_DIR", brpath / "dl") / "cyclonedx"
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
+        if os.path.isfile(patch):
+            f = None
+            if '.gz' in patch:
+                f = gzip.open(patch, mode="rt")
+            elif '.bz' in patch:
+                f = bz2.open(patch, mode="rt")
+            else:
+                f = open(patch)
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
+        list: Solved vulnaribities list in CycloneDX format.
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
+            "state": "in_triage"
+        },
+        "affects": [
+            {"ref": bomref} for bomref in components
+        ]
+    } for cve, components in cves.items()]
+
+
+def br2_parse_deps_recursively(ref, show_info_dict, deps=[]):
+    """Parse dependencies from the show-info output. This function will
+    recursively collect all dependencies, and return a list where each dependency
+    is stated at most once.
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
+        if dep not in deps and dep in show_info_dict:
+            deps.append(dep)
+            br2_parse_deps_recursively(dep, show_info_dict, deps)
+
+    return deps
+
+
+def main():
+    parser = argparse.ArgumentParser()
+    parser.add_argument("-i", "--in-file", nargs="?", type=argparse.FileType("r"), default=sys.stdin)
+    parser.add_argument("-o", "--out-file", nargs="?", type=argparse.FileType("w"), default=sys.stdout)
+    parser.add_argument("--virtual", default=False, action='store_true', help="This option include virtual packages to the CycloneDX output")
+
+    args = parser.parse_args()
+
+    if "stdin" in args.in_file.name:
+        # Read a single line of JSON input from stdin
+        show_info_dict = json.loads(args.in_file.readline())
+    else:
+        show_info_dict = json.load(args.in_file)
+
+    if not args.virtual:
+        show_info_dict = { k:v for k, v in show_info_dict.items() if not v.get('virtual')}
+
+    cyclonedx_dict = {
+        "bomFormat": "CycloneDX",
+        "$schema": f"http://cyclonedx.org/schema/bom-{CYCLONEDX_VERSION}.schema.json",
+        "specVersion": f"{CYCLONEDX_VERSION}",
+        "components": [
+            cyclonedx_component(name, comp) for name, comp in show_info_dict.items()
+            if "rootfs" not in comp["type"]
+        ],
+        "dependencies": [
+            cyclonedx_dependency("buildroot", list(show_info_dict)),
+            *[cyclonedx_dependency(ref, br2_parse_deps_recursively(ref, show_info_dict)) for ref in show_info_dict],
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
