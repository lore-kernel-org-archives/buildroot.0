Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1550C54791
	for <buildroot@archiver.kernel.org>; Wed, 13 Mar 2024 09:15:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0BE64151A;
	Wed, 13 Mar 2024 09:15:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0eRd9nZANm4U; Wed, 13 Mar 2024 09:15:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95E33416C8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95E33416C8;
	Wed, 13 Mar 2024 09:15:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 99F5C1BF3DF
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 09:14:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EBD0A813BA
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 09:14:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oy_ek_ne2Jzg for <buildroot@lists.busybox.net>;
 Wed, 13 Mar 2024 09:14:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com;
 envelope-from=fperrad@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 81E1681375
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81E1681375
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 81E1681375
 for <buildroot@busybox.net>; Wed, 13 Mar 2024 09:14:35 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-513ca834ad7so254295e87.0
 for <buildroot@busybox.net>; Wed, 13 Mar 2024 02:14:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710321273; x=1710926073;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UNlYaJKdrwAS3X8uGcEyrJqRyRcsMY488weV4WWl8CQ=;
 b=orpqfSj3bJINfvzXQOsEfcNsQ+0pkRaJ5lCZ1BYPFZXpQVP9Dt+dyKIHthgbozzq5A
 h06p1NOPOAqRwdGcn8WUQ/+5BGY6/+Qj5IyFjPAfSnARNmq7Z3OsR//cFgjF4XNmBUFF
 KTnjHaqXElUwKI3wQQcbhXz+n2h20IwA/E6qBOo1dwsQcI/zCId0wBYLlDMqmNGcSzpD
 RKfKZchxc94mM3mE5+HLz4lB95EnXipB1OyIIpyDr8345WNiSgvKtYAUEyt4YTaOHabR
 b8d6AtQFPc0h9S2gvB8kL7UeBPuXSD6xjFz2fG6Vxv5L851KWZrJzKfjzNTtNn47opfu
 Q06w==
X-Gm-Message-State: AOJu0Yx3zlRIcpmSENdZMQEC8S3+TTQPXeAPpgz5r+paXXRBWPA8cvMn
 kykM5NetaH6ha+eFg0AIP90j2URfm8Hm25X6K2ogqatxcKWGkxhhuTr3GHWNueo=
X-Google-Smtp-Source: AGHT+IFLNYh3NM3qGyFuxkO3Y7soqx/BLAEME7vUUY6qNzn3NMQzxqxs+tKklybF3PJ/jEgxrpQ1Nw==
X-Received: by 2002:a05:6512:54d:b0:513:ca84:3a0e with SMTP id
 h13-20020a056512054d00b00513ca843a0emr442665lfl.58.1710321273346; 
 Wed, 13 Mar 2024 02:14:33 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.92]) by smtp.gmail.com with ESMTPSA id
 u1-20020a05600c138100b00412e5f32591sm1699799wmf.28.2024.03.13.02.14.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 02:14:33 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 13 Mar 2024 10:14:03 +0100
Message-Id: <20240313091412.20865-22-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240313091412.20865-1-francois.perrad@gadz.org>
References: <20240313091412.20865-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710321273; x=1710926073; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UNlYaJKdrwAS3X8uGcEyrJqRyRcsMY488weV4WWl8CQ=;
 b=iSyqP7IfyHaAalK+9o+p7tyoFjXh068Iq8ocxSMuMneFX257LSYMa+KecLnGF1JPqR
 cfCSOtU2pUWN+gQMzrYHvhC4xwOvuB3j2N4o1OOX/1xxHSX8tqSoaK8a0K011A4vRqtt
 7AHPV4HLh1UBeiiw6y/2SqDyuyuZbP0dA/4h2ljohz86HTXAnmg86+yWe5GOeGZqpRRY
 ublniSn1v3cgI4vJXOKRhSYnPUD0i/ThEbE/kcU05JKjBJE5iRqNFmtU/G0Svuj7eHmg
 m8fjGFOUKPRuSMOx7TKxov6gCcxxLYmRJXHG4IiUvORoXHcf3X6QyVqr5srCgxw6mE/G
 lR8A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=iSyqP7If
Subject: [Buildroot] [PATCH 22/31] package/patch: disable busybox patch
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
 package/patch/patch.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/patch/patch.mk b/package/patch/patch.mk
index 6f83d2418..8765b3b31 100644
--- a/package/patch/patch.mk
+++ b/package/patch/patch.mk
@@ -30,4 +30,8 @@ else
 PATCH_CONF_OPTS += --disable-xattr
 endif
 
+define PATCH_BUSYBOX_CONFIG_FIXUPS
+	$(call KCONFIG_DISABLE_OPT,CONFIG_PATCH)
+endef
+
 $(eval $(autotools-package))
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
