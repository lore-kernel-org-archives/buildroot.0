Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF16DC52D7B
	for <buildroot@archiver.kernel.org>; Tue, 13 Aug 2024 10:04:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6AB3E80A5A;
	Tue, 13 Aug 2024 10:04:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TlWmbcBpNXAv; Tue, 13 Aug 2024 10:04:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CA0F80A72
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CA0F80A72;
	Tue, 13 Aug 2024 10:04:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BCFF11BF35F
 for <buildroot@lists.busybox.net>; Tue, 13 Aug 2024 10:04:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B5CCA80A54
 for <buildroot@lists.busybox.net>; Tue, 13 Aug 2024 10:04:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nwPGVYAsLznX for <buildroot@lists.busybox.net>;
 Tue, 13 Aug 2024 10:04:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.123;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 70D4D809F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70D4D809F8
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.123])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 70D4D809F8
 for <buildroot@buildroot.org>; Tue, 13 Aug 2024 10:04:33 +0000 (UTC)
Received: from unknown (HELO opfedv1rlp0a.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 12:04:30 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0a.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Aug 2024 12:04:30 +0200
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 13 Aug 2024 12:04:29 +0200
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Tue, 13 Aug 2024 12:04:28 +0200
X-IronPort-AV: E=Sophos;i="6.09,285,1716242400"; d="scan'208";a="181628821"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Tue, 13 Aug 2024 12:04:28 +0200
Message-ID: <cover.1723543467.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX405.corporate.adroot.infra.ftgroup
 (10.115.27.14) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1723543473; x=1755079473;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3N07sc0vQCu04xg4xHplxFfS1r1M/+zwlQF2nE0TqiY=;
 b=IW87FYv5A4Sjq4lnqgrGS/KsBIUdY2r40TwrYlU31EPeJqV95Rktn4sG
 W+0LldG0FW779Oyqe1dOQ/20DIfG5pP5Zn5R4iwJxApft9t+1pwJmhFa8
 YHlLdumrOPCBqmzcIZrYRFXkIT7k8XGq4DgYTkC7Obl/2sMM8zxtEIJoT
 FofaOK/cuwa/34cJcLzT9Uf/ze9wvH8sj1f3zRvGQDuH9kbuqjXx6PoEk
 DBt0sPzwTQXFTxzvrVYcdXRTcAhffFPlROiFW2BedkeduiltytEEOn2vq
 fSkfOXNKnzHl0Oa8fgJbdSmJ6tYZ/q6rTLfKkpCvxEsMzVIszajogIsA0
 w==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=IW87FYv5
Subject: [Buildroot] [PATCH 0/3] toolchain/wrapper: move -ztext to the
 toolchain wrapper
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E . MORIN" <yann.morin@orange.com>,
 =?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

Hello All!

Following a discussion with Thomas , we were both left wondering why
-ztext was not handled in the toolchain wrapper, like the other similar
flags are.

This small series is an attempt at making it so.


Regards,
Yann E. MORIN.


The following changes since commit 81e6541efe054df635947d0c143818f8cf7cb048

  package/gnuradio: fix build with fmt >= 11.x (2024-08-12 22:50:39 +0200)


are available as patches in this mail series,

for you to apply patches up to 8402ba3c5551505159a155c5cf0fc5b58c6a3614

  toolchain/wrapper: move -ztext from LDFLAGS to toolchain wrapper (2024-08-13 12:03:55 +0200)


----------------------------------------------------------------
Yann E. MORIN (3):
      toolchain/wrapper: check unsafe paths earlier
      toolchain/wrapper: check we did not add more args than expected
      toolchain/wrapper: move -ztext from LDFLAGS to toolchain wrapper

 package/Makefile.in            | 19 --------------
 toolchain/toolchain-wrapper.c  | 57 +++++++++++++++++++++++++-----------------
 toolchain/toolchain-wrapper.mk |  9 +++++++
 3 files changed, 43 insertions(+), 42 deletions(-)

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
