Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B5D5C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 20:46:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA63860EB4
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 20:46:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DA63860EB4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FA2C4036B;
	Sun, 25 Jul 2021 20:46:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hdn_ZzdKaR0x; Sun, 25 Jul 2021 20:46:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6ADA40365;
	Sun, 25 Jul 2021 20:46:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F24C51BF25F
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 20:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E16FB6069D
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 20:46:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g1bcnLM9zQd8 for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 20:46:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 675AC6065D
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 20:46:37 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id r6so9352165ioj.8
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 13:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B4Kh1NDITKs1BsgXTfrc4uSbX7Wn0gXFPHkyLGVSe2M=;
 b=Xky0LVEl3B5rY1SiGfDmeRsosc4R67LyoYmzAYHPMwwK5ibXHkcwAskEiSGNLh+27e
 55dbLuOqfqkHsEGNv26XozKBUAGHo6Dka69IlE+l5blH921i8O5Lsc8BlQV3K6c96NC8
 AezUpVLT55kxZUSwkUtVz0wP0zwhfyWQEjmjoxOWaXwHtJEt3IBNJ8gMW4EhesYXpxMN
 +T2JSfJZdEJgYJsrHKFsKgbDPOyi5BLvccBryMTFAT4YJPNR49uYTLsyvBvChsi7l0XT
 T5aFJjMfPPMFMJvPjaGIVYgDB+tMxdAtvKlm4oAquTjvsKW2ad4BV5sxI+cT1HAiWXIw
 Ed2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B4Kh1NDITKs1BsgXTfrc4uSbX7Wn0gXFPHkyLGVSe2M=;
 b=o3qT/m18gL941InUAYtq+T1nypKKVjTPq2NS4TE+K6xOTlKhYUrKKF3OgTWeQgZnb+
 EffN3QAGhKiWfeFLytSXHqtEEdmoM9x+3NKwC8wUbDMxVJwNk7OZq3Hh2c5AVRr6E6SX
 gyXq4bDwQYGp4MAH4R1M9Uyjtsup3n5wUIFr3i6iD+IDDw5KNya8nVvMxZI6J5h/IdI4
 LWiyukkoy2kFacq2JbzjATo0eV2Q3XbgTU5YjvND1NjQqGEOWYhLtStyyej1ltDyIhsq
 lcehLStOqKf77/YlBwkNYOm8xq6y2t0b33LLR004oaICzRn4dM6Xjmpofj0mTuwd5uz6
 Nxkg==
X-Gm-Message-State: AOAM531yCidJc6xuwt4Ju4f9iZDyeHgI8hpj6caXVPtqf+gdTghSd6cl
 5lYQ2XEAe09FHNXL8UV9H6bOo8rkPMs=
X-Google-Smtp-Source: ABdhPJw4rhp4qMNyb82qDBup0CJp+4qfcq2F484faJBuE+HBqrDhYVBDY88lknMnX9+haM2v4I5UJQ==
X-Received: by 2002:a6b:4f16:: with SMTP id d22mr12041624iob.15.1627245996236; 
 Sun, 25 Jul 2021 13:46:36 -0700 (PDT)
Received: from james-x399.localdomain (97-118-178-184.hlrn.qwest.net.
 [97.118.178.184])
 by smtp.gmail.com with ESMTPSA id k10sm22634591ion.38.2021.07.25.13.46.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 13:46:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 14:46:24 -0600
Message-Id: <20210725204624.1620567-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libtirpc: add missing
 !BR2_STATIC_LIBS dependency
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/libtirpc/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libtirpc/Config.in b/package/libtirpc/Config.in
index 1899edefbf..6a900c68c3 100644
--- a/package/libtirpc/Config.in
+++ b/package/libtirpc/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_LIBTIRPC
 config BR2_PACKAGE_LIBTIRPC_GSS
 	bool "gss"
 	depends on BR2_USE_MMU # libkrb5
+	depends on !BR2_STATIC_LIBS # libkrb5
 	depends on BR2_PACKAGE_LIBTIRPC
 	select BR2_PACKAGE_LIBKRB5
 	help
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
