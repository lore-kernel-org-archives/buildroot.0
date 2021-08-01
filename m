Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B690C4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 13:46:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DF96610A5
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 13:46:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2DF96610A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3B3E83CC2;
	Sun,  1 Aug 2021 13:46:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gdHd8tC87zVi; Sun,  1 Aug 2021 13:46:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DF0583C4D;
	Sun,  1 Aug 2021 13:46:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 700C21BF333
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 13:46:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6CB6B83C4D
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 13:46:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jbm22t2vSGNO for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 13:46:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 778BD82F76
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 13:46:19 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id c16so18122365wrp.13
 for <buildroot@buildroot.org>; Sun, 01 Aug 2021 06:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hzAM91BGmi55+7PtfpqXtYs+Ut0kUzUamCVX+Tm5MRM=;
 b=g0DxEPj1shBsf/Ij+52WkDK0tLd7dJSdHYOW13YV2JnYlToZVDI1kJU8b1O21Rcb9z
 Y060qFLgeeVtp97kQ5S4ZyLNYurcxNVDbSsjDyrgrL9CAFxTwiGNkp5TgY5FV7bCewkp
 qguO6Jc2MNxSBAEsJ3lqah9tgShMHSLnwu7lhLZnm50QCHQA9DVGkurFEvOoGbjSu4xt
 if7e4DaEuARshXjkHaA3bZv9oDXn/Zv88id2Q3A+L+sYsvF1Erm77TNvACgUwcsFej4r
 TdsceI1mNOVySBYBwtmcYTjqE49qgrqLaP2PO6x9ALWB2RNXnOX2+I2FG0BTBZ102UPx
 5dvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hzAM91BGmi55+7PtfpqXtYs+Ut0kUzUamCVX+Tm5MRM=;
 b=mdCfS1Rkt4ii6LLh+iFC7Fl65GMI1WWqG31mKCLn5Fja+u2RFL4graJFI3yylgdEL2
 Odx21Hn432Ui/upBQLHHVlEBgSUieIfVxsks+N2eC+e9XDdHj1N1HdwVQl5T0dy/BGwt
 Cux5BRULMYPBKVQOVWb7n4Ktx8NGJP7IHKg/1/yN8+3XQxPJAp1hN9KMu8wWLn7rAD/c
 INfLnv5xIvoNHRAo0/fQz2PGqyroFFDeSh7bAFSBqbCGkLL9edQrrunkD5nwLjnh5ZcK
 AeiWEJuk19a87ZP/e6pdHxWqjrl4NtC1pAUdS/UTA+PCipuMtw1BUUQImZYsB1k3FAeD
 9i2g==
X-Gm-Message-State: AOAM532kDDIPtAUBZmtf0IqUZ7VzcL7siuiAXjDeNS3uls3Lbrn9GDyc
 3MjMPSoSoJ38HKtWKhJBBAjcOqaBlHEycg==
X-Google-Smtp-Source: ABdhPJw8lE20YuBEgSAqXYoTymdYO4PmrznpdeinbjShp6vXer9qXAXabv4fOcuGXQAA57ALyHuvvQ==
X-Received: by 2002:adf:e281:: with SMTP id v1mr8965414wri.5.1627825577479;
 Sun, 01 Aug 2021 06:46:17 -0700 (PDT)
Received: from kali.home (pop.92-184-116-155.mobile.abo.orange.fr.
 [92.184.116.155])
 by smtp.gmail.com with ESMTPSA id z137sm7440418wmc.14.2021.08.01.06.46.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 06:46:16 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Aug 2021 15:46:08 +0200
Message-Id: <20210801134608.3730251-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libxmlrpc: cli tool needs dynamic
 library
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

cli tool, added in commit bc3dc2b44ba1d80ed93f43a8d43c3d80ff548077,
needs dynamic library

Fixes:
 - http://autobuild.buildroot.org/results/18a1a45a0fda7fc95e9d865b4b8a90a99494717e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libxmlrpc/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libxmlrpc/Config.in b/package/libxmlrpc/Config.in
index f8b8c411e1..33d512328e 100644
--- a/package/libxmlrpc/Config.in
+++ b/package/libxmlrpc/Config.in
@@ -14,9 +14,13 @@ if BR2_PACKAGE_LIBXMLRPC
 
 config BR2_PACKAGE_LIBXMLRPC_TOOLS_XMLRPC
 	bool "install cli tool"
+	depends on !BR2_STATIC_LIBS
 	help
 	  Command line tool xmlrpc.
 
+comment "cli tool needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
 endif # BR2_PACKAGE_LIBXMLRPC
 
 comment "libxmlrpc needs a toolchain w/ threads"
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
