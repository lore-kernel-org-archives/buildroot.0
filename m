Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF42C021AA
	for <buildroot@archiver.kernel.org>; Wed, 19 Feb 2025 08:51:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A297D84D74;
	Wed, 19 Feb 2025 08:51:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QR1bimYpwPjh; Wed, 19 Feb 2025 08:51:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 809D584D9A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 809D584D9A;
	Wed, 19 Feb 2025 08:51:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E4212968
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B8C4C503BD
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HEHzaVGcT0wD for <buildroot@buildroot.org>;
 Wed, 19 Feb 2025 08:50:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CE7654F39A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE7654F39A
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CE7654F39A
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:53 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-439846bc7eeso19694295e9.3
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 00:50:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739955052; x=1740559852;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CkAZM17LgbFTiWDeBv0vA6Squb6bJtdQJ7Eq2BiEMEU=;
 b=UNtCK/5dltToaO5Oa+/8v+iAomBNa17jP4HgcPHRbnlNBbvIEN0TVmOiUajZHxlbPA
 LlLFZ8jriDtQKVb2u1tBMZXV3APAKtRfRRasnR7QL/pghNZfOjWnWo8JkcrltwAQzQle
 5DQ3wLfNnum24UJ2yfimu77WHnE/pexZivPsRPT9uohoi6TuMGyV7sSxbry697z1u+DV
 ZbXQPVS3JR9fFhhIGZKy9MClw2I0rY1ukrTiZSdhfZl3PNGpwpvBIHnQwm4Rsw+/igT/
 8jjVN3VnW7sU1Hl062F0E7MXXVIwkumIzqqlNUN+2P98qu34kP2y15PYUUIiTZlM6lM7
 jrLg==
X-Gm-Message-State: AOJu0Yz9vRZhzkvy9sSQhMfUxEbhSMWJ8jtA3CSEV1t3R/7tQSNF1QwE
 91seIPNDN3nnKm+2B2N6EkpjPqnO2P6iseAhRjdlWs2OFLxegyCPyrU4qA==
X-Gm-Gg: ASbGncsaCdkXZQ10yX0dNfDLEmC+lM0N4jypv2eHbbyrjJWohpPVU2tBtkfUzF4uFIJ
 Lwhhz/gbEi9pt+8EF54gRwhqIxZ+Dia95GG01Utp6SVqRSFY9LJN6rD6R3JTLnNoH1oOhttg4rL
 XDsVivIksnOZAvA/5V4jMvKto2/cgvlCjpNd/BE6rLgtp94E6KplBGqwwOxry/RN1+6Jf9741I2
 EYnhUp0MkbVNS0JrI9EynsAKoimKBa80ORpVi4t2Yu5erYcCMGQPy5w0xsjYi6q3scjCbNliXjL
 RiPsGlP0gtDZ2e8vRFoWZWLysQ==
X-Google-Smtp-Source: AGHT+IF38Z4Cy6s3YbDfErvUG5q/wctjNib5IAsbhtM7NitfbvWzyqEiT9sE+0GIkzUXgMug6Dgo6A==
X-Received: by 2002:a05:6000:1faf:b0:38f:3392:9fd8 with SMTP id
 ffacd0b85a97d-38f5878dea4mr2194918f8f.18.1739955051713; 
 Wed, 19 Feb 2025 00:50:51 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d5e9esm17517399f8f.61.2025.02.19.00.50.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 00:50:51 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Wed, 19 Feb 2025 09:50:28 +0100
Message-ID: <8544eb3b5b3664c67bb61fe3d37fa0c0222d7a50.1739955023.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1739955023.git.yann.morin.1998@free.fr>
References: <cover.1739955023.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739955052; x=1740559852; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CkAZM17LgbFTiWDeBv0vA6Squb6bJtdQJ7Eq2BiEMEU=;
 b=G+8/kOSI/FOWMiVWq/wVmNOJtNshfQtEh12uBAcM7EVCjfwa/G22EFmn1V3FWVLtYd
 NX0tWKwCtiVAvBY75F9LTVXpuIwWV+sQbWVug7Wu9DJBphhvhsWaPNfIqbAehAZuoiE/
 z4zpej+llPLk6P7VOn3oPhYm1MmxDEAJW5YKcDqE9h1TW5lKGFDjfB3cijIHgnWrwIEx
 7fKsWIk/ZrOFY4UXyZdzQsAgnombEecB2QAVPGNT1bhOZADk8cOPUvy5rrlNYjoMfwnI
 pxsqafRbHAup9WxMF38ok3XsT+/jGLXsSx2R6KFPSWDwEvWT25NVdAgH3mbYxmAIFeSw
 symA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=G+8/kOSI
Subject: [Buildroot] [PATCH 13/27] package/thrift: afirm host-boost
 dependency for host variant
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

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/thrift/Config.in      | 1 +
 package/thrift/Config.in.host | 3 +++
 2 files changed, 4 insertions(+)
 create mode 100644 package/thrift/Config.in.host

diff --git a/package/thrift/Config.in b/package/thrift/Config.in
index 2fa04705a8..dbe7585ea3 100644
--- a/package/thrift/Config.in
+++ b/package/thrift/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_THRIFT
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_HOST_THRIFT
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_LIBEVENT
 	select BR2_PACKAGE_OPENSSL
diff --git a/package/thrift/Config.in.host b/package/thrift/Config.in.host
new file mode 100644
index 0000000000..5e92365587
--- /dev/null
+++ b/package/thrift/Config.in.host
@@ -0,0 +1,3 @@
+config BR2_PACKAGE_HOST_THRIFT
+	bool
+	select BR2_PACKAGE_HOST_BOOST
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
