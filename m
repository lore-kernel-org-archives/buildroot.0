Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63BA9C52D7C
	for <buildroot@archiver.kernel.org>; Wed, 21 Aug 2024 18:54:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02C418101B;
	Wed, 21 Aug 2024 18:54:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AZXSCNu7J1nE; Wed, 21 Aug 2024 18:54:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15E3A8101F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15E3A8101F;
	Wed, 21 Aug 2024 18:54:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8BC3E1BF395
 for <buildroot@lists.busybox.net>; Wed, 21 Aug 2024 18:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7865840588
 for <buildroot@lists.busybox.net>; Wed, 21 Aug 2024 18:54:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CzPvSPvcGkuZ for <buildroot@lists.busybox.net>;
 Wed, 21 Aug 2024 18:54:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=mattianarducci1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4A646400AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A646400AB
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4A646400AB
 for <buildroot@buildroot.org>; Wed, 21 Aug 2024 18:54:10 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5bed05c0a2fso31551a12.3
 for <buildroot@buildroot.org>; Wed, 21 Aug 2024 11:54:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724266448; x=1724871248;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:sender:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=53mzy+jGp2BpMcnoYIT4n5jRbuWJGf24QXEdABAk/V8=;
 b=XzGqWVao0f1ARx4W4tRgPRspeEvkxSvHTJ1H3zsw1Rzbk5NFDMVNA42VJ86/JkSKlq
 EvCprKun8WagAYF9oSfSUQKiT2RFpJ5YLlQ4fqicY0Iw7Zytv34WanSP8PHtFMFNEAa8
 vvonhhQ26w9AtTNgvXRLr/YRoJ8+sSXePnM5QtHr7t/G9eX1mvwgbXRL1MHxTmp4gC4q
 BOKvCr+uncaWst1YPFggKluseEqeVMInYR0OOKEUQ7/q05AC6VjsTDkbPl4hEweuH10p
 Mz61xsViy5v7y3yae/im+HMGm3K6UU5D8lpTPqMFyB6eCiSBT79W7Qfd33QpQkRARE5N
 vvEA==
X-Gm-Message-State: AOJu0Yy0XUQJ7N/rnODT1SUAuOlj5oSghv85S3OhDicXlB6Jz/HNkxsd
 S5vDmb2sbFb0OtRZWk9knyg8bCayn1Uw3yGZDGwSPCUT6guWn04muChE6Q==
X-Google-Smtp-Source: AGHT+IH1I8EwfdedEw+rMA4maBNmFKzTj7Smfy2up1DWkiCNb/XcEFH1lGsqCBQDzuv58fkMdBz2jQ==
X-Received: by 2002:a17:907:7f9e:b0:a86:73cb:35a3 with SMTP id
 a640c23a62f3a-a8673cb3605mr279839966b.64.1724266447772; 
 Wed, 21 Aug 2024 11:54:07 -0700 (PDT)
Received: from localhost ([37.161.164.205]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8684f9cc04sm47966866b.142.2024.08.21.11.54.07
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2024 11:54:07 -0700 (PDT)
From: Mattia Narducci <mattianarducci1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 21 Aug 2024 20:54:06 +0200
Message-ID: <2955850.e9J7NaK4W3@localhost>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724266448; x=1724871248; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=53mzy+jGp2BpMcnoYIT4n5jRbuWJGf24QXEdABAk/V8=;
 b=PTLZgJakIv4hqTgQ707lVW5GXjjcc5LPAr5nRxU3FW8i5VBr/vLyiVjo9XS8+iHd1t
 8b9y6WDKBlM5zJd1P0WqjeLnQ8HpDR+mNaj1eYBm2eNzGDU29CzybkUF64wxWoPS59f8
 j8vqOvn84iyf93Tp+k0+lxUAExgyTIEh9Qjujk49O6+W1jrvbgEt3+LHRSYsMU4aI6T2
 n18FMV70EJCVui0MEjx9afqFq4lM+/ceyvw+CxS3y0V7Y8sKKI2pi152BvJ/iayG8WkJ
 O6ypuakQbdFdOT/eOEw8N5BAC6S7eCYJM+XJGttElePLoopaEBdmBw8ozb99WG6OuAYw
 didg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=PTLZgJak
Subject: [Buildroot] [PATCH 1/1] package/proftpd: add option to enable
 mod_lang
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

ProFTPD's mod_lang module handles RFC 2640 LANG and OPTS UTF8 commands
allowing localization of greetings and command responses and the use of
character sets beyond 7 bit ASCII for directory and file names.

Signed-off-by: Mattia Narducci <mattianarducci1@gmail.com>
---
 package/proftpd/Config.in  | 7 +++++++
 package/proftpd/proftpd.mk | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/package/proftpd/Config.in b/package/proftpd/Config.in
index 9d99ff70c4..1f8f2bd305 100644
--- a/package/proftpd/Config.in
+++ b/package/proftpd/Config.in
@@ -16,6 +16,13 @@ config BR2_PACKAGE_PROFTPD_MOD_CAP
 	help
 	  Compile ProFTPD with mod_cap support
 
+config BR2_PACKAGE_PROFTPD_MOD_LANG
+	bool "mod_lang support"
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	help
+	  The mod_lang module enables ProFTPD support for RFC 2640 LANG
+	  and OPTS UTF8 commands.
+
 config BR2_PACKAGE_PROFTPD_MOD_REWRITE
 	bool "mod_rewrite support"
 	help
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index cd7d232672..9f64cb43a0 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -49,6 +49,13 @@ else
 PROFTPD_CONF_OPTS += --disable-cap
 endif
 
+ifeq ($(BR2_PACKAGE_PROFTPD_MOD_LANG),y)
+PROFTPD_CONF_OPTS += --enable-nls
+ifneq ($(BR2_ENABLE_LOCALE),y)
+PROFTPD_DEPENDENCIES += libiconv
+endif
+endif
+
 ifeq ($(BR2_PACKAGE_PROFTPD_MOD_REWRITE),y)
 PROFTPD_MODULES += mod_rewrite
 endif
-- 
2.45.2




_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
