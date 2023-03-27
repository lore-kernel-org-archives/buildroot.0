Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44EFAC6FD1D
	for <buildroot@archiver.kernel.org>; Mon, 27 Mar 2023 14:11:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC5A14094A;
	Mon, 27 Mar 2023 14:11:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC5A14094A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uj0XYeqCOgjP; Mon, 27 Mar 2023 14:11:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5A7341775;
	Mon, 27 Mar 2023 14:11:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5A7341775
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BF8FD1BF31A
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 14:11:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 994BF40327
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 14:11:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 994BF40327
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RXC6SSy757BD for <buildroot@lists.busybox.net>;
 Mon, 27 Mar 2023 14:11:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4447400C6
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E4447400C6
 for <buildroot@buildroot.org>; Mon, 27 Mar 2023 14:11:12 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id r11so36798534edd.5
 for <buildroot@buildroot.org>; Mon, 27 Mar 2023 07:11:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679926270;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pas9JfHpFU1LY22vQIvcMqdVSs3Dr1+RuMLVvJOr7bM=;
 b=1iCPDRGUMT+rivF7Id38tW68YDmjT7yPXQHdCfecqVlUTCCoccA59r78IRNwcImTDW
 tgfB2wSssTufz3jDylU+P5yugRQoXikzZgwmd+l5WJI1mOgQ59h0B4ifAfDULrnNozNv
 JJc0zA8gzbPWzl+xC7GYIuiWPFw10op0YFEqipt4mJcGHbaL261oUwbgEpHjJlpbP4KP
 EBmmUSqxs+kO+PpKtGtTAPdmcUIp9oPB9fb4b14Z56g+T+aSk/WTOOxZZqVYAD3vHWDm
 u0vnfia/fHBzlOCeNJcykhNfDSJAR/R+DyTSGmA9CGhPnWVk+eyQmqunqiTlZuB5XbEC
 JtjA==
X-Gm-Message-State: AAQBX9dbAgEQ3hKsUVcesf/jlB38l+Xlc8F9w5HMQiIr9tIPfki+CNv1
 RngWLhj+rmZAtaqqOn7zQmvhlvT64Z9s95Mb
X-Google-Smtp-Source: AKy350ZIC0nWTd0p/DvIZAloF0tYTBwwpZtEt+kxiv9iD/DZ6cCpHkr+9VbQRUHpbjn15B5eftuA2Q==
X-Received: by 2002:a17:907:1c93:b0:93e:908d:cfe2 with SMTP id
 nb19-20020a1709071c9300b0093e908dcfe2mr12656469ejc.0.1679926270036; 
 Mon, 27 Mar 2023 07:11:10 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:22fc:f856:23e6:784b])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a50a402000000b004c4eed3fe20sm14824386edb.5.2023.03.27.07.11.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 07:11:09 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Mon, 27 Mar 2023 16:10:58 +0200
Message-Id: <20230327141058.3669326-4-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230327141058.3669326-1-thomas.devoogdt@barco.com>
References: <20230327141058.3669326-1-thomas.devoogdt@barco.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679926270;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pas9JfHpFU1LY22vQIvcMqdVSs3Dr1+RuMLVvJOr7bM=;
 b=G8cunVy4CvCN8VNwYAMohvgh8QHgyRXXSdQRsBrgyPtG55tPM4zilYNZ4AeVkGmHol
 u+nPnhbipLZ2xTEP8Kt+TuC5ICmyGr17e5EPxGqPOBE2Sq9IOdXJQ1tZSbZbAmycDPRO
 mIU3mDb52rbqwV3zTIs6Byt00Iv7Qqr6cbF0xxJb7PCXn5d9lg2UztM5LKTtTZaVi7qu
 E2ufCmiq+Gs+ySNaZLog0fr7c0H0NVaEw82ETSpe78gvAPUn2PsMp8NUmHybHoKAwgRL
 qEBPqgpidQR10spscV021Z6Ogc6LeEoCPsESzAuCYTeDd8nnuwcQgl3Pxqfw7iTpIT2a
 tIPQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=G8cunVy4
Subject: [Buildroot] [PATCH 4/4] package/fluent-bit: drop xtensa from
 wasm-micro-runtime
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
Cc: Thomas Devoogdt <thomas.devoogdt@barco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

According lib/wasm-micro-runtime-WAMR-1.1.1/README.md#supported-architectures-and-platforms,
it should be supported, but I saw multiple build errors,
so drop it until someone is able to properly build it.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 package/fluent-bit/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/fluent-bit/Config.in b/package/fluent-bit/Config.in
index 91fdf02134..2fc74a6446 100644
--- a/package/fluent-bit/Config.in
+++ b/package/fluent-bit/Config.in
@@ -38,7 +38,6 @@ config BR2_PACKAGE_FLUENT_BIT_WASM_ARCH_SUPPORTS
 	default y if BR2_aarch64 || BR2_aarch64_be
 	default y if BR2_i386 || BR2_x86_64
 	default y if BR2_RISCV_64
-	default y if BR2_xtensa
 
 config BR2_PACKAGE_FLUENT_BIT_WASM
 	bool "wasm runtime support"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
