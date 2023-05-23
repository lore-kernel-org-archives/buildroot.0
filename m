Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B1AC77B75
	for <buildroot@archiver.kernel.org>; Tue, 23 May 2023 17:31:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63B236141F;
	Tue, 23 May 2023 17:31:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63B236141F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hhgR7WpCqf1y; Tue, 23 May 2023 17:31:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F18560A79;
	Tue, 23 May 2023 17:31:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F18560A79
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A611A1BF318
 for <buildroot@lists.busybox.net>; Tue, 23 May 2023 17:31:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E74A41F1A
 for <buildroot@lists.busybox.net>; Tue, 23 May 2023 17:31:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E74A41F1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xP-KFv5gxky6 for <buildroot@lists.busybox.net>;
 Tue, 23 May 2023 17:31:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4763C41EC4
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4763C41EC4
 for <buildroot@buildroot.org>; Tue, 23 May 2023 17:31:48 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-95fde138693so1040428366b.0
 for <buildroot@buildroot.org>; Tue, 23 May 2023 10:31:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684863106; x=1687455106;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FmEhl1/nvce6IIZX8lU+ipyJ/IyMWZBuJb9UGbYBoBk=;
 b=UFP19APa8HpvPcLbbXHbxOFJcvdeHAJk4jP8lcv7tg1WyrXqThIvjujun4qjIA/iTw
 6sApkKk7KbsyqihJ2ypnoU1RafphDko2GNCgzNTc7CgX1cpaJ+You0MdCZ9IhQUiuL1h
 pwbyOLWdfGafOW5ucCCvv5BUxl3D5bWGxbngp9sudjbW3XpBUZpRyi+cUhJ98S/u+k3q
 MC6cI6xWrXCHMmc0Wzu2v6IGD6NfFCPHiqcXSWwKikOWkIzUOJ8tAmeV70Q+XhEt1SDO
 NB7bFFK1aiG4ITK3aCGy2berMFgfAYnIHhptnmOkeMzOD9aCJyuhWFQqiNAB93t22kLE
 98Dw==
X-Gm-Message-State: AC+VfDyCwagSUqMPs/qSyZjdSeNKyeM2gTX2bGL6lQwQ8KXdX2cLJl4l
 nVgxlXhHWc2dO/Ge2ahvRNmPuX3wm0v20grKP1A9rw==
X-Google-Smtp-Source: ACHHUZ7qNbbne/Tf6w6b/XcKcR2yJrGy6uqs2rVQI44hacSRqiso91IGQDWtNDwgP7zJ9O37Wekx1Q==
X-Received: by 2002:a17:907:7b97:b0:970:6c71:7293 with SMTP id
 ne23-20020a1709077b9700b009706c717293mr3804964ejc.14.1684863105985; 
 Tue, 23 May 2023 10:31:45 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-24-92-214.retail.telecomitalia.it. [79.24.92.214])
 by smtp.gmail.com with ESMTPSA id
 w20-20020a170907271400b0096a16761ab4sm4752222ejk.144.2023.05.23.10.31.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 May 2023 10:31:45 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 23 May 2023 19:31:42 +0200
Message-Id: <20230523173142.2003235-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1684863106; x=1687455106;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FmEhl1/nvce6IIZX8lU+ipyJ/IyMWZBuJb9UGbYBoBk=;
 b=a0gwyX3N4nnU9JGHorkJ8+Srs9nMxKvraZF6h7iP7n4ZpabddAtRdMwpyDaEQUk+LF
 GUKUXXuAt5Wf4oaN4h7dg6QpHSLvNlF9y0dEOJ/Gae0beKHRpY0TjMqLVn36Vp+TMRZT
 ulVX9cg7DHs/Yr0K8MD6W/PGFclHmVsS3W33Q=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=a0gwyX3N
Subject: [Buildroot] [PATCH 1/1] package/libmnl: fix build failure
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Dario Binacchi <dariobin@libero.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The rtnl-link-can application requires kernel headers of at least
version 4.11. Since the `make check` command compiles all examples, their
compilation is enabled only if the condition regarding the kernel headers
is satisfied.

Fixes:
- http://autobuild.buildroot.net/results/36c1619c8b02efeaf9caebae8bb5c3eb8a26238b/
- http://autobuild.buildroot.net/results/15f6dc103eec7bdeb5020acbc0ae99dc97c00e4e/

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/libmnl/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libmnl/Config.in b/package/libmnl/Config.in
index b4a4195751ec..434778bf5547 100644
--- a/package/libmnl/Config.in
+++ b/package/libmnl/Config.in
@@ -10,7 +10,11 @@ if BR2_PACKAGE_LIBMNL
 
 config BR2_PACKAGE_LIBMNL_EXAMPLES
 	bool "install examples"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11
 	help
 	  Install binary examples.
 
+comment "examples needs a toolchain w/ headers >= 4.11"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11
+
 endif
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
