Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 746AAFCE091
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 14:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 282E8831BD;
	Thu, 26 Feb 2026 14:27:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kkwq8vuKhlUU; Thu, 26 Feb 2026 14:27:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43F2382974
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772116038;
	bh=agRIhS1MTIASxeSZB6KslWSkBBVjW5jve4nOKfldivE=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gdH0XtIlPTw/RRgWM6Yl+1whi7jV1Iwv5XdYEWWeQu2WYH484bRw/blXy8OCuRrwh
	 3Bm+k5CVTHs4zt98S3I+gOxuZG6sqLT4RKSnND+KJA7np2Mn4UG5faxlekV4Hz/pjC
	 Ehl8/zJ20gqAjjOxz8HLWUKhjnv2tTpmPKdRqH3yA9ukLlb5ATXzyRJ3aJIIk0pJ/8
	 4bEC34w+oKWvG5lL6EDYvRQCHi4paBkG5Inijbat8FIZIuM7j503cqR88e0vL/UiP9
	 LVaqncUVQimavje2fFG4S4JXxmo3rNocsBRmld1qGUgyR/B/4x2/UL5PNLDpPnL+x/
	 Xu7tLGq0pKmsw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43F2382974;
	Thu, 26 Feb 2026 14:27:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DCAF824E
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 14:27:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2B7382974
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 14:27:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zFCNR-Kf6HWM for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 14:27:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a02:168:860f:1::35;
 helo=mail.codelabs.ch; envelope-from=martin@strongswan.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B3426826DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3426826DE
Received: from mail.codelabs.ch (mail.codelabs.ch [IPv6:2a02:168:860f:1::35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B3426826DE
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 14:27:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.codelabs.ch (Postfix) with ESMTP id 209C25A000D;
 Thu, 26 Feb 2026 15:27:14 +0100 (CET)
Received: from mail.codelabs.ch ([127.0.0.1])
 by localhost (fenrir.codelabs.ch [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GaFW66RZbr3w; Thu, 26 Feb 2026 15:27:13 +0100 (CET)
Received: from zbook.wlp.is (unknown [185.12.128.225])
 by mail.codelabs.ch (Postfix) with ESMTPSA id 16E985A0002;
 Thu, 26 Feb 2026 15:27:13 +0100 (CET)
From: Martin Willi <martin@strongswan.org>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Thu, 26 Feb 2026 15:26:51 +0100
Message-ID: <20260226142700.1064999-1-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=strongswan.org; s=default; t=1772116033;
 bh=+qkusldnuzZLe/NaeQcvKOWxLo9hDezxFnz5vzICpIM=;
 h=From:To:Cc:Subject:Date:From;
 b=D3bf/7ukLwNk+nb9/MtAHzoyvpfXOEJ5vJ5KqerzNdsr4XOdODyWBXDbTEt0l87x9
 WWhZJIlcx+OKfTjfSm96crihAiIR474sKdU2jIHFiRoBVclXy0IaIj8+zaGska/1B6
 qF3SrA4F5+rUq8BM+MMCgohl6ptfxMJoy+IjXO0Twl5C5TnI64a2X8ThQHzTEswetn
 c3Vq+VvA9BXWuMZxj4COsSXSLU+xGHrQeKAjSdh2Sr++A3/cl82Xfut8fI+Z1OtW6g
 xBEr+QEtVLAPmobOL1MhlprpN3bw3p2CwWTlg0BhpcDF+YJkQAZgG7/IykoACDqrUI
 l4rr+aRnm0Gfw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=strongswan.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=strongswan.org header.i=@strongswan.org
 header.a=rsa-sha256 header.s=default header.b=D3bf/7uk
Subject: [Buildroot] [PATCH 0/9] Extend CycloneDX metadata and purl
 generation
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
component purls. Extend tests to cover the new functionality.

Based on the previous series "Add additional CycloneDX SBOM controls".

Martin Willi (9):
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
  utils/generate-cyclonedx: add generic purl for http(s) source URIs
  utils/generate-cyclonedx: use github purls if a package references a
    GitHub tag
  support/testing/utils: add utils/generate-cyclonedx metadata and purl
    tests

 .../tests/utils/test_generate_cyclonedx.py    | 156 ++++++++++++++++++
 utils/generate-cyclonedx                      | 115 ++++++++++++-
 2 files changed, 270 insertions(+), 1 deletion(-)

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
