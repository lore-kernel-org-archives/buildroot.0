Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2778FCE090
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 14:27:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 842A583CBF;
	Thu, 26 Feb 2026 14:27:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hgPEScGQkwCJ; Thu, 26 Feb 2026 14:27:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DBA783E8F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772116042;
	bh=aOfSDTDEcKZ7ZLQ9OwvikSsY24M1fya8Yn0Pg3moFfc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ehj0ya0w6bD/uBA248Dq6hU/9029w7DabEPMU1wdnBPC54TPvlVTwGS3GOb4buJp+
	 X4CeAA849YtMlQbNDxO7LuFsEZD4Kf51/Rx2EFYfVN4ofkvLPc40oH4D+54dy7MPga
	 TuHtPnCG0LN3cK/wwfEw4SEfGt+2bo+BV1+a0xydaqL3SMM9lB8QtC1wUFa8PiL827
	 FNhQzuVY2Wk2FnW5hLUgN4kzDt9v+buEIqTbbxa8BEFwJd2OGhL+pV2aEj1A1CXRqb
	 jvT6O0xPwzg2wDBHh7kkjRNO3PcdsKF4IOqb1VyfBamiY71opwTNL5X5h7CdJ/ivab
	 ElHv3jaGQUFTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DBA783E8F;
	Thu, 26 Feb 2026 14:27:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C61D24E
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 14:27:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BEEEE826DE
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 14:27:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ebZjWFNudnkB for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 14:27:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=109.202.192.35;
 helo=mail.codelabs.ch; envelope-from=martin@strongswan.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 136AE828C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 136AE828C5
Received: from mail.codelabs.ch (mail.codelabs.ch [109.202.192.35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 136AE828C5
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 14:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.codelabs.ch (Postfix) with ESMTP id 5BFCB5A0004;
 Thu, 26 Feb 2026 15:27:15 +0100 (CET)
Received: from mail.codelabs.ch ([127.0.0.1])
 by localhost (fenrir.codelabs.ch [127.0.0.1]) (amavis, port 10024) with ESMTP
 id igM4EIFWz7_Y; Thu, 26 Feb 2026 15:27:14 +0100 (CET)
Received: from zbook.wlp.is (unknown [185.12.128.225])
 by mail.codelabs.ch (Postfix) with ESMTPSA id 3C6DD5A0005;
 Thu, 26 Feb 2026 15:27:13 +0100 (CET)
From: Martin Willi <martin@strongswan.org>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Thu, 26 Feb 2026 15:26:54 +0100
Message-ID: <20260226142700.1064999-4-martin@strongswan.org>
In-Reply-To: <20260226142700.1064999-1-martin@strongswan.org>
References: <20260226142700.1064999-1-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=strongswan.org; s=default; t=1772116033;
 bh=Jba8Sv3p8I5OF2FrWLjvXUZmH7T9Yksso1DED+7S+TM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HQgmGXr9IYoAcARJUjYe+EviqeDF40o/VEtjrJOZwLcraVm60Qr3Uu11tqmMDptlt
 5EYXBWV3UY6cLTbXq+Gxja8590ZDvP2wcLq7qffVIF3moM5i9TIanHi9cj1jP3GzEL
 NTbOIZYsD5f2y/Bj8PefJ3owIaa/93K4Lr/S9/eJ02E1uKuWHoehlZ7bCnfKVURBQ5
 OoxT/CErGrdDDN4M//wyGqvpJge4oZWFMI+jilsBKgAe5S9SwWthuWrIrmtT0Dv6lC
 LQ4S3ag4pDMagohAHYqHlJmumZ8RUKSaLdWD8aFDBXMvTd1caLETB96Bsx4Pq1GAkh
 JOpHq1Q6MsNiQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=strongswan.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=strongswan.org header.i=@strongswan.org
 header.a=rsa-sha256 header.s=default header.b=HQgmGXr9
Subject: [Buildroot] [PATCH 3/9] utils/generate-cyclonedx: add manufacturer
 name/URL options for SBOM metadata
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

The metadata component may contain a manufacturer field, identifying the
creator of the SBOM. Add options to set the manufacturer name and URL, both
optional. The URL option is repeatable to add multiple URLs.

Signed-off-by: Martin Willi <martin@strongswan.org>
---
 utils/generate-cyclonedx | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 3b8832cf33b0..9d0c559aa18a 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -452,6 +452,10 @@ def main():
                         help="Specify the project name to use in the SBOM metadata (default:'buildroot')")
     parser.add_argument("--project-version", type=str, default=f"{BR2_VERSION_FULL}",
                         help="Specify the project version to use in the SBOM metadata (default: builroot version)")
+    parser.add_argument("--manufacturer-name", type=str,
+                        help="Add SBOM manufacturer to CycloneDX metadata")
+    parser.add_argument("--manufacturer-url", action="append", type=str,
+                        help="Add SBOM URL to CycloneDX metadata (repeatable)")
 
     args = parser.parse_args()
 
@@ -531,6 +535,15 @@ def main():
     if not args.no_vuln:
         cyclonedx_dict["vulnerabilities"] = cyclonedx_vulnerabilities(show_info_dict)
 
+    manufacturer = {
+        k: v for k, v in {
+            "name": args.manufacturer_name,
+            "url": args.manufacturer_url,
+        }.items() if v
+    }
+    if manufacturer:
+        cyclonedx_dict["metadata"]["component"]["manufacturer"] = manufacturer
+
     args.out_file.write(json.dumps(cyclonedx_dict, indent=2))
     args.out_file.write('\n')
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
