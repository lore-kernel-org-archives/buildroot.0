Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4DA8D60CFA
	for <buildroot@archiver.kernel.org>; Mon, 18 Nov 2024 23:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CA8060890;
	Mon, 18 Nov 2024 23:24:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LlYOvGaey4SY; Mon, 18 Nov 2024 23:24:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 851396089B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 851396089B;
	Mon, 18 Nov 2024 23:24:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 308A327EB
 for <buildroot@buildroot.org>; Mon, 18 Nov 2024 23:24:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D0708001C
 for <buildroot@buildroot.org>; Mon, 18 Nov 2024 23:24:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LBOFBWBR904S for <buildroot@buildroot.org>;
 Mon, 18 Nov 2024 23:24:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3EB2D84D6A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EB2D84D6A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3EB2D84D6A
 for <buildroot@buildroot.org>; Mon, 18 Nov 2024 23:24:30 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E9F6DB0055A;
 Tue, 19 Nov 2024 00:24:25 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E . MORIN" <yann.morin@orange.com>,
	Julien Olivain <ju.o@free.fr>
Date: Tue, 19 Nov 2024 00:24:20 +0100
Message-ID: <20241118232420.3166108-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731972268;
 bh=U6mXnUMcApV5EGNQKy9PLsnphPOmo4gW87MM2pGcoT4=;
 h=From:To:Cc:Subject:Date:From;
 b=M180FpT0Y+JC/FwUTqWbdH4LlfaLyUnWtldewhimlS1GmTZaw1lkJcXeXFdWmnzah
 DYIRZ/0TZlBdEXd3stED1nu0FoWG6butIkiPEBLMuO/jhbAqFNUQtm4rzTR6wav0HL
 Sr09kgmvPDpx1F5LDNb/EpzGkNuyN7hTWXIKYc/JA6ELcu9Lk+QbXAx39qPYFY0ZN4
 XXOdC08uuPSNfLup4rjWywLXBG6v4LddGbRu+SyLnTvQkOQ5qUDa3LtdKriHKH3lSM
 T13YbQz8XRZezKTo6ETTQs0c7mYZl7i2Jfu6oXtGYYNkl1yARomiTq6De7rBP4Fbgr
 RQHo7TSQRoPCw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=M180FpT0
Subject: [Buildroot] [PATCH 1/1] package/skopeo: select BR2_PACKAGE_HOST_GO
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

host-skopeo fail to build, using the commands:

    echo BR2_PACKAGE_HOST_SKOPEO=y >.config
    make olddefconfig
    make host-skopeo

This commit fixes the issue by selecting BR2_PACKAGE_HOST_GO
in the Config.in file.

Fixes:

    make: *** No rule to make target 'host-', needed by '/buildroot/output/build/host-go-1.23.2/.stamp_configured'.  Stop.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/skopeo/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/skopeo/Config.in.host b/package/skopeo/Config.in.host
index 334a12b6fc..1c1c8f3ebe 100644
--- a/package/skopeo/Config.in.host
+++ b/package/skopeo/Config.in.host
@@ -2,6 +2,7 @@ config BR2_PACKAGE_HOST_SKOPEO
 	bool "host skopeo"
 	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_HOST_CGO_LINKING_SUPPORTS
+	select BR2_PACKAGE_HOST_GO
 	help
 	  skopeo is a command line utility that performs various
 	  operations on container images and image repositories.
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
