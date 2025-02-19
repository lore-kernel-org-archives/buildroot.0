Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 261B3C021AB
	for <buildroot@archiver.kernel.org>; Wed, 19 Feb 2025 08:51:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7240857BF;
	Wed, 19 Feb 2025 08:51:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D3vjYcXSkL49; Wed, 19 Feb 2025 08:51:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC6CC857B9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC6CC857B9;
	Wed, 19 Feb 2025 08:51:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 06B12127
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A72CB503AC
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id erzlgQtdicar for <buildroot@buildroot.org>;
 Wed, 19 Feb 2025 08:50:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7EA3F503A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EA3F503A3
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7EA3F503A3
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:49 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-38f2f391864so2874873f8f.3
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 00:50:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739955047; x=1740559847;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MJ9ZoPUScJSiOeWHME9auLqy4YB/FsNld3u6A9b43Bc=;
 b=s0fj1qQor931AqtT2Md6X8O/tEK/WRuPj6M8Ckgct4PCIO+hYTIsswTkFAZ02w5LFr
 zOfQI4uyA1kVBeEPvWa6fsrT/E4ICjH3xirmLj0P9o9KiaU39m+t6ujCAuLwRN36Hm2B
 DneSRagOKWz6eGUyk6B1Nt3dh+6v+88gLQpC6TMWVbbuqWjcJvhlBekw7YqNgScCVLVM
 GPiDDuyyXKr6ttGbkUPc96MeaUZhgIWTk75osJSvcbg35Ew1BuYuwxOQehm2bPtjS3Wg
 ENKEPLH8HjrOP7cURGJRTm67q+Z6Yjmo75G42w0dLqVwro64GuZL+sbxvEyR8ikkA22I
 mzNA==
X-Gm-Message-State: AOJu0Ywo8++kyjgwn7CRYFjvOsFeCL9Vtjz9mm8UQd/YodVKuae6E5yZ
 yvTEU+IRcsrmM8SVyHO/g7nPkWTnTqqoak/sh6u+0hPGHWs4uWrRU6k2Aw==
X-Gm-Gg: ASbGncu2TWWswxzbhFeIH5dINlVEK4zwCbnPcE0m05fy/FG4luC5SCDQK6CZCPzC04x
 Gqte5ZtCF1iph+1bZeKdq4y2gC/DsFWkW2ErlsW/9u6gwYISAI+YZcCbDXJQyL8Jx9YhVvIcM/0
 7Yr1UmBF/s6eh8f9tvR9CAmhjGcK7pZVHYm+WXr3TCCfviELLSs8ZEDTLJ4p1vTnWZWycKyl4zu
 DQ/R1CxrQRGut+SYMnkwabfMLcnYQpDTwroI4nOJJHSHhmjQRRXq+Xm6m02jGIb2pe7eVetglRw
 XxrSBcY7KWbkQaxJ+WRWlVgCqA==
X-Google-Smtp-Source: AGHT+IH6rTd9WrPv2SQ35mUxMd8Fz+OqVz0FL6pPE4tmziw/fNQA7WpGCdqKyVrHNAVTyEJAZA9vmQ==
X-Received: by 2002:a05:6000:1546:b0:38f:2856:7d96 with SMTP id
 ffacd0b85a97d-38f58781d20mr2052828f8f.1.1739955047191; 
 Wed, 19 Feb 2025 00:50:47 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d5e9esm17517399f8f.61.2025.02.19.00.50.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 00:50:46 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Wed, 19 Feb 2025 09:50:22 +0100
Message-ID: <f708f2a12cb9c4a8dda9309a92513c699da7d4ec.1739955023.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1739955023.git.yann.morin.1998@free.fr>
References: <cover.1739955023.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739955047; x=1740559847; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MJ9ZoPUScJSiOeWHME9auLqy4YB/FsNld3u6A9b43Bc=;
 b=VY8X/IBbOa8Uj08nbMfsnnZIBZCkeYCuzabPAmpMdj8KxlgvAyrYJ/NbHbl4F6Zhls
 oESzUsJ4E/GAyP/S6V6d5/JZ0V0WjqSI4yAlgMPkqKJ2A4CyDSAiGGyUgERzUlz7l7PO
 jjhX7GtMTyPdzO08n/is9NzDXw/ipUFX2JAjbXFNeVsDiV++dvCouBbCsfLRsJUO+z4M
 XSHpH7tnCfr+83gQ/Wvfqy8UsuYJ/VZhvI1rTx7B2aMFXTDaOhqbtx5pnzHXwRfKxM3C
 xRXVlgCsKzWXMv5FSxB8MYglrDLRj9Iurk1LtjBzlKFXa23ljG2Fn7VzvVMB8+W1RZGD
 ersA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=VY8X/IBb
Subject: [Buildroot] [PATCH 07/27] package/pulseview: needs some font,
 and fontconfig support in qt5base
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

pulseview needs to render some text, so it needs "some font".

It also needs Qt5 to be able to locate and load fonts. This can be
achieved at runtime, by setting the QT_QPA_FONTDIR environment variable
to point to the directory containing fonts, but this is not very
practical.

Instead, it can also beachieved by adding fontconfig support to Qt5,
which is in charge of actually looking up and loading fonts all by
itself. This is the way we decided to go for, as it makes things "just
work" without any trick.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pulseview/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pulseview/Config.in b/package/pulseview/Config.in
index b1f9dc25d7..94196f631b 100644
--- a/package/pulseview/Config.in
+++ b/package/pulseview/Config.in
@@ -17,11 +17,13 @@ config BR2_PACKAGE_PULSEVIEW
 	select BR2_PACKAGE_LIBSIGROKCXX
 	select BR2_PACKAGE_QT5
 	select BR2_PACKAGE_QT5BASE
+	select BR2_PACKAGE_QT5BASE_FONTCONFIG
 	select BR2_PACKAGE_QT5BASE_PNG
 	select BR2_PACKAGE_QT5BASE_WIDGETS
 	select BR2_PACKAGE_QT5SVG
 	select BR2_PACKAGE_QT5TOOLS
 	select BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS
+	select BR2_PACKAGE_SOME_FONT  # runtime
 	help
 	  PulseView is a Qt based logic analyzer, oscilloscope
 	  and MSO GUI for sigrok.
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
