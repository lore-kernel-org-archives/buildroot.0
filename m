Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B379AC53200
	for <buildroot@archiver.kernel.org>; Wed, 29 Jul 2026 09:01:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A94A60AD1;
	Wed, 29 Jul 2026 09:01:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l-gzxrLTK0JQ; Wed, 29 Jul 2026 09:01:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B12BD6080F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785315704;
	bh=ZROrKQe6jBhr2YpprfkVMvii8I9jQ8ZmlG1UOT/6aZs=;
	h=From:To:CC:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=B9Wng07jbZ6+tHeYVIefs6q08MP95qHF2x/K8Pr2A5jhyswlXqIxe7mFcovp4z1tH
	 /GAdYsc5/JH1gk+vpqXUh+7grCWvuyTmYUpN1Ho/Li2iBhgThgzcCR7E90AbGtNJTK
	 Bu4ZsxCmfrX0NVhY6MjXO6LPd4GBIKJZtCXxF5e73fRPW/W4LASw37H8waTb6xGMhO
	 ZPkx3FjyyI7mSCk/lTz007aIdy9dwk+hqelwdWQh5KWjcvyCipbRhXzYhqn+7cF0td
	 yprhCAzziWkQjunZIKCS0K159BDaw52XA92ZiXUpXtjWZsazDEJjjo45g+fHuR4IvA
	 x7W3fhcn6Udhw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B12BD6080F;
	Wed, 29 Jul 2026 09:01:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B393C3B0
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 09:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A52DA4009C
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 09:01:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 79JF-ERRlEza for <buildroot@buildroot.org>;
 Wed, 29 Jul 2026 09:01:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.239;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 353364004B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 353364004B
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.239])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 353364004B
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 09:01:41 +0000 (UTC)
X-CSE-ConnectionGUID: CTVlndQCRNibRup+sqLgzg==
X-CSE-MsgGUID: ANTRgr7UQb2u5p2MrlzXIQ==
Received: from unknown (HELO opfedv1rlp0h.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 29 Jul 2026 11:01:39 +0200
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0h.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 11:01:38 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45;
 Wed, 29 Jul 2026 11:01:37 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Wed, 29 Jul 2026 11:01:36 +0200
X-CSE-ConnectionGUID: zjrEeOnWT86Cq/88e/OcFQ==
X-CSE-MsgGUID: g7k+5vifQvy2Efrcp14rmQ==
X-IronPort-AV: E=Sophos;i="6.25,192,1779141600"; d="scan'208";a="455167469"
X-Amp-Result: SKIPPED(no attachment in message)
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: "Yann E . MORIN" <yann.morin@orange.com>
Date: Wed, 29 Jul 2026 11:01:36 +0200
Message-ID: <cover.1785315694.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-Originating-IP: [10.115.26.51]
X-ClientProxiedBy: OPE16NORMBX501.corporate.adroot.infra.ftgroup
 (10.115.26.25) To OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1785315703; x=1816851703;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7y/WOY4rbCHhv9o/cNGO6ZZYlcVWsQe1QxB/d7ToaAA=;
 b=GFNevw9j5gYPsKRB+J14ncPtAMUHa8ghzEmJ0WFT8q1ddD7/IKZrMn47
 6RG4nMDEaF7eWOR4wHEd878yQK2XaIQtc763c9togHbur3nNiSyQbJRKJ
 6TqlyiGWk67iH2Y4Nm3rQ/rhmH+aDNHLZfCB02iU+Ke85TPxlhnBrjMzQ
 t2zacYuNuEXQUP699rvdBDZsUHid4+SNYlSQ41dVvdeouMWsJ3irxHg00
 Ajj84mxNdXO+xYhfPw5BV8ILCo//cnGQt8G2hJg7U7yGBN+xQUqyEai+B
 8xVrpKT/UB+pFDML/vFeFyAfNbbzuUpBPxb8EYVfNwVDVYyVHBW0tS1ro
 g==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=GFNevw9j
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


The following changes since commit df6f3ad43f6dc4a8e76fa4b27a2c85a0b981de79

  package/lua-lyaml: bump to version 6.2.9 (2026-07-28 21:40:39 +0200)


are available as patches in this mail series,

for you to apply patches up to a011c7746d80417cc4b282c03f595a13bd92f489

  package/amazon-ecr-credential-helper: bump to 0.12.0 (2026-07-29 10:58:55 +0200)


----------------------------------------------------------------
Yann E. MORIN (2):
      package/docker-credential-gcr: bump to 2.1.32
      package/amazon-ecr-credential-helper: bump to 0.12.0

 package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.hash | 2 +-
 package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.mk   | 2 +-
 package/docker-credential-gcr/docker-credential-gcr.hash               | 2 +-
 package/docker-credential-gcr/docker-credential-gcr.mk                 | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

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
