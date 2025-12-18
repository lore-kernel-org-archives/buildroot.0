Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 051E2D6E2B0
	for <buildroot@archiver.kernel.org>; Thu, 18 Dec 2025 16:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CA454110C;
	Thu, 18 Dec 2025 16:44:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cksV2bXlFV-H; Thu, 18 Dec 2025 16:44:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5316C41090
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766076244;
	bh=MFVixiDIpCInb6Toui3RhUCjPtHHLX2VmdZnt0us9tA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=W2yqDMRS+3RJlpHEWPEd3aNm2n6IToY+u3EISDbV88n3n+qBRtIbY7mW4E0oc5BCv
	 zU/Qz4mMAh1UI2mtiSh1Udqq39C+mdYRG6lTE9sydAu2jJdVpoWXE1BHLz9DguLMFK
	 kNE6/5BHsSynbWm+oJu0qXsAfa201rEWWYgdN/GMQefQq52JwziYtLK0lECmzh4o2u
	 TPhkjii1x/SFBBxMm++O9YWJlcbLMFO/R+moSaN6ndx7Cs1HIMdhpj72N6J8Hp03D1
	 Wk1D2/+woFBYyKIE6XY/kFFfUxlmCJM5xwqHnEg9SaSuhPK9GjwxL2arLNZGOCJ0+S
	 ekoUzv6wn1eeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5316C41090;
	Thu, 18 Dec 2025 16:44:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A2082361
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 87D374023F
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:43:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p4VPW7oeL2hy for <buildroot@buildroot.org>;
 Thu, 18 Dec 2025 16:43:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92DE140077
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 92DE140077
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:43:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6DB88873D9; Thu, 18 Dec 2025 16:43:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Dec 2025 16:56:20 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: b7ec498e39e8276c797c4d46ec110beefd9d62d0
X-Git-Newrev: 2942d6592da36400acbd08a3f54aec54a4252a42
X-Patchwork-Hint: ignore
Message-Id: <20251218164358.6DB88873D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] utils/generate-cyclonedx:
 add support for 'resolved_with_pedigree'
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2942d6592da36400acbd08a3f54aec54a4252a42
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

The CycloneDX specification for vulnerabilities defines four analysis
states ([1]) for cases where a vulnerability does not affect a component:

* resolved
* resolved_with_pedigree
* not_affected
* false_positive

Currently, the metadatas present in Buildroot does not allow an accurate
mapping of ignored CVEs to the appropriate CycloneDX vulnerability
categories. As a result, all ignored CVEs are currently marked as
'in_triage' by default.

This default analysis was established during the introduction of the
'generate-cyclonedx' script. The reasoning at the time was that SBOM
consumers might want to re-evaluate ignored vulnerabilities, as the
Buildroot infrastructure could not reliably determine their actual
state.

This patch adds support for automatically marking vulnerabilities as
'resolved_with_pedigree' when a Buildroot patch includes a 'CVE:''
tag in its header referencing the CVE identifier.

The 'CVE:' tag appears alongside the already required 'Upstream:', if
the patch address a security vulnerability and may be repeated if a
patch addresses multiple vulnerabilities.

If a vulnerability is addressed by multiple patches, each patch will need to
reference the vulnerability identifier.

For details on how CycloneDX handles 'resolved_with_pedigree', see
[1][2].

As an example, the CVE-2025-3198 from the binutils package will result
in the following pedigree for the binutils component:

```
{
    "type": "unofficial",
    "diff": {
        "text": {
            "content": "..."
        }
    },
    "resolves": [
        {
            "type": "security",
            "name": "CVE-2025-3198"
        }
    ]
},
```

The `resolves` property is an array of issue the pedigree resolves. If
multiple are addressed by the same patch, then multiple identifier will be
present in this array.

In the listed vulnerabilities the entry for the CVE-2025-3198 looks like
this:

```
{
    "id": "CVE-2025-3198",
    "analysis": {
        "state": "resolved_with_pedigree",
        "detail": "The CVE 'CVE-2025-3198' has been marked as ignored by Buildroot"
    },
    "affects": [
        {
            "ref": "binutils"
        }
    ]
}
```

[1] https://cyclonedx.org/docs/1.6/json/#vulnerabilities_items_analysis_state
[2] https://cyclonedx.org/docs/1.6/json/#components_items_pedigree_patches_items_resolves

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 9415529923c9f7eaeec44c8fd3eecca79bf6b8d2)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 utils/generate-cyclonedx | 137 ++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 118 insertions(+), 19 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 60983ac1ea..a103b7b707 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -17,6 +17,8 @@ from pathlib import Path
 import urllib.request
 import subprocess
 import sys
+import re
+
 
 CYCLONEDX_VERSION = "1.6"
 SPDX_SCHEMA_URL = f"https://raw.githubusercontent.com/CycloneDX/specification/{CYCLONEDX_VERSION}/schema/spdx.schema.json"
@@ -34,6 +36,11 @@ BR2_VERSION_FULL = (
     .strip()
 )
 
+# Set of vulnerabilities that were addressed by a patch present in buildroot
+# tree. This set is used to set the analysis of the ignored CVEs to
+# 'resolved_with_pedigree'.
+VULN_WITH_PEDIGREE = set()
+
 SPDX_LICENSES = []
 
 if not SPDX_SCHEMA_PATH.exists():
@@ -111,12 +118,91 @@ def cyclonedx_licenses(lic_list):
     }
 
 
-def cyclonedx_patches(patch_list):
+def extract_cves_from_header(header: str) -> list[str]:
+    """Extract CVE identifiers from the patch header.
+
+    Args:
+        header (str): Content of the header of a patch.
+
+    Returns:
+        list: Array of CVE identifier present in a patch header passed as
+        argument.
+    """
+    PATCH_CVE_HEADER = "CVE: "
+    return [
+        line.partition(PATCH_CVE_HEADER)[2].strip()
+        for line in header.splitlines()
+        if line.startswith(PATCH_CVE_HEADER)
+    ]
+
+
+def patch_retrieve_header(content: str) -> str:
+    """Read the content of a patch and split the header from the content.
+
+    Args:
+        content (str): Patch content.
+
+    Returns:
+        str: Patch header content.
+    """
+    DIFF_LINE_REGEX = re.compile(r"^diff\s+(?:--git|-[-\w]+)\s+(\S+)\s+(\S+)$")
+    INDEX_LINE_REGEX = re.compile(r"^Index:\s+(\S+)$")
+
+    lines = content.split('\n')
+
+    header = []
+    for i, line in enumerate(lines):
+        if DIFF_LINE_REGEX.match(line):
+            # diff --git a/configure.ac b/configure.ac
+            # index 1234..1234 100644
+            # --- a/configure.ac
+            # +++ b/configure.ac
+            break
+        elif INDEX_LINE_REGEX.match(line):
+            # Index: <filename>
+            # --- <filename>
+            # +++ <filename>
+            if i < len(lines) - 2 and lines[i + 1].startswith("===") and lines[i + 2].startswith("---"):
+                break
+        elif line.startswith("---"):
+            # Some patches don't have a 'diff' tag just the --- +++ tuple.
+            # Check next line is starting with '+++'
+            # ex: package/berkeleydb/0001-cwd-db_config.patch
+            if i < len(lines) - 2 and lines[i + 1].startswith("+++") and lines[i + 2].startswith("@@"):
+                break
+        else:
+            header.append(line)
+
+    return '\n'.join(header)
+
+
+def read_patch_file(patch_path: Path) -> str:
+    """Read the content of a patch file, handling compression.
+
+    Args:
+        patch_path (Path): Patch path.
+
+    Returns:
+        str: Patch content.
+    """
+    if patch_path.suffix == ".gz":
+        f = gzip.open(patch_path, mode="rt")
+    elif patch_path.suffix == ".bz":
+        f = bz2.open(patch_path, mode="rt")
+    else:
+        f = open(patch_path)
+
+    content = f.read()
+    f.close()
+    return content
+
+
+def cyclonedx_patches(patch_list: list[str]):
     """Translate a list of patches from the show-info JSON to a list of
     patches in CycloneDX format.
 
     Args:
-        patch_list (dict): Information about the patches as a Python dictionary.
+        patch_list (list): Array of patch relative paths for a given component.
 
     Returns:
         dict: Patch information in CycloneDX format.
@@ -125,38 +211,51 @@ def cyclonedx_patches(patch_list):
     for patch in patch_list:
         patch_path = brpath / patch
         if patch_path.exists():
-            f = None
-            if patch.endswith('.gz'):
-                f = gzip.open(patch_path, mode="rt")
-            elif patch.endswith('.bz'):
-                f = bz2.open(patch_path, mode="rt")
-            else:
-                f = open(patch_path)
-
             try:
-                patch_contents.append({
-                    "text": {
-                        "content": f.read()
-                    }
-                })
+                content = read_patch_file(patch_path)
             except Exception:
                 # If the patch can't be read it won't be added to
                 # the resulting SBOM.
                 print(f"Failed to handle patch: {patch}", file=sys.stderr)
+                continue
+
+            header = patch_retrieve_header(content)
+
+            issue = {}
+            cves = extract_cves_from_header(header)
+            if cves:
+                VULN_WITH_PEDIGREE.update(cves)
+                issue = {
+                    "resolves": [
+                        {
+                            "type": "security",
+                            "name": cve
+                        } for cve in cves
+                    ]
+                }
 
-            f.close()
+            patch_contents.append({
+                "diff": {
+                    "text": {
+                        "content": content
+                    }
+                },
+                **issue
+            })
         else:
             # If the patch is not a file it's a tarball or diff url passed
             # through the `<pkg-name>_PATCH` variable.
             patch_contents.append({
-                "url": patch
+                "diff": {
+                    "url": patch
+                }
             })
 
     return {
         "pedigree": {
             "patches": [{
                 "type": "unofficial",
-                "diff": content
+                **content
             } for content in patch_contents]
         },
     }
@@ -229,7 +328,7 @@ def cyclonedx_vulnerabilities(show_info_dict):
     return [{
         "id": cve,
         "analysis": {
-            "state": "in_triage",
+            "state": "resolved_with_pedigree" if cve in VULN_WITH_PEDIGREE else "in_triage",
             "detail": f"The CVE '{cve}' has been marked as ignored by Buildroot"
         },
         "affects": [
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
