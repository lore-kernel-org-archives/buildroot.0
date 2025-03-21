Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC784C36000
	for <buildroot@archiver.kernel.org>; Fri, 21 Mar 2025 13:39:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F07D413B3;
	Fri, 21 Mar 2025 13:39:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UwGDakfRdZFI; Fri, 21 Mar 2025 13:39:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D7E441383
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D7E441383;
	Fri, 21 Mar 2025 13:39:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BE3961A0
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 13:39:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4D1A82021
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 13:39:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HTro4aKigpit for <buildroot@buildroot.org>;
 Fri, 21 Mar 2025 13:39:24 +0000 (UTC)
X-Greylist: delayed 430 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 21 Mar 2025 13:39:23 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7BEE381E65
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BEE381E65
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.124;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7BEE381E65
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 13:39:23 +0000 (UTC)
X-CSE-ConnectionGUID: SVoodoZmQeWTfzfHPXROvQ==
X-CSE-MsgGUID: ChEgwWg8T1+UgxKL0u6iQA==
Received: from unknown (HELO opfedv1rlp0g.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 14:32:10 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0g.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 21 Mar 2025 14:32:10 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Fri, 21 Mar 2025 14:32:09 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Fri, 21 Mar 2025 14:32:08 +0100
X-CSE-ConnectionGUID: qnYkuQzRT6qK46zNT4uD/w==
X-CSE-MsgGUID: SrPp/pyTSbOfnW1lKtYJtA==
X-IronPort-AV: E=Sophos;i="6.14,264,1736809200"; d="scan'208";a="266327201"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: Christian Stewart <christian@aperture.us>, "Yann E . MORIN"
 <yann.morin@orange.com>
Date: Fri, 21 Mar 2025 14:32:08 +0100
Message-ID: <cover.1742563913.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-Originating-IP: [10.115.26.50]
X-ClientProxiedBy: OPE16NORMBX101.corporate.adroot.infra.ftgroup (10.115.26.2)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1742564363; x=1774100363;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dSxyod5EvnhtmrmEZ4qyXOCeuU8cV1UrlC0kRgz111k=;
 b=nlYbqrLnpW3NiOCTeSIi9SpOIZHWp4fYfEGW8dIgOp3xbUtwRofgCxMw
 6gKheEFl5NuJPJChFmuEfOEgYhBwKjP/EPkv95p7AWeG+JBi96epRKdTs
 8riHdqUCI6AFdC23ruFvg3PxalE5pKRwD7ybWguJ0YGOYtKTiiHhJlCB0
 3nHexq3cu2gZl4EsWINJOxRCrC54NnrOBmq06Tu7z+42zxV0kRByNey2d
 k9IRxkSlyuUTX0vB/iMiCQ8Xuyoe3tQq2Zo9zY5T2e6gQuI1ly8ZZFV1S
 WaEomCGs7cX5SLsn5v/eW7h2k/w5s+8yXl+iDcsEFwwk9SCwfmVsx3v0K
 g==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=nlYbqrLn
Subject: [Buildroot] [PATCH 0/4] package: add some docker credential helpers
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

This series introduces some docker credential helpers for various cloud
providers: AWS ECR, Google Cloud Platform, and Azure. This will allow
one to pull and push images to/from those registries.

The series starts by extending the golab-package infra to accept
packages which sources are located in a sub-directory.

Then it introduces the credential helpers. Pretty boring packages...


Regards,
Yann E. MORIN.


The following changes since commit f0693546ab9eb30ee033747fe1c51664d23b207b

  package/python-setuptools: bump to version 76.0.0 (2025-03-20 23:02:42 +0100)


are available as patches in this mail series,

for you to apply patches up to cff564db203c97fc8800efa120d8e0494696814d

  package/docker-credential-acr-env: new package (2025-03-21 10:58:44 +0100)


----------------------------------------------------------------
Yann E. MORIN (4):
      package/pkg-golang: support _SUBDIR
      package/amazon-ecr-credential-helper: new package
      package/docker-credential-gcr: new package
      package/docker-credential-acr-env: new package

 package/Config.in                                    |  3 +++
 package/amazon-ecr-credential-helper/Config.in       |  9 +++++++++
 .../amazon-ecr-credential-helper.hash                |  2 ++
 .../amazon-ecr-credential-helper.mk                  | 20 ++++++++++++++++++++
 package/docker-credential-acr-env/Config.in          | 12 ++++++++++++
 .../docker-credential-acr-env.hash                   |  2 ++
 .../docker-credential-acr-env.mk                     | 14 ++++++++++++++
 package/docker-credential-gcr/Config.in              | 10 ++++++++++
 .../docker-credential-gcr/docker-credential-gcr.hash |  2 ++
 .../docker-credential-gcr/docker-credential-gcr.mk   | 16 ++++++++++++++++
 package/pkg-golang.mk                                | 13 +++++++++----
 support/download/go-post-process                     |  5 +++--
 12 files changed, 102 insertions(+), 6 deletions(-)
 create mode 100644 package/amazon-ecr-credential-helper/Config.in
 create mode 100644 package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.hash
 create mode 100644 package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.mk
 create mode 100644 package/docker-credential-acr-env/Config.in
 create mode 100644 package/docker-credential-acr-env/docker-credential-acr-env.hash
 create mode 100644 package/docker-credential-acr-env/docker-credential-acr-env.mk
 create mode 100644 package/docker-credential-gcr/Config.in
 create mode 100644 package/docker-credential-gcr/docker-credential-gcr.hash
 create mode 100644 package/docker-credential-gcr/docker-credential-gcr.mk

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
