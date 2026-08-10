Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4706AC5AD55
	for <buildroot@archiver.kernel.org>; Mon, 10 Aug 2026 13:27:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E08260715;
	Mon, 10 Aug 2026 13:27:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mv-ON-c-GZrW; Mon, 10 Aug 2026 13:27:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B1BC60706
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786368461;
	bh=4Y52WcaEbWEMR03j97W3xy2YYXPalK93j192dkMAhEw=;
	h=From:To:CC:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qmKmKXlD5k4goHLGzqsxchzB1T25cB59EDguyGjyOWaP5qbmPdH8VDP8Hm3e/x8QC
	 P1Q9cmmvj9HlakbGQ0tlCMe9H9SxXLmTR4we+Of7FcLk4S/bGAzm0lDjLCe2m57Vu5
	 EPLl1eKDPJzak4mFmjG+6NibJnIiBzFHu9c/0NcrveaPtd81ZJ4zAcpeMekEGiegDt
	 9M3ACQ23MTngVIBVHUgKvV+7csJfn129m0i+8Em7qOn1Z+YkW0PFiJNA/lc7/giOys
	 Acai8qvhHxpbG9gn8oH75q9T8FFCYM6t48jpS4iuKqSamhQ41zO8PVYYdOJUE+0YQl
	 zwnnqJreLpqSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B1BC60706;
	Mon, 10 Aug 2026 13:27:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C2A6B218
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 13:27:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ABCA34054F
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 13:27:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SB19DbQGopsQ for <buildroot@buildroot.org>;
 Mon, 10 Aug 2026 13:27:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.236;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3652D40435
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3652D40435
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.236])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3652D40435
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 13:27:37 +0000 (UTC)
X-CSE-ConnectionGUID: bUTaBgdlQ+yoGoEKaq2BwQ==
X-CSE-MsgGUID: ziYhVBc3RAeygH0LfW8Kog==
Received: from unknown (HELO opfedv1rlp0a.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 10 Aug 2026 15:27:34 +0200
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0a.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 15:27:33 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45;
 Mon, 10 Aug 2026 15:27:32 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Mon, 10 Aug 2026 15:27:31 +0200
X-CSE-ConnectionGUID: dnSVRfDtR2qpjEWXOGy/nA==
X-CSE-MsgGUID: k658lbn7TDuodosUWT8qbA==
X-IronPort-AV: E=Sophos;i="6.25,215,1779141600"; d="scan'208";a="460867393"
X-Amp-Result: SKIPPED(no attachment in message)
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: Michael Klein <m.klein@mvz-labor-lb.de>, Vincent Fazio
 <vfazio@xes-inc.com>, "Yann E . MORIN" <yann.morin@orange.com>
Date: Mon, 10 Aug 2026 15:27:31 +0200
Message-ID: <cover.1786368449.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-Originating-IP: [10.115.26.53]
X-ClientProxiedBy: OPE16NORMBX606.corporate.adroot.infra.ftgroup
 (10.115.27.30) To OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1786368458; x=1817904458;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Z88pxxD4IlcAGf3Ci/Q0fmSvVWExjqWEaNnGcM5KARY=;
 b=DsHi/dvwCZW39Am+Y1WIm50R94FX6XmGsUBWM6tsgDyVNpwQHnI0oIVx
 q+KW1yainXH+CluDP8Q5Kq12g/DZe5TjW587IoEREJbMIeOxE0i55w35H
 RkwbqE0oHkVJSEMACGUziASV8LPmjPleqsPSMBKF2zw+oMkqafvyybRUH
 /TjVIkwKnPH2Xa9hTCvssC2Qo76ATY/ZUhTOmyyPiYEHMTr3OzmzqXZfE
 iymVKBDYba1vsdSmpc7Wwda2tVfX5b5C+vNGHNQD8rGFNJwuaNcSSAj2L
 AwKtNU8wwTnXFzodmaoGnEghhP4lUydAZutfzRSEVNyV616ph0doUiKGP
 g==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=DsHi/dvw
Subject: [Buildroot] [PATCH 0/2] support/size-stats: actually handle .pyc
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
corresponding package.


Regards,
Yann E. MORIN.


The following changes since commit 4cc29326c91877a385eeb288378c1099ea240ee9

  Merge branch 'nyma/misc-fixes' into orange-master (2026-07-01 08:13:38 +0200)


are available as patches in this mail series,

for you to apply patches up to c45315df9f1084fe0f6f932e1523cfa9c4e6d992

  support/scripts/size-stats: properly assign pre-compiled .pyc files (2026-08-10 15:24:11 +0200)


----------------------------------------------------------------
Yann E. MORIN (2):
      support/scripts/size-stats: prepare for more .py associated files
      support/scripts/size-stats: properly assign pre-compiled .pyc files

 support/scripts/size-stats | 37 ++++++++++++++++++++++++++++++++++---
 1 file changed, 34 insertions(+), 3 deletions(-)

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
