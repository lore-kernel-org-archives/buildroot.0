Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B67EC4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 12:29:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EF0A610A5
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 12:29:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3EF0A610A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E3753401CF;
	Sun,  1 Aug 2021 12:29:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TnUfec4YmChv; Sun,  1 Aug 2021 12:29:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E8CE840205;
	Sun,  1 Aug 2021 12:29:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8C2301BF2EF
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 12:29:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 758B0606F7
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 12:29:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tLPKNThZutjC for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 12:29:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 494BC605AC
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 12:29:21 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id h14so17974630wrx.10
 for <buildroot@buildroot.org>; Sun, 01 Aug 2021 05:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PPhd58Ed+fVWfhsWRdfjn/+zp3E7NzFIwpp6VB9JaII=;
 b=cpKlAFSN0GSYwYdqtYFzTTsx8v02oE5q8zeFV3xSVqaxhAmZhTSHHHi68PLs+/oDYj
 bBBgnDbEVkjnaZtWAfJWXPOZu0O1M05TtX6PQPJpG6fHVEdBlVqClzSwTeKuFV7DN901
 tasER1U2p00txGtLMyGXhucNlTBBPY3yWtR7qt/n2qKXgwaMRDxbaquzxYBRwjSoMEXP
 2QodZADcCj4rSxY1jW0Q8kvf+HgsHt9CtX9OBDqeD3JkshGg2hN8VNWrkv299xf+4d5/
 BdGbt0ohTwmIrrqUzrAqytKBVRppKctzKcnejQ/AmbqH06rdoEYwBETrlxYE1D9J1OSl
 3tqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PPhd58Ed+fVWfhsWRdfjn/+zp3E7NzFIwpp6VB9JaII=;
 b=N62Un8zoC0KxpfuK49H0Yx18GogNeUDumBq6uBuEOgEHFzoKCsx8AqwPQMIvGWYcmv
 Nl+qbiLdYgf6DMf7v/UhDMcXYDOP81sS69tp/x0EOHmF/KQcye5gchfsa5pztIl5/aZz
 4ErYWP5rsPJjO5tU63BwbiDrtZaCXwW8+wR2YhLvG1Mf5L0A2QRGAcTnFOe6n2MIQT3Q
 6nG561vbcQC16pZZEl9qQo+6jF+1SqorDkdUD3/CMm5vYfqh8Es4A9/Yyl9fbuoYQJy/
 5HqHmColBI4ck6VqXg3PztzwtykHV9NLNa+Ev/LGhbAMKveWlqF58hJ0ekQMiSUaYKqJ
 by6Q==
X-Gm-Message-State: AOAM533Eu1e0/7BSnHUNXjLOUnYeXbA6obN++G1uKgqweXKBC8r5vXc7
 xYyckxfLmp9jlbFblMhzcjyRYbVcfRvFwA==
X-Google-Smtp-Source: ABdhPJwqL31FzpTbFN+aBN4nOPo+5W26dp9RNbDuQj99tvqPkLM+Nyusn6rrriG67PMd1NGyp6Ch9Q==
X-Received: by 2002:a5d:5985:: with SMTP id n5mr12976682wri.63.1627820959198; 
 Sun, 01 Aug 2021 05:29:19 -0700 (PDT)
Received: from kali.home (pop.92-184-116-62.mobile.abo.orange.fr.
 [92.184.116.62])
 by smtp.gmail.com with ESMTPSA id k17sm7914902wrw.53.2021.08.01.05.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 05:29:18 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Aug 2021 14:29:09 +0200
Message-Id: <20210801122909.3074515-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/openzwave: fix build with gcc 11
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Set DEBUG_FLAGS and RELEASE_FLAGS to an empty value to remove -Werror
and fix the following build failure with gcc 11:

/tmp/instance-5/output-1/build/openzwave-62444b0f979c337d2091d77d89cf63c2ae9775cf/cpp/src/command_classes/AssociationCommandConfiguration.cpp: In member function 'virtual bool OpenZWave::Internal::CC::AssociationCommandConfiguration::HandleMsg(const uint8*, uint32, uint32)':
/tmp/instance-5/output-1/build/openzwave-62444b0f979c337d2091d77d89cf63c2ae9775cf/cpp/src/command_classes/AssociationCommandConfiguration.cpp:191:85: error: 'this' pointer is null [-Werror=nonnull]
  191 |                                                                 group->ClearCommands(nodeIdx);
      |                                                                 ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/05ad5cc1f593704ef032f3c5278695247450b94b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/openzwave/openzwave.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/openzwave/openzwave.mk b/package/openzwave/openzwave.mk
index 357d19f32e..9c28c0a13b 100644
--- a/package/openzwave/openzwave.mk
+++ b/package/openzwave/openzwave.mk
@@ -23,6 +23,7 @@ OPENZWAVE_INSTALL_STAGING = YES
 # the correct directory otherwise openzwave will install configuration files in
 # $(PREFIX)/etc/openzwave.
 # Disable doxygen documentation.
+# Set {DEBUG,RELEASE}_CFLAGS to an empty value to remove -Werror.
 OPENZWAVE_MAKE_OPTS = \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
 	PREFIX=/usr \
@@ -30,6 +31,8 @@ OPENZWAVE_MAKE_OPTS = \
 	pkgconfigdir=/usr/lib/pkgconfig \
 	sysconfdir=/etc/openzwave \
 	DOXYGEN= \
+	DEBUG_CFLAGS= \
+	RELEASE_CFLAGS= \
 	USE_BI_TXML=0
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
