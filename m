Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA7F4C3DA4A
	for <buildroot@archiver.kernel.org>; Thu,  1 Aug 2024 08:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FAC581E60;
	Thu,  1 Aug 2024 08:46:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jUEL2ilz7EmQ; Thu,  1 Aug 2024 08:46:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DB3F81E97
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DB3F81E97;
	Thu,  1 Aug 2024 08:46:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AE4F71BF3C5
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 08:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9BF2140C1B
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 08:46:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oA2xbLIEr2Y5 for <buildroot@lists.busybox.net>;
 Thu,  1 Aug 2024 08:45:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.121;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F1DC440C13
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1DC440C13
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.121])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F1DC440C13
 for <buildroot@buildroot.org>; Thu,  1 Aug 2024 08:45:58 +0000 (UTC)
Received: from unknown (HELO opfedv3rlp0h.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 10:45:57 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0h.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 Aug 2024 10:45:57 +0200
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 10:45:55 +0200
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Thu, 01 Aug 2024 10:45:55 +0200
X-IronPort-AV: E=Sophos;i="6.09,254,1716242400"; d="scan'208";a="181672125"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Thu, 1 Aug 2024 10:45:47 +0200
Message-ID: <d5c9bc32705ce252df3eb70e0bfefe7a5c247c37.1722501946.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722501946.git.yann.morin@orange.com>
References: <cover.1722501946.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.26.53]
X-ClientProxiedBy: OPE16NORMBX201.corporate.adroot.infra.ftgroup (10.115.26.6)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1722501959; x=1754037959;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1UyGwBSvfFN/VaLqJrMzKAp0pib3Sm1tuo4tym1OrQw=;
 b=KB3ACKrjHwXUwlUh8A2aPz6Gb4tvK+sTxt0ELplMXIO9hP+2oyHQ+Esr
 brBvdU6hyZcBv/Nv5/tWFnq0sPjUXRSV4qdwMXdUmSXxIcdbRn6MG1alx
 ZfYl3/6BhX1/FucqxnmbOTb/HLQeIFIkXflkRroFoze1AebnjGVeFxyWW
 /c9xbiQ2mdMN0Xp7gaKBHAvXlcnsrB4yH/ELkHb91EZPHuWUB0+i4EHfW
 k2u1sN3ZO7lZUxxFNYwwON+8JFchJjb6tAwuLOetlQH3wzv7Nnl50Igqo
 fHXI1vkYjo4FQF5lZ7sqT+pYL05WUQdYQiIeF6QnujcZJooAxWC7z+KT4
 g==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=KB3ACKrj
Subject: [Buildroot] [PATCH 3/7] package/delve: needs CGO linking for host
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
Cc: yann.morin@orange.com, Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

The target variant depends on CGO linking, so propagate it to the host
variant as well.

Fixes: http://autobuild.buildroot.org/results/530/530e95c3b1f8dd0494075735a401be89e0cb9938/

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Christian Stewart <christian@aperture.us>
---
 package/delve/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/delve/Config.in.host b/package/delve/Config.in.host
index 0938ab0659..305198f1ab 100644
--- a/package/delve/Config.in.host
+++ b/package/delve/Config.in.host
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_HOST_DELVE
 	bool "host delve"
 	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_HOST_CGO_LINKING_SUPPORTS
 	select BR2_PACKAGE_HOST_GO
 	help
 	  Delve is a debugger for the Go programming language.
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
