Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84DC5C71155
	for <buildroot@archiver.kernel.org>; Fri, 20 Jun 2025 08:10:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31C6F40D9A;
	Fri, 20 Jun 2025 08:10:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7mwMkzrKJ5d7; Fri, 20 Jun 2025 08:10:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41899409D9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41899409D9;
	Fri, 20 Jun 2025 08:10:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D7B87E2
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 08:10:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B912360E32
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 08:10:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sSN-LUgCkcoS for <buildroot@buildroot.org>;
 Fri, 20 Jun 2025 08:10:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.239;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B694160AD8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B694160AD8
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.239])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B694160AD8
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 08:10:13 +0000 (UTC)
X-CSE-ConnectionGUID: 62oNM3nPQzyFSv4QVbMfAQ==
X-CSE-MsgGUID: JXLJa7ihQ8Oa+62iAt38Qw==
Received: from unknown (HELO opfedv1rlp0c.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2025 10:10:11 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0c.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Jun 2025 10:10:10 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Fri, 20 Jun 2025 10:10:09 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Fri, 20 Jun 2025 10:10:08 +0200
X-CSE-ConnectionGUID: FWiRCEi5QJuJYoHj8GDDIg==
X-CSE-MsgGUID: BaPDSr7OR3yaG4eP1rCwJw==
X-IronPort-AV: E=Sophos;i="6.16,250,1744063200"; d="scan'208";a="304191455"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: Angelo Compagnucci <angelo.compagnucci@gmail.com>, Christian Stewart
 <christian@aperture.us>, James Hilliard <james.hilliard1@gmail.com>, "Yann E
 . MORIN" <yann.morin@orange.com>
Date: Fri, 20 Jun 2025 10:10:08 +0200
Message-ID: <cover.1750407006.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-Originating-IP: [10.115.26.50]
X-ClientProxiedBy: OPE16NORMBX107.corporate.adroot.infra.ftgroup (10.115.27.4)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1750407014; x=1781943014;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YStL5C1AgcT62Dk0iWin3LLrE2SR764Bs/7C5EkiXbc=;
 b=EefU/SBLrE5Rb+3fv0kKiMi+81ZGWC2NuPaQNbWg0ihDlHWSt4zRog5J
 UR1ororhfZYYXtbd6LHIA63DO2ohx4LmtmmyFYUHwD71ZKckv9uX5E+q+
 iHazRR+dura6SqSqSTz7qSTLatK8BXupIlZ4jJqmDUjNuYuyJl/vyEy6I
 kl0tehCmkMrRFzZnDVH1idaV91+EXhDxPftiABOr5t4FrhKkYhivX5TiL
 CSsYxkEi3RQM2tYWJhBdBtmi1mqtIJbN8NCR+Y6HTpXpifFDSbroA/o9Q
 I7EyvSAuHU+nRCfgelXGOmMJWvU86TBIS9+OhwL9FA9k4t38LAjPf6kZl
 w==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=EefU/SBL
Subject: [Buildroot] [PATCH 0/4] package/pkg-golang: simplify installing
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


Regards,
Yann E. MORIN.


The following changes since commit 0233c854b1845e0070179439a74b3b5245a4b01b

  package/libblockdev: security bump to version 3.3.1 (2025-06-20 01:22:53 +0200)


are available as patches in this mail series,

for you to apply patches up to 424c15b5c3a2341e06b32f5481d391542c9437f8

  package/pkg-golang: catch use of legacy FOO_INSTALL_BINS (2025-06-20 10:07:09 +0200)


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
 package/docker-cli/docker-cli.mk                   |  2 --
 package/docker-engine/docker-engine.mk             |  2 --
 package/mender-artifact/mender-artifact.mk         |  3 ---
 package/moby-buildkit/moby-buildkit.mk             |  4 ----
 package/pkg-golang.mk                              | 17 ++++++++++++--
 package/tailscale/tailscale.mk                     |  1 -
 12 files changed, 36 insertions(+), 35 deletions(-)

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
