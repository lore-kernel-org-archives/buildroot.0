Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE0EF30953
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 11:58:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A95F813CB;
	Thu,  5 Mar 2026 11:58:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M-fRo28lZm2V; Thu,  5 Mar 2026 11:58:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7915881EC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772711892;
	bh=6txMDHtqO/6ULx3m0FezsN10yAKpt31egMRy60EHv5M=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VYTBajlQ0AjdVLz3Eo44/z2aoHIgOQD7iZq+r/O1Q7BQlRzNk1vwedZhIUEF6BBZ7
	 9Hh2n0nUtHaLp5TzBpUkyiAeiUNLxnSEJffbtuLkpNko5r87D7uwsGVVtXHQ7qy49x
	 0oqOHV3mM56uoo0+IsWTP2xOZXe1rh4mZsF2J1xtTRm5RC1jO7FkqGzeILtIY+AUrJ
	 qhQYAb4xM4o4IUvgqLwCEujvMWHXCmGo8yRoDxAjzNZjMAWNaOQbLXFtl5WRpyBgZm
	 huZmvr1OfYAUrz1YQSiGzzIyK97qAyf74HUamyDLC4AnL8TMVTqMDq/s1hKiknG7Vy
	 OZ9MMyZsk5/Gg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7915881EC1;
	Thu,  5 Mar 2026 11:58:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5524C223
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 11:58:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D167409FB
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 11:58:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6XAOtlUPYbRe for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 11:58:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a02:168:860f:1::35;
 helo=mail.codelabs.ch; envelope-from=martin@strongswan.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8D92040945
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D92040945
Received: from mail.codelabs.ch (mail.codelabs.ch [IPv6:2a02:168:860f:1::35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8D92040945
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 11:58:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.codelabs.ch (Postfix) with ESMTP id EE0885A0005;
 Thu, 05 Mar 2026 12:58:07 +0100 (CET)
Received: from mail.codelabs.ch ([127.0.0.1])
 by localhost (fenrir.codelabs.ch [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bHJAis63zlie; Thu,  5 Mar 2026 12:58:06 +0100 (CET)
Received: from zbook.wlp.is (unknown [185.12.128.225])
 by mail.codelabs.ch (Postfix) with ESMTPSA id A09995A0006;
 Thu, 05 Mar 2026 12:58:04 +0100 (CET)
From: Martin Willi <martin@strongswan.org>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Thu,  5 Mar 2026 12:57:46 +0100
Message-ID: <20260305115752.1861153-3-martin@strongswan.org>
In-Reply-To: <20260305115752.1861153-1-martin@strongswan.org>
References: <20260305115752.1861153-1-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=strongswan.org; s=default; t=1772711884;
 bh=ZHb1EZ4f88E5QlhVbKRbySnTSbA5hG++hN3Mm4GEmb4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TJ/9xYGQr49kTDa/2rLosFm33oxDREJ4zpFDPczquM/atUrVO2vbif6RQGXzOcM8p
 yztrTgfaEXv07JUG4uZ5inyspYOoxsRdhu3OCD3byllLaPOGG/9rqPCvzu9qhQn1Jg
 kU5TBHbV+SY0qxKtSMHoR4TzPFxpbDCMrr+TWJEni9BsvB14IKiOvqfMXYSgPQOIxw
 VYvSgZo9OwPialzVy2Qlnv8pThfVPiqw5VwpYjdbizXbHQ5Yr1Aul8KNNAXCZGry+Q
 b8jYbWW9kdER+IRRiwoIMu/DlxHrQQYQJnsnOI1bjwOotqCysj7aNZ/cVowlr3RyEo
 hwxVwO4w4wJEQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=strongswan.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=strongswan.org header.i=@strongswan.org
 header.a=rsa-sha256 header.s=default header.b=TJ/9xYGQ
Subject: [Buildroot] [PATCH v2 2/8] utils/generate-cyclonedx: add
 build-phase lifecycle entry to SBOM
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

Generating an SBOM from Buildroot usually means it is produced during the build
phase. Hard-code the lifecycle phase to "build" to reflect this.

Signed-off-by: Martin Willi <martin@strongswan.org>
---
 support/testing/tests/utils/test_generate_cyclonedx.py | 2 ++
 utils/generate-cyclonedx                               | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/support/testing/tests/utils/test_generate_cyclonedx.py b/support/testing/tests/utils/test_generate_cyclonedx.py
index 2d03e650fed5..b9f375364da1 100644
--- a/support/testing/tests/utils/test_generate_cyclonedx.py
+++ b/support/testing/tests/utils/test_generate_cyclonedx.py
@@ -109,6 +109,8 @@ class TestGenerateCycloneDX(unittest.TestCase):
         metadata = result["metadata"]
         timestamp = datetime.fromisoformat(metadata["timestamp"])
         self.assertEqual(timestamp.tzinfo, timezone.utc)
+        self.assertIn("lifecycles", metadata)
+        self.assertEqual(metadata["lifecycles"][0]["phase"], "build")
 
         self.assertEqual(len(result["components"]), 4)
         self.assertIn("vulnerabilities", result)
diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 459f1ea5d121..7d9f951ac8a9 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -517,6 +517,11 @@ def main():
                 "version": args.project_version,
                 "type": "firmware",
             },
+            "lifecycles": [
+                {
+                    "phase": "build",
+                }
+            ],
             "tools": {
                 "components": [
                     {
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
