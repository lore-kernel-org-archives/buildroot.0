Return-Path: <SRS0=JV6j=MP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBFDDC4338F
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 20:34:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D85F60F25
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 20:34:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7D85F60F25
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A7E84147E;
	Fri, 23 Jul 2021 20:34:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NSWdzrY31QBZ; Fri, 23 Jul 2021 20:34:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B135406AF;
	Fri, 23 Jul 2021 20:34:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7EF621BF3FF
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 20:33:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6AF4C83B5B
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 20:33:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SHxp37jX0E59 for <buildroot@lists.busybox.net>;
 Fri, 23 Jul 2021 20:33:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 65BC283B60
 for <buildroot@busybox.net>; Fri, 23 Jul 2021 20:33:03 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id b128so1475450wmb.4
 for <buildroot@busybox.net>; Fri, 23 Jul 2021 13:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P4MNATNa21Fs5CxWEkZO6HaUAYi43f7vrg3A+U7F0Zg=;
 b=qMqzeohI1k8qaVfuva/KRcPpxem0FRHkJBp30dOR9+aQ/wsSPw1ARZ8okV9AN4XeGS
 V2jMnFv3jU7Of+hdHfCc1oxLf8q0WV0CYIobIrVRrjgaG8cHIGTX0/XOx208SVuP/r4K
 rnIVlLhNpZlxPfAJm1OHEh8N4V/dDL1cVva1TOLi+Ite8TBHJf3I+QPXzMmHyPT3OJkb
 qHemGHRSrWC8hVR/sihU8Po9lZBlB/FHp9W2w0gaJyFgQB0GTMZaR3jLUz43CfvOLlRg
 /dq7C8kElnhpdFWmfIK9lsX3keN2qzCSRA6Cx4Cgqvc31rHcJ3jTAbXc/qrwO2106dLd
 1IBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P4MNATNa21Fs5CxWEkZO6HaUAYi43f7vrg3A+U7F0Zg=;
 b=VJEArDc4I1SH5jFZY0Hqz8HwS0dCDz9jphBd6HJNZE0lBVH9gT/aNoWV9iTgqxcz+H
 5ls2DHtRg2BrLxCHP/rUgfcnfyr0R1SrGqySCiAMrch6LlZwb4KpTFdJwWlJFVQQ8qmD
 mEbK/PxrOHKs56w/k4TTGDtZhuM0OIUe6o0xM8Te3MN41JaUUQvvult7eLT4UlpgaCch
 ysjrA+iFjnLcz2hfQdlJsuibX0hLSx7rqHPXN7eIYuo4WbJZUFOdjbbwQcwOy+I98y7X
 kHdOXFcUkIHk0kJ+l9AAvjUICv4s2Bj3LmkNjD6ySWSvcYhhIQBkR0fAiXc4HS2XYanq
 LQrA==
X-Gm-Message-State: AOAM5302O6dWjb25C+vWW9vI08feUaX+c92eXVGnW7f6K0yFzSHBmSwi
 MtsrRZ448//RthP1cUo9bM4OOwSgVxY=
X-Google-Smtp-Source: ABdhPJyqcUIHDIh7GFkPbOS4YUzBj6WRgNBEa1sbA82W8gE4gq6C/9nLcRmonnNzCRwVtN8rvONsNw==
X-Received: by 2002:a05:600c:4f92:: with SMTP id
 n18mr16162688wmq.134.1627072381501; 
 Fri, 23 Jul 2021 13:33:01 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id n17sm2128422wmo.18.2021.07.23.13.33.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 13:33:01 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 23 Jul 2021 22:32:42 +0200
Message-Id: <20210723203242.2531909-9-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210723203242.2531909-1-francois.perrad@gadz.org>
References: <20210723203242.2531909-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 9/9] package/perl-net-telnet: bump to version
 3.05
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

diff in README:
-    Copyright (c) 1997, 2000, 2002, 2013 Jay Rogers.  All rights
+    Copyright (c) 1997, 2000, 2002, 2013, 2021 Jay Rogers.  All rights

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-net-telnet/perl-net-telnet.hash | 6 +++---
 package/perl-net-telnet/perl-net-telnet.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-net-telnet/perl-net-telnet.hash b/package/perl-net-telnet/perl-net-telnet.hash
index cf1def6a5..c6dc0ca60 100644
--- a/package/perl-net-telnet/perl-net-telnet.hash
+++ b/package/perl-net-telnet/perl-net-telnet.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    d2514080116c1b0fa5f96295c84538e3 Net-Telnet-3.04.tar.gz
-sha256 e64d567a4e16295ecba949368e7a6b8b5ae2a16b3ad682121d9b007dc5d2a37a Net-Telnet-3.04.tar.gz
+md5  c8573c57a2d9469f038c40ac284b1e5f  Net-Telnet-3.05.tar.gz
+sha256  677f68ba2cd2a824fae323fa82e183bf7e3d03c3c499c91d923bd6283796a743  Net-Telnet-3.05.tar.gz
 
 # computed by scancpan
-sha256 05beca683093827706ef45a4958bf23bcd91990e0beeb0b098f97c661478c90d README
+sha256  22d0a3343b46c7857cd7d06cb37fe437d467df71aa5854af515374e1e8bf6c53  README
diff --git a/package/perl-net-telnet/perl-net-telnet.mk b/package/perl-net-telnet/perl-net-telnet.mk
index 0b9cce0af..ec3c02216 100644
--- a/package/perl-net-telnet/perl-net-telnet.mk
+++ b/package/perl-net-telnet/perl-net-telnet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_NET_TELNET_VERSION = 3.04
+PERL_NET_TELNET_VERSION = 3.05
 PERL_NET_TELNET_SOURCE = Net-Telnet-$(PERL_NET_TELNET_VERSION).tar.gz
 PERL_NET_TELNET_SITE = $(BR2_CPAN_MIRROR)/authors/id/J/JR/JROGERS
 PERL_NET_TELNET_LICENSE = Artistic or GPL-1.0+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
