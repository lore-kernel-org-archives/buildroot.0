Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FCBFCD6E4A
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 15:31:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F9CB613CD;
	Fri, 29 May 2026 15:31:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RI-f7UTs8ydl; Fri, 29 May 2026 15:31:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CC37613EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780068711;
	bh=tycj+LXxdLS0WqZSTO1WQr8EUSKEo8weeGqF8zXnfX8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BHvybxxjizUaPf8VscJJ/Wfo/IQNoHfeUwIA2WbsAoOMHh0pEnuOFraetcOyzN7Ba
	 H6AZt1kG3BUbd5mJdq+MfYS4NPRwyrCxD4TAx/8Biu5kQdODC3eddD4ji2KVhKNvMJ
	 ZihbpqF/b/kaDmArWU7cUxjFSddEm0dZX2681A3VJ0YUgnBUJ80PujuY0tsJlhG8Ka
	 7CVljUX2kre3zvKgsMlf22BDM3zaVJTHFXnTVt9dzNvH0cD6He4QG1SPAzwZRqmfke
	 q7jnxADRQVfN4tYFFESMHfOs8hP/e9+9olyDhRRQWfvavN2LEZEy5acFSl2VpinPfP
	 TLyoxvcXGByDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CC37613EA;
	Fri, 29 May 2026 15:31:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 162B8372
 for <buildroot@buildroot.org>; Fri, 29 May 2026 15:31:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB5D6613EA
 for <buildroot@buildroot.org>; Fri, 29 May 2026 15:31:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6j4wzDgw9yZI for <buildroot@buildroot.org>;
 Fri, 29 May 2026 15:31:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47DA3613CD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 47DA3613CD
 for <buildroot@buildroot.org>; Fri, 29 May 2026 15:31:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9EA53873ED; Fri, 29 May 2026 15:31:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 17:30:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 33c26bb89873a3a2310246343fa721686c3f885b
X-Git-Newrev: e46783d3a0f56c93c2ad28236162ff4b05c134df
X-Patchwork-Hint: ignore
Message-Id: <20260529153135.9EA53873ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/cve-check: fix
 vulnerability timestamp to RFC 3339
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e46783d3a0f56c93c2ad28236162ff4b05c134df
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Normalize vulnerability timestamps to RFC 3339 format with explicit UTC
timezone suffix for CycloneDX 1.6 compliance.
This fixes validation errors in sbom-utility and makes the generated
SBOM with vulnerabilities compatible with DependencyTrack VEX parsers.

The NVD JSON data feeds provide timestamps in ISO 8601 format without timezone
information (e.g., "1999-01-01T05:00:00.000"), but CycloneDX 1.6 requires
RFC 3339 format with explicit timezone designation (e.g.,
"1999-01-01T05:00:00.000Z").

Add nvd_datetime_to_rfc3339() helper function to convert timestamps before
serialization.

Validation results:

Before fix:
  $ sbom-utility validate -i cve/cve_report_current.json
  [INFO] BOM valid against JSON schema: 'false'
  [INFO] (234) schema errors detected.

  Error example:
  {
    "type": "format",
    "field": "vulnerabilities.0.updated",
    "context": "(root).vulnerabilities.0.updated",
    "description": "Does not match format 'date-time'",
    "value": "2025-04-03T01:03:51.193"
  }

After fix:
  $ sbom-utility validate -i cve/cve_report_update.json
  [INFO] BOM valid against JSON schema: 'true'

Tested-with: sbom-utility v0.18.1
Co-authored-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/cve-check | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/support/scripts/cve-check b/support/scripts/cve-check
index bcd970bad8..5047523ade 100755
--- a/support/scripts/cve-check
+++ b/support/scripts/cve-check
@@ -12,10 +12,10 @@
 from collections import defaultdict
 from pathlib import Path
 from typing import TypedDict
+from datetime import datetime, timezone
 import argparse
 import sys
 import json
-
 import cve as cvecheck
 
 
@@ -35,6 +35,24 @@ locally.
 brpath = Path(__file__).parent.parent.parent
 
 
+def datetime_to_rfc3339(dt_string):
+    """Normalize datetime string to RFC 3339 format with Z suffix.
+
+    NVD dates are already in ISO format, just need to add the Z suffix.
+
+    Input:  "1999-01-01T05:00:00.000"
+    Output: "1999-01-01T05:00:00.000Z"
+    """
+    dt = datetime.fromisoformat(dt_string.replace('Z', '+00:00'))
+
+    if dt.tzinfo is None:
+        dt = dt.replace(tzinfo=timezone.utc)
+    else:
+        dt = dt.astimezone(timezone.utc)
+
+    return dt.isoformat().replace('+00:00', 'Z')
+
+
 def cve_api_get_lang_from_list(values, lang="en") -> (str | None):
     for x in values:
         if x.get("lang") == lang:
@@ -134,10 +152,10 @@ def nvd_cve_to_cdx_vulnerability(nvd_cve):
             "url": f"https://nvd.nist.gov/vuln/detail/{nvd_cve['id']}"
         },
         **({
-            "published": nvd_cve["published"],
+            "published": datetime_to_rfc3339(nvd_cve["published"]),
         } if "published" in nvd_cve else {}),
         **({
-            "updated": nvd_cve["lastModified"],
+            "updated": datetime_to_rfc3339(nvd_cve["lastModified"]),
         } if "lastModified" in nvd_cve else {}),
         **({
             "cwes": nvd_cve_weaknesses_to_cdx(nvd_cve["weaknesses"]),
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
