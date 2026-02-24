Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21D32F3C98B
	for <buildroot@archiver.kernel.org>; Tue, 24 Feb 2026 14:56:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC83760A6B;
	Tue, 24 Feb 2026 14:56:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MdtlVc1lRfd4; Tue, 24 Feb 2026 14:56:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5C1E60DC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771944989;
	bh=cO4MBABxO/NpGyYafcM8RQc6zrGXYLacrQdT++9WUBI=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=EwzbCapWAZiQg/nAySyBx8FkTvT/smAcqn0j1ahSmEJxWPZ0fUUlROI2qFToLNzRm
	 7gZ6xRQNZqkokkMyjo/W41l9kEblR0zzP109hOH6TM88CwqZB/n1lkArw40l068Hiw
	 XyFIMcDPd1UPj+cYQR354cr6GJTuKT7uad4Fu1ZeBc1XadzZ9QRUmXKMOV2N5QGMsE
	 Y1kRoah0OXawRhlrmKm1CKo9Q6aHRE/R6USMOKS4kr1I6WhnKBT6ZzdgnilzzNwfa9
	 I+dKTM/UwPa1DuLVVkahdPA4i0mopREhh3CYSMX7+w9NBKGxpb9KOlLzRCT2zn5UFO
	 PTtFb+s65hPIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5C1E60DC0;
	Tue, 24 Feb 2026 14:56:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 143371B8
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 14:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE5F040467
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 14:56:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 86zB_-c5fMxn for <buildroot@buildroot.org>;
 Tue, 24 Feb 2026 14:56:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=fabien.lehoussel@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C98AA40434
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C98AA40434
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C98AA40434
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 14:56:27 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-436263e31abso5058815f8f.1
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 06:56:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771944985; x=1772549785;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1Naqgk5DQSyu2ruLwp8tJzPLIUHKtAXf6725+WNH+j4=;
 b=dUNKqejGM/lPRjV2vUhBN1vSmTt6HVBY3V6vy3G36RTKznsTFyZAwQZZQzlgntvefx
 mGJOfuuy334X/1U54he7EV3DoQNEjUkopHtDrnjfLxshPCwvxPxh5xdIJT3uQqXlm+EB
 PYFBw6iRDZuMeDNBk82H40scq1r5Zv20KkGlKOD1X1Q36tzpaXWNfaXeMhKQBDQs461B
 XvAQylmilHZA38gbabc61i0aRXaFRu3W02Kqta8p5ZCSj+xnMgeMwGt7pKCqWHuCYFug
 N+SqSq4Om2G+AVBDF3mL2j+c8+8SHRkkpDPasRzaRELYJM8pvh/jgpEp86RtD/x2H7CH
 GY/g==
X-Gm-Message-State: AOJu0YwiIoI5yA6654uB+GvU+lkFKRpJRbx+Jt8WWAv8I65enW5uSXPs
 dAk4VogDFNqxmC8gmaGchn4eE6fIAsh7rpDfEDHcJUJ2yz1uyFBAlB83s5SsHw0nkCdqDaS/nDU
 yAbT/
X-Gm-Gg: ATEYQzzx3499daTAKCILrxEOY7P3L6jBy4EIyAwstDwpU52yA+gcBxaJJG5o9ltM+4G
 cJbY4dX6+iliTxAAvMLtKflAVw1j7U2him3R7EaYwd4FQkjqOP/YKLmIVGvzQ+HeJEmzFMitX42
 NDPTS/e3QzDusDKSP3/xXG9zaUWRcafu+JlhRRiGRJwIjwDMwpwQv738wbz0K4c+Ope7FuRvIqn
 KgGWBAckGUsIaPRLjzOje3ZnG61SjH6cCOoqaJXLeMKa0yh/2CfzjuWLOt6Q7+dJu+mbo+9gRll
 dyp+a4tZujgSaVddISteWGZo+h36QDhsrttDpL3GrkBebXk2VaaQqHVyNIN7Xe2PRv6Z8oOoxQA
 UJ2tV60AddrPQ0D+p/L13wWyoeDqIWD8VaPFlrYnxdSS5R+o3TEI63Q9XgWo2Q+UcJOQBBeaCNK
 a+z4hjSaVAL+InddGiN5dYGj26LSirb64CXujoGT5BO7dkHo4VKfLAunj+yMwuzuvzuGNY8B3HW
 45Fhb6XXXzrZ7wxRhBUMQB0WdQnwcwtJROZ5Il+yg==
X-Received: by 2002:a05:6000:604:b0:435:9a2b:53d0 with SMTP id
 ffacd0b85a97d-4396f1816c4mr23789067f8f.45.1771944985183; 
 Tue, 24 Feb 2026 06:56:25 -0800 (PST)
Received: from FRSMI25-GRAVITY.idf.intranet
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43970bf9ff5sm28623653f8f.4.2026.02.24.06.56.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Feb 2026 06:56:24 -0800 (PST)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Fabien Lehoussel <fabien.lehoussel@smile.fr>
Date: Tue, 24 Feb 2026 15:56:22 +0100
Message-ID: <20260224145622.1789367-1-fabien.lehoussel@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1771944985; x=1772549785; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1Naqgk5DQSyu2ruLwp8tJzPLIUHKtAXf6725+WNH+j4=;
 b=yrVJYm1OMEcPifd21qAe4LAIB/6eNlExit1WxKZ7Gy25BXAq8cN6laHqFtA1VOsfZm
 XbAuKxgHgboBwpfwjsXp5E8uJn1i1FAoPuxqt8s3lrbgCMVOEo9Uh3qcWXDxDAYGYP8x
 FayhgIslQWSTAi12Xn2t/NfI+5idokQQLCzSs=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=yrVJYm1O
Subject: [Buildroot] [PATCH 1/1] support/scripts/cve-check: Fix
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
From: Fabien Lehoussel via buildroot <buildroot@buildroot.org>
Reply-To: Fabien Lehoussel <fabien.lehoussel@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>
---
 support/scripts/cve-check | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/support/scripts/cve-check b/support/scripts/cve-check
index ff14e4b238..932c67bd12 100755
--- a/support/scripts/cve-check
+++ b/support/scripts/cve-check
@@ -15,6 +15,7 @@ from typing import TypedDict
 import argparse
 import sys
 import json
+import datetime
 
 import cve as cvecheck
 
@@ -118,6 +119,25 @@ def nvd_cve_references_to_cdx(references):
     return advisories
 
 
+def nvd_datetime_to_rfc3339(dt_string):
+    """
+    Normalize datetime string to RFC 3339 format with Z suffix.
+    NVD dates are already in ISO format, just need to add the Z suffix.
+    
+    Input:  "1999-01-01T05:00:00.000"
+    Output: "1999-01-01T05:00:00.000Z"
+    """
+    if not dt_string:
+        return None
+    
+    # If already has Z or timezone offset, return as is
+    if dt_string.endswith('Z') or '+' in dt_string or dt_string.endswith('-00:00'):
+        return dt_string
+    
+    # Otherwise just append Z
+    return dt_string + 'Z'
+
+
 def nvd_cve_to_cdx_vulnerability(nvd_cve):
     """
     Turns the CVE object fetched from the NVD API into a CycloneDX
@@ -134,10 +154,10 @@ def nvd_cve_to_cdx_vulnerability(nvd_cve):
             "url": "https://nvd.nist.gov/"
         },
         **({
-            "published": nvd_cve["published"],
+            "published": nvd_datetime_to_rfc3339(nvd_cve["published"]),
         } if "published" in nvd_cve else {}),
         **({
-            "updated": nvd_cve["lastModified"],
+            "updated": nvd_datetime_to_rfc3339(nvd_cve["lastModified"]),
         } if "lastModified" in nvd_cve else {}),
         **({
             "cwes": nvd_cve_weaknesses_to_cdx(nvd_cve["weaknesses"]),
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
