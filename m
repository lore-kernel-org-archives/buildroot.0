Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E166CA9EBD
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 20:33:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA11160603;
	Sun, 11 Oct 2026 20:33:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8pvm9AMJ0OMD; Sun, 11 Oct 2026 20:33:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D8E9F605D7
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791750787;
	b=QZyGr0ctgx5L2DgrId2+4ByBm/Fgx77qyWHNxP3i5UuRknPMoV6UQR4L8lcIBNCW382E
	 GrE5o3SI8BVEoIxs+f3pgQLK7VmJjVknxhyo2+7FYw1XHY1AwIYNV21E0dDyfL+5s/pew
	 xFx55BOpXvr1XKmtWSrwaKR6nEPN6PKkp0UcZgnZzsHrEtds111M/5AAaUcwsspA3AQiO
	 Xt69pR8IrRH8jC8FS8zhbpOAFZmnQaNOuC75ScViK1tfuXFNn0LYXakGqyDSv2tGEe0tk
	 vhyx9Z1RotlNOeiGgKeN8LLz9YMHr3940bdnx1CHquyiw3MtD0yH9rCL8yDJeA9QFuA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791750787;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=i0Bdr8vWnd8kgXAn6GKhD1RyfjBRYoR6NLAaTCSLUxU=;
	b=R0aDK/+QLr8RAkOjSL+6215jfkIwu9Z8aIVSwCgPC0dVUD/r7O5zA+jt9dLKGb0fQYyB
	 NJY2nqNmIU6ktyCz2uLoZzKkgSsMPST0vWmmyf2lKjyTUpxgQciXKUZipOaDNuFHSR+NW
	 btjmcIZqHkCgpQXovHDDm/p6xth6cnu1DTCXdYwSXvPYMCQyuCCn3TNNgsXbBQMoBh9hf
	 3eeVLL7aOsWC4sC/M8i0yvwsG+mqwjnyfZf1dZDSkQCoV0mB4yNyZsXI3E5LV2JyJB+Ty
	 s3nnzOi3NJ2BrAkgLh+jWQArsMN8DEFll5OSmVOXMpW4pUpYZsasUv9xDmR8MdgkFGQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791750786;
	bh=i0Bdr8vWnd8kgXAn6GKhD1RyfjBRYoR6NLAaTCSLUxU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VIaF5FFa4DkjzAbgJdXb90iXVvi6Gwqw0/Hm5biIFwmcBhPmngzOEKvE3X2gJkqCe
	 +WWVYYY+izqYHJRnqOGcrjm0RP495GdPYZAIL8PWxKHk7aifv53oLXtVyQwAMy65zg
	 4Xr3V1lsHe54RVru69i6bGiRFJXH1mdB6y17zmYVueet4Mk9Mjx9WvYNHYqdRAQDep
	 XEZps2VD0LPy0BZnTRRcOCHWNkMfIOYliV7RaIOvuOWKlf2ZpC6yMlID0opAgwl3tb
	 gf+6T5htvWn/eqasXHNYSEFR1NdjBcMBh3zA0x4cI2OOa4qXynOJL/DXbca4ThFsBn
	 EVqdJDWqkb7kA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8E9F605D7;
	Sun, 11 Oct 2026 20:33:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 62084380
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 20:33:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 53D3080A84
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 20:33:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6PbahiX-lSfp for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 20:33:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B11AC80A68
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791750782;
 b=XL53Z5zlmisNNj0MQQuT3e6u4dFokLEKoBFXK658y/ntuz6TmGysQmRhAjCCjE+IV2ti
 BsMnOsbxrFhWaFO3k4TETMzK2tuffpSXkfpxU+UjprGX01u7tj8aljdLQBJRVC7/4AkYC
 6tq+3N63U5k7abA3zv/SbdvYjnXEey+rDKA7Ka8lM22SZwAeXbdkALqe3ImWOK+aUlze3
 2H3W9sDv/ZKmMCKD4KPEv1542xA0DZuOi9UQSclSLyjFfW8XwEm8q2rjKfM22hVezLOvl
 4ZYSx4BeqUQsZtYOv2YW1An5PoGVXoM1VBoDPI37o6Z3QaZtT0WQHruGOohs98AoucA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791750782;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=OR/mqWzKdDK6w70RQXlkvSRH5Sw5afmtMAnNHTmOgSw=;
 b=ZaJ1F4Nyplu2Mlu5E87hy20Zs7r5UVNbURKgTNuLidwiwT8qmsWyQKc849Dg+8CCYDI9
 KOqdSQpqGVzbaza9IxdKtV9Iew7NYsJICz/QUqxm3AyfDFIyo7rz9iR2o29C75RV7hr0c
 Km0FsJGacB4n5xep8Nh7/u96ILyI/Ap8QKoI0anbIFxG6nQp2z0IiEa+EjgF2+VIU4/fQ
 NU0Y20Fn8DAkeRftRc/S3wlL0/gYGLqlasOrB0FFTpLj5pCANMm6CsQu+Xy52mkebNRZg
 KWbXKdT9WjoFkTTcd8+JV8eh8+j6KZ2Ms55Whx2lFPzJ6S59bwQZD4KIDMRdePDfbVA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=lXvlV+JX; 
 arc=none smtp.remote-ip=212.227.17.22
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B11AC80A68
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 20:33:00 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MYNJq-1xAvj11mBG-00XpiF; Sun, 11
 Oct 2026 22:32:57 +0200
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
Date: Sun, 11 Oct 2026 22:32:30 +0200
Message-ID: <20261011203230.2072127-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261011203230.2072127-1-fiona.klute@gmx.de>
References: <20261011203230.2072127-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:bgeajMoZkY9LBpSS/NT0J7zsNrDgFH8Fo6uio6tWZ6X6k7117MT
 GD6QWgXI8gAxR/4imVFimrzDQIW9DZj+er+VB4J2cjZxhkiljv8aiaTKDTL4xPA47KQ4OGw
 P812UBV+oV+7c6jpgLBoMMf+uymf8QCwBdrVr2rMlJxjvgpwqFTAwixX3FKBJuxt02QbS6R
 64jysG7jqo/ygkR9MBMbQ==
UI-OutboundReport: notjunk:1;M01:P0:xw+m/lnlWpg=;s58N7mCYQGnf4lwzGHY7ZR6hGwa
 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
 =
Subject: [Buildroot] [PATCH v5 2/2] utils/generate-cyclonedx: include
 external tree information
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

External tree information may be important for interpreting SBOM
information, especially if the SBOM lists packages (components) that
do not exist in the listed version of Buildroot itself. External trees
mentioned in the show-info data of any package are listed in the
metadata.component.components list of the SBOM.

For packages from external trees, the bom-ref of the external tree is
listed in the BR_EXTERNAL_TREE property.

Note that this implies external trees that do not provide packages
used in the build (e.g. only defconfigs or overlays) will not be
listed.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
Double SOB line is because initial development was sponsored, but the
current revision wasn't.

Changes v4 -> v5:
* Rebase on changes in master
* Name package property in show-info output "external-tree" instead of
  "external" for clarity

Changes v3 -> v4:
* Use "external" and "package_dir" from per-package information to
  derive external tree information. This removes the need for a
  separate input file with external tree info (restructuring of former
  patches 1 and 3).

 utils/generate-cyclonedx | 91 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 87 insertions(+), 4 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 1fbf020a3d..acbc10c433 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -9,6 +9,7 @@
 
 
 import argparse
+from dataclasses import dataclass
 import importlib.util
 import json
 import os
@@ -21,6 +22,7 @@ import urllib.request
 import subprocess
 import sys
 import re
+from typing import Any, ClassVar
 
 
 DEFAULT_CYCLONEDX_VERSION = "1.6.2"
@@ -87,6 +89,74 @@ def br2_retrieve_spdx_licenses(version: str):
     return ret
 
 
+@dataclass
+class ExternalTree:
+    name: str
+    path: Path
+    version: str
+    bom_ref_prefix: ClassVar[str] = "buildroot-external"
+
+    def __post_init__(self) -> None:
+        """self.path may have been initialized with any subdirectory
+        of the external tree. Search for the external.desc file to
+        find the root of the external tree.
+
+        """
+        for p in (self.path, *self.path.parents):
+            if (p / "external.desc").is_file():
+                self.path = p
+                break
+        if not (self.path / "external.desc").is_file():
+            raise Exception(
+                f"No external.desc file found in any ancestor of {self.path}")
+
+    @classmethod
+    def from_show_info(cls, show_info_dict: dict[str, Any]) -> dict[str, 'ExternalTree']:
+        external_trees = dict()
+        for pkg_name, pkg_info in show_info_dict.items():
+            if "external-tree" not in pkg_info:
+                continue
+            name = pkg_info["external-tree"]["name"]
+            if name in external_trees:
+                # already recorded
+                continue
+            external_trees[name] = cls(
+                name=name,
+                path=Path(pkg_info["package_dir"]),
+                version=pkg_info["external-tree"]["version"],
+            )
+        return external_trees
+
+    @property
+    def bom_ref(self) -> str:
+        return f"{self.bom_ref_prefix}:{self.name}"
+
+    @property
+    def description(self) -> str:
+        external_desc = self.path / "external.desc"
+        with external_desc.open() as fh:
+            for line in fh:
+                try:
+                    k, v = [s.strip() for s in line.split(":", maxsplit=1)]
+                except IndexError:
+                    # invalid line, ignore
+                    continue
+                if k == "desc":
+                    return v
+        raise ValueError(f'No description ("desc") in {external_desc}')
+
+    def as_component(self) -> dict[str, str]:
+        """Format self as a component dict ready to be included in
+        CycloneDX JSON output."""
+        return {
+            "bom-ref": self.bom_ref,
+            "name": self.name,
+            "type": "firmware",
+            "description": self.description,
+            "version": self.version,
+        }
+
+
 def split_top_level_comma(subj):
     """Split a string at comma's, but do not split at comma's in between parentheses.
 
@@ -405,10 +475,16 @@ def cyclonedx_component(name, comp):
         } if "cpe-id" in comp else {}),
         **cyclonedx_external_refs(comp),
         **(cyclonedx_patches(name, comp["patches"]) if comp.get("patches") else {}),
-        "properties": [{
-            "name": "BR_TYPE",
-            "value": comp["type"],
-        }],
+        "properties": [
+            {
+                "name": "BR_TYPE",
+                "value": comp["type"],
+            },
+            *(({
+                "name": "BR_EXTERNAL_TREE",
+                "value": f"{ExternalTree.bom_ref_prefix}:{comp['external-tree']['name']}",
+            },) if "external-tree" in comp else ()),
+        ],
     }
 
 
@@ -567,6 +643,9 @@ def main():
     # only the first two numbers (e.g. 1.6) are valid in the schema and the
     # 'specVersion'.
     cdx_spec_version = ".".join(args.cdx_version.split(".")[:2])
+
+    external_trees = ExternalTree.from_show_info(filtered_show_info_dict)
+
     cyclonedx_dict = {
         "bomFormat": "CycloneDX",
         "$schema": f"http://cyclonedx.org/schema/bom-{cdx_spec_version}.schema.json",
@@ -577,6 +656,10 @@ def main():
                 "name": args.project_name,
                 "version": args.project_version,
                 "type": "firmware",
+                **(
+                    {"components": [ext.as_component() for ext in external_trees.values()]}
+                    if external_trees else {}
+                )
             },
             "tools": {
                 "components": [
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
