Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E85106B53A
	for <buildroot@archiver.kernel.org>; Wed, 25 Mar 2026 13:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30F3C8224A;
	Wed, 25 Mar 2026 13:33:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ygWzReD8DoTY; Wed, 25 Mar 2026 13:33:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D45D8230A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774445634;
	bh=pRAqTy/tRjXLnUlKT3EvJF60+FoWF++NzxYQZW7OAik=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pa8ejf1ZF+LpydhutQO3DhGdHzH15b1MPqwF/AZojY+1XwmHZMhBGicwNiJKRKL8K
	 +qrGr/rfvNSAYMEByAYUTAo4xlU1ACTviUUrbLOsjVSbak/BUfPlGzKVk8XRiESVi3
	 N1vSIG5Pp433ehb3g70dvdoWOehC3I1tIqUeYIGSJgwbwnZa4Vzgxt06ExnmHLN0lF
	 StSIHJ3wyrgeSLG+4RRexkQNVF3SmBaZg2pZV3T9TjRS0v7KayNkWe8xEr1usz/bwl
	 g2hEyVkqhEIDlErlvwGVeLW5R/q+hlnfXnMCc0QZU4jBEW6Qp5p0mji8TJpkb3fXOH
	 EIiw7Vn+Nk4Ag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D45D8230A;
	Wed, 25 Mar 2026 13:33:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 83D36353
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 13:33:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 756736130C
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 13:33:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4U3iXJQrOdQe for <buildroot@buildroot.org>;
 Wed, 25 Mar 2026 13:33:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=109.202.192.35;
 helo=mail.codelabs.ch; envelope-from=martin@strongswan.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0575460F34
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0575460F34
Received: from mail.codelabs.ch (mail.codelabs.ch [109.202.192.35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0575460F34
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 13:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.codelabs.ch (Postfix) with ESMTP id 701655A0008;
 Wed, 25 Mar 2026 14:33:47 +0100 (CET)
Received: from mail.codelabs.ch ([127.0.0.1])
 by localhost (fenrir.codelabs.ch [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hh_ji4gqXncN; Wed, 25 Mar 2026 14:33:46 +0100 (CET)
Received: from zbook.home (unknown [185.12.128.224])
 by mail.codelabs.ch (Postfix) with ESMTPSA id 159435A0002;
 Wed, 25 Mar 2026 14:33:46 +0100 (CET)
From: Martin Willi <martin@strongswan.org>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Wed, 25 Mar 2026 14:33:38 +0100
Message-ID: <20260325133343.1008245-1-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=strongswan.org; s=default; t=1774445626;
 bh=2MYUTpYfJJrl4Ew0oPQ7TJLo45cGry000YEHPMdlvvw=;
 h=From:To:Cc:Subject:Date:From;
 b=VjYomQ49j8VPVr6ITxgy5A6rH+6qizxzsr4Jp8Rm8E3xWArcP0OWH8JYjyCZM4a4t
 bPG5da3SNdoQMCBhQJDCJhT48i9QR7wUBtPbvhoNEvHUGXLN0hX7FyDKKYAwXB/R57
 GAjbRVI6y6GGEdRcqO54HvApbMWyCe9DZrf59MuIa0lXHZk9lkJozaCPqF/NXOO4vB
 akjslLIJ93QC+d7qrFzE+E+hJtGfNFAUVlATS0a8dmLJ2DqEntpFVvyp6/becx0lFf
 eN3TAB0AAmRZfWokufWuKH0GkifPcgA4jJC79DoJp4cY9wJ56AsInRUSCol6S/mLKr
 RGBYZfLUX+oRA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=strongswan.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=strongswan.org header.i=@strongswan.org
 header.a=rsa-sha256 header.s=default header.b=VjYomQ49
Subject: [Buildroot] [PATCH v3 0/5] Extend CycloneDX metadata
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

Adds SBOM component externalReferences with source-distribution URLs and 
hashes, basic unit-tests and a minor fix root component dependencies.

Changes v2 -> v3:
  - Add tests and indirect dependency fix from [1], make series standalone
  - Drop build-phase/timestamp patches
  - Drop manufacturer URL patches for now
  - Include hash files in show-info output

[1] https://lists.buildroot.org/pipermail/buildroot/2026-March/798111.html

Martin Willi (5):
  support/testing/utils: add basic tests for utils/generate-cyclonedx
  utils/generate-cyclonedx: remove indirect dependencies from root
    component
  utils/generate-cyclonedx: generate externalReferences with
    source-distribution
  package/pkg-utils: add 'hashes' to show-info
  utils/generate-cyclonedx: add hashes from .hash files to
    externalReferences

 package/pkg-utils.mk                          |   7 +
 .../tests/utils/test_generate_cyclonedx.py    | 208 ++++++++++++++++++
 .../cve_upstream.patch                        |  11 +
 utils/generate-cyclonedx                      |  92 +++++++-
 4 files changed, 317 insertions(+), 1 deletion(-)
 create mode 100644 support/testing/tests/utils/test_generate_cyclonedx.py
 create mode 100644 support/testing/tests/utils/test_generate_cyclonedx/cve_upstream.patch

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
