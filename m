Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51DA0F30950
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 11:58:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 221A14095D;
	Thu,  5 Mar 2026 11:58:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eglUvG3EmAP8; Thu,  5 Mar 2026 11:58:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5229D408CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772711891;
	bh=v8ZOiVkl8FkRjnmCQip50UzN3106OyCCjqDrfcqrRIQ=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HoB8x2/3AfCLpFmRK6kS5E5oIzMK58Zh35aaLqO/9IG5x11NpzQEQeNzH22goqJQ+
	 Um3L+Ts+JRFuBxuMmnO3VkctfGg9wwglvY74Gv+zdhhXURoXp6FmrqRc0libq1diWI
	 1RcO4t6MT0H77bm70lqDjQbjY6iQ1yz6seSJOnejCpjMmclEsnUOi1UFr2ezqUVeDn
	 jnFMKzCs6Ra1GibM5lyL2V8FoK3NrmF+JFeEZOq192y3UXYxWwAvRV6LyR6KyWAuFa
	 03w26hwYwoJ7fW6y2w0wva25v130v4l9qJ+zNRUzGlQQdTJk10LGVPHBv36S5VFqs7
	 Iro/PslXSc+fA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5229D408CA;
	Thu,  5 Mar 2026 11:58:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F3E4F25B
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 11:58:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E5873408CA
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 11:58:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fSlFbNEsh1kv for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 11:58:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=109.202.192.35;
 helo=mail.codelabs.ch; envelope-from=martin@strongswan.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B3A3740AF6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3A3740AF6
Received: from mail.codelabs.ch (mail.codelabs.ch [109.202.192.35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B3A3740AF6
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 11:58:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.codelabs.ch (Postfix) with ESMTP id D6AC55A0004;
 Thu, 05 Mar 2026 12:58:06 +0100 (CET)
Received: from mail.codelabs.ch ([127.0.0.1])
 by localhost (fenrir.codelabs.ch [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tyU1SxLeAML4; Thu,  5 Mar 2026 12:58:04 +0100 (CET)
Received: from zbook.wlp.is (unknown [185.12.128.225])
 by mail.codelabs.ch (Postfix) with ESMTPSA id 996025A0005;
 Thu, 05 Mar 2026 12:58:04 +0100 (CET)
From: Martin Willi <martin@strongswan.org>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Thu,  5 Mar 2026 12:57:45 +0100
Message-ID: <20260305115752.1861153-2-martin@strongswan.org>
In-Reply-To: <20260305115752.1861153-1-martin@strongswan.org>
References: <20260305115752.1861153-1-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=strongswan.org; s=default; t=1772711884;
 bh=3Q7F7+fZJaD9atjMabxQIt9x3BQB8pLpeJffUK6Ts8Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ABb5v1SOI62YS4sBML+P+Y5sWnnRY+zMZ/aiJazlpgS5hFkiXSqYgXRfHkfP7YAVE
 BbMuwlTyRaVbFYEi3k5L5KPdYlUD3zbFtMg3+1BSAj83AHS4W0way0G8mIgI20RBA3
 CK5KC25iQ1OVlttLQSEM2Ml3LnkP6r/TInEG92GyXBvBNwSmP+quCG2PEV0dl1XAAv
 nFvHqGpX9TvuX5cA2LxBozHjwNfE+UNOxRQym0rdh1xnkA0zNyMk13yN5VhEGlvD9+
 rxFv40z5KShajYrQUKj+gT4L1gTnPzINvdlXZtvMLsIQ7j2bQMlfSket4X1f6lxPLX
 vj26JlWW33tQQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=strongswan.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=strongswan.org header.i=@strongswan.org
 header.a=rsa-sha256 header.s=default header.b=ABb5v1SO
Subject: [Buildroot] [PATCH v2 1/8] utils/generate-cyclonedx: add generation
 timestamp to the SBOM metadata
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The metadata timestamp defines the time of SBOM creation. This is typically the
current time, so always add this timestamp in UTC format to the SBOM.

Signed-off-by: Martin Willi <martin@strongswan.org>
---
 support/testing/tests/utils/test_generate_cyclonedx.py | 5 +++++
 utils/generate-cyclonedx                               | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/support/testing/tests/utils/test_generate_cyclonedx.py b/support/testing/tests/utils/test_generate_cyclonedx.py
index 6fde96d23e9b..2d03e650fed5 100644
--- a/support/testing/tests/utils/test_generate_cyclonedx.py
+++ b/support/testing/tests/utils/test_generate_cyclonedx.py
@@ -5,6 +5,7 @@ import os
 import subprocess
 import tempfile
 import unittest
+from datetime import datetime, timezone
 from pathlib import Path
 
 import infra
@@ -105,6 +106,10 @@ class TestGenerateCycloneDX(unittest.TestCase):
     def test_default(self):
         result = self._run_script()
 
+        metadata = result["metadata"]
+        timestamp = datetime.fromisoformat(metadata["timestamp"])
+        self.assertEqual(timestamp.tzinfo, timezone.utc)
+
         self.assertEqual(len(result["components"]), 4)
         self.assertIn("vulnerabilities", result)
         vulnerabilities = {v["id"]: v for v in result["vulnerabilities"]}
diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 85cc77cf44ed..459f1ea5d121 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -16,6 +16,7 @@ import os
 from enum import Enum
 from pathlib import Path
 from typing import Any, Optional
+from datetime import datetime, timezone
 import urllib.request
 import subprocess
 import sys
@@ -509,6 +510,7 @@ def main():
         "$schema": f"http://cyclonedx.org/schema/bom-{CYCLONEDX_VERSION}.schema.json",
         "specVersion": f"{CYCLONEDX_VERSION}",
         "metadata": {
+            "timestamp": datetime.now(timezone.utc).isoformat(timespec="seconds"),
             "component": {
                 "bom-ref": args.project_name,
                 "name": args.project_name,
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
