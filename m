Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 438E7C5DF81
	for <buildroot@archiver.kernel.org>; Thu, 20 Aug 2026 08:19:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A43494059C;
	Thu, 20 Aug 2026 08:19:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2OR6HjKc9XFd; Thu, 20 Aug 2026 08:19:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787213993;
	bh=gM1xoKNvwsPo7zwRqROj3EnPYh+2AEOyDnSWYTDIm5g=;
	h=From:To:CC:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ry8bnoqQGTUxi5XM/RxbTG6fzg5kPHN+nhlCtea+i4iEtpQbTG7bE+oy0O0IlUUtB
	 TTjP+DojsIydsOwJAAHcuZHTgzsXFlesHakpxsB/qWF0RlQUPpEtMR41aHhdAkxTTL
	 ceB0FdN+UdKyBM/5V5rLsHZJsgBRRWcOscWIqGE8gEw+p68TN00lA1PzoklR9GYcvt
	 DMbaEkKx3MeCs82WbwKb1oKg7hfETZ5nO9J0+OL0Y/j6I4kzEtaKT3I6N81G30bY9t
	 77hYEpsnVLLMyvCFLJvw3OpjCAKdKxz0CyThnmHMFTjGHzm4JJHBAHvaavaW5uRTwT
	 3Is+h224axFwQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01DCA405A3;
	Thu, 20 Aug 2026 08:19:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0148C39E
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 08:19:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D91A840253
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 08:19:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QtpKBQp4jeZb for <buildroot@buildroot.org>;
 Thu, 20 Aug 2026 08:19:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.121;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=orange.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=IJwV4J53
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.121])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 58C8B40074
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 08:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1787213990; x=1818749990;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TvFbAWzFwm1wHktlELq9JBECdeEGovIuowpXkbdKFpk=;
 b=IJwV4J53pxTqAVpi6Ngc8PLDhoAuXuonQhuFBVEp64ji/ELSsKTuystl
 av8mFDD37q4hX+gfaoYH7Tj2dM1VLzi/WNQrR8zep+117/RgaRH3oMiaY
 utIMzRTE6DNKIhegCU6VgjjNufRSx/lpsDInrQxJI1yYjA47xjfJKSLAv
 BSzIFM2UmZMzbMJlUOnQKoFbIplo7HNDXe/2werVP3KdEb4arzM74YM4I
 Xki4IGX/mmOamz85GGJc7vtWmsB1oxTgSIM36vugsNer5fj6izQfMZcyH
 MFUszwNibh80eq66qgrbhVj/ASHGlQSvs/BFct5Y64WiRsidcX+LVSjyZ g==;
X-CSE-ConnectionGUID: ETGAVPzuRDOJa96NZBAnYw==
X-CSE-MsgGUID: 23DK4dqAT4aktYNNMiVQmw==
Received: from unknown (HELO opfedv1rlp0e.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 20 Aug 2026 10:19:47 +0200
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0e.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 10:19:46 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45;
 Thu, 20 Aug 2026 10:19:45 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Thu, 20 Aug 2026 10:19:47 +0200
X-CSE-ConnectionGUID: LTq769QUSKyl0YjKAol18Q==
X-CSE-MsgGUID: 6lPMUHHsTl21NdbN8aKFlg==
X-IronPort-AV: E=Sophos;i="6.25,232,1779141600"; d="scan'208";a="462338905"
X-Amp-Result: SKIPPED(no attachment in message)
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>
Date: Thu, 20 Aug 2026 10:19:46 +0200
Message-ID: <bf210af2584f4d87783ac68fbe94236a5cffd65f.1787213987.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Originating-IP: [10.115.26.51]
X-ClientProxiedBy: OPE16NORMBX502.corporate.adroot.infra.ftgroup
 (10.115.26.26) To OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26)
Subject: [Buildroot] [PATCH 1/2] package/distribution-registry: needs NPTL
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

distribution-registry calls pthread_getattr_np() which is only available
with NPTL; i.e. always available with glibc (where it originates from,
since 2.2.3), always available with musl (which has had it since 0.9.10
in 2013), and only available when uClibc has NPTL (since 1.0.0 in 2015).

Fixes: https://autobuild.buildroot.org/results/9395500a8baee6c6142f96d7bc97e81725c2e754/

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
---
 package/distribution-registry/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/distribution-registry/Config.in b/package/distribution-registry/Config.in
index af650171b1..3db2a8d906 100644
--- a/package/distribution-registry/Config.in
+++ b/package/distribution-registry/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_DISTRIBUTION_REGISTRY
 	bool "distribution-registry"
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL  # pthread_*_np()
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	help
-- 
2.43.0

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
