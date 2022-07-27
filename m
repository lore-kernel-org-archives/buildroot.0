Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A32E4C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 08:50:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A43781A27;
	Wed, 27 Jul 2022 08:50:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A43781A27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BGR8aVJzOFXO; Wed, 27 Jul 2022 08:50:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4AC4881992;
	Wed, 27 Jul 2022 08:50:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AC4881992
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 633B01BF59A
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 08:50:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4992C40982
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 08:50:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4992C40982
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mGSNhU-T8hR0 for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 08:50:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57FB14094B
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 57FB14094B
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 08:50:35 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id v13so15449943wru.12
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 01:50:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VYvrULQIBO6sT2gSYSOzNGWqhwTLnTyGy4YNFYnFYPA=;
 b=BKGLmIYVcAfL/MmJQMHEi0Q3Gsji63GpMzJJtg3ktSqxKKoTAPndmUIhQpHPnQfbt+
 W88NakzFrnQq5GzLYt1MBCqP+HfrfNBHo2xTQlOaSlbJ445d3//PlBAS5Mc2D4ABBnMW
 mFW2e9h6YYotzDwZVbTIlhU9GJQuLQEgePNfusYckFmHZeqODVkIesq0/0y7fAKC/X78
 TLY45dbIXmMm1y6KfVH5yr4C3dOrn4k+s37jL0XNaa/+XLx3H8Wbr8nf3k7Ra2Dl9LA9
 gm5iOluFNoNGGPP9VcBVv4fsdUvxbeSFBk3skJkuQh/cMWmeXTIJQkZ9a0S2dOwq4NFF
 cYiw==
X-Gm-Message-State: AJIora/tyUGjdNIo4zaJ9ao11JMJquk3uKgIoutGo++/BBVoVWfrWocy
 iMqBbLcfeuVNucFg4QtFd7LKLvIoXBI=
X-Google-Smtp-Source: AGRyM1ssS1ZhwWrwV+AGNKVhZlbROjtCwEp646TkemsyqrVUHJVZtiNP5WUz0jDffiFtSc65hI0law==
X-Received: by 2002:adf:fb49:0:b0:21a:3ccc:fb77 with SMTP id
 c9-20020adffb49000000b0021a3cccfb77mr12770159wrs.280.1658911832809; 
 Wed, 27 Jul 2022 01:50:32 -0700 (PDT)
Received: from kali.home (2a01cb0680494f3e376d079efd3cafb3.ipv6.abo.wanadoo.fr.
 [2a01:cb06:8049:4f3e:376d:79e:fd3c:afb3])
 by smtp.gmail.com with ESMTPSA id
 r10-20020a5d4e4a000000b0021e8cdd0c48sm7060600wrt.15.2022.07.27.01.50.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 01:50:32 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 10:50:23 +0200
Message-Id: <20220727085023.876407-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VYvrULQIBO6sT2gSYSOzNGWqhwTLnTyGy4YNFYnFYPA=;
 b=qrY+OXBVKWGarh8nWd/xhIVKHqLkorjrqPyhv2EeYYmKRxK8pCeVz1rpl2TjYdjcdb
 VsNGG7YO7jV3vGQqiCXXQW+JYl3cBSKKrliSU714e8KII3AhZnzf3TtNv0Ke87VmdvY2
 PuykIhIw8jA6UF/DFUAEcp8TqUeDjm/6BNitFjWLWBFByW6NKtNPKhDJbKcarxZNAbNA
 qaNrMbt4mnrQmSvkn6BGCSGellKzlEjHfxL+TrwZkmC2m7RORFqIXCmDtlntvuff2Wl8
 pPXpUsP8/AEvhXBQrWS6U4zRpUd+R2JYGtWDlqURr0ZvDQvYuPtQXBfzC0hx7YXkQw4J
 U63A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qrY+OXBV
Subject: [Buildroot] [PATCH 1/1] package/pulseaudio: drop ncurses dependency
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ncurses dependency was wrongly added by commit
a6d88d3ba5e30e11f4d726f341bc56c1be7c71c9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pulseaudio/pulseaudio.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index 747c09ad4a..5f6981ba0d 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -24,7 +24,6 @@ PULSEAUDIO_DEPENDENCIES = \
 	$(TARGET_NLS_DEPENDENCIES) \
 	$(if $(BR2_PACKAGE_AVAHI_DAEMON),avahi) \
 	$(if $(BR2_PACKAGE_DBUS),dbus) \
-	$(if $(BR2_PACKAGE_NCURSES),ncurses) \
 	$(if $(BR2_PACKAGE_OPENSSL),openssl) \
 	$(if $(BR2_PACKAGE_FFTW_SINGLE),fftw-single) \
 	$(if $(BR2_PACKAGE_SYSTEMD),systemd)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
