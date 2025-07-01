Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E72C8303A
	for <buildroot@archiver.kernel.org>; Tue,  1 Jul 2025 13:45:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5B7861155;
	Tue,  1 Jul 2025 13:45:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AQDMnvKeQZVU; Tue,  1 Jul 2025 13:45:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 082536115A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 082536115A;
	Tue,  1 Jul 2025 13:45:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6804A179
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 13:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E76C413B2
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 13:45:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8g7MMZLkj_Co for <buildroot@buildroot.org>;
 Tue,  1 Jul 2025 13:45:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.239;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AEF1E41390
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AEF1E41390
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.239])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AEF1E41390
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 13:45:54 +0000 (UTC)
X-CSE-ConnectionGUID: l7WiZjetTRyXFVSmcVecwg==
X-CSE-MsgGUID: 1xidXseERQOh2MfEptMVZg==
Received: from unknown (HELO opfedv1rlp0a.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 15:45:51 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0a.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 Jul 2025 15:45:51 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57;
 Tue, 1 Jul 2025 15:45:50 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Tue, 01 Jul 2025 15:45:49 +0200
X-CSE-ConnectionGUID: YXkA+awOTTy0TQJB0mB/bA==
X-CSE-MsgGUID: qP0GLMThQ/y5TVfzP2IgSA==
X-IronPort-AV: E=Sophos;i="6.16,279,1744063200"; d="scan'208";a="308478164"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: Angelo Compagnucci <angelo.compagnucci@gmail.com>, Christian Stewart
 <christian@aperture.us>, James Hilliard <james.hilliard1@gmail.com>, "Yann E
 . MORIN" <yann.morin@orange.com>
Date: Tue, 1 Jul 2025 15:45:49 +0200
Message-ID: <cover.1751377540.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX207.corporate.adroot.infra.ftgroup (10.115.27.8)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1751377555; x=1782913555;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NVlLVhGfGsUDT9LmVS3Mhv/239AF1wZxK/GixDUwS4Q=;
 b=VyogFYOO9GPYljXwi9PfzcuROsMcciPtYB+wp3zXwup5LIUL59OGNGst
 emwQjuvnYpyVmMyxlJGnd7yPxFP1TOtSsBZTilsdlecLaHj30IC4Qmb99
 4X0a4SRkct4Ip6UFzqzQ3yvqtPuoLt8ZB6q8UNcMsojuJWouNcBVsX5Dn
 od9XtZFHigT868/ZKPewN+fM5Kb8PtKuSSFIliLiPTCxVDEkkc6kfRtfY
 WJfs+XytwWqi2HN5SJfzbEBoAsDNK4Cbn7QslIVt+TgvehFXi1XAyEJ3O
 1yO9Fm9ykMIwDMJeNjLKTQWPlTcVD5Uc9JL8/ApComLggZuZb92wq9BaM
 A==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=VyogFYOO
Subject: [Buildroot] [PATCH 0/4 v2] package/pkg-golang: simplify installing
 multiple binaries
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

This small series aims at simplifying the golang-package infra when a
package builds multiple targets and thus installs multiple binaries.

Changes v1 -> v2:
  - account for distribution-registry, package added since v1 was posted


Regards,
Yann E. MORIN.


The following changes since commit 901b9e19ed3741d0cc379ff8f145b2294a3bd09b

  package/kvmtool: fix build failure w/ musl (2025-06-30 22:20:31 +0200)


are available as patches in this mail series,

for you to apply patches up to 71793243b832c0c9f397911ce0bdf08e03f660b4

  package/pkg-golang: catch use of legacy FOO_INSTALL_BINS (2025-07-01 15:43:33 +0200)


----------------------------------------------------------------
Yann E. MORIN (4):
      package/pkg-golang: simplify installing multiple binaries
      package: drop default _INSTALL_BINS in golang-package
      package/cni-plugin: simplify installation
      package/pkg-golang: catch use of legacy FOO_INSTALL_BINS

 docs/manual/adding-packages-golang.adoc            | 26 +++++++++++-----------
 docs/manual/migrating.adoc                         |  5 +++++
 .../amazon-ecr-credential-helper.mk                |  1 -
 package/cni-plugins/cni-plugins.mk                 |  7 +++---
 package/containerd/containerd.mk                   |  1 -
 package/delve/delve.mk                             |  2 --
 .../distribution-registry/distribution-registry.mk |  1 -
 package/docker-cli/docker-cli.mk                   |  2 --
 package/docker-engine/docker-engine.mk             |  2 --
 package/mender-artifact/mender-artifact.mk         |  3 ---
 package/moby-buildkit/moby-buildkit.mk             |  4 ----
 package/pkg-golang.mk                              | 17 ++++++++++++--
 package/tailscale/tailscale.mk                     |  1 -
 13 files changed, 36 insertions(+), 36 deletions(-)

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
