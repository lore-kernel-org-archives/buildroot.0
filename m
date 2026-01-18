Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 667A3C9830C
	for <buildroot@archiver.kernel.org>; Sun, 18 Jan 2026 22:12:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E53F40652;
	Sun, 18 Jan 2026 22:12:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wm3wEOwP14HC; Sun, 18 Jan 2026 22:12:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22D3340653
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768774369;
	bh=qOtgLAcFDSY9cUinEHLxFWbIAVIMl+SNkbzgmrjA5go=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Menatcyv5Rs4ISiBPCQ24aDYSofZYLN1kqtDllXoOPWUnFpGkNkKAjFhTGabP8/Se
	 Ivuolld9b2IJE5JfiwDrLDCkfWZO41bkBWZnhzuERmwDPW1pvXHi2WPd6AzkI0ONBt
	 dC/Xf7CuJ11ZPAZR4MMa3TlFsgJY7ShpxI1DyEgYE+iC1ZYlRmf6r0jdlx1+1/yQSk
	 aTbc55Pq00V/vGjll3Opv2vGHjs1//7l61ozyYvHpHOyUSLLaTgL0/LbVImNIw14av
	 wKaLg7DDkAc7Jk5ewUXRHrQtKd0uImDozfYPlfTYAPWNewx3dyKDGsHjzaDeXrsiNn
	 r6RGLbcLzan+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22D3340653;
	Sun, 18 Jan 2026 22:12:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B2EC2CE
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 22:12:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7F36A401A4
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 22:12:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ing3WWbUFZQF for <buildroot@buildroot.org>;
 Sun, 18 Jan 2026 22:12:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 84C7C4013D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84C7C4013D
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 84C7C4013D
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 22:12:46 +0000 (UTC)
Received: from postman.. (unknown [IPv6:2a01:e0a:2af:22b0:17d1:a908:70b9:90c3])
 (Authenticated sender: vjardin@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id E0A7B2003AE;
 Sun, 18 Jan 2026 23:12:41 +0100 (CET)
To: buildroot@buildroot.org
Cc: thomas.petazzoni@bootlin.com,
	Vincent Jardin <vjardin@free.fr>
Date: Sun, 18 Jan 2026 23:12:37 +0100
Message-ID: <20260118221238.70962-1-vjardin@free.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107233633.2870caea@windsurf>
References: <20260107233633.2870caea@windsurf>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1768774364;
 bh=+wQi/cRU7WcQpJEbfIWoYizbVrb11c1KAgPrP1yGkM8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MJJtRWQcdCRrZlP8UnCvvleEQ1ZIZtV871JGIFonNY5T36HBjX5ekF70l4zp/wA0c
 8uoiAHpsvruD+4WMJ1aBxxBovf9Ky+BvGxMuYN/4H22ItdcN573uX8TlESJzLXEgbB
 ZfbqAseD5LAOH7WgZGJv56Qe3JWsUQRfcuyk5sbXdSeeS05k6iThvVkze38t790Ua3
 5HV1H1ql9T5VRZSTNzC3mguZIcxyhx0CFGBDQkY25U+7IIk/FBlPgFO6/CT/uBGmp6
 SVpcGHYw3EsU5OWdfHOUM+aDkup2e1CiZ9g0PYjUr9sEbPmE9MJS2UxcOZRcSXv6tz
 Xg7yFdXoKY+Aw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MJJtRWQc
Subject: [Buildroot] [PATCH v2 0/1] package/dot1ag-utils: new package
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
From: Vincent Jardin via buildroot <buildroot@buildroot.org>
Reply-To: Vincent Jardin <vjardin@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

dot1ag-utils is an open source implementation of the IEEE 802.1ag
protocol providing Ethernet OAM (Operations, Administration, and
Maintenance) utilities including ethping, ethtrace, dot1agd, and
dot1ag_ccd.

Changes since v1:
  - Added `Upstream: not yet submitted` tag to patch
  - Simplified bool label to just "dot1ag-utils"
  - Fixed .mk file formatting (single space around =, no empty lines)
  - Note: libpcap does not have BR2_USE_MMU dependency, so despite
    Thomas' suggestion, this dependency was not added to dot1ag-utils.

CI: https://gitlab.com/buildroot.org/buildroot/-/pipelines/1702893660

Vincent Jardin (1):
  package/dot1ag-utils: new package

 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 ...0001-fix-strncpy-truncation-warnings.patch | 60 +++++++++++++++++++
 package/dot1ag-utils/Config.in                | 11 ++++
 package/dot1ag-utils/dot1ag-utils.hash        |  3 +
 package/dot1ag-utils/dot1ag-utils.mk          | 14 +++++
 6 files changed, 90 insertions(+)
 create mode 100644 package/dot1ag-utils/0001-fix-strncpy-truncation-warnings.patch
 create mode 100644 package/dot1ag-utils/Config.in
 create mode 100644 package/dot1ag-utils/dot1ag-utils.hash
 create mode 100644 package/dot1ag-utils/dot1ag-utils.mk

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
