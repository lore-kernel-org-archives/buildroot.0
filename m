Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1655CCFA05
	for <buildroot@archiver.kernel.org>; Fri,  7 Nov 2025 01:28:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7950884587;
	Fri,  7 Nov 2025 01:28:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EHGQtvY6BQiE; Fri,  7 Nov 2025 01:28:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5EAB84423
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5EAB84423;
	Fri,  7 Nov 2025 01:28:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 688CA93E
 for <buildroot@buildroot.org>; Fri,  7 Nov 2025 01:28:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4EBA2403B8
 for <buildroot@buildroot.org>; Fri,  7 Nov 2025 01:28:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kcOXBk-nrLFh for <buildroot@buildroot.org>;
 Fri,  7 Nov 2025 01:28:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::136; helo=mail-il1-x136.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9853740253
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9853740253
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9853740253
 for <buildroot@buildroot.org>; Fri,  7 Nov 2025 01:28:11 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-433217b58d9so1030575ab.1
 for <buildroot@buildroot.org>; Thu, 06 Nov 2025 17:28:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762478890; x=1763083690;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6EVG3E9Hm/iqlqA5xKH843CBpHic/+daqFB0dON7QwU=;
 b=DnBj7Pqyvjg12NRFaXw7fgJ+cqTtRX1rNMtu2haTAKJlasj2sh4ZV8HLpKpFSSt1Cf
 VKQrVQRnwf0/nB9r6AY8yzDjRGAYv5WKU1p2D3j1boYpqPbw8IKnsEXxbcAUgNa9gFyX
 170HeTffMMNqxEdFWYZCvcKzwM2ofUvjcxNezpEez20ZqlvCbOjH5gMxjvKDqUXYcvzn
 yHcLbrr35zHc2iUElzzD4S4/sKYxmeQoYufEwwqxO+KgkYZleDuzfyl9q780kJirkO5Z
 Vy6iOK+Lie8edxZloN9kk+fdy+xNpBvibRruel1Sb938aMqNFHPnx9aJbNibvx7OLPPn
 5tiQ==
X-Gm-Message-State: AOJu0YyribdtwkWXxRahKE80J28lxftAP3DOcXJbYHCbUJxCXcR/agd5
 KH/tehOUzY49JPlVUIdxWt0rfBFgy2uBBu6kTajpSK7ZC/Ku5XVI7KCDCHlkmF+E
X-Gm-Gg: ASbGnctYJNnb5uYGGxwfrobZxNkdV1tQ/GvzUDGMli/P++Uwc4Vv4KctzXBril1Ckgf
 h6KH7X1mKCMCJAgYOIcVDcY1HV+72R2jgo//z5HxRmsJncls5a4h3G1bti9r9ybf7kA67tcXFOg
 HX0E1fS1ngO0bdqGDXjaEb/9Sl8BlHNmtct1CdWkCAmgA0tDUXvh7PeclE3CPsWeQWYeojA+xj+
 W+aqx8eZPZK55mZXuPD2i+0/45Mub/AY9YTO8e6MonccG9SPAytusUoanvbBb5k8bq0UOWW3DKa
 Xh9MjnkLxnYwcQXLX4UL0PqC6jlHzF7x+FEWl+jy0X5Pf1p7S3ZpBd9hw4QUwR3OtiuPQT6DnR8
 loOixsIrZNtgBwnbA3sYz0F6xN0xamfsI5nENzfhjZ4CAh4d5UiARHavNPUQ0wNRQnAsQd0rjfU
 HlEYf6d4XFr0RMUu98w+eP4tJnhbolXGtH/OwMMcnwUfQTAlcAKCkMOT1AEQ==
X-Google-Smtp-Source: AGHT+IEhIk8wst95qjboF5WaVg4W4t7zHznN1TFtVlni5+Lper0z2JMKhmRRqJtdEllzVzM1J7kXDg==
X-Received: by 2002:a05:6e02:3b85:b0:433:29a9:32db with SMTP id
 e9e14a558f8ab-4335f453023mr19716945ab.24.1762478890105; 
 Thu, 06 Nov 2025 17:28:10 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-218-113-64.hlrn.qwest.net.
 [71.218.113.64]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-5b746991aedsm1433028173.63.2025.11.06.17.28.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Nov 2025 17:28:09 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
Date: Thu,  6 Nov 2025 18:28:04 -0700
Message-ID: <20251107012804.2080218-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762478890; x=1763083690; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6EVG3E9Hm/iqlqA5xKH843CBpHic/+daqFB0dON7QwU=;
 b=nMZkaKRCfLeClUMKRB9j+YwAn6QLOhFfw1y5vKYRAHSlgQVw7hbrJEHPwWs95mSF/B
 AVmsT2pXwvBT5v426/fROUWZJp0lPc5dTzhGH+u7RmDp2lWCFOmRDZd2/GFF3R7tyb2l
 XhmrqMM3xlR0NdgQaAqSRhSJG9wPizu3w3NgzBkXPnpe9IEoduXeaKI0pX9jDyafWXJs
 XQtqMpn9nIGJuCpqV1vEX1fpS6LNUCi+shDCO+DMnv9EjU3PxYboBvuqXcr+dxIS3LKj
 b9scrIUy3ttNonFrINlgWPko+fohAyet2O+Km1o3lf+nFbNyG36hiiTnFA7YnDQOTYWH
 tcvA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=nMZkaKRC
Subject: [Buildroot] [PATCH 1/1] package/tailscale: add missing config fixups
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

There are a number of kernel config fixups required for tailscale to
function properly, these are commonly enabled by default in various
kernel configs but lets make sure they are all enabled here as well.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/tailscale/tailscale.mk | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/package/tailscale/tailscale.mk b/package/tailscale/tailscale.mk
index 3c6c7bce1e..86039fd4b1 100644
--- a/package/tailscale/tailscale.mk
+++ b/package/tailscale/tailscale.mk
@@ -28,6 +28,19 @@ endef
 TAILSCALE_POST_INSTALL_TARGET_HOOKS += TAILSCALE_INSTALL_SYMLINK
 
 define TAILSCALE_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IPV6)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IPV6_MULTIPLE_TABLES)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_NETLINK)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_CT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_MASQ)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_NAT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_TABLES)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_TABLES_INET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_TABLES_IPV4)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_TABLES_IPV6)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_TUN)
 endef
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
