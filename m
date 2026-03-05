Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE8DFF30950
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 11:54:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99C2481EBD;
	Thu,  5 Mar 2026 11:54:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yF8miAwFKWKk; Thu,  5 Mar 2026 11:54:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0897381A6D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772711669;
	bh=VoMTiSfVefM+LzwMzfrdizgUBqJtilGHZHnjrJuGifQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TGP2eARVlg+A5OfSgTUQcF/PukUrOh+GcoAdTYfKi9vamYE1uqEJF1DFGdUIn5DHE
	 niZWQmk3MjvnPGf1nj3YgWf/PyLqYB7wduI7p4SOH2Y3YdZXtauuukvFQJ9t5gWhj1
	 Uf6v4W9LxtKjk6WBsO68jwiFCBJFwq0EcCjp0BqCxZnoEZCPvS4EExSso2QSJpvV3X
	 WCkguwBeYnLMTGm22K1200Fbl/XQyRqR9HrSPPtPr+vjgkJJ0zVdp+sPCbIWOlLjNk
	 Bqt4d+qniLf3kjdXiO4dwFs6IKhHLxlHSvGWtABJYMD8d+T7ZVEm9tfIVP0oIr5NEt
	 3/BKUYdrK9v7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0897381A6D;
	Thu,  5 Mar 2026 11:54:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B282825B
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 11:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9841D4011A
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 11:54:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cGzdt_IV6RHr for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 11:54:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a02:168:860f:1::35;
 helo=mail.codelabs.ch; envelope-from=martin@strongswan.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 106CE40061
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 106CE40061
Received: from mail.codelabs.ch (mail.codelabs.ch [IPv6:2a02:168:860f:1::35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 106CE40061
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 11:54:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.codelabs.ch (Postfix) with ESMTP id 5D4A35A000D;
 Thu, 05 Mar 2026 12:54:22 +0100 (CET)
Received: from mail.codelabs.ch ([127.0.0.1])
 by localhost (fenrir.codelabs.ch [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7fezVYdrHj3C; Thu,  5 Mar 2026 12:54:21 +0100 (CET)
Received: from zbook.wlp.is (unknown [185.12.128.225])
 by mail.codelabs.ch (Postfix) with ESMTPSA id 4E5185A0005;
 Thu, 05 Mar 2026 12:54:21 +0100 (CET)
From: Martin Willi <martin@strongswan.org>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Thu,  5 Mar 2026 12:54:06 +0100
Message-ID: <20260305115413.1860514-1-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=strongswan.org; s=default; t=1772711661;
 bh=mPgU6q1wvFvnnbzaf1CoUK3kWQ9dZKTHJzTKfa0sBVg=;
 h=From:To:Cc:Subject:Date:From;
 b=HqoGjjC59SAQyaMSwOnOpBiiV5gjvZYuqaZF6CuDm9xctxICBmLlGoVYDPy3+Amor
 ey/ojqT2oxw5uPL8uwgygCtJutEUh/Im7n/6ry+cmsC3XmiFnz1u04kxSBJQknis6h
 clwxZtmVfCOAG4tuMrY6MKXYDwEPb+Vap2Foa3i1kbYCXd+di+UnGtV1zUkTTgD2/z
 bJJDu1xUK+5jxEW1vlMhid1bM60nlHtHn7y1H0bzQv5SLK8JoOd0EEwQ4RE3C4nF8K
 kwM0CojgxVsNV03xXq0dmd3tE3eJYNYKr/WHhzYcJ0ng2rK0y+pXggxDM5Z81/dzbN
 vBZN0dbjg0avw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=strongswan.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=strongswan.org header.i=@strongswan.org
 header.a=rsa-sha256 header.s=default header.b=HqoGjjC5
Subject: [Buildroot] [PATCH v2 0/7] Add additional CycloneDX SBOM controls
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

Adds command line options to control patch diffs, reference Upstream: URLs
and filter package types from output. Introduce unit-tests for existing and 
new generate-cyclonedx functionality.

Changes v1 -> v2:
  - Add a new fix removing indirect dependencies from root component
  - Filter --no-skeleton/host packages and deps early from show-info output
  - Drop --no-vuln patch and let external tooling do it for now. CSAF VEX
    generation may be added in a future series.
  - Keep patch type "unofficial", regardless of any Upstream: URL
  - Introduce unit-test first, then extend it for each added feature

Martin Willi (7):
  support/testing/utils: add basic tests for utils/generate-cyclonedx
  utils/generate-cyclonedx: remove indirect dependencies from root
    component
  utils/generate-cyclonedx: add option to control patch diff inclusion
    in SBOM
  utils/generate-cyclonedx: allow referencing patches by upstream URL
  utils/generate-cyclonedx: allow filtering skeleton packages from SBOM
  utils/generate-cyclonedx: allow filtering host packages from SBOM
  utils/generate-cyclonedx: omit BR_TYPE property if --no-host given

 .../tests/utils/test_generate_cyclonedx.py    | 204 ++++++++++++++++++
 .../cve_upstream.patch                        |  11 +
 .../test_generate_cyclonedx/no_upstream.patch |  10 +
 utils/generate-cyclonedx                      | 164 +++++++++++---
 4 files changed, 354 insertions(+), 35 deletions(-)
 create mode 100644 support/testing/tests/utils/test_generate_cyclonedx.py
 create mode 100644 support/testing/tests/utils/test_generate_cyclonedx/cve_upstream.patch
 create mode 100644 support/testing/tests/utils/test_generate_cyclonedx/no_upstream.patch

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
