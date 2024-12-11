Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5356AE77180
	for <buildroot@archiver.kernel.org>; Wed, 11 Dec 2024 09:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B2D540325;
	Wed, 11 Dec 2024 09:47:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GM1BP6hRCb7i; Wed, 11 Dec 2024 09:46:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DAAF40877
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DAAF40877;
	Wed, 11 Dec 2024 09:46:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 241D9E11
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 09:46:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 121DC80CA2
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 09:46:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lfppAPradpfM for <buildroot@buildroot.org>;
 Wed, 11 Dec 2024 09:46:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 277A780CAB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 277A780CAB
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 277A780CAB
 for <buildroot@busybox.net>; Wed, 11 Dec 2024 09:46:54 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-385e06af753so2863891f8f.2
 for <buildroot@busybox.net>; Wed, 11 Dec 2024 01:46:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733910412; x=1734515212;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R9Mnh3gpOO89fxkiCdneYBlP3Ljhx9B1+7dZfz8YqXE=;
 b=umCtb20uTwVq5Bk49XGvfUnZ3ya9ToKSeCpZBBagLJLvBTGSlE4JMNkKVLMHz5238h
 xvoq1qezKcy4hjeq1mrjAApaS/Sca7Ua2untffWfeUZPnvqod3o7Ectt22fEGp1/YD5T
 9l92BIKRic2FuvhQ5HWKwryQD+cDd9dXnx1A5kIFogwiRR/2tjWWjIqGLmMTtm+ONV33
 Pfx05kUdemLS63DZQ4C+dnU1dVAmlBj7k1iAGH7fG0TXHfk0VXiAZ/+lPu/3969JM/in
 UGcgUe1OJ7G3Fn872Bou7wP82txFv9NjXk98fXLLVxwDMUh1uJPpmStvzx/O5e96arbl
 WiDQ==
X-Gm-Message-State: AOJu0Yy1aL+tyMTTOd8YN3JrNVf9Sx8cc8kSslusA/LdARLZqtIT0XOm
 y9sU5/5Uq5jRh4cwMPh62MyOcrwmstij2XtiJId1mJQCxCPoBlvYudSqMNQiZr2hRQEvP67puIt
 klQ==
X-Gm-Gg: ASbGncvDfGM3R1XeAaK9EcG5TfLRWVU5tN06gPHWZ+4bOoopym4i3haU/dPGRTmN9tJ
 15x4+dBT1YwwyQbL9pLZvSIYes59FetDVTAjOn49CHXIhHCZ7kzSYyV6YHg69VFJOvGYDqpUWGq
 EmIZ2Oq6p6syt+Cl4hjlAS+4rvUMdRkE0Da88yBqOJzoc7IZhWeNn2Jqh/Tp46FUi0fsvQKHWVH
 +2wDvwS1k9tLhP0hFrO8sPrVkd7lzCSRG9Ts7spXYNynQ/HEdPfbIWhDZDmTjmxJSMat/xsB/D4
 dPTFjeqQZGBQ
X-Google-Smtp-Source: AGHT+IHEmP1zksErSwC7a6e6G8+ZwU1P03FaxOlmuBWGXMQxjFYs00W4bazgjthdb5lL7Fyr0UYtcA==
X-Received: by 2002:a05:6000:a1c:b0:385:fa20:658b with SMTP id
 ffacd0b85a97d-3864ce97271mr1964020f8f.24.1733910412090; 
 Wed, 11 Dec 2024 01:46:52 -0800 (PST)
Received: from vm-2404.. (75.184.66.37.rev.sfr.net. [37.66.184.75])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38782514d35sm892518f8f.74.2024.12.11.01.46.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 01:46:51 -0800 (PST)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 11 Dec 2024 10:46:38 +0100
Message-ID: <20241211094639.968420-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241211094639.968420-1-francois.perrad@gadz.org>
References: <20241211094639.968420-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1733910412; x=1734515212; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R9Mnh3gpOO89fxkiCdneYBlP3Ljhx9B1+7dZfz8YqXE=;
 b=AHWODLW3ZI51wc9DRnH+Pi98oujcodxZU7DAMw9EZlntoJ0ystNfHmrE+wvdXMYewC
 hlxpQkv18EvUaZg/6NEt9Z5/KnjAmB/bJ04KlPk2GCqR8v9XbQkuqCNOYkvn5R0w2K1N
 l0SM4VmkIT5HqaUAv2jllIszXNe71XAlA8urKr1Rc4J3knf10JVjyhFC3lCpQnv8HQil
 NI0/mAvF4Ccbmhqe8hhh9ZcpIt0L2v0xpuIz36pZ91p/Ry2oo3OlHu2sYmnnRs/hghZ0
 +mWWtHCp3Uof1WV6NXt3SIcIkX2TES/vAFSgmyHB11Rmhe32zuamp1y6wMgpyWSSZce9
 zGYg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=AHWODLW3
Subject: [Buildroot] [PATCH 2/3] package/luadbi: bump to version 0.7.3
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luadbi/luadbi.hash | 2 +-
 package/luadbi/luadbi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luadbi/luadbi.hash b/package/luadbi/luadbi.hash
index e142f5e62..992de9571 100644
--- a/package/luadbi/luadbi.hash
+++ b/package/luadbi/luadbi.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  9ebbbaf4ea1f48628341e9ff3c1de10a57200c02453734f41b8016b0fc7b4956  luadbi-0.7.2-1.src.rock
+sha256  b1b6abd58a7b9cb51ccf67be903d5cbace9721c35dbf799379ffd57f45b40f12  luadbi-0.7.3-1.src.rock
 sha256  988d73cc2e56f972e8177091e084855fc2904d0fafcfe5c4e02864f25ce2b928  luadbi/COPYING
diff --git a/package/luadbi/luadbi.mk b/package/luadbi/luadbi.mk
index fbae6b319..6f617fdc2 100644
--- a/package/luadbi/luadbi.mk
+++ b/package/luadbi/luadbi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUADBI_VERSION = 0.7.2-1
+LUADBI_VERSION = 0.7.3-1
 LUADBI_SUBDIR = luadbi
 LUADBI_LICENSE = MIT
 LUADBI_LICENSE_FILES = $(LUADBI_SUBDIR)/COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
