Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A51FDC433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 11:06:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41A07831DA;
	Sun,  3 Apr 2022 11:06:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4nkfy1tUBM8R; Sun,  3 Apr 2022 11:06:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A75F831A5;
	Sun,  3 Apr 2022 11:06:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C4A451BF4E3
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 11:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C1DFA402AD
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 11:06:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3MLeYKY71RpN for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 11:06:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E1F264029A
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 11:06:44 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id u16so10420810wru.4
 for <buildroot@buildroot.org>; Sun, 03 Apr 2022 04:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YmcYALitbV1a1z+MBWC2RadV74Pf3Jbfy6TR+cOJIDY=;
 b=bzrS0pD+sB7SOzjIOOrffMGYVkLr28Ances5/ceFovRwGVke6XH8LNE+65/wvs4kSD
 Ca63Z2/2BEBClFp8HMbM3JFLaRsQwllvtnu7qwIsZpzgJk3EbtoiKkMHYnlnUJiV36KR
 feUuAxUPcZZEXkNzOArAyxcLQLDOK+Ii+ecWG09etd5KlVXLO40smcbwywdY3dTSEfkn
 VaJAjyK5e9TKeWeLvQJfvpZI2wXwuQiNKNsmp3vS5YIa7ATzvQ6822FrpNNJWOMK2sP8
 MMCB9lqbDUPf8imyO/1bdy7h4vOLyPSNwQ9VfUop5zlk8ZTOPDdz2AmsAa7VsnPOrlR2
 4Fog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YmcYALitbV1a1z+MBWC2RadV74Pf3Jbfy6TR+cOJIDY=;
 b=0IAFK+/hg0zRrV8pwec6KarAQImaBhqnDRT3a/k5QtUprjWcVH76BHx19rx4i1t7du
 HhH1u7RpJY8/yNe+flCwYovTXpxDx90gcKSrDJwc4IMIKExCy0z9A4l/Tef0/8SMUcfE
 hiNH1hj1y7PYJb4Y3sD4x2gfXMfM8RL7NYiC4UI3P4FAaX41Xn4Kp3+QqM2wgk1rB1Dn
 p1rcvHbkl4UN06oulvmWULSaZlnlhgE0J6EhkWZ8+Wzhm52CMIQfwnQKMvqiUP7Riofm
 gDCYtjkFxLe0K7B/ZFwgvDf6M3yT/s8rvl7KquH/j0BD3stRg7JjYpD4XsWJFZvjJIQB
 aiiw==
X-Gm-Message-State: AOAM531ZwTx+NmSKWAwbtRp9k2VBWKu2ZXM4LedyvYOhTnxEHsR7Ty18
 bKmUyz6rDb5YxL3gG78pi30nWkmtC1U=
X-Google-Smtp-Source: ABdhPJxJZtfQymf6TJ3BQ8A4KKaa+vt1c8iuxgZ3mOtGZj1BX6YSLJ/h0dMlf1HvsDgVLEULOwZRng==
X-Received: by 2002:a5d:5344:0:b0:206:bd8:28b2 with SMTP id
 t4-20020a5d5344000000b002060bd828b2mr2482829wrv.189.1648984002860; 
 Sun, 03 Apr 2022 04:06:42 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 n18-20020a5d6612000000b00203fbd39059sm6548259wru.42.2022.04.03.04.06.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Apr 2022 04:06:42 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Apr 2022 13:04:53 +0200
Message-Id: <20220403110455.2875846-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] package/htop: fix sensors option
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

Commit 811846df48745d58d96f6c0fbab0dec5f17d614b wrongly used
--{with,without}-sensors instead of --{dis,en}able-sensors

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/htop/htop.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index 7caa47ce13..210518da2f 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -28,10 +28,10 @@ HTOP_CONF_OPTS += --disable-capabilities
 endif
 
 ifeq ($(BR2_PACKAGE_LM_SENSORS),y)
-HTOP_CONF_OPTS += --with-sensors
+HTOP_CONF_OPTS += --enable-sensors
 HTOP_DEPENDENCIES += lm-sensors
 else
-HTOP_CONF_OPTS += --without-sensors
+HTOP_CONF_OPTS += --disable-sensors
 endif
 
 ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
