Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B565EC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:22:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC34384142;
	Fri, 28 Feb 2025 17:22:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZNrdpCZZTEsO; Fri, 28 Feb 2025 17:22:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52F8585963
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52F8585963;
	Fri, 28 Feb 2025 17:22:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A69B711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE71842EF8
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SqxWiGQeACzK for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:32:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95A6D42D33
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95A6D42D33
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8AAB186143; Fri, 28 Feb 2025 16:30:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 22 Feb 2025 18:35:30 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 180fc4ec96e280a6f1caaf043b11430a13c1bf0b
X-Git-Newrev: dbab39e2d90899f28929af5db3fb0facae19b6a1
X-Patchwork-Hint: ignore
Message-Id: <20250228163046.8AAB186143@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 support/scripts/generate-cyclonedx.py: add script to generate
 CycloneDX-style SBOM
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
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=dbab39e2d90899f28929af5db3fb0facae19b6a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
[Arnout:
 - alphabetically order imports;
 - use endswith instead if 'in' to check suffix;
 - add usage to help text;
 - remove .py suffix.
]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 DEVELOPERS               |   1 +
 utils/generate-cyclonedx | 317 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 318 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 73d4281d12..9a220359e7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3176,6 +3176,7 @@ F:	package/xorcurses/
 
 N:	Thomas Perale <thomas.perale@mind.be>
 F:	package/go/
+F:	utils/generate-cyclonedx.py
 
 N:	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 F:	arch/Config.in.arm
diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
new file mode 100755
index 0000000000..993d7154ef
--- /dev/null
+++ b/utils/generate-cyclonedx
@@ -0,0 +1,317 @@
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
+import bz2
+import gzip
+import json
+import os
+from pathlib import Path
+import urllib.request
+import subprocess
+import sys
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
+            if patch.endswith('.gz'):
+                f = gzip.open(patch_path, mode="rt")
+            elif patch.endswith('.bz'):
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
+    parser = argparse.ArgumentParser(
+            description='''Create a CycloneDX SBoM for the Buildroot configuration.
+                Example usage: make show-info | utils/generate-cyclonedx.py | jq > sbom.json
+            '''
+        )
+    parser.add_argument("-i", "--in-file", nargs="?", type=argparse.FileType("r"), default=sys.stdin)
+    parser.add_argument("-o", "--out-file", nargs="?", type=argparse.FileType("w"), default=sys.stdout)
+    parser.add_argument("--virtual", default=False, action='store_true',
+                        help="This option includes virtual packages to the CycloneDX output")
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
