Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5625CDB47F
	for <buildroot@archiver.kernel.org>; Wed, 24 Jun 2026 12:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66012818DC;
	Wed, 24 Jun 2026 12:52:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pUQPRwU0npxg; Wed, 24 Jun 2026 12:52:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A41C81A58
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782305530;
	bh=qxUjeCJqd0ou8O+UqYxApDVJkK7+XO2gYnCCuWBVaJo=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=GJSRUDhc6M3raOB9Le3qPNV8qaFPE7YcYjRTIA5satM9Y5czzUZNDD2Zu1TAWy6Kw
	 2D1h3G2PMaVTjduAdiOMHpOaoFk8whvicL4AjctViphUUNaWMJTI0S+H1VJJ1Wmisf
	 wEJgsE2CPLsdVuGvEGNtjiRHiv8rpEqhi16+lgZaygdm0QLuPVtinKkFZtw/BjXN7S
	 1IyAZLYpkNkGf//j//rn9CR8YD7LmZmJlijdB5Cdfd2n3Rx61wV51NLy3mI6uTkFD8
	 fOudHbDSHIHsiAFTHrOzCCUTGnerg6r4Hld+nhUoxIDn3G9+AncsGl/5T8flpav5kk
	 r+Cny260GU0/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A41C81A58;
	Wed, 24 Jun 2026 12:52:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A3024367
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 12:52:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8920140B7D
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 12:52:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qQKk-kTezpig for <buildroot@buildroot.org>;
 Wed, 24 Jun 2026 12:52:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8740C40AAF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8740C40AAF
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8740C40AAF
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 12:52:07 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4924593f45dso11164395e9.1
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 05:52:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782305525; x=1782910325;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S+w3qUVImCp6ub9PQ0uhrIUPtjMEypRDZWSmPmuoGBI=;
 b=IhlEx0PyKheBQ8FbKU+FLVTIKBHV946E0K8bgV68dWyTWDCNTX9xmVm1U60HolYbtc
 mouuv7t71ynSSxV/emf0t1X++r52oTyrldnJ7nIgD9UZlpxbP/VrX4kdbhbaLjyRIOmq
 F5fnvoGMzayJnhYS2FSz5rbRx2g0+HavsIJQ5IGjy1UW1JVgO2ptlwECS1hi/Kw6cMyp
 LtDu5DFiJnbsg1KUN6Mj7ByKL83zEpiPlyEge3guKf94A8QHqz60C9jTWdWeSy1BP2wn
 sCGDuvm9mpvTWiSVyelm75ql2cALA+/DngNAo/9vRfr5DO4TUOYXlgd+T/tL6qGwSQbP
 B85Q==
X-Gm-Message-State: AOJu0YxQFCBXdTZdjYhby80KfCdf9+kQZeHyvjOZi5szO8QxfYbcaAi3
 sT6bYLlIMLIjsB0AX9Ek6KgKE7v4zVYcVoDneyWnWZyaaP8t5PkauUzZ21bqsYl2FYQLpPRjHXD
 XPzvY
X-Gm-Gg: AfdE7cmilUnszq18emiDnloPiyZK2FhgjZCLg5gt7JYhWQY4BjpE7301qB83awNUrF1
 ktx+9ghztxanf1zLOcHOTBQuolPnszODSUtYTQzLy9LkNVhw/hc8paw+DEa7XYUmVfzJrt+9qPg
 JBWnjJNbOw0JIQYvhe0YSK/qmi4oymUxSU1ZgGrJIrr8uNnp19Z5FdzTH3KgKdFuESj9/oaGip9
 XJqsltARWX6+KTv8+ZBu2qC5BFNqTneg4cCPmcqVU2ZRdV0k9wiuBDruOeS0jsZXZJlGaCao214
 TlgMNzObe9qTdLDV11UOsW2MEkMc+65wfhhL1bp4FRYSFyWC9jWCn9V40FT5++UhQycOl1QsvrZ
 78G2+fiQLYkyvsFKOgdmlwAJkGbylKxSCghmtEUMJdifYT2htP5lZ6lf8KL1H2trLMFPCkQzuNK
 VLmcEP8KKNGgcCFWvlgNk5O0F50nSgsw87LzPhBinXLqakO4ZCLhHp4IYKFQaLH327LJs6NyBhX
 oQ=
X-Received: by 2002:a05:600c:8a1a:10b0:490:c6c2:bdc2 with SMTP id
 5b1f17b1804b1-49260840b94mr36282445e9.4.1782305524944; 
 Wed, 24 Jun 2026 05:52:04 -0700 (PDT)
Received: from P-NTS-Evian
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4924923392dsm722946235e9.2.2026.06.24.05.52.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 05:52:04 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Wed, 24 Jun 2026 14:51:52 +0200
Message-ID: <20260624125154.1869177-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1782305525; x=1782910325; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=S+w3qUVImCp6ub9PQ0uhrIUPtjMEypRDZWSmPmuoGBI=;
 b=re1/LyvWLMs2AxfP2FjPNtpeCAn0V0UM1nY0SS71zBFXF6vQ5q5luYeoRGNARqMryD
 p1Q/ATDiNRRFb1BxTpvxFWfiP8kWb3lA5p0YYKVYGMEqgPyrUvsFOz2lYi149aMQwxSR
 nWK6JzJn66Qi3fFULv22k21cqOS1GRX5e+No4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=re1/LyvW
Subject: [Buildroot] [PATCHv2 1/3] package/iptables: improve kernel support
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

So, disable iptables-legacy support only when nftables compat is not
enabled by default. Enable iptables-nft support when nftables compat is
enabled, even if not used by default.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=9fce66583f06c212e95e4b76dd61d8432ffa56b6

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
v2:
 - Enable kernel support for iptables-nft even if nftables compat is not
   enabled by default (Fiona Klute).
 - Enable kernel support for iptables-legacy only if nftables compat is not
   enabled by default (Fiona Klute).
---
 package/iptables/iptables.mk | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index a9d912f6cc..bb01c07a43 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -49,11 +49,33 @@ else
 IPTABLES_CONF_OPTS += --disable-bpf-compiler --disable-nfsynproxy
 endif
 
+# Enable kernel support for iptables-nft even if nftables compat is not
+# enabled by default.
+ifeq ($(BR2_PACKAGE_IPTABLES_NFTABLES),y)
+define IPTABLES_LINUX_CONFIG_FIXUPS_IPTABLES_NFT
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_TABLES)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_TABLES_INET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_SOCKET)
+endef
+endif
+
+# Enable kernel support for iptables-legacy only if nftables compat is not
+# enabled by default.
+ifeq ($(BR2_PACKAGE_IPTABLES_NFTABLES_DEFAULT),)
+define IPTABLES_LINUX_CONFIG_FIXUPS_IPTABLES_LEGACY
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
+	$(IPTABLES_LINUX_CONFIG_FIXUPS_IPTABLES_LEGACY)
+	$(IPTABLES_LINUX_CONFIG_FIXUPS_IPTABLES_NFT)
 endef
 
 define IPTABLES_INSTALL_INIT_SYSV
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
