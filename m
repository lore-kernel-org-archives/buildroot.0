Return-Path: <SRS0=Uqjv=MW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 649C7C4338F
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 20:43:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 079F460F48
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 20:43:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 079F460F48
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD62E83C17;
	Fri, 30 Jul 2021 20:43:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vsSIAe5PWomf; Fri, 30 Jul 2021 20:43:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F223883C02;
	Fri, 30 Jul 2021 20:43:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BB8211BF97E
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 20:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9A4F40587
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 20:43:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XhabDvIemYLk for <buildroot@lists.busybox.net>;
 Fri, 30 Jul 2021 20:43:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA8034057F
 for <buildroot@buildroot.org>; Fri, 30 Jul 2021 20:43:20 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id b7so12842412wri.8
 for <buildroot@buildroot.org>; Fri, 30 Jul 2021 13:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yS+W4rWYhIsTriKzjKnRYfziYBE9JykCE2S8ikuJsEo=;
 b=PRD6PZOy0GqNw9DkVC2jnnK7FreXSS8lHjelu8MA9TQjOiOPxfCpj6bexas3LF8RC4
 up3JLHYGSISXYh9nutf6Wgd2ia8LgavteBIGKHfBeydcKe+6w+k+TMYfLgLIm6ES2YLe
 R+ttpW/+10r43P7/CuBw0bq9oh/l7ANwUnCZCuI3h5oVCx6W/q27imDtUvswX0C48eP2
 c51Pp4li4DmwdYhJNoWtK+tykQUtTA6SPE/g43mJqZfGSv2SJZfzlt9lnIKysGOnpmK1
 OyW8v55Gt7EOw4QoE3U5j1dVb4Kb1I2RIj8dh27+HiMo01E+WyL8hXU8VIE197cGBFIA
 wi9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yS+W4rWYhIsTriKzjKnRYfziYBE9JykCE2S8ikuJsEo=;
 b=NZNgUIZskBwN0Af+44+DzdCozosiiJq70DILiK69GCeZAHGX9m5nVmVKFqiRH3M4M9
 3ya6GXzQ85gV81XtRkKFi3kWJ4bRi+qWYWVfqetNJwwx1zT4kgBKOul8elM5asTqCpLR
 uvcquBKz1YFBn6jvuLlHPv1z13Ze6zUpCFpBdoT22ncLnVIbYfOCFhNvXK7oPE6WxgEk
 ays8j+MSSBX0Ff1YXkf1bRlxPfpRjBo7fCXLfsuDezBrQVZWjOCl2wYVdIji48M3A3Cu
 nK9xjVjNFzpYWuhWeJ/YpewdH5DBLVuKF6WmrN3jpjcrXBzQ60QtdK4OtmX3QJJAVRfB
 BTfQ==
X-Gm-Message-State: AOAM5326y36vmktGgB7t6l+Edrdhk5Xz8hjSb4RVtrCfkwWYHu6zEc6G
 Ng2TxfWRHl3QnKBdsWYuTSh1mO6SFXJUOQ==
X-Google-Smtp-Source: ABdhPJwPUjmaPJShYEgPoZLTDuPpleI/gdtNc3tHjkCKOse3pWpx0fKmWB5HFVZ3T9lYppMc4KwzFA==
X-Received: by 2002:a5d:4d85:: with SMTP id b5mr4991509wru.317.1627677798302; 
 Fri, 30 Jul 2021 13:43:18 -0700 (PDT)
Received: from kali.home (pop.92-184-116-175.mobile.abo.orange.fr.
 [92.184.116.175])
 by smtp.gmail.com with ESMTPSA id j13sm2573151wms.24.2021.07.30.13.43.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 13:43:17 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 30 Jul 2021 22:43:08 +0200
Message-Id: <20210730204308.47614-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/exim: fix SELinux
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>,
 Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Build is broken since commit 6aeee4007322574083533a71c2be9a74e2faed55
because services/mta module is mandatory with exim

Fixes:
 - http://autobuild.buildroot.org/results/7032d13c4a1b5979f6737d1482a8452e26c705aa

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/exim/exim.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index bfb14dcb23..e90419a286 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -10,7 +10,7 @@ EXIM_SITE = https://ftp.exim.org/pub/exim/exim4
 EXIM_LICENSE = GPL-2.0+
 EXIM_LICENSE_FILES = LICENCE
 EXIM_CPE_ID_VENDOR = exim
-EXIM_SELINUX_MODULES = exim
+EXIM_SELINUX_MODULES = exim mta
 EXIM_DEPENDENCIES = host-berkeleydb host-pcre pcre berkeleydb host-pkgconf
 
 # Modify a variable value. It must already exist in the file, either
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
