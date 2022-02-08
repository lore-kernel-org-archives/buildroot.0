Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6361FC433F5
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 18:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFA82823C0;
	Tue,  8 Feb 2022 18:05:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fC20KpFFPBIv; Tue,  8 Feb 2022 18:05:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BEE7813E9;
	Tue,  8 Feb 2022 18:05:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C10A61BF2AF
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 18:05:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AEDD060B88
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 18:05:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=orange.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b7wij-Gezois for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 18:05:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.70.35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 532CA607B0
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 18:05:31 +0000 (UTC)
Received: from opfednr07.francetelecom.fr (unknown [xx.xx.xx.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfednr24.francetelecom.fr (ESMTP service) with ESMTPS id 4JtWBx1WG9z1yyq; 
 Tue,  8 Feb 2022 19:05:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.com;
 s=ORANGE001; t=1644343529;
 bh=btGmwlgAEJNB9kzTPe4v2HDUKwbFjGpBpta4+qr+mPU=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:Content-Type;
 b=MCY0kX59Tg2+5nMEvRF5w2Mt+/ktcnyDWpIInOU9kMf6xmwZ8VrECYPU4mi3SiajN
 KWgf3FP+s9bz0LJepHFHMFdjx1zHmV3NSivrZa8+2BzNf0QAAOf5nHzpAv+MyB/C3i
 SNL7XKfP71EIwAcEI2vpVxmd4/KeyvebfT4/F5pa+ebalqCPnu6e0/mgpwpZdp0mHV
 wprZZa9pQnnag23MgjtG1CHYnQSnWbLlAf2ehizWbG+nz/Gth8ry63Lha9j+/Pl719
 TqigGGop7j9nhnwxGc/+CTjfL4MHtcurNGo4Kxw2cebQH8Y+W6UYk6lGZkpxkWH9yG
 28kXOaDzC3evQ==
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Tue, 08 Feb 2022 19:05:26 +0100
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Tue, 8 Feb 2022 19:05:26 +0100
Message-ID: <3095_1644343529_6202B0E9_3095_200_1_cover.1644343524.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-Originating-IP: [10.115.26.53]
X-ClientProxiedBy: OPE16NORMBX602.corporate.adroot.infra.ftgroup
 (10.115.26.30) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
Subject: [Buildroot] [PATCH 0/3] package/pkg-cargo: build in sub-directory
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
Cc: "Yann E . MORIN" <yann.morin@orange.com>, Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

Hello All!

This three-patch series allows cargo-based packages to reside in
a sub-directory of the package source tree.

It also allows cargo- and golang-based packages to declare their
own download environment variables. The golang case was not tested,
by lack of an affected package, but the change is simple enough
(hopefully).


Regards,
Yann E. MORIN.


The following changes since commit f9668ea37b81819794bb3964705f900895b54128

  support/scripts/graph-build-time: add support for timeline graphing (2022-02-08 13:47:55 +0100)


are available as patches in this mail series,

for you to apply patches up to 61674c9d53c678f60a82c5c347147c31b9a29ba6

  package/pkg-cargo: allow building in a sub-directory (2022-02-08 18:58:24 +0100)


----------------------------------------------------------------
Yann E. MORIN (3):
      package/pkg-cargo: allow packages to define download environment
      package/pkg-golang: allow packages to define download environment
      package/pkg-cargo: allow building in a sub-directory

 package/pkg-cargo.mk  | 18 +++++++++++++-----
 package/pkg-golang.mk |  2 +-
 2 files changed, 14 insertions(+), 6 deletions(-)

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
| +33 534.541.179 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
|      yann.morin (at) orange.com      |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'


_________________________________________________________________________________________________________________________

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
