Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C40EDEA3F0C
	for <buildroot@archiver.kernel.org>; Tue, 10 Feb 2026 05:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3585D60E06;
	Tue, 10 Feb 2026 05:58:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HYcmyl2uC_DC; Tue, 10 Feb 2026 05:58:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 551AA60ABE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770703127;
	bh=b2kVD407OmxxvHS4fJ6UBFKNVt6tK2EyP4u/NK9AJik=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=r2xndAPL+PZ0238pg4q2LUEF/RlrRnxDFZfuiUIGGR5tOCR8zkhxyKJwJ9cQg51Dw
	 vl05ktc2IoKlAYZSgHlLh8YGfKIcvlwuRjn7sQygmVCJ5+JAx+48TwWO8o4f3webkp
	 oUhueig//Ia0TOVP4A9XDo/YdlvMfJhkXEHwneHeJjPNn/8VjOJ451k8iSWp+h27Rf
	 5+L8ZYQlF4Yng6lTbJ41LH7sY1kPREcn2vjt4tfmXnfcKqprjWAM7tTr418otSWL6G
	 cQhB1omZx17/WgrxBhXX81Mpj/79D1tecpOLSuqqvKw8SzeAy38Ai7KTv0BnCdTgir
	 OZHBGGUt/Ltyw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 551AA60ABE;
	Tue, 10 Feb 2026 05:58:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A3C7219
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 05:58:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 473C160ABE
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 05:58:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0aN-CCyHf9Su for <buildroot@buildroot.org>;
 Tue, 10 Feb 2026 05:58:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.237;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E35F960884
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E35F960884
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.237])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E35F960884
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 05:58:43 +0000 (UTC)
X-CSE-ConnectionGUID: LGVRBF6PTeSrWyF0Q7ZxCQ==
X-CSE-MsgGUID: 29urRYBSTAKqlU32gQEECw==
Received: from unknown (HELO opfedv1rlp0h.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 10 Feb 2026 06:58:41 +0100
Received: from unknown (HELO OPE16NORMBX605.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0h.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 06:58:41 +0100
Received: from OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] by
 OPE16NORMBX605.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Tue, 10 Feb 2026 06:58:40 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61;
 Tue, 10 Feb 2026 06:58:39 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Tue, 10 Feb 2026 06:58:39 +0100
X-CSE-ConnectionGUID: j9Q0uFH5S+qBeQeWZaQXlg==
X-CSE-MsgGUID: +vajRlt0QNCBa1TrsQBMqg==
X-IronPort-AV: E=Sophos;i="6.21,283,1763420400"; d="scan'208";a="390401465"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Tue, 10 Feb 2026 06:58:39 +0100
Message-ID: <3c42d6a8803c28ce34156eee659e25875b916075.1770703119.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX606.corporate.adroot.infra.ftgroup
 (10.115.27.30) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1770703124; x=1802239124;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WnzMralhUqqqF97VS9xGPNUFdc2gSofot4csPWcXJYk=;
 b=bcMCUXjceAAgT1ZVEZY6pLhiiA/E+wVwc6AOEhBcZOzSRFi0A1twl5Id
 pDLUZtfp+EQHNQ63UZmvSFtTXGAMz9apRJTlPx7595RcTDUklHCGoXyY+
 rq2p8wiWGNLcgK9QLv15SBFuwwToYyaer20eTUX3bnpa47R1efxk3n7Y+
 UZGZK7/5Fg5DKunQI5orNp9pzzIPEysOS2EFxtF3JwoDWGZDWAHfY4leU
 dHvBJMCkktX/qFCyCysYwy3bdGT9uonPyb10shPaYpIn66IVBPPsmVYca
 7BCZnw3Or6mQhV7rXbfAX0IZ8lntGTk2ehpLx6dW4apzy3QVbyrzKyOAc
 Q==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=bcMCUXjc
Subject: [Buildroot] [PATCH] DEVELOPPERS: adopt mosquitto
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
Cc: yann.morin@orange.com, Scott Fan <fancp2007@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Scott Fan <fancp2007@gmail.com>

---
mosquitto 2.1.x has been released recently, but has changed quite a bit,
which needs quite a bit of tinkering in the .mk file. This commit also
serves as a sign that I am working on the version bump.
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 225d1ac917..296b79f9e4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3481,6 +3481,7 @@ F:	package/tpm2-pkcs11/
 N:	Yann E. MORIN <yann.morin@orange.com>
 F:	.editorconfig
 F:	package/gpsd/
+F:	package/mosquitto/
 F:	package/skopeo/
 
 N:	Yegor Yefremov <yegorslists@googlemail.com>
-- 
2.34.1

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
