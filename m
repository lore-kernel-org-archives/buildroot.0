Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6161FE77188
	for <buildroot@archiver.kernel.org>; Fri, 20 Dec 2024 13:31:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1366B804BF;
	Fri, 20 Dec 2024 13:31:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KEn7-3c7d3IL; Fri, 20 Dec 2024 13:31:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 209D783BA5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 209D783BA5;
	Fri, 20 Dec 2024 13:31:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id ABDF9920
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 13:31:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9720140A86
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 13:31:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EkFbkfzz4pAH for <buildroot@buildroot.org>;
 Fri, 20 Dec 2024 13:31:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.122;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8E027409FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E027409FB
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.122])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8E027409FB
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 13:31:05 +0000 (UTC)
X-CSE-ConnectionGUID: xWjGU0/2T124+wz1i0U8jA==
X-CSE-MsgGUID: wB+R/oFGROqpIW7lm3rVNw==
Received: from unknown (HELO opfedv1rlp0a.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 14:31:02 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0a.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Dec 2024 14:31:02 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Fri, 20 Dec 2024 14:31:01 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Fri, 20 Dec 2024 14:31:00 +0100
X-CSE-ConnectionGUID: Qoklu5ahRKyDT2xiQv6yBw==
X-CSE-MsgGUID: bGBZzdhgQ6musB5u5Qb1WA==
X-IronPort-AV: E=Sophos;i="6.12,250,1728943200"; d="scan'208";a="234963078"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: "Yann E . MORIN" <yann.morin@orange.com>
Date: Fri, 20 Dec 2024 14:31:00 +0100
Message-ID: <cover.1734701459.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX307.corporate.adroot.infra.ftgroup
 (10.115.27.12) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1734701465; x=1766237465;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BP8aQUgGwZE3cxqW8nu65O+Yk+NAwfZuA+duEtum4SY=;
 b=HFejApMFkgojhg6JYmuSRaHh1+7HQMIaKjMF9bdpAie5d12E0RZ2dZ3F
 nR+jNImW6Z/7GzJprNmLqHzgJ2NQ/DCK1lDd0/NkBUZpITn25Ave/bGgh
 BHcv08YRn/5YSJ2EJRriX25nAfzuVw3H3DjG9ZiHHHFjpvD4fIzkByUGo
 cy4BdSkUCyOte4+y/X+t6jS96QE0/o4fiWFKTLTItEJ4RiOXmlSvL3pE0
 56h4px7Ufj5sU6hz0DmRK9aKqvuTc5IWBjnqx83oXswb80NnNIPENp482
 J93UKH4tTvBhvv7ng9Lezlwqdfyez6s2kJBoGHIVhqo0WLZrkryYpW82e
 A==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=HFejApMF
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


Regards,
Yann E. MORIN.


The following changes since commit a0ebdd5cd8318d03693ffa2bfd95b311847bbc1c

  package/cloudflared: bump to version 2024.12.2 (2024-12-20 00:33:23 +0100)


are available as patches in this mail series,

for you to apply patches up to 64f9d09898aee7370ee86df702b207182e6d0cb5

  utils/get-developers: add option to report Cc: lines (2024-12-20 14:28:35 +0100)


----------------------------------------------------------------
Yann E. MORIN (5):
      utils/get-developers: don't offload parse_args()
      utils/get-developers: use parser.error rather than canned print+return
      utils/get-developers: read patch from stdin when it's not a tty
      utils/get-developers: sort reported developers
      utils/get-developers: add option to report Cc: lines

 utils/get-developers | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

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
