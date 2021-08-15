Return-Path: <SRS0=DPgg=NG=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74CAAC4338F
	for <buildroot@archiver.kernel.org>; Sun, 15 Aug 2021 19:54:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D7D46135F
	for <buildroot@archiver.kernel.org>; Sun, 15 Aug 2021 19:54:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2D7D46135F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07ABF4034B;
	Sun, 15 Aug 2021 19:54:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZNwqwUpg9GQ4; Sun, 15 Aug 2021 19:54:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B853B40370;
	Sun, 15 Aug 2021 19:54:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3B9F51BF28D
 for <buildroot@lists.busybox.net>; Sun, 15 Aug 2021 19:53:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A26240106
 for <buildroot@lists.busybox.net>; Sun, 15 Aug 2021 19:53:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rQyxQirFi7ez for <buildroot@lists.busybox.net>;
 Sun, 15 Aug 2021 19:53:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B8013400F7
 for <buildroot@buildroot.org>; Sun, 15 Aug 2021 19:53:52 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id r7so20814389wrs.0
 for <buildroot@buildroot.org>; Sun, 15 Aug 2021 12:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H57WLiSEgF1PRvOeW6J+ej+vITobSW1OV6+C2eNEc5g=;
 b=U6+xvPPctT07HI/2taFvG2IcGWec5LiEgfYzmARaE94Z/MlP2PKyvjvjnXmxigYlac
 C+O4N3yNcaLompsXPgSKOeNiLx+uao3KS40amDbTsIkGRZ8Wv1Y1H8btD+rorvtJ7HGu
 zHaW0SDeqhtRbl3GcNR8cXMACEtngQaZCHjfGCvL+4A6KqddDIwVlsXgd2vcOSHU+cm2
 9vkbzddhxcKfeJJEzNRsGylwzhmZD/a58PLMWlaB08DMC971QM0li2qrwcYf+14l7zt5
 fStYjJSfdQyVGJxIl1Jp1c8ELFs5CCP1aLsf7hfZAIwOYcd5vFIjZQ1EjAyv/Hv5Wwgq
 eNrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H57WLiSEgF1PRvOeW6J+ej+vITobSW1OV6+C2eNEc5g=;
 b=e3QtIo5XOOq5hsjnAVoQi/hlS4MgmSgorko1mYbTJ19K/2fnyzrKGK+2Nkx05GIdVB
 jfDZ7UZV0sEPizoE8eI+CxLTB1ajr74SY3FyWonhgJWfAtOiv8U7adekDgmcD810Jt7T
 4cIrUElqgW2EhZY6URccT//5cjH9sY5LIOtcQoumvtG69JBQAXIAGtF0aTPJNQdypkmm
 BUavk1zwGrXwrf+ECkajF+q97yRxmnvBGUum5CUJCfj4wmmlgVIatQt3xlVTheSz7Xz8
 pe90LaUHCNc8wXwt4qeMtX0vT7V+UYNC7v2dz0IVR+RhLUubvEM6glaU3tL3gtuIbXdl
 mTpg==
X-Gm-Message-State: AOAM532dVJMPwzfPFG1yDOJdBvDgOBpyX7QwQRb+TVillrszUjiX3vqw
 +SSTTYcfFgM+2USzrU5MoeAus6HrSLSZMqLE
X-Google-Smtp-Source: ABdhPJxi51RmeSjlA0qYSou9GoJOeGEPzknQCL3Jbxk0e+IHDVMqie+hZNB/i88YOttM8Ne+TgWQOA==
X-Received: by 2002:adf:f403:: with SMTP id g3mr14885290wro.222.1629057230706; 
 Sun, 15 Aug 2021 12:53:50 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:1cf4:dfbd:c158:8c1c])
 by smtp.gmail.com with ESMTPSA id a11sm9431169wrq.6.2021.08.15.12.53.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Aug 2021 12:53:50 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Aug 2021 22:53:37 +0300
Message-Id: <20210815195340.12027-3-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210815195340.12027-1-asafka7@gmail.com>
References: <20210815195340.12027-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-pyopenssl: depend comment on
 BR2_PACKAGE_PYTHON3
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

The user shouldn't view the comment on the python2 menu.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-pyopenssl/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-pyopenssl/Config.in b/package/python-pyopenssl/Config.in
index 95630f2461..99ea4e9408 100644
--- a/package/python-pyopenssl/Config.in
+++ b/package/python-pyopenssl/Config.in
@@ -10,4 +10,5 @@ config BR2_PACKAGE_PYTHON_PYOPENSSL
 	  https://github.com/pyca/pyopenssl
 
 comment "python-pyopenssl needs a toolchain w/ C++"
+	depends on BR2_PACKAGE_PYTHON3
 	depends on !BR2_INSTALL_LIBSTDCPP
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
