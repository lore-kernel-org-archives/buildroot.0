Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 283E0C54791
	for <buildroot@archiver.kernel.org>; Wed, 13 Mar 2024 09:15:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D12CA416C4;
	Wed, 13 Mar 2024 09:15:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eT7XsBbMfi9Q; Wed, 13 Mar 2024 09:15:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C30B416B4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C30B416B4;
	Wed, 13 Mar 2024 09:15:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 48CB01BF3DF
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 09:14:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7389D813B6
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 09:14:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jR0200Oj2h1q for <buildroot@lists.busybox.net>;
 Wed, 13 Mar 2024 09:14:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=fperrad@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A1B8A813BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1B8A813BA
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A1B8A813BA
 for <buildroot@busybox.net>; Wed, 13 Mar 2024 09:14:35 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-412e784060cso3780245e9.1
 for <buildroot@busybox.net>; Wed, 13 Mar 2024 02:14:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710321274; x=1710926074;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pkTsnBfb7sjxAy7taL75flwhhChx2MOGzOG07+L6ZFU=;
 b=Wl31BB+9qAGLqbRu5CmKBRqFNhhOt13Nv3UTGjIpfVhYK3C6PT+V76mYJex5UIlFjZ
 QL19rB5b2IwWsERLabGuyymoW9DEsTVNG2uemEG5aM76psjahCvxCLpEOkoC+ExgZZMx
 4xFa/pYJrykVZlEoeiFcXSNf4Czb3y3zc5Lif50lGZaX9kDhCsj0iOGBT76MJdC4UbdN
 IG8grlXgrzY5ZYcLtjPOOixotRakXZjtRnw+wJVx7eG7vALRvQxAyYyb/hBKKjXjCkO3
 qwBOCVpXJzqNJmBQJAb2TJY96jJ1xRYOmAwHGFaPV02EE6sfpp1LUgteuAdJdP3Fximv
 6Vqg==
X-Gm-Message-State: AOJu0YxKXbqLkP28kz5Q5LJ2CRe9TMEQjLKF9BRtWmjvuc50QJeBa28w
 3wlahozGrhxlj/1wFCM91XAC7SKD1ltRBKjadNVrA5G0OeUxlY/kSjoyAn75Mpc=
X-Google-Smtp-Source: AGHT+IFQoLxvjDmP6OX7vaRuygOlpo309//iafVNpl0n8KPOX51sxhUERAYRCZJcOdegHiCiVIRV7w==
X-Received: by 2002:a05:600c:45cd:b0:410:78fb:bed2 with SMTP id
 s13-20020a05600c45cd00b0041078fbbed2mr1587608wmo.19.1710321273920; 
 Wed, 13 Mar 2024 02:14:33 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.92]) by smtp.gmail.com with ESMTPSA id
 u1-20020a05600c138100b00412e5f32591sm1699799wmf.28.2024.03.13.02.14.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 02:14:33 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 13 Mar 2024 10:14:04 +0100
Message-Id: <20240313091412.20865-23-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240313091412.20865-1-francois.perrad@gadz.org>
References: <20240313091412.20865-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710321274; x=1710926074; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pkTsnBfb7sjxAy7taL75flwhhChx2MOGzOG07+L6ZFU=;
 b=Vv75Vv5CwB2wgSQgpkH7OJKKlIKGD5pphGlHNSQw7oxkcopI2PXdAiDKoYHG/ILdfc
 b59tE+wVKIbuSljDBWJkgbQCsXYOnAU+eJUEEk2Y9A8Rj92qw1Do/9dHchHeT6wsBrYR
 ZIxugOml4xlaOWulhkeR6LSegWyYQiN8iCHf3jVaS6IzcAqkUzQfBYeY6g1uSwwUiV+i
 yXmlYGQm1hzj+f6XcB0O80aULOoAa6FoMPuLI211D3fUTO2niQJBlGUwKLTBWgZCg62r
 D0Y8QdhlcPnOowIeetr8vOsyJIVM0BFHamCHhyhti0DhhGnRJQjWpmYOdFXPGL9/48Pq
 lgfw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Vv75Vv5C
Subject: [Buildroot] [PATCH 23/31] package/rsyslog: disable busybox syslogd
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/rsyslog/rsyslog.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index dc30a2edc..807caf5ce 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -176,4 +176,8 @@ endef
 
 RSYSLOG_POST_INSTALL_TARGET_HOOKS += RSYSLOG_INSTALL_CONF
 
+define RSYSLOG_BUSYBOX_CONFIG_FIXUPS
+	$(call KCONFIG_DISABLE_OPT,CONFIG_SYSLOGD)
+endef
+
 $(eval $(autotools-package))
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
