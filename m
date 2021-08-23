Return-Path: <SRS0=awcP=NO=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23CACC432BE
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 11:27:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6492613A5
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 11:27:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C6492613A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D37180CC1;
	Mon, 23 Aug 2021 11:27:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C65BL-EpXoH8; Mon, 23 Aug 2021 11:27:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 290DD80CC2;
	Mon, 23 Aug 2021 11:27:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7389B1BF33A
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 11:27:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 619AE40221
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 11:27:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lEWMCd12LwUH for <buildroot@lists.busybox.net>;
 Mon, 23 Aug 2021 11:27:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9AB9240206
 for <buildroot@buildroot.org>; Mon, 23 Aug 2021 11:27:35 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id k8so25766362wrn.3
 for <buildroot@buildroot.org>; Mon, 23 Aug 2021 04:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0hrhUhWZ/4QjdY8vrU9yNKIbMVrxcntah8hVqB0a4nw=;
 b=nhJKZfxErhHRtG5HTol/cEfaPLLN1pjeu4ypmN4DTcTFj+utfirSsXl8WowxlEcGBe
 MrT3zObO2EzzsOi3aHpxPm4955RAyW8W4PoFoCPfmPMjqSFvYO2u6fsB6QGjTWHgQwiu
 A8LQBiV5UNKxnHD5cubIwM2k6DuaJz/6YX1qSZilPXvqr1Qy/i8e1BTxMGdZbJLQGjJF
 yJbrTH68GwP5xeDJp9g3DW5P6EVgeaZs4nZ4ypexn8mbgnqJ+/p2FIesrTxl9YHZ9wXk
 RjtEGBNbK8czvN0LnPTr0D+AW/P7VGt/tTII9ktAsIe3fyG0nG9SG3X1c2DtdVidM+/L
 3SHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0hrhUhWZ/4QjdY8vrU9yNKIbMVrxcntah8hVqB0a4nw=;
 b=V8RjgfR6XM84z3UsfJscOSk+TEfGYsyhoQVuWiBcHsTt7Inr574+IFXXP9zxl4oY9u
 ljfmFWGiOymOt8u/cj/wmJFd8mXRDU/Hmh4hqauOwf6b2PM9+3ZVdUoYm+etdJwKibZu
 +1Y6Hso5D7HDF14Ijplv1v6eQYCwTlSaXmgNFkSxFl28KAK3KZVZxnnS1SScKfgVamob
 Hoos0RvWoLuGte8QyF2tcZZZBbegQZI6sH5ZwGjX4mLIpEmzUCxskV3KgggxZ+R813X0
 7/7UtxOCULrW7NnJJTBdxK0LKUTUOl3Dk+rGvwdZxffuBmIutvOihSZHPk26DLQeBhRl
 JKXA==
X-Gm-Message-State: AOAM531p3kDx7End+DTKDEGiX/VgyVM/jMUYrnfuqn242ywL18gMk2JK
 rQ4Wb5oZW3WxFs5RFmBgn6uSSxBtZ5E=
X-Google-Smtp-Source: ABdhPJwKESXmFHa5Q2ztV4lkCrfVv3jvyNETQAE7FD+XkcM0S2wDp3/6cxBKQYw2u7YVT3Q2767lag==
X-Received: by 2002:adf:e78d:: with SMTP id n13mr6893707wrm.55.1629718053767; 
 Mon, 23 Aug 2021 04:27:33 -0700 (PDT)
Received: from localhost.localdomain
 (2a01cb058f8a180098814a9aef637f91.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:9881:4a9a:ef63:7f91])
 by smtp.gmail.com with ESMTPSA id o6sm14693079wru.92.2021.08.23.04.27.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 04:27:33 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 23 Aug 2021 13:27:29 +0200
Message-Id: <20210823112729.750916-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libffi: disable use of static exec
 trampolines
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

TestGst1Python test segfault since the libffi bump to 3.4.2.

Apply the same fix from Yocto [1] disabling static exec trampolines.

Fixes:
https://gitlab.com/kubu93/buildroot/-/jobs/1522848331

[1] http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=dadfef3950fae4e93ce4c13ab91a2a7f41b3702e

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/libffi/libffi.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
index 0ef2786988..85b4ab5b84 100644
--- a/package/libffi/libffi.mk
+++ b/package/libffi/libffi.mk
@@ -13,5 +13,9 @@ LIBFFI_INSTALL_STAGING = YES
 # We're patching Makefile.am
 LIBFFI_AUTORECONF = YES
 
+# The static exec trampolines is enabled by default since
+# libffi 3.4.2. However it doesn't work with gobject-introspection.
+LIBFFI_CONF_OPTS = --disable-exec-static-tramp
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
