Return-Path: <SRS0=UKoJ=OW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7622BC433F5
	for <buildroot@archiver.kernel.org>; Sat,  2 Oct 2021 21:36:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C002D619F8
	for <buildroot@archiver.kernel.org>; Sat,  2 Oct 2021 21:36:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C002D619F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 61E5D40205;
	Sat,  2 Oct 2021 21:36:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5-q2gnamjl0K; Sat,  2 Oct 2021 21:36:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2CD0F40207;
	Sat,  2 Oct 2021 21:36:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AD0021BF312
 for <buildroot@lists.busybox.net>; Sat,  2 Oct 2021 21:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9BCD440207
 for <buildroot@lists.busybox.net>; Sat,  2 Oct 2021 21:36:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CVtKh7yR_Y_a for <buildroot@lists.busybox.net>;
 Sat,  2 Oct 2021 21:36:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D721E401E9
 for <buildroot@buildroot.org>; Sat,  2 Oct 2021 21:36:12 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id d11so14278543ilc.8
 for <buildroot@buildroot.org>; Sat, 02 Oct 2021 14:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m+XjCiO25o1cGteWBp6bTCaACdSzPJKPijcFgfz/RRg=;
 b=by1w8JeK5MbMkPoGz74WHPy1Qn1VHiUOZ/aBiAiYZwLE886cWvBjYPWVp1Q46p1OwC
 R9OFgaeJ4xLNL1kSc9WcoLq6YeRaRS21y/SVv36nEUlwyULGUfnrX488GYJa9nIrC0Gs
 MRyMln8yvoYbHeRxkuBnTUB4Sw4qLRGJdjzAAdFGViSWtUUbR55JmAERRqIBf/117/Qi
 7Zth2jnNiqkpSfqIz+eHouGbuF9HyeW2rYZMopiI1kFZR/iSrZkfES/Qrf8E3WHicxhL
 4H9NPfzy2vTqhRGsJteH1Tf6j6jAYKuO9Z2Iu/LuG4sOp/ASv/piw9q3DL1UZ4VCN3s+
 AJ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m+XjCiO25o1cGteWBp6bTCaACdSzPJKPijcFgfz/RRg=;
 b=CQnLMpCXUmBk+RX8oKCrklctJSO2fM1hfRfaks3kyQYZ7aAfI2bVIIAK5KL9CEkrIP
 OQIg6RDNcVJ1Fp2Dx6tQE5tHutkEFt30N15dX5PTOHozwT5JURRzkTWkstTHhXw+BDml
 RZvfRzzmLqs8Hr108IRyCzu14yosJBhJyEhq714aHHkNIConmmaxX0uqTUoKXRQYmys9
 +dhbDBH9q5EhvNzRh3Cu7+hjJ8UnPFuy+9EYlvAQdjVii2ePQNYIiAPAi+wDARZCTMgs
 IIPFYVsxXCAOCAowYB+1ig92LVXowLx50ADN0Mfu7UQQVMae+oWzVH+qqEzefbxOF7gZ
 Fshw==
X-Gm-Message-State: AOAM5333pAKMFZuSixwnbuR9WsBSJIGvo6M6NsLtHfwiMFqaLjg+Qu5u
 8nKAqPDiDk4xjkra83MTNBoRFpLNN6g=
X-Google-Smtp-Source: ABdhPJx+gZUaShe4N4qTPwbQLpPe+gLEaVkIF0g+Dox1xlNcauoPqozXZ2MuHzwJafJbj9Q+dz4vmA==
X-Received: by 2002:a05:6e02:188b:: with SMTP id
 o11mr3969417ilu.9.1633210571811; 
 Sat, 02 Oct 2021 14:36:11 -0700 (PDT)
Received: from james-x399.localdomain (97-118-169-148.hlrn.qwest.net.
 [97.118.169.148])
 by smtp.gmail.com with ESMTPSA id s23sm5879278ioe.39.2021.10.02.14.36.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Oct 2021 14:36:11 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  2 Oct 2021 15:35:56 -0600
Message-Id: <20211002213556.3969021-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pipewire: depend on ncurses when
 available
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

If ncursesw is enabled depend on ncurses so that pw-top is built.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/pipewire/pipewire.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index d6cbe1605f..b88f129055 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -101,6 +101,10 @@ else
 PIPEWIRE_CONF_OPTS += -Dffmpeg=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
+PIPEWIRE_DEPENDENCIES += ncurses
+endif
+
 ifeq ($(BR2_PACKAGE_PIPEWIRE_V4L2),y)
 PIPEWIRE_CONF_OPTS += -Dv4l2=enabled
 else
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
