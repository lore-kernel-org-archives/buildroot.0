Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B9DEC43334
	for <buildroot@archiver.kernel.org>; Tue, 19 Jul 2022 13:17:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8916B41552;
	Tue, 19 Jul 2022 13:17:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8916B41552
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X-2xE5YHUs82; Tue, 19 Jul 2022 13:17:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 604804152D;
	Tue, 19 Jul 2022 13:17:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 604804152D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 93C881BF31E
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 13:17:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6DA374152D
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 13:17:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DA374152D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wABWAADrllpr for <buildroot@lists.busybox.net>;
 Tue, 19 Jul 2022 13:17:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC2B541497
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EC2B541497
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 13:17:03 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id h17so21608743wrx.0
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 06:17:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zgXnbc/OFty3xWCbsXwnamU5DQ4mNA97jbIIykb49Pg=;
 b=vKeyYxCgHp5sLKRNy3liSgTtKyFB+LnLgBtnhJC28m0jzd5vOhKz53Ex/YVx74mwSA
 CnJghUhAZQIzGQ+u9IMKoZAUCryRRhMy/8ZcY0x8DNbR5pVEWFYDRQuBdovJiAEbdUj9
 hoS9ua1uN+H+IRIAKgdcYmsbMP4Bg/fPjcjwr2z+hKRGFuH1AUVTTJiYgFMgYtXnbrOS
 Ofd0r2OXf5ViicQQPQBh35Vo3AFPFDHr4o2De++NMTbgn3/WHXjy0+AZCcc2xyEma398
 18jD6SWPq7Ea3MWsc9oMIodBLuoOxzdHXYF0u9FxCv7BnoIHif0fG4o+atplFOGz/HHF
 /OrQ==
X-Gm-Message-State: AJIora/x9ZLk9XPvzBv3vhCgArR0rtQdz4eFPr3N8wLUOr4/BsjOJl8S
 iADbUH+ivl+0fHYElg8v9kC2FaHGGIU=
X-Google-Smtp-Source: AGRyM1vp8Zuabc7TfxfTbnD2b4m3l31Oy9GYO2UHSVWS7SznMfsWQsDkOkw0nNSx/JfO2TkR0nIJ2A==
X-Received: by 2002:adf:ed41:0:b0:210:20a5:26c2 with SMTP id
 u1-20020adfed41000000b0021020a526c2mr25864926wro.603.1658236622171; 
 Tue, 19 Jul 2022 06:17:02 -0700 (PDT)
Received: from lano-work.. ([80.120.136.76]) by smtp.gmail.com with ESMTPSA id
 d16-20020a05600c34d000b0039c5642e430sm14609496wmq.20.2022.07.19.06.17.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 06:17:01 -0700 (PDT)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 19 Jul 2022 15:16:04 +0200
Message-Id: <20220719131605.337057-2-nolange79@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220719131605.337057-1-nolange79@gmail.com>
References: <20220719131605.337057-1-nolange79@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zgXnbc/OFty3xWCbsXwnamU5DQ4mNA97jbIIykb49Pg=;
 b=SDV2bso9sJShVhI8P9eC61zH0zeZRRb7IbhcKf/biYNDLRuOuc2OMjGJ1+86r1A8sl
 VjSgzZpHIIzo2/ejk2MDeMzSfQEhgX7qjughszFvF8Totpi2imRnzsRKuKIv2+u38zfn
 YV6aZ8ffpCqcQpKmsu9MR4l6a7HWkNy4jAPqi+y7c3mggN/QKi9GXd6dfIdgakw8eCtC
 5HbVicJtd5kVd5tXU3P7aoZbuWIfnUYxkFhdsKCVq/LCd1AT+6yGOcpPL6j3U4gvXWo4
 rJdhArtqCMc3KpMWkTaH8GEriLKi7IvgaDa1zFTllc5AUImpgyGYjzyWlT1EtXWSIRnP
 DDCA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=SDV2bso9
Subject: [Buildroot] [PATCH 2/2] package/systemd: allow package to be used
 without init system
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
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Allow systemd to be built as normal package, this for example
allows building systemd-boot without any init system.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/systemd/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 9f1a778e59..e0f5dbce0d 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -16,7 +16,6 @@ config BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
 
 menuconfig BR2_PACKAGE_SYSTEMD
 	bool "systemd"
-	depends on BR2_INIT_SYSTEMD
 	depends on BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS # kmod
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
