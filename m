Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29243C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 13:17:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BAE960B3C;
	Sat, 10 Dec 2022 13:17:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BAE960B3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tdWYPL0FApai; Sat, 10 Dec 2022 13:17:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E77E860A79;
	Sat, 10 Dec 2022 13:17:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E77E860A79
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3D6CE1BF859
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 13:17:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17023410A4
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 13:17:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17023410A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9MmUfY4lP4Yl for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 13:17:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6205C409FE
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6205C409FE
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 13:17:25 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id n20so17757231ejh.0
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 05:17:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PidZ6k3Wj8JyqX8vQ2F60QHbCFX/BaQ5RtsiIdVIOBM=;
 b=wgfvSp3MsaZHKD9yOvE+QOhNZqjzw1pHn+ys9XMWsOOsWvFaKXKAbIcNd1qZWwx9c9
 ius+Lumo8CkTBjLoiOzrn0YhxolgGSs4/qf6QYWfgobgRJ2hplnl0rt4BGpEg7KQcHAa
 1uvrVtMOR4I+mvEpiHhMDncuC2TkCFUFt9MOkfpcnC/lOkbQJc//Zu+V3h31vF56yYn+
 yVibOVFXQjMHYtRa5cyxUTRkOlQCJQZNh0YLQLUrGtYl7ZmfFs29GYG4JHoDZ+hp+pH0
 sa32bHBUF0g9D6Vth6zdsvLDSAGDQlx+sC0GyUAhitDLscBK/5umH3tXSBHTlivdHQjX
 IywQ==
X-Gm-Message-State: ANoB5pmjhcesUS+2FP0PYtXEWRPnI/fKZHgGNpFap+yc6k+acpuxfrA1
 XuPYKKVIDX5cpHB+FXA/D/tromX4BLg=
X-Google-Smtp-Source: AA0mqf4gZoXxo2Yfd6QuGbnRbQIo8hr6401ksPJpalfCjr+yaKvRcDZIKDEaUHn69bwRz4yPAZ/s/w==
X-Received: by 2002:a17:906:e203:b0:78d:f455:c396 with SMTP id
 gf3-20020a170906e20300b0078df455c396mr7464507ejb.60.1670678243459; 
 Sat, 10 Dec 2022 05:17:23 -0800 (PST)
Received: from debian-noppl.. (84-113-221-34.cable.dynamic.surfer.at.
 [84.113.221.34]) by smtp.gmail.com with ESMTPSA id
 o19-20020a170906769300b00738795e7d9bsm1019912ejm.2.2022.12.10.05.17.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 05:17:23 -0800 (PST)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 14:17:11 +0100
Message-Id: <20221210131713.274886-1-nolange79@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PidZ6k3Wj8JyqX8vQ2F60QHbCFX/BaQ5RtsiIdVIOBM=;
 b=Ps70ED/wh0/gHq8+xebcIXXeBVTvuyQVCkcYnCYHwiGQMlWnn5EBjX3XqaFTtBAxDW
 FSd94AS/7WIE6BvvXxmFneejhJYi+7BPEw/ZWGruQpYbZwVGZHkC97NxfXDQ/P552nbt
 6Zj/jYkygMj5HwuS9bLj61/arMTRVMutqtoO8Sv+MdIehY0/1V4sjc2R3TxQWmeeligv
 bmtnkBfgJ7Pft/9tJ6lxpLJEDVv7KP1mjZsgvQM7wScLifwJI8JDfI1Lhwo1mHdzJj+3
 AdYJhAnW2UiCEINnMawuVx8VFLfOG6602OkvDzYaUBoApUE0RLyfUTEz/xO/ZBfrTBLT
 r2cw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Ps70ED/w
Subject: [Buildroot] [PATCH] package/libxml-parser-perl: fix build when host
 matches target gcc
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
Cc: Norbert Lange <nolange79@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The host configure and build step looks for same compiler name
(eg. x86_64-linux-gnu-gcc), and the build potentially breaks
if the target compiler is named identically.

revert PATH env variable to not include the target binaries.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/libxml-parser-perl/libxml-parser-perl.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libxml-parser-perl/libxml-parser-perl.mk b/package/libxml-parser-perl/libxml-parser-perl.mk
index 37cef2e418..4af4485429 100644
--- a/package/libxml-parser-perl/libxml-parser-perl.mk
+++ b/package/libxml-parser-perl/libxml-parser-perl.mk
@@ -14,6 +14,7 @@ LIBXML_PARSER_PERL_RUN_PERL = `which perl`
 
 HOST_LIBXML_PARSER_PERL_CONFIGURE_OPTS = \
 	$(HOST_CONFIGURE_OPTS) \
+	PATH="$(PATH)" \
 	LD="$(HOSTCC)"
 
 define HOST_LIBXML_PARSER_PERL_CONFIGURE_CMDS
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
