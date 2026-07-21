Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 415F2C44529
	for <buildroot@archiver.kernel.org>; Tue, 21 Jul 2026 04:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF4A880DF7;
	Tue, 21 Jul 2026 04:46:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LQA89uCRhE5v; Tue, 21 Jul 2026 04:46:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0573180DD1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784609174;
	bh=gSmrnm3zpc0EjHkFz1OR2KmBAgOCS0drEXiB++sDGBs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=X6tvnIzlIQjzsmpg8O1m1Y2RgGT9Rex8e0HMan2Z5NFEEHeimW/KJMkp0gUyY8D27
	 /DEy29NJy5xM+Dg3gP5KHZb2JsOfw5TKVJCyH6N8VPb8ZKZoQT3sJp59h5kpq4RWT0
	 BhRnaB4zUwOd3RbPevEHHirVCbrGDURGveoI4mqgjFVIv1xX3nvx0dk2ISVHu7OjAT
	 W2x5UhH15f1dR1On/XUKw4ydmiCbsMEvOTZQZy8WceWEAkBTjisxF/wFhReFdapn0w
	 RcNb9UoW1GcELzWHFURfcU4PE7rA74XHNxNH7Tzl1mfBoE0OgWYLprf/giKxq3gf5+
	 QFwNXqmXNFSvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0573180DD1;
	Tue, 21 Jul 2026 04:46:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 98BB49E5
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 04:46:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E00D80D91
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 04:46:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L4imH5x3vgBp for <buildroot@buildroot.org>;
 Tue, 21 Jul 2026 04:46:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.237;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 13ACF80D5B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13ACF80D5B
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.237])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 13ACF80D5B
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 04:46:11 +0000 (UTC)
X-CSE-ConnectionGUID: Sf+lsv2KTPG2ORe+7zqQ4g==
X-CSE-MsgGUID: W4fCjI3RR8+gv7jMIobnAA==
Received: from unknown (HELO opfedv1rlp0b.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 21 Jul 2026 06:46:08 +0200
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0b.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 06:46:08 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43;
 Tue, 21 Jul 2026 06:46:07 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Tue, 21 Jul 2026 06:46:06 +0200
X-CSE-ConnectionGUID: 2VHXB9KeQXKFeU2xudOwMA==
X-CSE-MsgGUID: BWZdJGG9T5O5GrbVBeJw0Q==
X-IronPort-AV: E=Sophos;i="6.25,176,1779141600"; d="scan'208";a="454047919"
X-Amp-Result: SKIPPED(no attachment in message)
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Tue, 21 Jul 2026 06:46:06 +0200
Message-ID: <cover.1784609165.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-Originating-IP: [10.115.26.51]
X-ClientProxiedBy: OPE16NORMBX507.corporate.adroot.infra.ftgroup
 (10.115.27.27) To OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1784609172; x=1816145172;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pmZjqjq32Y0CD6sTDYAtrmh3G0Z5lh194gJfU2JjsCA=;
 b=d6AaTYX+jznjXmoEo6O5+vZEw+H4LTVXWVSa3u3H7On06wvbozmA1KcB
 R3jbfNXZKX884ydWAbSQJlVGQ49fY4nbg8LHdC2HMSzf6nlCgDb2ck+g0
 PU0HWOOYQ/SuErq/yhoMX3ifzQr5WCp1QIdjXK49KANiemS1BPClwfwdB
 JNLQLCOHE9WU6Sv2YNbaXeqbtLVgEz9qLsdf68qLRa1/9uH0f4KnphrTq
 rUNOC263/Ub6rc1CS/4/Fbs9kaPIUTlJfdxbNBIhKOzZCnSf13HnBmy+M
 WwM8n5hhJ9OHlOX+pZr3lFBkL/fv5kWl5t+zSVx/PB24tfFerOWkDvpKg
 A==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=d6AaTYX+
Subject: [Buildroot] [PATCH 0/2] package/lib{qmi,qrtr-glib}: bump versions
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
Cc: Petr Vorel <petr.vorel@gmail.com>, "Yann E . MORIN" <yann.morin@orange.com>,
 Aleksander Morgado <aleksander@aleksander.es>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

Hello All!

This small two-patch series bumps the versions of the aforementioned
packages.


Regards,
Yann E. MORIN.


The following changes since commit a44b18837dc54504f25139d7a3e571cb67cbc9c4

  package/openssh: fix build for powerpc64le (2026-07-20 22:21:10 +0200)


are available as patches in this mail series,

for you to apply patches up to a7faeb61709b77701a7fe35fdb96f4107c43f38a

  package/libqrtr-glib: bump to version 1.4.0 (2026-07-21 06:35:11 +0200)


----------------------------------------------------------------
Yann E. MORIN (2):
      package/libqmi: bump to version 1.38.0
      package/libqrtr-glib: bump to version 1.4.0

 package/libqmi/libqmi.hash                         |  2 +-
 package/libqmi/libqmi.mk                           |  2 +-
 ...-libqrtr-lib-meson.build-fix-static-build.patch | 36 ----------------------
 package/libqrtr-glib/libqrtr-glib.hash             |  2 +-
 package/libqrtr-glib/libqrtr-glib.mk               |  2 +-
 5 files changed, 4 insertions(+), 40 deletions(-)
 delete mode 100644 package/libqrtr-glib/0001-src-libqrtr-lib-meson.build-fix-static-build.patch

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
