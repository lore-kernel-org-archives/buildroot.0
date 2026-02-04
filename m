Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C6B6E95396
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 12:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A60680BA9;
	Wed,  4 Feb 2026 12:44:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nyyRvk53dYTE; Wed,  4 Feb 2026 12:44:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11E4C80B56
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770209071;
	bh=6bZ+LN0U1WjjPa/OeEHX2T53e2u27kPv3VQCem0wbvc=;
	h=From:To:CC:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Bpn2VDkaqZ5mpJ4l1oLcAGN5yuV92ebVvTthE3dWtqvMquyOvRLO6gN1CRx+eiXq6
	 MjJfMD7eyiU+uGluEQscUKZoLsq8gg3MBxMCaU9z4Z/lHSBtEDwDV9vxJtcZHt3k4i
	 oo8ZCgX51SYhY99ag1EHImhj1jh6gCDDnJ+g3ifrhIQeHXWXsBFESCBX2iuDeNRWBE
	 0lsluE7ckD2SwdTGJBCtD0pdKrOIRs6QQu1hmhC3Uch6bV2i5LUGBOWJ9/3CKAW+tU
	 T8wXFFY5YOufATq52s72vVvifEzW2gxtayxoazJT9xMsWPifJBiNMdXZBYoqCKrEbk
	 uIKFG+rYh3qOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11E4C80B56;
	Wed,  4 Feb 2026 12:44:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B93C6F4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 12:44:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98820405F0
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 12:44:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ODnzeDev5qaA for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 12:44:28 +0000 (UTC)
X-Greylist: delayed 427 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 04 Feb 2026 12:44:27 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 12D5D400FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12D5D400FB
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.123;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.123])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 12D5D400FB
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 12:44:27 +0000 (UTC)
X-CSE-ConnectionGUID: b4RyeEgRQEO2lU8ZagndUQ==
X-CSE-MsgGUID: v/+VSJloR7Ku725TX77r5Q==
Received: from unknown (HELO opfedv1rlp0g.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 04 Feb 2026 13:37:17 +0100
Received: from unknown (HELO OPE16NORMBX605.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0g.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 13:37:17 +0100
Received: from OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] by
 OPE16NORMBX605.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Wed, 4 Feb 2026 13:37:15 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61;
 Wed, 4 Feb 2026 13:37:13 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Wed, 04 Feb 2026 13:37:13 +0100
X-CSE-ConnectionGUID: NfSR15+WTg25psJkzv2k2g==
X-CSE-MsgGUID: CRcvfeGOTmGYGqHQO51kng==
X-IronPort-AV: E=Sophos;i="6.21,272,1763420400"; d="scan'208";a="388617679"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: Heiko Thiery <heiko.thiery@gmail.com>, "Yann E . MORIN"
 <yann.morin@orange.com>
Date: Wed, 4 Feb 2026 13:37:13 +0100
Message-ID: <cover.1770208629.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-Originating-IP: [10.115.26.53]
X-ClientProxiedBy: OPE16NORMBX607.corporate.adroot.infra.ftgroup
 (10.115.27.31) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1770209068; x=1801745068;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CvWCXBC2GD/+MwPw7L25xwF6rXrrVEZfrmNl1rmNFrI=;
 b=pVSHhyLXSTK3rnudhzP5J+RJS1lH29Lyf8Kydv6oH65K2URgrI/gx3mS
 cEdlPpT3SPmBkB9HzKnHpibBLKMU2wHh6pEdBCasiFhXyu7iguUGtO6FZ
 L295UYKlmpY53VJR7NnlnDEJtLokHE1+4JyWyZoqYiNr72iQMGjPrWASh
 1CTYknTG18L0MEuncbdQwE6MnW5DoVYvpcL8H2lVvGGupbzFRhjbLagNt
 TEYPUGveedkCkrss2ET+K8/BMtDM4Ase/4rb0DH+Oh2sGUw26S6CWbw5u
 rswpwNwP3/UDRAzkpNXgbDH2kwUHRgEFMZpxRDezJn/Sx/PGLCfeVOtF4
 A==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=pVSHhyLX
Subject: [Buildroot] [PATCH 0/3] package/blake3: add target variant
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

From: "Yann E. MORIN" <yann.morin@orange.com>

Hello All!

This small series extends blake3 to being a target package, in addition
to being a host package.


Regards,
Yann E. MORIN.


The following changes since commit 27fed8e7ba87671161c6ae9ab4aeb20533ede93d

  beaglev_fire: remove fdt set from boot script (2026-02-04 12:03:13 +0100)


are available as patches in this mail series,

for you to apply patches up to b2d5a34a036132c546c17f2f3687b8ccf7c0e967

  package/blake3: add target support (2026-02-04 13:36:54 +0100)


----------------------------------------------------------------
Yann E. MORIN (3):
      package/blake3: explicitly disable threading & examples
      package/blake3: bump to version 1.8.3
      package/blake3: add target support

 package/Config.in          |  1 +
 package/blake3/Config.in   |  8 ++++++++
 package/blake3/blake3.hash |  2 +-
 package/blake3/blake3.mk   | 12 +++++++++++-
 4 files changed, 21 insertions(+), 2 deletions(-)
 create mode 100644 package/blake3/Config.in

--
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
|                 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
| yann.morin (at) orange.com           |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
