Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F9EEC2BD09
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 14:24:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C9D540EAE;
	Tue,  9 Jul 2024 14:24:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tH9hOrxs10qW; Tue,  9 Jul 2024 14:24:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A763340EB7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A763340EB7;
	Tue,  9 Jul 2024 14:24:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5CC5E1BF27A
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 14:24:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5525440106
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 14:24:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rrlSbqNrXo7v for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 14:24:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.122;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9925640C1D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9925640C1D
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.122])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9925640C1D
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 14:24:03 +0000 (UTC)
Received: from unknown (HELO opfedv1rlp0c.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 16:24:00 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0c.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Jul 2024 16:24:00 +0200
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 16:23:59 +0200
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Tue, 09 Jul 2024 16:23:58 +0200
X-IronPort-AV: E=Sophos;i="6.09,195,1716242400"; d="scan'208";a="167136811"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Tue, 9 Jul 2024 16:23:58 +0200
Message-ID: <cover.1720535037.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX208.corporate.adroot.infra.ftgroup (10.115.27.9)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1720535043; x=1752071043;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AKTVvLSncI0UNQ9m6D2kZ98icSLeRoX1Cn/WCKwETNA=;
 b=Our7+NiGLTWpYymhS9nXLtFHcsQNWmyz5jiEzxDbphl32AGU8163grd4
 ESfN9jG0QaoB6LvwcQbl54FoTz3R2LFk58/mMQPJ5hs0Y1f3pIbUEt7zq
 83bOC4st7L8o/+p0oD+AOx8HZ8T4v6j2mDCHjh0DlPiNH0gEqMbkDVBU2
 1oH5aA8E2AB5WRK1YtHqDf8zezglxEJyvhukz6tasRj3NNzbAlbBh7KSs
 q7DmoZVVJWRF4aMvnoMwo47HVaVOsDS1ru5UqElQw9pjbdgpKAaLBxAW1
 pNOVOhDVMcChfDaYP1rOa8vZuUpSiyt3eeUrb0T9AGc//kyH4HiA5exks
 g==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=Our7+NiG
Subject: [Buildroot] [PATCH 0/5] package/gpsd: make the package more modular
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Bernd Kuhls <bernd@kuhls.net>, "Yann E . MORIN" <yann.morin@orange.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

Hello All!

There are use-cases where a gpsd daemon is not needed, and just the
"native" tools and the python helpers are used. There are also cases
where tonly the python scripts are needed (e.g. one is useful to
configure the u-blox devices).

This series makes the package a little bit more modular to cover those
cases.


Regards,
Yann E. MORIN.


The following changes since commit 3ebc7c69d56430c34eba4c869d1d4fe4d1e8de55

  support/testing: new rt-tests runtime test (2024-07-03 23:50:24 +0200)


are available as patches in this mail series,

for you to apply patches up to e6e9df5fad92d96444cebc9ebc8c137b83f929a6

  package/gpsd: add option to enable/disable the daemon (2024-07-09 16:23:08 +0200)


----------------------------------------------------------------
Yann E. MORIN (5):
      package/gpsd: condition python stuff to the proper kconfig option
      package/gpsd: fix comment about wchar requirement
      package/gpsd: move python option later
      package/gpsd: add option to enable clients
      package/gpsd: add option to enable/disable the daemon

 package/gpsd/Config.in | 46 +++++++++++++++++++++++++--------
 package/gpsd/gpsd.mk   | 70 +++++++++++++++++++++++++++++++-------------------
 2 files changed, 78 insertions(+), 38 deletions(-)

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
