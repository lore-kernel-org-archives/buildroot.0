Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A6C1C02185
	for <buildroot@archiver.kernel.org>; Mon, 20 Jan 2025 07:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DED5C4077A;
	Mon, 20 Jan 2025 07:18:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tTbkeRYwXgA4; Mon, 20 Jan 2025 07:18:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9E0B40697
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9E0B40697;
	Mon, 20 Jan 2025 07:18:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 28D70D7
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 07:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1563540160
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 07:18:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Arp0xUkqLWi5 for <buildroot@buildroot.org>;
 Mon, 20 Jan 2025 07:18:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.124;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A7648400AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7648400AC
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A7648400AC
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 07:17:58 +0000 (UTC)
X-CSE-ConnectionGUID: dBd1+xVCSNKO6FSwiGKxeQ==
X-CSE-MsgGUID: t/8Sh572Tr+Ewigmk2Ak2Q==
Received: from unknown (HELO opfedv1rlp0h.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2025 08:17:56 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0h.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Jan 2025 08:17:56 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Mon, 20 Jan 2025 08:17:54 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Mon, 20 Jan 2025 08:17:54 +0100
X-CSE-ConnectionGUID: hqYtNSYjRTOWJfWE7CE61A==
X-CSE-MsgGUID: /Rac603mSHycLNtscryzRQ==
X-IronPort-AV: E=Sophos;i="6.13,218,1732575600"; d="scan'208";a="240932596"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: Julien Olivain <ju.o@free.fr>, "Yann E . MORIN" <yann.morin@orange.com>
Date: Mon, 20 Jan 2025 08:17:54 +0100
Message-ID: <cover.1737357470.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-Originating-IP: [10.115.26.52]
X-ClientProxiedBy: OPE16NORMBX302.corporate.adroot.infra.ftgroup
 (10.115.26.11) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1737357480; x=1768893480;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6VvzVZfu/qKFz4mzBrGdspR5SsEM5DgZVBxrYbqNHds=;
 b=cKQ3bzJjajv9pejrVtHr2kHtb+qFekGSTBAYRKvtXV+nGjjs3Jo8aDPz
 Alg2NNN11f04pWhcv+dxhkLb9K/vCcxJKkRavH4Vz2Xs1wQXHNwe3cRsc
 VFy64NVmvfXrrz1JTZMFAkBz6iHpag+up6LZOucopmhQFmPRNmBV5jFmd
 jMqGmgPCCsLkCTs81FZQ9z7MBVwuhTj9ohnAGBYiGgGJ444Gh90dNhCPH
 L20kxLBSXztHNEk10VAaABzuHcKvG2bEzfyOsb1Jh5jzWQV2NmIFlm4Ef
 HpNbl3ZdTABsR+wlAVhNMepN5kLVPauU7LAti9TnTETk/+3bRuCwrxgzz
 Q==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=cKQ3bzJj
Subject: [Buildroot] [PATCH 0/2] support/tests: fix get-developers test when
 stdini for tests is not a tty
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

This small series aims at fixing the get-developers test when running in
an environment where stdin is not a tty, like in a CI pipeline (e.g.
Gitlab-CI).

Then it extends the get-develpers test with an actual test for reading a
patch from stdin.


Regards,
Yann E. MORIN.


The following changes since commit 12ec5d5059ea107a960b9e20dd11b9f7affd1070

  package/lighttpd: fix missing conf install (2025-01-19 15:13:45 +0100)


are available as patches in this mail series,

for you to apply patches up to b8090988958a71953ab904d2f33af498536a280c

  support/testing.utils: check patch on stdin to get-developers (2025-01-20 08:14:58 +0100)


----------------------------------------------------------------
Yann E. MORIN (2):
      support/testing/utils: fix get-developers test without a tty
      support/testing.utils: check patch on stdin to get-developers

 support/testing/tests/utils/test_get_developers.py | 28 ++++++++++++++++++----
 1 file changed, 23 insertions(+), 5 deletions(-)

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
