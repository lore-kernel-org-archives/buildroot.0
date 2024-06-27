Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B9CCC2BD09
	for <buildroot@archiver.kernel.org>; Thu, 27 Jun 2024 08:40:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8F3E40114;
	Thu, 27 Jun 2024 08:40:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jFlgl9r8HWhh; Thu, 27 Jun 2024 08:40:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1BB8404D1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1BB8404D1;
	Thu, 27 Jun 2024 08:40:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 09C081BF3D5
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 08:40:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0392084027
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 08:40:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y0VB2L1-eozz for <buildroot@lists.busybox.net>;
 Thu, 27 Jun 2024 08:40:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D41D783F45
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D41D783F45
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D41D783F45
 for <buildroot@buildroot.org>; Thu, 27 Jun 2024 08:40:44 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-42565697036so1868515e9.1
 for <buildroot@buildroot.org>; Thu, 27 Jun 2024 01:40:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719477643; x=1720082443;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jXQ0sxiQI8F95fUO6siH2/+spTyc5SfiVMp+6VObEz0=;
 b=KMLJ+EcypZsQW2XGCaxcqUiFhXonpvTZ6H3wagP3p/7TV6oco1PSN/JoK3AYQzuzJq
 1WEVSPyDqi+M6BukDn/H8NHLpzIuJT6I7E109+4fCcdbOyi9bDBAv4JS10rB5mANPpxM
 PwQFNE3XCpcbKP1JWpmrAguTbQoG8JfJkuMDH89u/TktsYsJoDyQ48mjtIG4GzQIIG+d
 rkGMIKk3Mm4nt3BPSCi01GHg+2vgrDQU26DzHMuaEOjwiLQ4NFub1ahSJJhn9HrNH283
 l8DU5Jr0fTs9seKqJDnpGJeuXx9ZZpTP59icdn5Ok4uoZRtoFsnC4ljMsHBhlZOd30ty
 YGPg==
X-Gm-Message-State: AOJu0YwoZKV/RzOclYHaj7QaSxTDXnz+wa1hvIBZjvaKANnLY7ca9HtF
 Vv5h0TjnBLokCxpmDVd0IrQy4KEXPHjtsgrq7+cyQMOm2+DHdCA/5I6dUBUSMk2C5Ccb3oSf/mC
 h
X-Google-Smtp-Source: AGHT+IFckht9h8zqG/vRe/FuuNhBynDSouHQIHuwPJ+u4rbATacqh9O+/ZKPrFJrYZi7lkxvWjTowQ==
X-Received: by 2002:a05:600c:4f42:b0:424:8743:86b4 with SMTP id
 5b1f17b1804b1-42564316daemr10629075e9.6.1719477642695; 
 Thu, 27 Jun 2024 01:40:42 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-424c8245da9sm54861355e9.1.2024.06.27.01.40.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jun 2024 01:40:42 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 27 Jun 2024 10:40:39 +0200
Message-ID: <20240627084039.44592-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1719477643; x=1720082443; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jXQ0sxiQI8F95fUO6siH2/+spTyc5SfiVMp+6VObEz0=;
 b=rBgvO9BioUM+Te8sgonJcqaKuYpruIjBR/XyltP6PlS391FzcoPrcfVa1UCORdiaL3
 WZMtuyXqxm2LRcRuY/Q9+WXxN8VvfYqGHH37YLb5OG2RV7/uXYrpWr/uEfTOluZhfQ81
 5I/dxnIOXDkBJhAIEpGS81fHaU41oEiZNaKAQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=rBgvO9Bi
Subject: [Buildroot] [PATCH] package/gnutls: add tpm2-tss optional dependency
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

tpm2-tss support is available since gnutls 3.7.3 using
--{with,without}-tpm2 configure option [1].

Since the option is not handled by gnutls package, tpm2-tss support
can be enabled if tpm2-tss package is build before gnutls package.

Likewise, tpm2-tss support can be enabled for the gnutls host variant
if tpm2-tss libraries are installed on the host.
Make sure to disable tpm2-tss support for the host-gnutls.

[1] https://lists.gnupg.org/pipermail/gnutls-help/2022-January/004736.html

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/gnutls/gnutls.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 8a4f3345aa..8302194812 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -57,6 +57,7 @@ HOST_GNUTLS_CONF_OPTS = \
 	--without-librt-prefix \
 	--without-libz-prefix \
 	--without-tpm \
+	--without-tpm2 \
 	--disable-openssl-compatibility \
 	--without-libbrotli \
 	--without-idn \
@@ -98,6 +99,13 @@ else
 GNUTLS_CONF_OPTS += --without-p11-kit
 endif
 
+ifeq ($(BR2_PACKAGE_TPM2_TSS),y)
+GNUTLS_CONF_OPTS += --with-tpm2
+GNUTLS_DEPENDENCIES += tpm2-tss
+else
+GNUTLS_CONF_OPTS += --without-tpm2
+endif
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 GNUTLS_CONF_OPTS += --with-zlib
 GNUTLS_DEPENDENCIES += zlib
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
