Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 249E5C0015E
	for <buildroot@archiver.kernel.org>; Wed,  5 Jul 2023 12:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6697140BC1;
	Wed,  5 Jul 2023 12:18:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6697140BC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fD9F1Kj73p8P; Wed,  5 Jul 2023 12:18:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8DF0740B42;
	Wed,  5 Jul 2023 12:18:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DF0740B42
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8BD791BF28E
 for <buildroot@lists.busybox.net>; Wed,  5 Jul 2023 12:18:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 63B4140136
 for <buildroot@lists.busybox.net>; Wed,  5 Jul 2023 12:18:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63B4140136
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yeg2ar-0yUW2 for <buildroot@lists.busybox.net>;
 Wed,  5 Jul 2023 12:18:25 +0000 (UTC)
X-Greylist: delayed 00:07:09 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B93F5400F8
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.237])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B93F5400F8
 for <buildroot@buildroot.org>; Wed,  5 Jul 2023 12:18:24 +0000 (UTC)
Received: from unknown (HELO opfedv3rlp0b.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2023 14:11:12 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0b.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Jul 2023 14:11:13 +0200
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 5 Jul 2023 14:11:10 +0200
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Wed, 05 Jul 2023 14:11:06 +0200
From: yann.morin@orange.com
X-IronPort-AV: E=Sophos;i="6.01,183,1684792800"; d="scan'208";a="10754201"
To: <buildroot@buildroot.org>
Date: Wed, 5 Jul 2023 14:11:06 +0200
Message-ID: <cover.1688559056.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-Originating-IP: [10.115.26.51]
X-ClientProxiedBy: OPE16NORMBX105.corporate.adroot.infra.ftgroup (10.115.27.2)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1688559505; x=1720095505;
 h=to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding:from;
 bh=1l9kYwYS923ywnN88vpeOfqFghkRBuPyjSYXxw4RZX8=;
 b=rjwfzQE39WVi5mP7+1KcVVYrbCXgU9+N03JqtITFQIbiR1Xj0jDsiUix
 hnM86RDYUcNCD+ntOCKJ58pZJjzbMdiHeaCvlZmBtSqh6FVtdD01S2CPK
 w+p28g2ui10dYL4iLtPH71poITkVpQwzVnyBUt94iOMmgNnZQCDrdM2Ww
 qWK3CzeGZ3mDpL7GiIlqU+QciC4Wkt2UPqIb4V0uGKsn0+Ni8sWLUjuu9
 qOYClb7UNa+cvir1Y6cblTZjpmuGm3Lk/KB14ev1hIaZh2TkRGu3QAE/o
 LJdLOu+eUXd/TGxdLE7SOY8TRqdQhRPU5BDHdXXSEs+PToEEv/jWGmXdL
 g==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=rjwfzQE3
Subject: [Buildroot] [PATCH 0/3] support/download: enhance svn backend
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
Cc: "Yann E . MORIN" <yann.morin@orange.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello All!

This small series enhances the svn backend with two new features:
  - properly use credentials to retrieve changeset info
  - allow skipping svn-externals

Additionally, it also adds shellcheck fixes/exceptions, so that script
does not end up on the list of derelict scripts.


Regards,
Yann E. MORIN.


The following changes since commit 11aa7ac8fa3a21dc2476dd09539ea3cf3e48f03d

  package/gnuradio: fix build with python-pybind > 2.10.0 (2023-07-04 22:44:08 +0200)


are available as patches in this mail series,

for you to apply patches up to b1388fcaee6d79d0845a49632b5b9326050ed219

  support/download: add support to exclude svn externals (2023-07-05 13:51:22 +0200)


----------------------------------------------------------------
Yann E. MORIN (3):
      support/download: fix shellcheck errors in svn backend
      support/download: use svn credentials to retrieve revision date
      support/download: add support to exclude svn externals

 docs/manual/adding-packages-generic.txt |  6 ++++++
 package/pkg-download.mk                 |  1 +
 package/pkg-generic.mk                  |  9 +++++++++
 support/download/svn                    | 28 +++++++++++++++++++++++++---
 4 files changed, 41 insertions(+), 3 deletions(-)

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
