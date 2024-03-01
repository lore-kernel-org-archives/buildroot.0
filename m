Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB51C5475B
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 18:38:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FA17832B0;
	Fri,  1 Mar 2024 18:38:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bgNkbwWYX0JG; Fri,  1 Mar 2024 18:38:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A98FE83A9E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A98FE83A9E;
	Fri,  1 Mar 2024 18:38:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B52A11BF354
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 18:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F138983A9E
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 18:38:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0qgUj1KztswL for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 18:38:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AD115832B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD115832B0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AD115832B0
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 18:38:01 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-33d7b8f563eso1436822f8f.0
 for <buildroot@buildroot.org>; Fri, 01 Mar 2024 10:38:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709318279; x=1709923079;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qQzeJwza2v4bpwDaxK4yODoQlCDXDKxXQwfF6R+pJkc=;
 b=CVbpum2zQ5srPGEtrIStMQhRjYlY1BjyoSLHoLfHySij1wawvzs93pp7KmuxspS/dz
 FrIQdiVlQuoJ2phvNPRP4Xn2obVuoR99oy2MCaK9PJv3mmJLX06i992d/g4dZq/TYMHw
 pXm6o1UwI8+YaepemTmm1PufjCgFRydVxYE6MKH7PMZV2jRWKaRMZAir4BwIoItbMW8W
 /4j8lyNBJxoD7S6xcDU+CPcIuL2pcPvPFD9Z55YVwcpa3PjO2b2bdVt95QCG6eXXqPEV
 9phVsyzSyDh1L7LRUAq4MCXoFjrJ7FTkeq9bnFrjOqVBGXdhsmh96TV9zCRdZ0fc/5BI
 g14A==
X-Gm-Message-State: AOJu0YwFBWo+dzn+I90O06rtb9qXbssiT/BnpYeYuCPydYd2Er/my9I7
 scDMwy4lxr80DfTNe+J/y8ARCHGz8ZKKW24gq6P3PlBaTEsaxsE70SQF/i/3
X-Google-Smtp-Source: AGHT+IHuWLmkHNK5iCdjacBDCijZepBtXE8/0ByDBmWfUa+l5aZVOBOE7kjqfIxIds0rSyJ7WTHiaQ==
X-Received: by 2002:adf:f44b:0:b0:33e:c9f:1037 with SMTP id
 f11-20020adff44b000000b0033e0c9f1037mr2145832wrp.30.1709318279053; 
 Fri, 01 Mar 2024 10:37:59 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 p8-20020a5d68c8000000b0033d87f61613sm5189187wrw.58.2024.03.01.10.37.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 10:37:58 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Mar 2024 19:37:56 +0100
Message-ID: <20240301183756.811532-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709318279; x=1709923079; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qQzeJwza2v4bpwDaxK4yODoQlCDXDKxXQwfF6R+pJkc=;
 b=YhTYMqkrIwGiFwdHF9FSgtIPY1XMsEAiTBExsfh1Fm8V5CbkOYp7J0XJuzI7pvPi5t
 qmJvIW84gRdXUXUHn5Cv2K4oP0fLDIJWSx82balEGLdHCTT9FghQLFZiufgVJYxhksgR
 ulXUQSMLqjT/6qTpuE6qn0VVdYVCQRNpeWqxpR7gIJsNIpdBRxCLykOyXL/M9SEKEEvW
 R6BtE0o5X04f7bWCf+5A0sXc8+BCwXpAIKIiXfqES6gWjPSeugoh2VCPfj/+cZl/f+fq
 KaK/+X8Rkw+z3VyBNkmCtwsDiX9fqRf6MTQ0ngJwfTc+aDLNSRAZHHs6aXtU/HUXqNuP
 4PvQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YhTYMqkr
Subject: [Buildroot] [PATCH 1/1] package/newlib-bare-metal: update
 NEWLIB_BARE_METAL_VERSION
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
Cc: Ibai Erkiaga <ibai.erkiaga-elorza@amd.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update NEWLIB_BARE_METAL_VERSION to match version retrieved on
https://release-monitoring.org/project/13816

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/newlib-bare-metal/newlib-bare-metal.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/newlib-bare-metal/newlib-bare-metal.mk b/package/newlib-bare-metal/newlib-bare-metal.mk
index e1b46fbc88..f27da4284b 100644
--- a/package/newlib-bare-metal/newlib-bare-metal.mk
+++ b/package/newlib-bare-metal/newlib-bare-metal.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-NEWLIB_BARE_METAL_VERSION = 4.4.0
+NEWLIB_BARE_METAL_VERSION = 4.4.0.20231231
 NEWLIB_BARE_METAL_SITE = ftp://sourceware.org/pub/newlib
-NEWLIB_BARE_METAL_SOURCE = newlib-$(NEWLIB_BARE_METAL_VERSION).20231231.tar.gz
+NEWLIB_BARE_METAL_SOURCE = newlib-$(NEWLIB_BARE_METAL_VERSION).tar.gz
 NEWLIB_BARE_METAL_DEPENDENCIES = host-gcc-bare-metal
 NEWLIB_BARE_METAL_ADD_TOOLCHAIN_DEPENDENCY = NO
 NEWLIB_BARE_METAL_LICENSE = GPL-2.0, GPL-3.0, LGPL-2.1, LGPL-3.0
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
