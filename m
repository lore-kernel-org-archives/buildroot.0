Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 539E1FCE08E
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 14:26:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C63848410B;
	Thu, 26 Feb 2026 14:26:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jufUW3yjGfGK; Thu, 26 Feb 2026 14:26:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9BCD8410F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772115964;
	bh=zhiyv9HI1fKzs1RoqO1g+XSNaMW0tBCatpH28JgS12s=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=J6Jn7wo9gxXXYcQWjpyGFtBMBmdvhPXHppr7cqILUUPIlvpXCAwzI5+nIm3BHNmOm
	 gj1DnwEV8Wtbn9gIOwRFFIcQKqA2NTA3NndnhzyjoCMcRAKBbydJ57lBpUVQILEj7F
	 2e9h8eh6PiqIdlvGBQuqKGM5AINJbv3n8jdeGfJuGieICpJUbBHBWyZFuQeXsW7GYu
	 aCk673ENraqwSFwXNZ4mCeeYko8eSiWrL7YiewhctjZs4G1Yd8vN1rTIwPok4ymzDs
	 S2/rgFLS8tnSpaK/qbyhlaaeskQ/dQFueE1JH/H0Ukfdq0BfUpWnXMDX4jzwJXeDCQ
	 s7Pi9GeLIEB2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9BCD8410F;
	Thu, 26 Feb 2026 14:26:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 51E18438
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 14:26:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43A1984100
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 14:26:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LGYr0-ALYRYC for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 14:26:01 +0000 (UTC)
X-Greylist: delayed 308 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 26 Feb 2026 14:26:00 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 94A7C840E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94A7C840E2
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a02:168:860f:1::35;
 helo=mail.codelabs.ch; envelope-from=martin@strongswan.org;
 receiver=<UNKNOWN> 
Received: from mail.codelabs.ch (mail.codelabs.ch [IPv6:2a02:168:860f:1::35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 94A7C840E2
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 14:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.codelabs.ch (Postfix) with ESMTP id 0FDF75A000C;
 Thu, 26 Feb 2026 15:20:50 +0100 (CET)
Received: from mail.codelabs.ch ([127.0.0.1])
 by localhost (fenrir.codelabs.ch [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pl8i2-4C2EKE; Thu, 26 Feb 2026 15:20:49 +0100 (CET)
Received: from zbook.wlp.is (unknown [185.12.128.225])
 by mail.codelabs.ch (Postfix) with ESMTPSA id 0705F5A0002;
 Thu, 26 Feb 2026 15:20:49 +0100 (CET)
From: Martin Willi <martin@strongswan.org>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Thu, 26 Feb 2026 15:20:15 +0100
Message-ID: <20260226142023.1064241-1-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=strongswan.org; s=default; t=1772115649;
 bh=WUgQUSNOnJFpfE6AZAN6W0qmf+/0AnqMo72LzX+YsZo=;
 h=From:To:Cc:Subject:Date:From;
 b=x1se/sfr5G83VhDTVzEDJey66oAinufMQIOsoOWp8yrSz/k8HHPCbWydUepk+19/m
 0aQlWfiXCxfJxqN9CKcbQqaq0agZgQxDNi0jo2Hw+dLspXdRtgtUPCSh5p6/5GYDns
 /DLlmURNXIBjGvrr8GIEn9JV1FO1uJ4SaXNPI0U0a5G45wPVMfj7dG/Jk468wNo/O9
 o3gCGhpICW5Mhu7TGW2py1iVl2xcTcm0QmwRyDEcpCCauDIVLvJo3LI7ZnKBuzh8EX
 9bZG4dtFX2mpFK/+OvY4031MR7ctinv5r8KzQcZNujWtm26ENxn9Xhm3MObTRcBsvJ
 KfR3p1mxDNT7g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=strongswan.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=strongswan.org header.i=@strongswan.org
 header.a=rsa-sha256 header.s=default header.b=x1se/sfr
Subject: [Buildroot] [PATCH 0/8] Add additional CycloneDX SBOM controls
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

Adds command line options to control patch diffs, filter package types 
and suppress some properties. Introduce unit-tests for existing and new
generate-cyclonedx functionality.

Martin Willi (8):
  utils/generate-cyclonedx: add option to control patch diff inclusion
    in SBOM
  utils/generate-cyclonedx: allow referencing patches by upstream URL if
    available
  utils/generate-cyclonedx: allow filtering skeleton packages from SBOM
  utils/generate-cyclonedx: allow filtering host packages from SBOM
  utils/generate-cyclonedx: omit BR_TYPE property if --no-host given
  utils/generate-cyclonedx: do not list filtered packages as
    dependencies
  utils/generate-cyclonedx: allow excluding vulnerabilities section
  support/testing/utils: add tests for utils/generate-cyclonedx

 .../tests/utils/test_generate_cyclonedx.py    | 165 ++++++++++++++++++
 .../cve_upstream.patch                        |  11 ++
 .../test_generate_cyclonedx/no_upstream.patch |  10 ++
 utils/generate-cyclonedx                      | 160 ++++++++++++-----
 4 files changed, 303 insertions(+), 43 deletions(-)
 create mode 100644 support/testing/tests/utils/test_generate_cyclonedx.py
 create mode 100644 support/testing/tests/utils/test_generate_cyclonedx/cve_upstream.patch
 create mode 100644 support/testing/tests/utils/test_generate_cyclonedx/no_upstream.patch

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
