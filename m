Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4B86C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 10:28:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB85C60F35
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 10:28:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EB85C60F35
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF5084011B;
	Wed,  4 Aug 2021 10:28:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rpW85L2w5iUj; Wed,  4 Aug 2021 10:28:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF71540241;
	Wed,  4 Aug 2021 10:28:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4A4601BF418
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 10:28:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 472B683B6C
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 10:28:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ekdc0rvJYngx for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 10:28:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8002183B5D
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 10:28:04 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 e25-20020a05600c4b99b0290253418ba0fbso1153314wmp.1
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 03:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VbGSoy3qPMbr31e79kGHDNt4FaG1yS1gfwnphJsE0yg=;
 b=RJ6SEAaDntEQMrKjZaW+jsw++nKSLOcgDTgZSV6uO+W6WK+oEz3Yqlq4Xh4gvUriuU
 HVx2W3v4qz6lNOOM28c2HqUqaiCZeUnkeKAC4BQdTXr4MdxIGCGkZpbNmRs9dJNipdgl
 BVAUZxpSD6eVjsN7zCX8U3AoGIfqJ6NlSYHXjBF570O3Ho+bsU5TK/3I/mN36R3ODkMp
 KM9WL05ldgr4u3uncsHCKHIIMo2UkS398CNmSb0Nr0SG1FzeG7+LwQlJtEvcB5AmHfUt
 OcuTrwDJjVA2raDcWu2Lfo/HJ7BcJaiDH3zhavCdauFvxxT7+peZpEgE8Q2okgYcXHcs
 COKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VbGSoy3qPMbr31e79kGHDNt4FaG1yS1gfwnphJsE0yg=;
 b=UAu2001B+xCfbcsH7Fc3Pcn95A6vW5jOyU7exjhnCis31qdWohaI+fC6sML7rJFt7H
 +47Dr/0AXuWopEREoLxHjl+06SLgWYKTD9TrsYXNneBRsT0A7vJPkpPoGf2SCzy2ps5G
 h8UH9gAKLKiVuZHufDUWFI0kOxqHycaNzWEl0ksFT3yZIumSNAfDtRJllUsm6CF7Z2CR
 jwGp12IDun6aaPKgwZVMUwS6pgO5Gcde0yZFRsOfV4CQpaw20hy1+4mw+buweakQ/pp5
 eTsCaKiApWaWSFal6ujvQ0C7bLqpfMkqa9yrWnbp3kYavItZkRQhECQrafBLqI68Y1iC
 Fstg==
X-Gm-Message-State: AOAM530C0KbmvCxfyaWykloJmMlRTweEZUhmMRe2dFoqFvFG4hjZgUN5
 UPcaiG4aXPTe9TEhDa2eVB3cGyq04+EmJQ==
X-Google-Smtp-Source: ABdhPJwYS/w+peVjONoHe24L+4Y20VKC4zZ1qODxG4CPZ/sfY3ToS85yh9K4epSPHjipr1BBduXhTQ==
X-Received: by 2002:a7b:c749:: with SMTP id w9mr26659807wmk.98.1628072882530; 
 Wed, 04 Aug 2021 03:28:02 -0700 (PDT)
Received: from kali.home (pop.92-184-97-247.mobile.abo.orange.fr.
 [92.184.97.247])
 by smtp.gmail.com with ESMTPSA id n18sm2076512wrt.78.2021.08.04.03.28.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 03:28:02 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  4 Aug 2021 12:27:55 +0200
Message-Id: <20210804102755.934422-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/sigrok-cli: add SELinux module
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
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Support for sigrok-cli is added by the apss/sigrok module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sigrok-cli/sigrok-cli.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sigrok-cli/sigrok-cli.mk b/package/sigrok-cli/sigrok-cli.mk
index 3d1e187882..2c960fdf4f 100644
--- a/package/sigrok-cli/sigrok-cli.mk
+++ b/package/sigrok-cli/sigrok-cli.mk
@@ -8,6 +8,7 @@ SIGROK_CLI_VERSION = 0.7.1
 SIGROK_CLI_SITE = http://sigrok.org/download/source/sigrok-cli
 SIGROK_CLI_LICENSE = GPL-3.0+
 SIGROK_CLI_LICENSE_FILES = COPYING
+SIGROK_CLI_SELINUX_MODULES = sigrok
 SIGROK_CLI_DEPENDENCIES = host-pkgconf libsigrok
 
 ifeq ($(BR2_PACKAGE_LIBSIGROKDECODE),y)
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
