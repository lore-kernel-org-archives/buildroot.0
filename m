Return-Path: <SRS0=3r6m=NL=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 911F6C4338F
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 10:18:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 484E661037
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 10:18:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 484E661037
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA07E80E1A;
	Fri, 20 Aug 2021 10:18:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xybokCdXu_Yt; Fri, 20 Aug 2021 10:18:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45B6280E53;
	Fri, 20 Aug 2021 10:18:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 228221BF39D
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 10:17:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BDA280E53
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 10:17:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y39DZAXuIFZs for <buildroot@lists.busybox.net>;
 Fri, 20 Aug 2021 10:17:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C22B180E1A
 for <buildroot@buildroot.org>; Fri, 20 Aug 2021 10:17:54 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 x2-20020a1c7c02000000b002e6f1f69a1eso8712985wmc.5
 for <buildroot@buildroot.org>; Fri, 20 Aug 2021 03:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K8DPb9BUB9x9MuSyMRLozL3OeQcKqvKd7Tqr71MgQhI=;
 b=aEncyyxr/bg3/z9q3KdnPSTSx9f1i+rQALIA9gVuQ7bMDxjMUrLvs3rqXvhfTKiqIq
 2DhYZYM0M94yNwQaywXk/tRVFuz2LY8F1yYrfAaNyHXgDSiRyuR2VEl6nSk8zrDWiHdI
 BbFiK5XtRDU6AOGcu1fCr6JeIWQnq8SHorbw/UtTbQAZdwiltacOQj/whkr+Q8L5zU3S
 //xeQgKtvQIPlYRxpfiaLTrTWGqy3Qen8vc2BnUuC7wvXl/GYqyLWfBclf+9OuvXRXE6
 L+SHj9ZkM0RCDOeF9XluT7KGAx2VVJUlHWDeMJOdpdVQDldO7dfSaJvFE7by+dCP95BJ
 rEYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K8DPb9BUB9x9MuSyMRLozL3OeQcKqvKd7Tqr71MgQhI=;
 b=BiZARmxx2ld2VWa0nv382oBdvgvz6llP9olDGb+07lXtiy2uRSrBHCKQSOpokF38r8
 TQWfs3YgvPwFxF1gWNPVjBOId5Ln6VSeSraAyb30NzsA8sKaKd3k7e1Jg1d/1fI7Q0z9
 ps5BE72NmPofIxLTY9C8poIJ3EF86/fUe1/4Kb6UXetxhmUojqRkyxviDjtbcgHf+PTV
 ldrQiSbu3Ouz6abOqXdaPFWmz6x9jJPkVmYC+dEDjnsMawPbf0kkviI/QzhnFqwnqkqk
 qlfg5lfofbiFgn69NabRNyO2Rt6w/fqgnQsMOlos5r7Ny0YSsyIngM1Cw3vxlTAU4JmK
 Cqzg==
X-Gm-Message-State: AOAM533HEBbOMPiwXE8gMVzqWjap6piIvcf8+p9LuTkZEbPrv51y5nnL
 nDyRelJHVnWiUySRzA7QtFQaeKAXzy1iSw==
X-Google-Smtp-Source: ABdhPJx/BKs1JGrYWKTOYPx9QT3lEZHPn0O+ecQa0Zjd8IZ9W+sk5MJ43YL+qqw7Qu+NgzJegRhkAw==
X-Received: by 2002:a05:600c:4a29:: with SMTP id
 c41mr3054135wmp.86.1629454673076; 
 Fri, 20 Aug 2021 03:17:53 -0700 (PDT)
Received: from smartron.lan (amontsouris-559-1-16-245.w90-24.abo.wanadoo.fr.
 [90.24.143.245])
 by smtp.gmail.com with ESMTPSA id l19sm4909467wmi.4.2021.08.20.03.17.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 03:17:52 -0700 (PDT)
From: Titouan Christophe <titouanchristophe@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 20 Aug 2021 12:17:47 +0200
Message-Id: <20210820101747.193382-1-titouanchristophe@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libvirt: fix syntax error in
 Config.in
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
Cc: Titouan Christophe <titouanchristophe@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

The typo was introduced in 6aa318d91e66731d66dca485c4c30391fe0e2423

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
---
 package/libvirt/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libvirt/Config.in b/package/libvirt/Config.in
index 9308d2a6ac..8c3021242a 100644
--- a/package/libvirt/Config.in
+++ b/package/libvirt/Config.in
@@ -9,7 +9,7 @@ comment "libvirt needs udev /dev management, a toolchain w/ threads, dynamic lib
 	depends on BR2_PACKAGE_LIBVIRT_ARCH_SUPPORTS
 	depends on !BR2_PACKAGE_HAS_UDEV || BR2_STATIC_LIBS || !BR2_USE_MMU || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
-		!(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 &&
+		!(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 && \
 		  (BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11 || !BR2_aarch64))
 
 config BR2_PACKAGE_LIBVIRT
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
