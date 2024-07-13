Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93684C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 19:58:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D37140148;
	Sat, 13 Jul 2024 19:58:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vYstcpUdKUTe; Sat, 13 Jul 2024 19:58:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 317DD40498
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 317DD40498;
	Sat, 13 Jul 2024 19:58:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3A6DF1BF3F6
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 19:58:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25821813F3
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 19:58:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h65sHo8YBa6K for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 19:58:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E7BD8813ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7BD8813ED
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E7BD8813ED
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 19:58:23 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-36798779d75so2715380f8f.3
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 12:58:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720900701; x=1721505501;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eMeA4KwcRfUjT7WvM2WLumRMVMs6L0y0zF5yqwXFNrM=;
 b=Ty9EJx8kZWlQAyr7kBrRSiQpNwRxbzBJ04G5Ffy9yALqC4VcFtCVbzoQQEBPNz7AiY
 4IpYuPQNO1aongsWLzbsRqA0DHYv16hETuv5+mZsA9io6CQkoVbjOLM3Ey94LbsmoK2T
 yhmWwSmVl8F6w5QdQNuWXyWGlid9o+GXsr0aBtZUkYlHcHZc4dLxi5Jz8kgidTApLpq2
 m5uzEzAHJJiW4bJ1lZSEAbQujx4Ni1E40vApNTRI80cJjxgnGhheeUkQnS+3Q+92ySLD
 rjRj4xt3K8NhIo3z8WzibDhDFkQH+DAcbyDuhOEESD8nNKQKfNeqW+SRY+99DUC1qF9Y
 HXZQ==
X-Gm-Message-State: AOJu0YygJsiw/3Vab9dLwdm2jvw7vmMaPCuzRAee8/kpThNzpmd4jhQa
 94daTuCSi8Scv0sD7gsUfY7b28ImzeY5XHUjLFdV2dJee/6jJFDeQPCHkw==
X-Google-Smtp-Source: AGHT+IFagVsae7SK7Z7DYuOwlg6ctBKwkQLOmJ+nUtVdykriSBePSsskEOjKMPYaf4Q18tEdIXytqA==
X-Received: by 2002:a5d:47a6:0:b0:367:927f:980e with SMTP id
 ffacd0b85a97d-367ceadc88bmr16073882f8f.63.1720900700767; 
 Sat, 13 Jul 2024 12:58:20 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680dafb9aasm2260312f8f.67.2024.07.13.12.58.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jul 2024 12:58:19 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 21:58:13 +0200
Message-ID: <20240713195813.560673-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720900701; x=1721505501; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eMeA4KwcRfUjT7WvM2WLumRMVMs6L0y0zF5yqwXFNrM=;
 b=g+WYWeceXzmvtjjwYBln8V6KLl1DaSvUu8yHFsf6gJ/4bN94FjhoB2zUgm+DxnQL4E
 xb942jpiNoj6WKxrQ5AkrrYUE80sWcGO976vAsdtn1heGl/VmJke+hRXi3hB2pS7fuC+
 MJWIC2HaBVJZ+DAkEWY2xB9Bf/YLqMTlcCEcCrI1MSgees+/0aHa+q2p3LCejdyJmEKy
 x7hu2b8KAj5yRQzR1tGfgtNkLuRJjTUcMkF5LMtSamYrbOWevNF+qICIQ4m/XCwZJ1kw
 HQpFdaSAmbKbifM1BFJbBqvq5LE28ysbWlKnUw3QsSMyefbrF97/2CYcY1JBP/AFYBg6
 ccXg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=g+WYWece
Subject: [Buildroot] [PATCH 1/1] package/libopenmpt: add
 LIBOPENMPT_CPE_ID_VENDOR
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
Cc: Julien Olivain <ju.o@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:openmpt:libopenmpt is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/05979DC5-95A8-40BD-9102-402B69F5AFAA

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libopenmpt/libopenmpt.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libopenmpt/libopenmpt.mk b/package/libopenmpt/libopenmpt.mk
index d07dc1c2fc..c52f5b04c2 100644
--- a/package/libopenmpt/libopenmpt.mk
+++ b/package/libopenmpt/libopenmpt.mk
@@ -9,6 +9,7 @@ LIBOPENMPT_SITE = https://lib.openmpt.org/files/libopenmpt/src
 LIBOPENMPT_SOURCE = libopenmpt-$(LIBOPENMPT_VERSION)+release.autotools.tar.gz
 LIBOPENMPT_LICENSE = BSD-3-Clause
 LIBOPENMPT_LICENSE_FILES = LICENSE
+LIBOPENMPT_CPE_ID_VENDOR = openmpt
 LIBOPENMPT_DEPENDENCIES = host-pkgconf
 
 ifeq ($(BR2_PACKAGE_LIBOPENMPT_OPENMPT123),y)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
