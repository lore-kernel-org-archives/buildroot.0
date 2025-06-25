Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A201AC7EE30
	for <buildroot@archiver.kernel.org>; Wed, 25 Jun 2025 10:01:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27826406A9;
	Wed, 25 Jun 2025 10:01:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C55P77qO-l2F; Wed, 25 Jun 2025 10:01:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4161140603
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4161140603;
	Wed, 25 Jun 2025 10:01:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DEDD712C
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 10:01:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0A7E83EA0
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 10:01:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GnpsNsh6lKHo for <buildroot@buildroot.org>;
 Wed, 25 Jun 2025 10:01:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.121;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C30C283E26
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C30C283E26
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.121])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C30C283E26
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 10:01:48 +0000 (UTC)
X-CSE-ConnectionGUID: odkj794ZS2KlDZ5R/bqP0w==
X-CSE-MsgGUID: hRw++rsKReOFF056udpStw==
Received: from unknown (HELO opfedv1rlp0f.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 12:01:46 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0f.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Jun 2025 12:01:47 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Wed, 25 Jun 2025 12:01:44 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Wed, 25 Jun 2025 12:01:44 +0200
X-CSE-ConnectionGUID: 3qfeHZohTGeMv8N3arx2LA==
X-CSE-MsgGUID: QWoCvuCkQBqD/Nc6f+YhzQ==
X-IronPort-AV: E=Sophos;i="6.16,264,1744063200"; d="scan'208";a="301638236"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: "Yann E . MORIN" <yann.morin@orange.com>
Date: Wed, 25 Jun 2025 12:01:44 +0200
Message-ID: <cover.1750845702.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-Originating-IP: [10.115.26.50]
X-ClientProxiedBy: OPE16NORMBX208.corporate.adroot.infra.ftgroup (10.115.27.9)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1750845709; x=1782381709;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mmN5MKUfYcpWc/Q88aU9sVsFQq+7wok9WGe7wdtkcQI=;
 b=GD9Z90oMRfXbW2S0ig5m0F2/R7a2mGuIgRm1dKV2u23ZCpOp5wiqhmU/
 j3u4foDmw3oy3io/eeLElwwLevt5AUBpD5krydcPRQiqBMPnZv76t/MF/
 97TrM7/9bRtksHf5BQXgQ+zjBR2YRx/9yo/y7SM5D5lomYrqSgQcYm5DB
 SR3y7sU80BnTUcVt1tUDqXFzClyJ6Uj1jIzu/TM/n1AFfu+Z8ibGrYeKB
 Z2va2jrENGWGqz5q7bStv/BH65AcMOPC2B/upEuJo0h5g8QntypMCb8jT
 ogeCjLJtFeH/oeK1iFpknaeQ5OPfnfGYE3y5R2jg8W2Sy2scAe+Bq+pYt
 w==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=GD9Z90oM
Subject: [Buildroot] [PATCH 0/2] boot/syslinux: fix top-level parallel
 builds, add lpxelinux
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

This two-patch series does exactly what it says on the tin.


Regards,
Yann E. MORIN.


The following changes since commit 1bb4a955fa6acceba3b6aab2e7f5ee2e3bbabc9e

  package/python3: security bump to 3.13.5 (2025-06-22 15:30:57 +0200)


are available as patches in this mail series,

for you to apply patches up to 1fa681c118f4041317be9836e2031c3f636af1d2

  boot/syslinux: add option to install pxelinux (2025-06-25 11:54:34 +0200)


----------------------------------------------------------------
Yann E. MORIN (2):
      boot/syslinux: fix install with top-level parallel build
      boot/syslinux: add option to install pxelinux

 boot/syslinux/Config.in   | 16 ++++++++++++++--
 boot/syslinux/syslinux.mk | 18 +++++++++++++++---
 2 files changed, 29 insertions(+), 5 deletions(-)

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
