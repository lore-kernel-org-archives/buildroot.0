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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D647BC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:22:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CE5060F48
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:22:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9CE5060F48
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D8F1406A1;
	Wed,  4 Aug 2021 01:22:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7DjKS8M5rnWO; Wed,  4 Aug 2021 01:22:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8352840664;
	Wed,  4 Aug 2021 01:22:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5D0E31BF834
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 22:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5851E83AC0
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 22:07:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iHQWlyi1yIXm for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 22:07:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 298EF83A77
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 22:07:12 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id m19so71656wms.0
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 15:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TiX4zjmbpesOdxHKuhlsdCnj6FnOBT60t6PnPWTz0Po=;
 b=ruWVe+R/GORvn9s5Gjjiff7m89aluVPWLr3OjwcgDRa4etspUI+I06Bg1FQxfLCSXf
 6B29BOTV84va8OvqQtgI3YIxKXwDqjcsyofkllcmSSnVoNmb7EgEugWIQT/cxa5RlyIs
 Te7odALDttZ2mA9a/1yseAhTgqZJfwHApfQl6jX7FkgrLiuUu8jPdVvp8+MU+5aOjV5o
 IM0l1zV7tRlmAh5ooGJJ6DLqEXYcbp3+atRWnD1LfNPh1ZdR/qLtFp5coaFZJ7E2KGHL
 EOYRYSQksKzD2QlA/K05Nq9iomLDSyRskfuJXUTctPCRZ4JNl3ZoZPYg+3U0Cqb7u3s1
 X/5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TiX4zjmbpesOdxHKuhlsdCnj6FnOBT60t6PnPWTz0Po=;
 b=hmq+JHu0UeqihOXDpnYlIZU7Y8l/CG4n4vkDEf0DHVghXHT7K2z1uOYpPTSdWANLYl
 kPYRUrJYRKa/o0lnSjjiFKIsqWjaAaseji/XqkORzVCvbnP2a1ZxqFcIEdnK3sLAwH2T
 nNCHbVKSoaptDJUTwWbQLD/24uP8LPM6xx+wGOywHtNcUS/UKxqG/tfkkRswsl57612J
 P/c0Q4b710OXyU38fWhrek/9jvx95m7/Vd3lu2okJtwV1cakiPUMKdA9XEa9fpFjbp7a
 mJAot7PwuDJB9k4jj8mhUH+GXZzl8xfCKvIInkxCHg0z7AJjEwsx1ok1FRDCt+0Tn1j5
 Z9CA==
X-Gm-Message-State: AOAM530xs9MHfOW0cWCFaV4bEWUzIbnY5KqWU+0jvVZOyVKJ5UMPgOSC
 8i1/jUgFiiF6CkRP+ylhw5k+LT7nnvgO5w==
X-Google-Smtp-Source: ABdhPJx3GeeHYi0EoqGuF+3NfAT3oKdd6kxhrjQuaA0WmrgsPxPpQzNE2EDw3X5/7nL4hbBNTkPRbA==
X-Received: by 2002:a7b:c932:: with SMTP id h18mr21808938wml.152.1628028430014; 
 Tue, 03 Aug 2021 15:07:10 -0700 (PDT)
Received: from kali.home (pop.92-184-97-75.mobile.abo.orange.fr.
 [92.184.97.75])
 by smtp.gmail.com with ESMTPSA id x15sm178156wrs.57.2021.08.03.15.07.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 15:07:09 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  4 Aug 2021 00:07:02 +0200
Message-Id: <20210803220702.366412-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xserver_xorg-server: add
 SELinux module
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Support for xserver_xorg-server is added by the services/xserver module
in the SELinux refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index c326230be0..2d276f90d5 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -9,6 +9,7 @@ XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.xz
 XSERVER_XORG_SERVER_SITE = https://xorg.freedesktop.org/archive/individual/xserver
 XSERVER_XORG_SERVER_LICENSE = MIT
 XSERVER_XORG_SERVER_LICENSE_FILES = COPYING
+XSERVER_XORG_SERVER_SELINUX_MODULES = xserver
 XSERVER_XORG_SERVER_INSTALL_STAGING = YES
 # xfont_font-util is needed only for autoreconf
 XSERVER_XORG_SERVER_AUTORECONF = YES
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
