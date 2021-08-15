Return-Path: <SRS0=DPgg=NG=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E5D6C4338F
	for <buildroot@archiver.kernel.org>; Sun, 15 Aug 2021 19:54:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D38DA61359
	for <buildroot@archiver.kernel.org>; Sun, 15 Aug 2021 19:54:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D38DA61359
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 931B9400F7;
	Sun, 15 Aug 2021 19:54:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xDExA9tpgQiR; Sun, 15 Aug 2021 19:54:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0DC5740106;
	Sun, 15 Aug 2021 19:54:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E50F11BF28D
 for <buildroot@lists.busybox.net>; Sun, 15 Aug 2021 19:53:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D46CD40332
 for <buildroot@lists.busybox.net>; Sun, 15 Aug 2021 19:53:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NxPhyR_sAQj9 for <buildroot@lists.busybox.net>;
 Sun, 15 Aug 2021 19:53:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 39E414033D
 for <buildroot@buildroot.org>; Sun, 15 Aug 2021 19:53:51 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 w21-20020a7bc1150000b02902e69ba66ce6so10318147wmi.1
 for <buildroot@buildroot.org>; Sun, 15 Aug 2021 12:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rsGxP8SYo6bY49NQ8/+UZO0aWZ8wH4anqxj85w8RG5o=;
 b=dP98x7q3Vs1LZzjEbOMljOVpgrjJEjFxskWA2r/SJL8nQTvdNEr34i0mapcBgv91PC
 GvxTA2rO74McOKtumxv8/DZRYCwi7KsxJ+gzNcXbGP6FS9q/e5kkn+A3cc0jk58x0fEX
 28cvQ2kqhoWSbJ9/3Epb6j6xBaLGqnHDTw++VB4lf84ekG3isW1BYNBvsnlX7RVgi11L
 hm+NIthYqXvD8O/Hg3T8NsuO3al6XFukKfcFyZKdyh1sKx7dxlxgEKL32Vhnk4s7dQNf
 1/GjPBy5dAARMTG5eli4DGKK05X36l9nr6Z8Ka54WqfHox2yhT3oLtZ0wxb1Gsj2zIdh
 9mcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rsGxP8SYo6bY49NQ8/+UZO0aWZ8wH4anqxj85w8RG5o=;
 b=nxacazrsWljFXZ1ZbWwZheEN7QXEMFtFdohQNCAaKIpixy5WyZ1UIwBavv1E8j3Ikv
 ZYc5EAdP8T9ssCTOe6qhhi0PkJIf1tYle8+7ALXSaYaw/tevfki5lufO5gbsDzdviSy4
 n73nMTZLGBjo39+k1rAGRYdwC98zboTgud4qJS7AVYoMJq0Oq3XFiulRjNRDQmFodL4a
 f2OcxsRJNqZD0i3PzlsQLduyiOX26oEXevmCCp0aaw1n4BfKjAN+6IMl+k4epFT6laOO
 03WpOuxweJrLJv0hSFhphObgIAtMhXL96b6NN9l+iWH/99x+sZ3ljzpKhV2ciWBDj29O
 N84A==
X-Gm-Message-State: AOAM533ZRg703f+TjIhQUQdf0k53VodT76sKG3YVOf7fWj4bGeCzqnIa
 UaHN0jPGt7bGRE+zw4LQ9mWbcmlgbOoC8vpx
X-Google-Smtp-Source: ABdhPJw8cTd0HDHCebTzQFcxwtucfX9GCZ6OQ8tDCoNWcwWaIR0cEAv3vtS4QLYZdlxhmKMNPedFgg==
X-Received: by 2002:a1c:2984:: with SMTP id p126mr11971385wmp.58.1629057229366; 
 Sun, 15 Aug 2021 12:53:49 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:1cf4:dfbd:c158:8c1c])
 by smtp.gmail.com with ESMTPSA id a11sm9431169wrq.6.2021.08.15.12.53.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Aug 2021 12:53:49 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Aug 2021 22:53:36 +0300
Message-Id: <20210815195340.12027-2-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210815195340.12027-1-asafka7@gmail.com>
References: <20210815195340.12027-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-keyring: depend comment on
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
 package/python-keyring/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-keyring/Config.in b/package/python-keyring/Config.in
index 18fad84007..f7bb1ae820 100644
--- a/package/python-keyring/Config.in
+++ b/package/python-keyring/Config.in
@@ -11,4 +11,5 @@ config BR2_PACKAGE_PYTHON_KEYRING
 	  https://pypi.python.org/pypi/keyring
 
 comment "python-keyring needs a toolchain w/ C++"
+	depends on BR2_PACKAGE_PYTHON3
 	depends on !BR2_INSTALL_LIBSTDCPP
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
