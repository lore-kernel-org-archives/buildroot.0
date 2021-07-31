Return-Path: <SRS0=zrjq=MX=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE0D4C4338F
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 20:11:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55F8A60F35
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 20:11:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 55F8A60F35
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EFEA640295;
	Sat, 31 Jul 2021 20:11:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id msX7z2fxoOyt; Sat, 31 Jul 2021 20:11:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 167724024B;
	Sat, 31 Jul 2021 20:11:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D65E11BF34F
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 20:11:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C61676078D
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 20:11:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tvPek2dJrbCT for <buildroot@lists.busybox.net>;
 Sat, 31 Jul 2021 20:11:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D392B606B6
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 20:11:47 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id j2so16077477wrx.9
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 13:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G0yMvV4dSGqAFa/htEAd8GKeT+j3AmJYde0ldnUQ0Es=;
 b=UvC/5NQeHHM6QyFMBrHRGaz640DcjT5FYljr/WfE7TrxSbFUoV6Io9ZNgdNDDjhaM7
 sutvplDwAGGFxU7UkdeqWszG/Yo/7fJrnDu6KaVuuE9W1cZ6ZoJldCbyFkJg7p8RgP0A
 +bqWM/+KyDWlxiaqR3vbuxSa0sJnWpB/r5g7vUJsix59vHWhb/NebqaFZbi2l2Z56VMv
 Ljajepf/KRLDxoFMbxtaAZaXEMeL9xaAzE7SFAMqs+7yNG5vklJ6U2ZQZ+lGOXCIj5Fu
 AcoqS7Pcuta3H+9RQtvDBJ8ArkwUtGrY1PuNIwuJoJJUD2r2KlnG11GJwhpG40iBkj55
 AbVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G0yMvV4dSGqAFa/htEAd8GKeT+j3AmJYde0ldnUQ0Es=;
 b=gLC9bflIw0GvRY51OFo/IuJlhHFVUExkKf3tfXXWoZXJ7XtvsBdfEfVAQqzq+qCMrG
 jnixHN3AVCRFgyfL+EqLVj4JpkkV+v8XnYqwX5X3j4qCctkLpQX+IIqiFucckU/HoSx5
 2lsEmNCdLH6DKdCC2E6B/xvn7eV0XjPGwfEAkt3cpVoS4nrJS+n4GgWyy0nKr5FSoalw
 nmHKNgVnQGytAOc0FfS45rkGwgrh6RU5nQHPhZtKDzKoXIDXkLsz91VT963iOvJw4NVX
 y7Fjv9E3CyUi6l7mdmS0E4lX44Lh8GSSztEaujjf4AVhA65QpPJykM7JGoJ1cnzz/7pm
 LNnw==
X-Gm-Message-State: AOAM531W+spyjs18/zZTYaJ8yXf0JqDPyocfpnnzDlMRwDAK32yCUK0F
 x/amvu3Ks3iCJ87uufCLNFI970a7w63vzA==
X-Google-Smtp-Source: ABdhPJzd5GPmnVlXbR/epyfY+T1LfaqnyfELcEtVNXgTC+g8aspGdApmAVXUQ3h6j39sAP7649ogyg==
X-Received: by 2002:adf:a40f:: with SMTP id d15mr9886308wra.70.1627762305687; 
 Sat, 31 Jul 2021 13:11:45 -0700 (PDT)
Received: from kali.home (pop.92-184-116-174.mobile.abo.orange.fr.
 [92.184.116.174])
 by smtp.gmail.com with ESMTPSA id l24sm1561632wmc.22.2021.07.31.13.11.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Jul 2021 13:11:45 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Jul 2021 22:11:37 +0200
Message-Id: <20210731201137.1236773-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gtest: drop unrecognized option
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
Cc: Michael Nosthoff <buildroot@heine.tech>, Stephan Hoffmann <sho@relinux.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

BUILD_GTEST has been dropped from gtest since version 1.8.1 and
https://github.com/google/googletest/commit/aff0379441a392d618ec87b6d55a29070e97eaf1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gtest/gtest.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
index 29c85e698f..474d127312 100644
--- a/package/gtest/gtest.mk
+++ b/package/gtest/gtest.mk
@@ -44,8 +44,6 @@ ifeq ($(BR2_STATIC_LIBS),)
 GTEST_CONF_OPTS += -DCMAKE_POSITION_INDEPENDENT_CODE=ON
 endif
 
-GTEST_CONF_OPTS += -DBUILD_GTEST=ON
-
 ifeq ($(BR2_PACKAGE_GTEST_GMOCK),y)
 GTEST_CONF_OPTS += -DBUILD_GMOCK=ON
 else
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
