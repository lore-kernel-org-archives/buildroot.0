Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D09CAC28B28
	for <buildroot@archiver.kernel.org>; Sat, 15 Mar 2025 19:57:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9418F83B4E;
	Sat, 15 Mar 2025 19:57:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p-yfOFMkX0M8; Sat, 15 Mar 2025 19:57:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6296783B3E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6296783B3E;
	Sat, 15 Mar 2025 19:57:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E860CC8
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 19:57:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC6B8607CF
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 19:57:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PFjLrMQD1xpz for <buildroot@buildroot.org>;
 Sat, 15 Mar 2025 19:57:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CBE4B607B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBE4B607B8
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CBE4B607B8
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 19:57:16 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3913fdd003bso1581418f8f.1
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 12:57:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742068634; x=1742673434;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9VgOiL86ni6JqToXnPmeiAyvDrADiBt4mN8B4oFrHpQ=;
 b=GamCiCVUx6LrfrQTTZx2+I4dm1yA+eNXBzFdnP619lUmYq4NY3qIilRBb54NziVvG7
 sTcuStWMteYzUSp4gFbsBSHwULAqGg1m68gOTTTXwSMZL+xHmS5faLsGKiS+LQ19KWWS
 9AylNI0gMywoqbvNanm7OAvD0gE2fdy2ucrR+lh/uXi2oQAAjllCPw4zmBFOAO+IMKcd
 YkABBFCh1kPLfPGgTuBxmCcrmHYw4XC7WoOV9d4bLj4DP5jZy7G/KI94UwN+mJR+CIk5
 BNLzzEX2CW60/bqMfv1DRT1+JL00kdxq/R913zyP6lPKcNdk98gmsGf3kcXg1vtE7oLn
 EJ7Q==
X-Gm-Message-State: AOJu0YywcGSLqvXe5vlvvCWv7FPs/NLZxTIoxnQsJTVKCH9aMb0vJ0K1
 82/Z9E9534Y8Aq+veUrEsPA4XWyEd2biGrVtD6j3d8IzGBptzUzpjFQ8zw==
X-Gm-Gg: ASbGncv0wAXJxYoYaE4dZ7cLM1xQS6wT1qhUtY6wL2I1ZGF3w+08dD2b+7perTwomCq
 Y+YUNymIc5EnoO4+rrSU+CQ+E7lE4yVXYEbbXSxrNmnBfTsMBh6FZnZDSYGcWehYfauvPWKRCe+
 9kWb/xsTqGObIk8Zu7jFEmrXLLefvAfey0LnO1fIO2zu7G8E/sw8YHIqvkPUj0jUu29NVZEmqS2
 KOcndtIBalF0A9gGkTW1FlN5qTMBduw1rn5tkTTTI3Ko1BfSazaOITz3Hqd1fuZ9+2TpBdCEY0k
 +jxSEmJm4Hl3WlTbc5dToqdad4/6aPLouZQpuawW0aoQ+YmW/5A18010QsfTzAALrg==
X-Google-Smtp-Source: AGHT+IE5Moemu8cLEdilOeFvQXC1SstB+ODPVHZQI7fIpfx4Mrnby9Yqp6QU7VZvjaKDCurRWFy3Pg==
X-Received: by 2002:a05:6000:1fa9:b0:390:f025:9e85 with SMTP id
 ffacd0b85a97d-395b954eeeamr12425145f8f.21.1742068634394; 
 Sat, 15 Mar 2025 12:57:14 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c8975afesm9756836f8f.47.2025.03.15.12.57.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Mar 2025 12:57:14 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>
Date: Sat, 15 Mar 2025 20:57:02 +0100
Message-ID: <f1a20d5defe99cc6304e0aa77f706d2afa7d1fd4.1742068624.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1742068624.git.yann.morin.1998@free.fr>
References: <cover.1742068624.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742068634; x=1742673434; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9VgOiL86ni6JqToXnPmeiAyvDrADiBt4mN8B4oFrHpQ=;
 b=mf+HCuDZwsVQd3TLl6PVQ6HOIersrx5dx7kYKlTjDSR+td/GRvy7kHryNv45cNVJqd
 1asyZ602r+XfN2jBIiAQ34z0YpnoEtyHcYRdnfStgzZZ1YfbCgndWAOlI/efHu8RwODL
 YqgQtpY4+5zg083PflFiR/kGO43p/H844sCZHbX4eLNYR0GGZv4NnOm/fUyc20gnQzGD
 T+7fKVl49MuVvuyRh5PsKL1ZZ3yP+tiS2S32bgiLrSRCRu7Cjgh/Yv+7MrXDwm7ZFRTj
 Sj7aPhtW82Ngoc70e1EO9HK4F6SV9KddLx0uGFwqt8s6pmZ69rlwSuGE+N3mAui0JjIu
 eh8A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mf+HCuDZ
Subject: [Buildroot] [PATCH 04/14 v4] package/slirp4netns: needs TUN support
 in the kernel
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

slirp4netns needs a kernel with TUN support, so enable that and the few
options it depends on.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Reviewed-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>

---
Changes v3 -> v4:
  - add Raphael's reviewd-by tag, as per:
    https://lore.kernel.org/buildroot/cover.1740841539.git.yann.morin.1998@free.fr/T/#m3e676331134de815b1795b1a847431fe099032d9
---
 package/slirp4netns/slirp4netns.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/slirp4netns/slirp4netns.mk b/package/slirp4netns/slirp4netns.mk
index ffcd334ab6..5923957c25 100644
--- a/package/slirp4netns/slirp4netns.mk
+++ b/package/slirp4netns/slirp4netns.mk
@@ -12,4 +12,13 @@ SLIRP4NETNS_DEPENDENCIES = libcap libglib2 libseccomp slirp
 
 SLIRP4NETNS_AUTORECONF = YES
 
+define SLIRP4NETNS_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_CORE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETDEVICES)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_CORE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_INET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_TUN)
+endef
+
 $(eval $(autotools-package))
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
