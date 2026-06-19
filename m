Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A81CD98F2
	for <buildroot@archiver.kernel.org>; Fri, 19 Jun 2026 09:31:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65A566F624;
	Fri, 19 Jun 2026 09:31:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hTeY6PEs_gGa; Fri, 19 Jun 2026 09:31:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A9A66F614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781861516;
	bh=8pIDXWXXu+ZdHekV7d6CidIfSdL+Vukn0MTTQ8nsL4Y=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=oXYYF6vW5juw1lVxAgbcrUs43FxGCox6+mcksFuBDYSC+bFYiD7R2CmG31mzaqyg9
	 4GYF9E2bFd4luFfu28eitSmAPs69vggn+CMzFX+tMUvIGivU5S4MHaf5v580mKzZY0
	 SHi0xKpBv+VrBeQ44DDj3/LkZm43X9K5Y1lcy+y+4TDrhuLZWw3CFjC9e9nlY4LaFC
	 XV1hcfqFyecGZQw9lCiE6ITREzRT/tKHV3AzDjXrg3BPEc/706sAxA+BCRpb0F/WWL
	 ykVcGFnTFrHWrB1TDMMMHsZcE114pyGztrKe6ZGtjcAZxXEge38sAG65ZK3Z04Cq1r
	 Dt7L62QByRzYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A9A66F614;
	Fri, 19 Jun 2026 09:31:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 562D2367
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:31:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 47D9842622
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:31:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7KCaPv5_j7b9 for <buildroot@buildroot.org>;
 Fri, 19 Jun 2026 09:31:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.239;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DC36B41088
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC36B41088
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.239])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DC36B41088
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:31:52 +0000 (UTC)
X-CSE-ConnectionGUID: 2g/hP8mNTKytGuWu3AgU2Q==
X-CSE-MsgGUID: 4GSaBGYXRB+wFfPG8Zal9g==
Received: from unknown (HELO opfedv1rlp0b.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 19 Jun 2026 11:31:49 +0200
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0b.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2026 11:31:49 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37;
 Fri, 19 Jun 2026 11:31:48 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Fri, 19 Jun 2026 11:31:47 +0200
X-CSE-ConnectionGUID: 5ACqkPeGRjW4ejD40gVd6w==
X-CSE-MsgGUID: PtIlZXvKS4qjlibucNDL8w==
X-IronPort-AV: E=Sophos;i="6.24,213,1774306800"; d="scan'208";a="441963954"
X-Amp-Result: SKIPPED(no attachment in message)
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Fri, 19 Jun 2026 11:31:47 +0200
Message-ID: <5eb533070f62b66decb39cb42067e453ef577bfc.1781861320.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX607.corporate.adroot.infra.ftgroup
 (10.115.27.31) To OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1781861513; x=1813397513;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6dy3dhEL7Yo9MIOkLzFvK3rpgb7GKnvFDdCbZh+pLlI=;
 b=HUD202+DXNYJV/+zphBlJZYNzN+rMkSS0ED7LY876Dq+R23dzApYUnfW
 VtqORQ+p9UNx8CPglL+/OdNK6gNGWw8j400nuUaJKligJuOtTxTyjZyfF
 jPmlk+y5jcglc1e73zJga78xUt6dkdO0x+XbIQid2GJRBP56evzjy440A
 1LJxYlHVRCcgTGJ08dqL2W1sYoon/w8r1JgNqqCgMf/p0+cqNfHtYT87q
 9HZ7B/aXk2f/Kz/cG9rZwHAuyBTSG3000V1STij06XDVe5E0nucoeRP6G
 DmzR50VhahSbvu9dcskk70lMI/4GDATJQGRZX2z+2egwuNoSqzI6USYF+
 g==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=HUD202+D
Subject: [Buildroot] [PATCH 1/1] package/mosquitto: requires cmake >= 4.3
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
Cc: yann.morin@orange.com, Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

With an older cmake version, like the 3.25.1 as available in the docker
reference image, mosquitto fails to build when ccache is enabled:

    [ 98%] Building CXX object lib/cpp/CMakeFiles/mosquittopp.dir/mosquittopp.cpp.o
    In file included from [...]/buildroot/output/build/mosquitto-2.1.2/lib/cpp/mosquittopp.cpp:17:
    [...]/buildroot/output/host/opt/ext-toolchain/i686-buildroot-linux-gnu/include/c++/15.1.0/cstdlib:83:15: fatal error: stdlib.h: No such file or directory
       83 | #include_next <stdlib.h>
          |               ^~~~~~~~~~
    compilation terminated.

Officially, mosquitto only requires cmake 3.18, but that proves to not
be enough, in fact...

We workaround that by requiring cmake 4.3, which is the one version that
could be tested with our host-cmake.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Titouan Christophe <titouan.christophe@mind.be>
---
 package/mosquitto/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
index 08223bc5db..d553d2fe5c 100644
--- a/package/mosquitto/Config.in
+++ b/package/mosquitto/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_MOSQUITTO
 	bool "mosquitto"
 	depends on BR2_USE_MMU  # lib peeks in malloc() internals; broker fork()s
 	depends on !BR2_STATIC_LIBS
+	select BR2_HOST_CMAKE_AT_LEAST_4_3
 	select BR2_PACKAGE_CJSON
 	help
 	  Eclipse Mosquitto is an open source (EPL/EDL licensed) message
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
