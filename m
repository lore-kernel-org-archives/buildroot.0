Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD25C61DB2
	for <buildroot@archiver.kernel.org>; Fri, 13 Jun 2025 05:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 029AD4084D;
	Fri, 13 Jun 2025 05:44:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v_EEtYhjCiCU; Fri, 13 Jun 2025 05:44:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 370474084B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 370474084B;
	Fri, 13 Jun 2025 05:44:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F15341BD
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 05:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D7479607B4
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 05:44:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8qPfwXzCbNy7 for <buildroot@buildroot.org>;
 Fri, 13 Jun 2025 05:44:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.121;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 67D7E606DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67D7E606DB
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.121])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 67D7E606DB
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 05:44:45 +0000 (UTC)
X-CSE-ConnectionGUID: WhLUvagoRSylXsdALmwPRw==
X-CSE-MsgGUID: 2GnWcszaTYKKQWcEaZGbJQ==
Received: from unknown (HELO opfedv1rlp0h.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 07:44:43 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0h.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Jun 2025 07:44:43 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Fri, 13 Jun 2025 07:44:41 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Fri, 13 Jun 2025 07:44:41 +0200
X-CSE-ConnectionGUID: H4j4cVAQRvW1TZvjRN4hgQ==
X-CSE-MsgGUID: zqPSZjAaRK6a2i3+SPzPpg==
X-IronPort-AV: E=Sophos;i="6.16,232,1744063200"; d="scan'208";a="297200017"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: "Yann E . MORIN" <yann.morin@orange.com>
Date: Fri, 13 Jun 2025 07:44:41 +0200
Message-ID: <cover.1749793479.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX401.corporate.adroot.infra.ftgroup
 (10.115.26.14) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1749793486; x=1781329486;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=H3xvMmonZiqhpFZf6lVFcIgFmfaEiIiM8ZCZuNUn74U=;
 b=DH3bXrOmahxUyOOEzTQMxoKcqJjjehLUAOXqdWdta41t+5d8Xg7+ndeB
 figuHZhSl5ktVyk6o7u613Zangd/xY111tm/p3rkAllJWwGEzax95bvfA
 Do6w6OvDTax/wmNivpgSXqRe2ibgbqeocG/KzPIpXsqQzKvuTIliSBZN5
 5ypb4gANnkD/7yfZBZbFslZgZTz3Zz0C3Wv6gb0vXXFxAthQP0GcK4U7m
 Dm3kxvZ333a/kbiwG2Uk2AAylU46qOcTIMKtPdqvYrrp5x+kGmstupJK7
 ZCNddHoFUjUDyf5jH4KApj4DWlKJMujwaBMpov03oIHsr5bfFveubuXCN
 g==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=DH3bXrOm
Subject: [Buildroot] [PATCH 0/3] package: add hashes to license files for
 docker credential helpers
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

The various recently introduced packages that provide Docker credential
helpers, did not have a hash for their license files.

This series adds such hashes now.


Regards,
Yann E. MORIN.


The following changes since commit d02a1239a553f31605e63b0fb50d9ea4e5e0d987

  package/linux-headers: drop 6.14.x option (2025-06-12 22:54:20 +0200)


are available as patches in this mail series,

for you to apply patches up to d2a08a5ea591122a0a08567e98a89ef0a26cc21a

  package/docker-credential-gcr: add LICENSE hash (2025-06-13 07:42:31 +0200)


----------------------------------------------------------------
Yann E. MORIN (3):
      package/amazon-ecr-credential-helper: add LICENSE hash
      package/docker-credential-acr-env: add LICENSE hash
      package/docker-credential-gcr: add LICENSE hash

 package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.hash | 1 +
 package/docker-credential-acr-env/docker-credential-acr-env.hash       | 1 +
 package/docker-credential-gcr/docker-credential-gcr.hash               | 1 +
 3 files changed, 3 insertions(+)

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
