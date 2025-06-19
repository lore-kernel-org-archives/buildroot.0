Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F442C71136
	for <buildroot@archiver.kernel.org>; Thu, 19 Jun 2025 07:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8520406F1;
	Thu, 19 Jun 2025 07:39:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EG6wTqXiU3Vy; Thu, 19 Jun 2025 07:39:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD1D94045E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD1D94045E;
	Thu, 19 Jun 2025 07:39:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 89E1316B
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 07:39:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6CE4E60711
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 07:39:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xOlIjM3p7uVA for <buildroot@buildroot.org>;
 Thu, 19 Jun 2025 07:39:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.123;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 53707606E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53707606E6
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.123])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 53707606E6
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 07:39:49 +0000 (UTC)
X-CSE-ConnectionGUID: o5hkufVgTz+j4po0RBn6Bw==
X-CSE-MsgGUID: ojCGSi0ET12PA8AMgZrTmg==
Received: from unknown (HELO opfedv3rlp0b.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 09:39:47 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0b.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Jun 2025 09:39:48 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Thu, 19 Jun 2025 09:39:46 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Thu, 19 Jun 2025 09:39:45 +0200
X-CSE-ConnectionGUID: FSyFs07yQVOiBC1adfilag==
X-CSE-MsgGUID: +l0R+OJrSuCMero3T531mg==
X-IronPort-AV: E=Sophos;i="6.16,247,1744063200"; d="scan'208";a="302366884"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: Christian Stewart <christian@aperture.us>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, "Yann E . MORIN" <yann.morin@orange.com>
Date: Thu, 19 Jun 2025 09:39:45 +0200
Message-ID: <cover.1750318763.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-Originating-IP: [10.115.26.50]
X-ClientProxiedBy: OPE16NORMBX106.corporate.adroot.infra.ftgroup (10.115.27.3)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1750318790; x=1781854790;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hpVm74EQ+zq2QNs9QvjXREECd67lCqapeLTam64J7Ac=;
 b=UO4jR/MlH8NammCvv4qKd2XtcPcGqPIKVIPCUGhCPM4xXCoNiRRGdnUn
 DVtp/La4asTfAj9LnGu78u47+tifpbWHYgl13eWzEkNpdkQllGtT9A5r7
 rXVXEG3vB/CLVZXpxks23nXdQgEsn+ZWEz1te6mr4M5N4vWv3fB0+sWcU
 xCeMpKk4JKOjCPXR4LJEhtPhxJwHHAtOdItsprt2S1zGrcHsWAYY/a21G
 yYZye4hozBXo90p34d9u6L36c9XpO6OqH+2Hy7A1wkQgC8EGRiXz54gs7
 iumtitgGr3ThoM/urwQ8mHuE1dLnve2oFdRd7tJgwkM5EmX3gIs5TAMhy
 g==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=UO4jR/Ml
Subject: [Buildroot] [PATCH 0/3 v2] package/distribution-registry: new
 package
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

Changes v1 -> v2:
  - rename using pkg-golang infra's variables
  - fix flake8 warning in runtime test


Regards,
Yann E. MORIN.


The following changes since commit cb5d3daf644395e0b31e09974fe2f47f130b4f7c

  package/grout: bump to 0.10.3 version (2025-06-18 22:21:29 +0200)


are available as patches in this mail series,

for you to apply patches up to e9de3252ae9bdf50b1c7f4a32dca00e45e85b921

  package/distribution-registry: new package (2025-06-19 09:38:15 +0200)


----------------------------------------------------------------
Yann E. MORIN (3):
      package/containers-image-config: new package
      package/skopeo: use containers-image-config files
      package/distribution-registry: new package

 package/Config.in                                  |  2 +
 package/containers-image-config/Config.in          |  8 ++
 .../containers-image-config.hash                   |  3 +
 .../containers-image-config.mk                     | 25 ++++++
 package/distribution-registry/Config.in            | 17 ++++
 package/distribution-registry/config.yml           | 13 +++
 .../distribution-registry.hash                     |  3 +
 .../distribution-registry/distribution-registry.mk | 47 +++++++++++
 .../distribution-registry.service                  | 10 +++
 package/podman/Config.in                           |  1 +
 package/podman/podman.mk                           | 10 ---
 package/podman/policy.json                         |  7 --
 package/podman/registries.conf                     |  1 -
 package/skopeo/Config.in                           |  1 +
 .../tests/package/test_distribution_registry.py    | 96 ++++++++++++++++++++++
 support/testing/tests/package/test_skopeo.py       | 20 +++++
 16 files changed, 246 insertions(+), 18 deletions(-)
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
