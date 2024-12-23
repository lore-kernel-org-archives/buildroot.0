Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62424E7718D
	for <buildroot@archiver.kernel.org>; Mon, 23 Dec 2024 07:27:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08FD380CF1;
	Mon, 23 Dec 2024 07:27:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BL57l-DsbW6h; Mon, 23 Dec 2024 07:27:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06FDD80B43
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06FDD80B43;
	Mon, 23 Dec 2024 07:27:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 541975E
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 07:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2277B80C93
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 07:27:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z7gUU7r1JoI0 for <buildroot@buildroot.org>;
 Mon, 23 Dec 2024 07:27:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.122;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0425680B43
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0425680B43
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.122])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0425680B43
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 07:27:21 +0000 (UTC)
X-CSE-ConnectionGUID: tQoXGcQvRF+9qHlwy9gnbQ==
X-CSE-MsgGUID: Wg+ZqIvlT8eJZL9OZdno/g==
Received: from unknown (HELO opfedv3rlp0d.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2024 08:27:19 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0d.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Dec 2024 08:27:19 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Mon, 23 Dec 2024 08:27:17 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Mon, 23 Dec 2024 08:27:17 +0100
X-CSE-ConnectionGUID: 7LrMHmq/RPWqwDlIiHW1BQ==
X-CSE-MsgGUID: USt91NkaRdy2hyZbolN7wQ==
X-IronPort-AV: E=Sophos;i="6.12,256,1728943200"; d="scan'208";a="237596614"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: Julien Olivain <ju.o@free.fr>, "Yann E . MORIN" <yann.morin@orange.com>
Date: Mon, 23 Dec 2024 08:27:17 +0100
Message-ID: <cover.1734938835.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-Originating-IP: [10.115.26.52]
X-ClientProxiedBy: OPE16NORMBX404.corporate.adroot.infra.ftgroup
 (10.115.26.17) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1734938842; x=1766474842;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+u4ZvXOMbvbCBTgYJzSerY9tWbfMpjbbnWRLLwx1eFk=;
 b=rAxz/3niSW5eCCVkqPduGNogV4z08m9hB3jkYWuUnPkd2tBk2q3ci4CM
 kM29hOmPpKn/Cg35r/DRBntCWA2oV7IuMtE74dX8myWFshZwqahjizFc1
 Cx5bdDpaxfn9vWKufUVrt0x5lyHunmH2vONoBjOs9693qGmiEipgqJ119
 8nZifi9zwsBkhCrprP6m9jGcOHwmJg9ElVmmo8d8aXLeRAcucf/KeVhYM
 15B8vrPi/wPvyA/bUz46NeSeCgVsELeEKuePUpBCEeyB9dCIz8GiHyeJI
 QBWy/ZWRNU7EIc1zyWWfbcRn2wxuC7RV+KhdAuu8Wr0Hmoy5Dx326xBN9
 Q==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=rAxz/3ni
Subject: [Buildroot] [PATCH 0/5] utils/get-developers: misc cleanups and
 improvements
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

This small series brings in a few trivial cleanups and improvements to
get-developers.

Changes v1 -> v2:
  - fix test-suite  (Julien)
  - enhance help text for new option  (Julien)
  - fix typoes


Regards,
Yann E. MORIN.


The following changes since commit 621ebccf3f1ca70443160103ae12ab3ea89f63bd

  package/python-autocommand: add patch to fix build issue (2024-12-22 17:55:22 +0100)


are available as patches in this mail series,

for you to apply patches up to af1aba057da1bd3bb056f7e6886641149bf22592

  utils/get-developers: add option to report Cc: lines (2024-12-23 08:24:24 +0100)


----------------------------------------------------------------
Yann E. MORIN (5):
      utils/get-developers: don't offload parse_args()
      utils/get-developers: use parser.error() rather than canned print+return
      utils/get-developers: read patch from stdin when it's not a tty
      utils/get-developers: sort reported developers
      utils/get-developers: add option to report Cc: lines

 support/testing/tests/utils/test_get_developers.py | 12 +++++------
 utils/get-developers                               | 23 +++++++++++-----------
 2 files changed, 17 insertions(+), 18 deletions(-)

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
