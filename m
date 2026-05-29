Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FBA7CD6E51
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 15:06:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00D926105A;
	Fri, 29 May 2026 15:06:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o-duSzWC5hXC; Fri, 29 May 2026 15:06:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B5E860EB5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780067198;
	bh=V/ZDwSzxQUQeA/gBwBCic9wFKDbKGRQ6GnybFtgwKqs=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=Ol3xMqzN/wj4wUoA/JPcPdiIVzWE9dJhsPGLVTgSyGqPRCYEtFWulG2gmTAkJt1r9
	 YKRlOPbed80royiWXwIOSBbVCAzsMjK+l6sJVe8u9nMa/jyqnpLdSAei4oDwNLAHSQ
	 AJnVoF4qF4vODxJHu59Zsg2AemNTPFbeaMQ7XTI2FsXnu65HZ0XlK3HWaK3hjrDDX9
	 7G2GRd3oo6uUB3JtoGD73iJ1HRK37owuwLGz8QFaghH7Hawapag3HvWs8CHCS0kIq1
	 uAE/0CfVzOcsLsTUeeA3hKd8aB1YNuM04OJNnGSUePE89BUTm5WoV83+p/ivNaZ2V4
	 QeZwAsrlDCdhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B5E860EB5;
	Fri, 29 May 2026 15:06:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E33DE372
 for <buildroot@buildroot.org>; Fri, 29 May 2026 15:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E01A841E56
 for <buildroot@buildroot.org>; Fri, 29 May 2026 15:06:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5vjgNhHF5yyt for <buildroot@buildroot.org>;
 Fri, 29 May 2026 15:06:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C95D4411BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C95D4411BB
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C95D4411BB
 for <buildroot@buildroot.org>; Fri, 29 May 2026 15:06:34 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-45ef4223be7so416371f8f.2
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:06:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780067192; x=1780671992;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CIJkC8X3cvqO364J3h5lJkkpV+7IgRO64Rt07+ZoVR8=;
 b=BZqm9LVZG46s58vWHvaypfMt4cSvFdEF415W2DdAsyOyURmleWIgfZ6ppwoVNPbrnh
 2PwZXhaO2WwrPgzZtQjWVyItMLNLuIQomnIz1eUOzxWkAAzoeisCajC7ut20TrlEanQc
 0DSrwmlSO0Qt/1kNXSR9IjXs24I11XO7LyB+RwAB28mLm5dm7vkBjDeddRbmDnS32lPd
 kYRQPVxoBTWg4Ebbk75TOpnZGN34IC+fqNqo1NKiD3Ba0BcttRiSLW47D2RZGxhpO+kD
 gqsVtcPPnB1gW9hqlYSuVC47zL6vygM451+qXoa4wVFlO6Di4SH8CVNrArwpJyQnaNTc
 dlvA==
X-Gm-Message-State: AOJu0Yx0IVIymYge8R6zoVUCBB+iWA2UCBIO5mniLH29smZWXZyfm4Pn
 8gYVaaLDpxgtGlqtKbBnvhc/qNoVEbbsW7QS9iP8X280S6vE4qZ9+WiNkevq5FHuoAvU2snx0cE
 9oUjz
X-Gm-Gg: Acq92OHgUWfvy8SoX/3Ofnf0g0kVh+9Tz9+TCPSgUly7rf8880BhfEIKmQS+NKadmQh
 WrjC9sf6V/oMCW86t95YeNH7//ArGlyJjxJzg4zdRNTXBCKYw/xTpqiRAt2XWelBWkngOONuV9P
 wCPpvp9/+wpuQe5ngYdjNfdEmX8TnA/BH108CZ5yt4Y+Xgul5unoZTEkPEQSurzfs4KJFw4NNp3
 o45fG5VdR0iJozEJ4pVCgmjDv6GcXm8k1RHDMblbJipDGsPEAlqo5e6gHBjkuhh5UpeLpUfygIo
 97v2O5bitsmKaRHmK86o77IRB9c8rhqpSXIQKZgw9093W8F6gK6wOMp+cbA9zsxI65sR0L28Xv/
 UvYBb3A6l62qmwXfyIVCMuQykQDoKiCQnNLe6QqtA+dGmaWetnZeSpnvPrCBVgCeRsKHAaFsSHG
 haFOmXs7ulJfktjq5JmXkiFl3VHlijqcL0q1dRm8yulmBg1saJN3Ne8YcloA==
X-Received: by 2002:a05:6000:4610:b0:45d:817c:b8b2 with SMTP id
 ffacd0b85a97d-45ef6b67c0dmr328978f8f.30.1780067192189; 
 Fri, 29 May 2026 08:06:32 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef3559645sm4091190f8f.26.2026.05.29.08.06.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 08:06:31 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 May 2026 17:06:27 +0200
Message-ID: <20260529150631.447940-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780067192; x=1780671992; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CIJkC8X3cvqO364J3h5lJkkpV+7IgRO64Rt07+ZoVR8=;
 b=bB6i5m3BQhfVj9bqqRGoNu4pu9qGm96xgsM4yNXqfEhfY9o8mgnfFkOqhwDKG91cea
 ZzE7UdfpehvGwPX0bCGsuiTQoCnzOQwSsTqchI5yduteaw2n0l9KijMjVJgaLZVhuOB6
 StcTYOZ4y+rAckJgdPIoVxq75bQ0zAu8cS4fRJ7u8bg6THbdIZT35Zrc2PB4VUKrZYHS
 +4clqagy7O5KO7mcly7D/+/7oTfcWqfDFTjcHi+dPFQxwUJkUT9m1z7NySjWP8xpu+L3
 2LzGaLcv+S31txJOND8MRwJXWOmsYse24lKtx9TJZQLe+FDbBkWj+tPufNtdoMZe/XQO
 uaVA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bB6i5m3B
Subject: [Buildroot] [PATCH v2 1/5] support/scripts/cve-check: fix
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
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
Co-authored-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
v1 --> v2: add this patch at the base with comments from https://lore.kernel.org/r/<20260227091541.41760-1-thomas.perale@mind.be>
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
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
