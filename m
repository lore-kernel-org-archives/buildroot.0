Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64CD9C88E64
	for <buildroot@archiver.kernel.org>; Mon, 14 Sep 2026 12:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18C89405E8;
	Mon, 14 Sep 2026 12:49:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3yT9HyzBw3Wr; Mon, 14 Sep 2026 12:49:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 22247405F4
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789390149;
	b=NtyhYYjvPS6JQDpP9UCrhhEqcIeeUV6u4ugxhun//9ykTme09g346dvdo5QuqigXpnE3
	 8Yr9+z0aqoxbvSNj2zIvWngKx58vzxT7Wyibn+rX/p+eRssnZTl7h+iTE+8UskoNsz1YP
	 PQSchYrF/QGgT7GjL7QcI2yQ6T9hRl3tx519IPSpZ9dCXJGKVTA2JsC2HqiMaRw7Sz/Hk
	 7xOQyrG92yMLUL0J93MEXJo2m5l7XoaDxNNB3j9eJuNl/edYm1KynOpOknNr7erPlo8dO
	 RvuAWI59BqXh/8elIE6Ck4GSZ4+KBdCe2Qsby7AZctNXu1H7wXule9zGgefmf7IdMKg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789390149;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:Received:Received:
	 Received:Received:X-CSE-ConnectionGUID:X-CSE-MsgGUID:X-IronPort-AV:
	 X-Amp-Result:From:To:CC:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Patchwork-Hint:X-Originating-IP:X-ClientProxiedBy:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=C/wMzxlOoO6NorwVkipezvyxkD1zT5V3hS2Al/o8hJs=;
	b=GHqPL2P5BcbKVxUp3PWkKYKreshshQQCcLN3DBT8k9fykODKR9yLfE2HS1zE3S68rm2h
	 7ONx//HhF2+ITUpfSHVIimuEanoRUUpab64W5QO8EARt7gfYWCWY7QYAlEM2/XVB7JwUc
	 7t5UaTJQOlcOjGio3+3kx7MApusPg7L2LEO5E5wxP5hoXmb/rd4k5BXYBJlUgp1jv1Fpq
	 I1ihM0yBdYZpN443SsHjp4//ZsurBiazmR+in0iEDdaW7woQ8ztBnc5cgl3qmjeibs6SF
	 bLRGLgclCyzEoKYJ/C1ZGHAUmzbBb3r2Hfl6lOoyaK8lZGWI+s0WC0mo4QbmPdo9t0g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789390149;
	bh=C/wMzxlOoO6NorwVkipezvyxkD1zT5V3hS2Al/o8hJs=;
	h=From:To:CC:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BmZf8Ny+Bec6vGyG8CjxOHQ0D5YGN386SSQii0l8jrH2tePl+dsYvFb/LnlKt+Pxx
	 RvoJiRmH/td+0WIS9g/ATDeuXejfNuDf+OgkqUkgS5z8zx9vUDQGR2nG1azzhaAk9c
	 R+cVeoBCtXeHzqB+RtcE5WKl2fbAOjLkRul7lV9TruGD0XoVhX8ReI5l+AjbqNSjcD
	 ibdwKTHfN9JLdOyYMY8w7ddFg/0xxHuAROlsTP67xqkUS2O/CBBaFIhHuV2t1v7t6F
	 BskVoNzPK9M1PiACTokpEIAWMUrLrX+xUags0/2EtuIXbhKKdyit6s8BXX0TnMKVvr
	 E82UQcDSmIRiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22247405F4;
	Mon, 14 Sep 2026 12:49:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 28779EB
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 12:49:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E9CB80D15
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 12:49:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fw2VV6EhzwpD for <buildroot@buildroot.org>;
 Mon, 14 Sep 2026 12:49:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org EDAE680CD8
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=80.12.210.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789390146;
 b=I/soDt9Expm1x/qP/IffiDlqnkxqzcfiTj5/CTCwbdlzw2bp2vBxntRCl36pYS81Wd9V
 1ImCj6nx0gHerjvGt/4Myu4qpN71ogVP5DF4KF8Pfi85nl+tAbY4opXHS0mNsY4IoM+oA
 EJCy4Bevh/0Lpo1qzafu5B4pgFaSIleRa4gDemyp3G1iFSxpLQk+GLl9OSaUjQKwkDTxb
 7fuxTH3xkUpilxMRX0i+86PKHMiSqAA/3J+jIh3eLY1mfsqKuXzlY+cKLEwopdhyDFQgt
 pN49u2uwEhXUBVsHFl/vql2J2+i9A8qdvdHzFcv4VNdwqrxVOhsavnG/50JaVizrx6w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789390146;
 h=Received-SPF:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
 Received:Received:Received:Received:X-CSE-ConnectionGUID:
 X-CSE-MsgGUID:X-IronPort-AV:X-Amp-Result:From:To:CC:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:X-Patchwork-Hint:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding;
 bh=JJNPqG1YKS+Uyt0quSVWrqlhad67Sija8aQnBdIAt+g=;
 b=O86w3V3WYK/Mu8VfifdczogTR8OqGMbxqBvAkz87A9/KNk/MffxydTj6LL85g6o8uLsl
 nqqv6y3cCi5M+CViGQb52RF28XLukdMcbC1xolCBbBPCuESt3Mdt2+Re083sVG5nWJRWx
 ZM8cMxJrXJg8XglD+1/DU6C90Og8VasDYXxqsodXos5OrBwbtZp2TiYTAXwzWuZ2/YU+A
 0l3Tp1RySF3i2WQvvRzj9/6Q/yvazaiSKbTR55SO0lvJh0KU5SyUqGyA0feBSfpvE80SE
 rkd4PmKavn9sLEkb/fj/A3cJNDbRgfIry82Vdyh5hJ5heiy3CaEQsgiIV800GngfO3w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=orange.com; 
 dkim=pass header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=JO1cYXRu; 
 arc=none smtp.remote-ip=80.12.210.122
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.122;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=orange.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=JO1cYXRu
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.122])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EDAE680CD8
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 12:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1789390146; x=1820926146;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JJNPqG1YKS+Uyt0quSVWrqlhad67Sija8aQnBdIAt+g=;
 b=JO1cYXRueHGoHpeAG8HUtHAHfRPO+H3D8KTscY1ktJOPBpj4AInDzVGe
 hquJuSqQlVF3m9wkuVj7YW6oQlPpA+3L62SFzpyknZ2J67knB2l8EY1DM
 e5p1hLhjHviQ5frMNP1bUF9CXm7PJy8ksUUVk6Vwzr7f7ZbB6gJWsVpKE
 xpQLgzy/6mI4poPIKx3qyJjK9yE+u/VZ/qnVQiQlcKyr4PRYu67r6Wofn
 qX//x+0X1KcMMPFRzcptu7R5Xrr4jUFqbiBh2FGhsl8Ydf0N5u+nrxsEG
 OooyZlOVoKIxwehvR832dORESfTEHIUeu/ijqwG5eSKNbjSbm0YAxw973 A==;
X-CSE-ConnectionGUID: z1TaIFDlReaZC6F/6XZjvg==
X-CSE-MsgGUID: H0CikHpTTEymwpsHY5FG+w==
Received: from unknown (HELO opfedv3rlp0e.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 14 Sep 2026 14:48:45 +0200
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0e.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 14:48:46 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46;
 Mon, 14 Sep 2026 14:48:44 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Mon, 14 Sep 2026 14:48:43 +0200
X-CSE-ConnectionGUID: 2p19I8phRtqHe4/zT7FHbA==
X-CSE-MsgGUID: wnAeyQFrQYOmTu5AnZgOxw==
X-IronPort-AV: E=Sophos;i="6.27,102,1787004000"; d="scan'208";a="467770371"
X-Amp-Result: SKIPPED(no attachment in message)
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: Vincent Fazio <vfazio@xes-inc.com>, "Yann E . MORIN"
 <yann.morin@orange.com>
Date: Mon, 14 Sep 2026 14:48:43 +0200
Message-ID: <cover.1789390115.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX504.corporate.adroot.infra.ftgroup
 (10.115.26.28) To OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26)
Subject: [Buildroot] [PATCH 0/2 v2] support/size-stats: actually handle .pyc
 files
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

This small two-patch series properly associates .pyc files to the
corresponding package, to account for the PEP 3147 layout.

Changes v1 -> v2:
  - use python's cache_from_source() instead of open-coding the
   path  (Vincent)


Regards,
Yann E. MORIN.


The following changes since commit 04d7d7bdeb907483e7db0005b403484f379cf84b

  package/mosh: bump gcc version requirement due to protobuf (2026-09-13 21:59:28 +0200)


are available as patches in this mail series,

for you to apply patches up to 9e49dfb4368becd006de1be4977695caea90c237

  support/scripts/size-stats: properly assign pre-compiled .pyc files (2026-09-14 14:29:42 +0200)


----------------------------------------------------------------
Yann E. MORIN (2):
      support/scripts/size-stats: prepare for more .py associated files
      support/scripts/size-stats: properly assign pre-compiled .pyc files

 support/scripts/size-stats | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

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
