Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC905CCF9F8
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 19:09:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21EBC81E77;
	Thu, 30 Oct 2025 19:09:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q4Cdm3Sfs4yD; Thu, 30 Oct 2025 19:09:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F17E981EC4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F17E981EC4;
	Thu, 30 Oct 2025 19:09:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7345B2A3
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 19:09:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70E094004D
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 19:09:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xumZeeluRUVa for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 19:09:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4AD35400B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4AD35400B4
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4AD35400B4
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 19:09:40 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-4298a028de6so1561013f8f.0
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 12:09:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761851379; x=1762456179;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rmIzcsvhhwO1BmmA1/PifvxFE3VmZej10el4ZHogri4=;
 b=eqczDzTEFDbfi2Xa0s/DcHUw6TxRA/Ba5SDM13bA0mCiYZKan39eJ5PAt/rzd1EWoZ
 dUUl8kiorQBWBjpf4c3lXlG04dwuyroKV6lYmBaSaFdi12BEwa7TLzyMQEnVlcDF3edY
 jSVkCJ7YNhSuqXRIECNzuEG9fMZ2RkeaXkWdrMfllFBujmU4SLoN1/zfXH6olybpfg05
 WCqZ7F0zdgowIPgURpzpNtJwrt7Fx9yZhCyVcTp3ZMGqUQlMWOon3tQ5+OiMHRl11X1G
 J2pzfR9/3gDdVxRNO1ZU2hl76KSSD9i8jtQ6UYWwqDwToTo3tldo10Ln/yV986G7GkyC
 FQEA==
X-Gm-Message-State: AOJu0Yx6kh5gxOPMUVCKs0rFxiUPjHwBuprro7/xBZNCWa9JdTnsisWH
 FdSv3eArzudbMzr2XtUwiM6M9V9J/3O7pQbNI1d6J6Hx+EKIDq0fL+wS/bYF7oouI1yyyBSBXZF
 HuT9j
X-Gm-Gg: ASbGncs9h8Y/idgqYojXAgB4aU/gZRrN3bIMIc/IeDcsdI3Fvn34Mv6QIdSJ1wnVJtR
 AgFtlQAm2Nz9ziJYpnlkSvQy1b2rSfqAw4/aOJkJzrBgannWVc1sgCWSsF87ajNo3JFCgY5KMtt
 vOkvCR+Y5fQ7k27Idrpw4U22vPqcCRRT4UBh1+ndP91SEk4CZOWeEVAkfVc6pSEY/m58laNGocC
 3NThwlsR/L46gzMxYd6evuXCtkDVYxuxC05vEjCAzddtfSck3OVN02F1eZD/wbmI4vLM9G5tM4I
 1HeWlxRzInP+K7qyP9FDSUel8zMltPyREpbzhoq9rZ4V3JCoZa1WTJ/IC9T18o69emRPpHlDYdA
 a9FauuoxMQaY62OX839omotX23SED12DNgBLIhX40zNrpRMwWN0Uw8yRID1iVzyveVEJI5dFx6Q
 txtZxPatxCiqRdsdFqAE+hj0IaRw==
X-Google-Smtp-Source: AGHT+IFg8eOSIbbxKyT12tr+dTAKSoBPdKmTwKWas9UJWfal5ziL4jUtEI4JvA0735jZfTul/Mh4zw==
X-Received: by 2002:a05:6000:40e0:b0:429:8b4a:c3b4 with SMTP id
 ffacd0b85a97d-429b4c0f438mr3826180f8f.5.1761851378040; 
 Thu, 30 Oct 2025 12:09:38 -0700 (PDT)
Received: from arch (77.109.92.202.static.edpnet.net. [77.109.92.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952e2e06sm33727962f8f.46.2025.10.30.12.09.37
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 12:09:37 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 30 Oct 2025 20:09:35 +0100
Message-ID: <20251030190936.262624-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251030190936.262624-1-thomas.perale@mind.be>
References: <20251030190936.262624-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1761851379; x=1762456179; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rmIzcsvhhwO1BmmA1/PifvxFE3VmZej10el4ZHogri4=;
 b=UDqOBQbAZNbsLhPMTt5As167UQgMa5CC/AsL81EVZ1YPlVJW9/XrNWzXpcy8HpWUyY
 e+hCbC4ckljERY7L0sE+tu639NqauwP5HusQ+tagT3Ko7Fcn4vvhXjfHqSgw2p1CXAbH
 T7S67++L/gWAaI0RpSDCNXg4r3uYppoQ4hF6A4rIb1EJ93lSdzlHmeQVR9yccOi0wYzQ
 T+fTUhosnU9qqXpTL5E4BCipzdoEfQQ74ef9rqFW52OPDbS5+847BhYajPFUAJrrLfO2
 Owp/Un+jrVVxEw68lUdVsqcmK6UGg6kG+46kDJxAjaQwkH2EE1MXzKbGWNOOTDhf9pJ/
 cAOQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=UDqOBQbA
Subject: [Buildroot] [PATCH 1/2] utils/generate-cyclonedx: add support for
 'resolved_with_pedigree'
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

The CycloneDX specification for vulnerabilities defines four analysis
states ([1]) for cases where a vulnerability does not affect a component:

* 'resolved'
* 'resolved_with_pedigree'
* 'not_affected'
* 'false_positive'

Currently, the metadatas present in Buildroot does not allow an accurate
mapping of ignored CVEs to the appropriate CycloneDX vulnerability
categories. As a result, all ignored CVEs are currently marked as
'in_triage' by default.

This default analysis was was established during the introduction of the
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

If a vulnerability is addressed by multiple patch, each patch will need to
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
multiple are adressed by the same patch, the multiple identifier will be
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
---
 utils/generate-cyclonedx | 137 +++++++++++++++++++++++++++++++++------
 1 file changed, 118 insertions(+), 19 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 60983ac1ea..eade36db6b 100755
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
+        patch_list (list): Array of patch relative path for a given component.
 
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
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
