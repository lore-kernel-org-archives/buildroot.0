Return-Path: <SRS0=j1wI=N3=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A78F4C433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 19:27:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BB4460F9D
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 19:27:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4BB4460F9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19C7480F23;
	Sun,  5 Sep 2021 19:27:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lh5JjuUYExbG; Sun,  5 Sep 2021 19:27:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72AE880F19;
	Sun,  5 Sep 2021 19:27:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6631C1BF403
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 19:26:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 554F440433
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 19:26:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Tji-FAAu-yL for <buildroot@lists.busybox.net>;
 Sun,  5 Sep 2021 19:26:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 691754042F
 for <buildroot@buildroot.org>; Sun,  5 Sep 2021 19:26:56 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id g135so3068763wme.5
 for <buildroot@buildroot.org>; Sun, 05 Sep 2021 12:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lEoLQy1RuX1YvsKm6ekhCUCUVk9MGHWmRrGFR0BnAdU=;
 b=chpQ9lAsXT75oM+AFzvQFbK+CS9w4llivwmdS46KRsXhWxuafQUKmookMwvjI+Topj
 yYlPA7bgD0LEDv78A2d8m01PJpOvaQBvCJLWVyO4FC4B/6+gYEsczeyx/Sylemz69bqs
 CTGQkRAHqVRl4CQdZwvMLgCetwPyfmYMp3w9nbK0rCG/dJfJ9cKxjKV0kUY67ltEcIiR
 LXu+6GS7QjX3FrtGR1F3LvTqx1f1mw7lYf0NLlEd5Chv7bYoz3FX8cJl5TikkXsdQXe5
 qKHCvFvCYKBFsgFWIi3d9fWAgZ4VwUE+0gsNBAGZyqgPtoHmSzpgDBsmFgtEQFG08bz/
 a8CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lEoLQy1RuX1YvsKm6ekhCUCUVk9MGHWmRrGFR0BnAdU=;
 b=kI96gIK5gsFImOCkDz7K6zOMjRPee0cGL9M72bPk5gnb4+Mx4VX7DPP31nptZDpFgy
 vY4GaPVQ7gk9VNOsaQUP80XtQmQ7wMHAYr5B0sTrT/8bDubExhzbbz5vmLOMru8AfQ0C
 SMa5ZUoIenT2HPnEiikEvPuU3FffOXx1oJUM/OUTfd23sE2bvHTqanKYMKL0Mr07dveU
 amd67ZXuWsHH+6DzhXHTO01R82FTUHuuu1e6BEBb6MSyvGfn3kQZ3oWuTwtfcUXesBJc
 GyfgbqzFuCgSjiqbmtiNptgI4HWz2BzZinSulZhVfj2Z1H2U9eKVnR5SrmI6mWn5X4/A
 l0gg==
X-Gm-Message-State: AOAM533SkWC0sqB8vG/LHISmXOh6RWpZYZIbqu9JJKsghw4tesPxz9eR
 K4aokIfQZc7Goqa+cJaWz9PA7qd9b8VBbQ==
X-Google-Smtp-Source: ABdhPJzSyVilSUMK+p8vIWQF4Qs5xjJfzi1XZM8OFIcoyVMBqKN1MUNPH6GtC262+TbXa7NSD9+73A==
X-Received: by 2002:a1c:98d5:: with SMTP id a204mr8371637wme.52.1630870014302; 
 Sun, 05 Sep 2021 12:26:54 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id u26sm5913040wrd.32.2021.09.05.12.26.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Sep 2021 12:26:53 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Sep 2021 21:26:48 +0200
Message-Id: <20210905192648.1378685-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libiio: fix python build
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Paul Cercueil <paul@crapouillou.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

python bindings needs setuptools since bump to version 0.23 in commit
50b6d7d69f880e940d7c281c493a6a6694d6ebe3 and
https://github.com/analogdevicesinc/libiio/commit/21023a538b125dee966bf496dcad019ee20967bd

Fixes:
 - http://autobuild.buildroot.org/results/a26cce9760c75c44ebdcf21dfb4a69aad5702de4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libiio/libiio.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libiio/libiio.mk b/package/libiio/libiio.mk
index aec251e9a1..8c2e126592 100644
--- a/package/libiio/libiio.mk
+++ b/package/libiio/libiio.mk
@@ -71,9 +71,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBIIO_BINDINGS_PYTHON),y)
 ifeq ($(BR2_PACKAGE_PYTHON),y)
-LIBIIO_DEPENDENCIES += python
+LIBIIO_DEPENDENCIES += host-python-setuptools python
 else ifeq ($(BR2_PACKAGE_PYTHON3),y)
-LIBIIO_DEPENDENCIES += python3
+LIBIIO_DEPENDENCIES += host-python3-setuptools python3
 endif
 LIBIIO_CONF_OPTS += -DPYTHON_BINDINGS=ON
 else
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
