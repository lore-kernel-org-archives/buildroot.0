Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D45CD98F2
	for <buildroot@archiver.kernel.org>; Sun, 21 Jun 2026 16:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF2F96FDA2;
	Sun, 21 Jun 2026 16:46:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MhPZ4ONlks-v; Sun, 21 Jun 2026 16:46:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55B026FD8F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782060404;
	bh=54eLW6kkZg/ZPv8xcgXnuhC1aRyeE+6pk1VUOdDPxMI=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=G9oZnGD+7HmU4i4evvF/Wy0IJOL3FViPVrGajN0CCQVssGXGSbN2OT40eEZN2zQEX
	 eV1c8ffAvNf3m/rEKG7YXxbrUjy6+5Oup1A4FX+jEA29IInHAN8x4K07Kt6lmeMkpg
	 JWlz+JpjlOlxHIwywWljxOJdtII741ZvpuDEc8u0U/oj32y4yhwHpPzCDkrZs0Z7rW
	 ePGattg5dLy+zmmHj6a23uIcvPSbtGxlZXNjIGkmhk8PScfXY1iRnD6uzhjNv0quTN
	 CWTutN/1INxGSi3RPmjQNXe+j45xdAY7ObRyTFHj/q19N/BbtlLQvG4/8Ns8UVYpIC
	 waVV+G2qLusLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55B026FD8F;
	Sun, 21 Jun 2026 16:46:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 01B4A367
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 16:46:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7AD56FD86
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 16:46:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SRBsEsyfaCeu for <buildroot@buildroot.org>;
 Sun, 21 Jun 2026 16:46:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6B06D617B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B06D617B7
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6B06D617B7
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 16:46:41 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4923139e940so21165025e9.3
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 09:46:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782060399; x=1782665199;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q8/sHDotd5R0i40Hh695QIgwvB7v369JxK1/W7/bhec=;
 b=PNg22DT8/J38Oqyhg+W30GUVIU+QM2TpJ3LlyRlJmrNgOPd8kJQqsOCwTAFEVECOKU
 Ra3T7CUR+Uk51S/3S/n5pgs2cOAJmLQHCsaPv3yyNf0y/OftLx0NMVCmAWP3atg9+Jja
 0tjbbPVMaXo98W2mAjgWQl+1N9cDdWQRnO0W9hYTCtGuXEquKnz7dAPYFOkA3a68Mfqz
 RjtKO3Y7ZgIJRM51b/tT6OcW6KmefFHCYC6lza6A18aXxS3dXKEwhBJvjH3Vg8/Y8VGC
 SueeHhcey6Tm0uLanH8NNj4InlGDMOk068P5RvwNGLVMGMdDAZZK77D5NioZpWFWOsgT
 1V3w==
X-Gm-Message-State: AOJu0YxOHrI8Terhz+bwEep15XCFupZL9lJurGNkb5Dh+5UE0GpGM3f6
 c13H1J0m1qaoxDOqCBL/xuXFg7BeCCG0kcWhT2OYA2CgmBuJQLAN2HrS4weNaoPnOPKv6P35Xv0
 jQJ3L
X-Gm-Gg: AfdE7clHLqIEfcUGkdiy00XhFrqnMNnOjPM6taFbnW1zaayDohpB76qjsSkffkptBob
 j0PTdbUT9eks0bkXBmoDTWoHAg/DjExQ+2LVhZbInxMBMixeeCQlEMA1lrXGHBPcCCjWiuRxGG+
 fwmw0HXaAMTf00q7OMXWuZgj5wV+eNior7MuRdKH4fX76Epk8qogeKCrWzaKPz0ucAxYXPncO5E
 ajfe1799JCMhF+ONhwFhUo6P1ZFhfdd1zBYUKK4VdD3U2ZrKzBoskpnqesVbJXwuwnJ37l7ABOv
 E6bbSxgQ0Mlw3lftPYwg+Os2n20EFY6jdHgLWjvdiCKbtrMHia9yfGoRhpsgL8lbJm8FPBPygil
 081vJxdmm1f4dtth9j0JFMeJ1byQa7Lx7UOUNhVVdtTqYRXJ+m6tZhT34lAMcgUJ9GwI8dpfTRN
 00iJqg8PLg89Wk0vUi5XPBf8B9Ezt0KcEvQBWDnJbJxadNbINSPdrKniKKthGAj+VzB4Juu6ZRz
 FtNK2SH4NiJ7os=
X-Received: by 2002:a05:600c:8286:b0:490:bb3e:30b0 with SMTP id
 5b1f17b1804b1-49242326ce2mr154541715e9.4.1782060398972; 
 Sun, 21 Jun 2026 09:46:38 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4666678828dsm18051329f8f.19.2026.06.21.09.46.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jun 2026 09:46:38 -0700 (PDT)
To: buildroot@buildroot.org
Cc: ju.o@free.fr, dowan.gullient@smile.fr, Romain Naour <romain.naour@smile.fr>
Date: Sun, 21 Jun 2026 18:46:32 +0200
Message-ID: <20260621164634.2423931-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1782060399; x=1782665199; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Q8/sHDotd5R0i40Hh695QIgwvB7v369JxK1/W7/bhec=;
 b=25E5tD4f7Go3YmVh0IOzRd9/CWxNOvZpNj38EJZfqajZtZXSigPm0m8WrSjYIzIUf+
 5Nkjnv/MTFuCSVyoBakniEdKtjlX+ltol3qt9CGUU80ahAojyTNxtM++oEDNHmNiB5Rp
 2jN+ZYBxcvGZ9FV0sg1nwhYK5+OlxPQe31504=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=25E5tD4f
Subject: [Buildroot] [PATCH 1/3] package/iptables: improve kernel support
 for iptables-legacy and iptables-nft
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since kernels 6.17, support for netfilter legacy tables were disabled
by default [1] but iptables package needs Netfilter legacy tables
support enabled in the kernel when nftables compat is not enabled.

Make sure to enable CONFIG_IP_NF_IPTABLES_LEGACY and
CONFIG_NETFILTER_XTABLES_LEGACY for kernels >= 6.17.

Fixes:

  [BRTEST# iptables --flush
  modprobe: module ip_tables not found in modules.dep
  iptables v1.8.11 (legacy): can't initialize iptables table `filter': Table does not exist (do you need to insmod?)
  Perhaps iptables or your kernel needs to be upgraded.

On the other hand, when nftables compat (iptables-nft) is used by
default (BR2_PACKAGE_IPTABLES_NFTABLES_DEFAULT=y) we have to enable
nft protocol support in the kernel.

  iptables --version
  iptables: Failed to initialize nft: Protocol not supported

Enable CONFIG_NF_TABLES and CONFIG_NF_TABLES_INET as for
NFTABLES_LINUX_CONFIG_FIXUPS and complete the list with
CONFIG_NFT_SOCKET needed to pass the TestIptables with
nftables compat (iptables-nft) enabled.

Without CONFIG_NFT_SOCKET:

  iptables --policy INPUT ACCEPT
  iptables v1.8.11 (nf_tables):  TABLE_ADD failed (Operation not supported): table filter

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=9fce66583f06c212e95e4b76dd61d8432ffa56b6

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/iptables/iptables.mk | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index a9d912f6cc..4ace16d0ec 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -49,11 +49,26 @@ else
 IPTABLES_CONF_OPTS += --disable-bpf-compiler --disable-nfsynproxy
 endif
 
+ifeq ($(BR2_PACKAGE_IPTABLES_NFTABLES),y)
+define IPTABLES_LINUX_CONFIG_FIXUPS_IPTABLES_NFT_OR_LEGACY
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_TABLES)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_TABLES_INET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_SOCKET)
+endef
+else
+define IPTABLES_LINUX_CONFIG_FIXUPS_IPTABLES_NFT_OR_LEGACY
+	# [for Linux kernel versions 6.17 and later]
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_IPTABLES_LEGACY)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XTABLES_LEGACY)
+endef
+endif
+
 define IPTABLES_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_IPTABLES)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_FILTER)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XTABLES)
+	$(IPTABLES_LINUX_CONFIG_FIXUPS_IPTABLES_NFT_OR_LEGACY)
 endef
 
 define IPTABLES_INSTALL_INIT_SYSV
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
