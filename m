Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6944EF30951
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 11:58:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D3FB812F7;
	Thu,  5 Mar 2026 11:58:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JMh-_bMX3w98; Thu,  5 Mar 2026 11:58:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 569D98131D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772711890;
	bh=MgRGxqAQRbuLGKefbTMbgLE0MIlb5wW/hIopNSp956k=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kXxQNZ+M/OR1ilGLlGn2RciVeWOU1/EJ5c9/4m7KpXw1gRHgPMqOb8S2Oeer972zR
	 hU8TBuGsoVt1CiLCz67V+jshqzMHKYEpLCyW6rBDU9CpOlPrPfeANXtkmgRbGupks9
	 WiMffK/P7RhmIUmaIgkdlcn7d6XX3n3SuVsZ7WVyTVeFwODo1iw5XdNtLoqgI86MiA
	 HNrcZ8Ftoq5af57s8PrfIgc0KE9eicibpW74S7I2iyIjRO67v7B14eHZ6ck0C0Q3s9
	 YraoECVE7XvIwUy4wKbMZOx9s3DTr0rlBPcOkwtZmg+N4kearrn1LHiBPiWuNsqDbf
	 qm2lzLwc8Zxng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 569D98131D;
	Thu,  5 Mar 2026 11:58:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3429425B
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 11:58:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25F018131D
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 11:58:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YcpjNdR2zeSG for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 11:58:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a02:168:860f:1::35;
 helo=mail.codelabs.ch; envelope-from=martin@strongswan.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1E0B6812F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E0B6812F7
Received: from mail.codelabs.ch (mail.codelabs.ch [IPv6:2a02:168:860f:1::35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1E0B6812F7
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 11:58:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.codelabs.ch (Postfix) with ESMTP id 482DD5A000D;
 Thu, 05 Mar 2026 12:58:06 +0100 (CET)
Received: from mail.codelabs.ch ([127.0.0.1])
 by localhost (fenrir.codelabs.ch [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 919RZRMMRkbD; Thu,  5 Mar 2026 12:58:04 +0100 (CET)
Received: from zbook.wlp.is (unknown [185.12.128.225])
 by mail.codelabs.ch (Postfix) with ESMTPSA id 91AD55A0004;
 Thu, 05 Mar 2026 12:58:04 +0100 (CET)
From: Martin Willi <martin@strongswan.org>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Thu,  5 Mar 2026 12:57:44 +0100
Message-ID: <20260305115752.1861153-1-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=strongswan.org; s=default; t=1772711884;
 bh=Rbrv84AnTgHBbS5oh4nDxGhUtqps9HxJw40VjmmHFpo=;
 h=From:To:Cc:Subject:Date:From;
 b=0BMYeBvuPC9EO215+sGE+s6JF1UA4k7gRgUexZEDk9h752EpbGRyzwBsSF4jjckrk
 8dmuJ3Y/ldg9KGljWQQKFkjDEdOXLt5gYsQU97PvoOzHF3rDfnlKaWZ26i2ZfEeNbK
 3ahLrQNODszZhV2q/ve+VCu1XQz8GsFqB3mahErDV4JKV75uP8NSn8DqQLlyC6VkxL
 gzEeT2CkbnhiU1ZIS/FVqn9C/MMgJNYmGi0ty3Xf5aJV2URrogN+GyJNN758ZbfeDH
 AdBjc7FNqwgkkPg1VOCj6QDAj+oPWJV41tJytXb43YSM4kpMcJZqOBjS41e60Bdqyu
 Dv26CVoUzotHg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=strongswan.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=strongswan.org header.i=@strongswan.org
 header.a=rsa-sha256 header.s=default header.b=0BMYeBvu
Subject: [Buildroot] [PATCH v2 0/8] Extend CycloneDX metadata
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

Adds SBOM metadata (timestamps, lifecycle, manufacturer info) and
component externalReferences with source-distribution URL and hashes.

Based on the previous v2 series "Add additional CycloneDX SBOM controls".

Changes v1 -> v2:
  - Drop PURL patches for generic: and github: PURLs
  - Instead add patches to generate source-distribution externalReferences 
  - Extend unit-test along with each added feature

Martin Willi (8):
  utils/generate-cyclonedx: add generation timestamp to the SBOM
    metadata
  utils/generate-cyclonedx: add build-phase lifecycle entry to SBOM
  utils/generate-cyclonedx: add manufacturer name/URL options for SBOM
    metadata
  utils/generate-cyclonedx: extract manufacturer URL from package
    Config.in
  utils/generate-cyclonedx: check for manufacturer URLs in non-lib
    package
  utils/generate-cyclonedx: find manufacturer URL under *_TARGET symbols
  utils/generate-cyclonedx: generate externalReferences with
    source-distribution
  utils/generate-cyclonedx: add hashes from .hash files to
    externalReferences

 .../tests/utils/test_generate_cyclonedx.py    | 181 ++++++++++++++++++
 utils/generate-cyclonedx                      | 146 +++++++++++++-
 2 files changed, 326 insertions(+), 1 deletion(-)

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
