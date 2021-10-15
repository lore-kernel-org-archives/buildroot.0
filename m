Return-Path: <SRS0=lKTV=PD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2988C433F5
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 20:08:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3823C61184
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 20:08:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3823C61184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0CA480BAE;
	Fri, 15 Oct 2021 20:08:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q-h0xn1OH73q; Fri, 15 Oct 2021 20:08:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5122C80AFE;
	Fri, 15 Oct 2021 20:08:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 60C0C1BF2CC
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 20:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5CA0660668
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 20:08:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BHf-U6i-OJBQ for <buildroot@lists.busybox.net>;
 Fri, 15 Oct 2021 20:08:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B46C2605A7
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 20:08:51 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id e12so28348301wra.4
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 13:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C5XGJh4Sxkoqt3K6DT2dn5lILJv0zNCRKVuENfO8OiU=;
 b=iLNv8GEc3yad6trzZXRfZkoHFfaReythlfEu+m5jj42otruKfMQ+o+HDa6S9nrHDaM
 a2Y0Q/rRQHa52S1vs53QVadkegPYDbBY5kjiWnVqeewaBKDDyC2IlolQXrhDz+7xMtXQ
 hknZP8veK1fWgdlLCv/dIQEN/vIrz/MtGHzW3zZau0LZVuwG0C2lupdjj2YhjXtr5EQ3
 +PUqWeNTgSObGAP8Xe1HUpjh60Z5vNQdE2lmblc/TH/sGwIIIV/eK0aS9XzFtdamWx6+
 HpqBzyU0aGA9bJjQRxEQQQ+Iqy0mZYNgfwELW7ocNuo+EA/G9113CaEywq1tAMaIanuC
 68tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C5XGJh4Sxkoqt3K6DT2dn5lILJv0zNCRKVuENfO8OiU=;
 b=rkzJ806vQmVfG9ErZPi8LZozirk+l1GV/NVYyutQd85R93BwMaKR1K04ZzpPzZqUSC
 6pdjpR0E4+3BbqH85Z6L0rHiEyKY2KVaP6KDl5K9nNG4NE0pfPMBlgD0u7yHFV5uG3AM
 zDzwUPm9nCKf7OUAIrF85iLw3HvkTg0YOOtjbhlD5txQ7CHYsUcOU1zaURKCkHmDz7A1
 nivEzdOBTk0t226oB57zdE0j5Q37V0MonHqwshh6uJteK0o+NVHWNUwlXJ9gkVoljpVe
 FvOr6Y5iJTGZU5bLhZ2p1owUjbYnAAYYX638S1aeihH6q1cHfoN7IxcXjHkrJ9HqsHNU
 FSpw==
X-Gm-Message-State: AOAM5329gZgAQY9vK+kIwSlBFgpAIPqpw9ucJiv3uCpeBTzPeB8uegPr
 Ve9HWNWnzynJyQGIcNl23l1DtbyS7IM=
X-Google-Smtp-Source: ABdhPJwzFfmoT6yWhrLd0CuYEkWUG6dGgkPfKy30woE9DyjqQohyGvRdt6EUmxziGwvyKLrrfVoHTQ==
X-Received: by 2002:adf:a413:: with SMTP id d19mr17193033wra.246.1634328529537; 
 Fri, 15 Oct 2021 13:08:49 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id z79sm5528537wmc.17.2021.10.15.13.08.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 13:08:48 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 15 Oct 2021 22:07:41 +0200
Message-Id: <20211015200741.1648668-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/cryptsetup: bump to version 2.3.6
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Stable bug-fix release with minor extensions.

All users of cryptsetup 2.x and later should upgrade to this version.

https://gitlab.com/cryptsetup/cryptsetup/-/blob/v2.3.6/docs/v2.3.5-ReleaseNotes
https://gitlab.com/cryptsetup/cryptsetup/-/blob/v2.3.6/docs/v2.3.6-ReleaseNotes

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cryptsetup/cryptsetup.hash | 2 +-
 package/cryptsetup/cryptsetup.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cryptsetup/cryptsetup.hash b/package/cryptsetup/cryptsetup.hash
index 3b58345611..0aa3f79df7 100644
--- a/package/cryptsetup/cryptsetup.hash
+++ b/package/cryptsetup/cryptsetup.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/utils/cryptsetup/v2.3/sha256sums.asc
-sha256  9d16eebb96b53b514778e813019b8dd15fea9fec5aafde9fae5febf59df83773  cryptsetup-2.3.4.tar.xz
+sha256  b296b7a21ea576c2b180611ccb19d06aec8dddaedf7c704b0c6a81210c25635f  cryptsetup-2.3.6.tar.xz
 sha256  45670cce8b6a0ddd66c8016cd8ccef6cd71f35717cbacc7f1e895b3855207b33  COPYING
 sha256  8c33cc37871654ec7ed87e6fbb896c8cf33ef5ef05b1611a5aed857596ffafa5  COPYING.LGPL
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index b816dc2f22..3cf6c8a301 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CRYPTSETUP_VERSION_MAJOR = 2.3
-CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).4
+CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).6
 CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
 CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
 CRYPTSETUP_DEPENDENCIES = \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
