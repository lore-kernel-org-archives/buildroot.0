Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93995C3ABC3
	for <buildroot@archiver.kernel.org>; Tue, 13 May 2025 11:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34E1F81334;
	Tue, 13 May 2025 11:48:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TajbuKHtpj3w; Tue, 13 May 2025 11:48:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52F3A8119A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52F3A8119A;
	Tue, 13 May 2025 11:48:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DFBC9153
 for <buildroot@buildroot.org>; Tue, 13 May 2025 11:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D07CA40E2E
 for <buildroot@buildroot.org>; Tue, 13 May 2025 11:48:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H04_cynNJput for <buildroot@buildroot.org>;
 Tue, 13 May 2025 11:48:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.123;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AE29B40DD6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE29B40DD6
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.123])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE29B40DD6
 for <buildroot@buildroot.org>; Tue, 13 May 2025 11:48:15 +0000 (UTC)
X-CSE-ConnectionGUID: 5HjiBWrrTC6SONBbBMxqoA==
X-CSE-MsgGUID: ssWt4LAfS6a/UkP05X5CYw==
Received: from unknown (HELO opfedv1rlp0c.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 13:48:13 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0c.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 May 2025 13:48:12 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Tue, 13 May 2025 13:48:11 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Tue, 13 May 2025 13:48:11 +0200
X-CSE-ConnectionGUID: RZ3gYu8zQ4ypGjyxS/QjQg==
X-CSE-MsgGUID: gml2dW2GTG2gDjXo+KKxvQ==
X-IronPort-AV: E=Sophos;i="6.15,285,1739833200"; d="scan'208";a="289572304"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: Christian Stewart <christian@aperture.us>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, "Yann E . MORIN" <yann.morin@orange.com>
Date: Tue, 13 May 2025 13:48:11 +0200
Message-ID: <cover.1747136889.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-Originating-IP: [10.115.26.52]
X-ClientProxiedBy: OPE16NORMBX304.corporate.adroot.infra.ftgroup
 (10.115.26.13) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1747136896; x=1778672896;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=c5H0xFqJKqHaE3wsEfWuis1cEumuDnlkGN/vcWAz/HM=;
 b=YdkNptyIHuEEq6qJZHv8A9GKw9Tuut6jAW37D7hvqO+EeFjcgmUtL7Y9
 s/533fcIdgIM9jCh0CfZotfONWcFasUiXDZERlVFxwqckv2tQcPk8FJLT
 XCAeYhYG4ClMqJrcDF0gRcEunuipbWx15Zqyoqo6fhm1+Ifw99JS+l206
 lifT4/ysFev7LRzw/F5nfU7bc2Sc68SM/Q0sB4c1yymDz+I/44i/7FUGd
 MaqETavgOr0TlrzqgwS1/1b4oEBmtGEXzaxyf7ya4sDLysdDISgxnxLMn
 7p0pI8QWMHoOiJTKXmZsuMgLZwnn6BEZlJK/9gAAqL79XuYfb5Ss0i65+
 A==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=YdkNptyI
Subject: [Buildroot] [PATCH 0/3] package/distribution-registry: new package
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

This small series introduces distribution-registry, the reference
implementation to host and distibute container images.

The series is three-fold:

 1. introduce the common containers-image-config package, that provides
    default, sane, official configuration files shared by multiple tools
    from the containers ecosystem;

 2. use those files for podman, instead of the custom, canned ones, and
    extend the skopeo runtime test to exercise using those files as
    well;

 3. introduce distribution-registry itself, with a runtime test.


Regards,
Yann E. MORIN.


The following changes since commit a7ea1e658de6d8f951ef8c4e81724c131306db6b

  board/bsh/imx6ulz-bsh-smm-m2: flash U-Boot (2025-05-12 23:00:50 +0200)


are available as patches in this mail series,

for you to apply patches up to 8d15f6761c6d86fb4b04c3209970e1a6cc803d78

  package/distribution-registry: new package (2025-05-13 13:42:39 +0200)


----------------------------------------------------------------
Yann E. MORIN (3):
      package/containers-image-config: new package
      package/skopeo: use containers-image-config files
      package/distribution-registry: new package

 package/Config.in                                  |  2 +
 package/containers-image-config/Config.in          |  8 ++
 .../containers-image-config.hash                   |  3 +
 .../containers-image-config.mk                     | 25 ++++++
 package/distribution-registry/Config.in            | 17 +++++
 package/distribution-registry/config.yml           | 13 ++++
 .../distribution-registry.hash                     |  3 +
 .../distribution-registry/distribution-registry.mk | 51 +++++++++++++
 .../distribution-registry.service                  | 10 +++
 package/podman/Config.in                           |  1 +
 package/podman/podman.mk                           | 10 ---
 package/podman/policy.json                         |  7 --
 package/podman/registries.conf                     |  1 -
 package/skopeo/Config.in                           |  1 +
 .../tests/package/test_distribution_registry.py    | 88 ++++++++++++++++++++++
 support/testing/tests/package/test_skopeo.py       | 20 +++++
 16 files changed, 242 insertions(+), 18 deletions(-)
 create mode 100644 package/containers-image-config/Config.in
 create mode 100644 package/containers-image-config/containers-image-config.hash
 create mode 100644 package/containers-image-config/containers-image-config.mk
 create mode 100644 package/distribution-registry/Config.in
 create mode 100644 package/distribution-registry/config.yml
 create mode 100644 package/distribution-registry/distribution-registry.hash
 create mode 100644 package/distribution-registry/distribution-registry.mk
 create mode 100644 package/distribution-registry/distribution-registry.service
 delete mode 100644 package/podman/policy.json
 delete mode 100644 package/podman/registries.conf
 create mode 100644 support/testing/tests/package/test_distribution_registry.py

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
