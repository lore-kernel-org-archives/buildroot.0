Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18EBDC54791
	for <buildroot@archiver.kernel.org>; Wed, 13 Mar 2024 09:15:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D78FC41563;
	Wed, 13 Mar 2024 09:15:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U0fCU4ZY37EF; Wed, 13 Mar 2024 09:15:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5AD6F416EA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5AD6F416EA;
	Wed, 13 Mar 2024 09:15:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E841B1BF3DF
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 09:14:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4911481380
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 09:14:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Es_cjKI23PT for <buildroot@lists.busybox.net>;
 Wed, 13 Mar 2024 09:14:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com;
 envelope-from=fperrad@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9B9F9813F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B9F9813F2
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9B9F9813F2
 for <buildroot@busybox.net>; Wed, 13 Mar 2024 09:14:38 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2d204e102a9so11046141fa.0
 for <buildroot@busybox.net>; Wed, 13 Mar 2024 02:14:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710321276; x=1710926076;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EpO4eWUFxSBu2tturLGhSgdaO98zyKDbrZQELf1p7U0=;
 b=AxBBVrKQc9s8VWnOYcFaGV+LNJRt3kwhgJ1Vs6IAkmWpxz+FHdEGbl6ih4KqsS7CCK
 UGfWFFfzKXgUpkERwOk/Rn35RSr9PgaYD2lEI/rSQHKhQZAAp5dq3AK3WsYR3RfjKPLR
 MGlN2xs8blot+OizBnobg6Z1iJzRHgNifhij7UhGWJ0doqRNP+9CG5b38d3jZhl+UdHC
 GH6pDcH9YjYV8sDbq6RyEuhm24lfe7c+whkDumZqw4Dt1xiIboBuUY9W5O0xRnYVyqup
 6aITyLKx6/HW0d1xURTfCEeq2SZ3IdYxbjKTUCcvgtX/lHWIe+iqsMkcsgEsZ67odJUg
 bmFg==
X-Gm-Message-State: AOJu0YyK5FJRhvMU2hrx2x5HHi0ngWMctRJBDMtiH7kGqpwptZ48ipv7
 NIwUNXz6drJCK5Bij9wIobNPtGhj3RcKVDhftWspcdG8qMRIqppmSo0d2s6C+CI=
X-Google-Smtp-Source: AGHT+IF2HggnsxgSK23IwxuwIU1ODE5WxJZ9viMZnPDfUBKTNAOEpdjaqLOH4Vp/jiTafttpVVcKaA==
X-Received: by 2002:a2e:3210:0:b0:2d2:9a8b:f45e with SMTP id
 y16-20020a2e3210000000b002d29a8bf45emr1829806ljy.14.1710321276416; 
 Wed, 13 Mar 2024 02:14:36 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.92]) by smtp.gmail.com with ESMTPSA id
 u1-20020a05600c138100b00412e5f32591sm1699799wmf.28.2024.03.13.02.14.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 02:14:36 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 13 Mar 2024 10:14:08 +0100
Message-Id: <20240313091412.20865-27-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240313091412.20865-1-francois.perrad@gadz.org>
References: <20240313091412.20865-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710321276; x=1710926076; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EpO4eWUFxSBu2tturLGhSgdaO98zyKDbrZQELf1p7U0=;
 b=A4hdR3U4tAax7k6pogEexvX9ZJCbJ0+lG+r/eHI8YcBjoD8gyNZMAywaU5RLLNsP2d
 uvjHYyjVbeWsMVa9Wt5FBfiLuVP08iUmtUpZoWU+kEns1novnEhjKWHLNfG2XNKSMxTP
 yVIFQ/urVd1glLdkxxdHUpij7c6NOwHv74ECaVOBGspyonfPrmeGx9bgDgm8nUnuD8aY
 +BOOCFUE2NApJ4ASsgS8lr22wGLfxCTDvtbZKS5C0atjk8cAdWIO2IrNV1J3GT+Sh5qC
 YEq/wbGzUBbTWba/nFVIEcgK0rMP4aZRzDcfOllmBHPkZjYKJwBCut38XgPrK4FDKU8z
 qDBQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=A4hdR3U4
Subject: [Buildroot] [PATCH 27/31] package/tftpd: disable busybox tftpd
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
 package/tftpd/tftpd.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/tftpd/tftpd.mk b/package/tftpd/tftpd.mk
index ceac24119..4fb77189d 100644
--- a/package/tftpd/tftpd.mk
+++ b/package/tftpd/tftpd.mk
@@ -25,4 +25,8 @@ define TFTPD_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/tftpd/S80tftpd-hpa $(TARGET_DIR)/etc/init.d/S80tftpd-hpa
 endef
 
+define TFTPD_BUSYBOX_CONFIG_FIXUPS
+	$(call KCONFIG_DISABLE_OPT,CONFIG_TFTPD)
+endef
+
 $(eval $(autotools-package))
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
