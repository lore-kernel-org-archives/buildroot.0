Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA55C36002
	for <buildroot@archiver.kernel.org>; Wed,  9 Apr 2025 20:03:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEE606179C;
	Wed,  9 Apr 2025 20:03:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eCAFSh5xAMZY; Wed,  9 Apr 2025 20:03:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC7A96178C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC7A96178C;
	Wed,  9 Apr 2025 20:03:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E650201
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 950AA83F64
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w2D8P5BgMy9b for <buildroot@buildroot.org>;
 Wed,  9 Apr 2025 20:03:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DF02E83F5E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF02E83F5E
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DF02E83F5E
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:49 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-39ac9aea656so6108327f8f.3
 for <buildroot@buildroot.org>; Wed, 09 Apr 2025 13:03:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744229028; x=1744833828;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Dc4JmzxIy8Gp69Mlm+lkIBl3hYCGV2/oSVmvqZVguQU=;
 b=aS1acekvwtDXa1hb9XvCA9xkLo//Io0aJjLe9R1vaKV46NoA/Xklf/38hzlRt3s10R
 PlBdCpVAxkEwH9rfR04MxKfOjZEh11EKdJhQ2MG7bhk6h7yg4zLu8tB1zChpjNkOVDcY
 HH9x9gQglP7X3AzUuUFPVxUItGeTlPmrwfbdWH73qT3VqqFC/f4gmTwxDJkzlhuT+sXf
 bRUsrQTCk6riEH5Qteu7HTBedmSUx0Yz2XSsw6NMWmd6r4eWJJvIbourtkg62aub4xFk
 C7lp9tZVUWjSoVncVTc9zyuBEmtUpvGEWg1a1nQuGQIGubYGbQIkl3fhgp2WRoKSylvS
 VlJw==
X-Gm-Message-State: AOJu0Yw8thrXBNydinsyZTvu9hbFMsZfTeyd9Lvx/1I/wCWdNPHFfQj0
 Syv/fNhB4D4qwObSjS9d4tJ7693vh3wXZ+j666o1Ua2r12Q9t2Vd00b69g==
X-Gm-Gg: ASbGncvFUhPZ350ieXNipRUm8k2meZ3jb/v6hTW16dhNPdaxFBXpgSLmlT7yc/sRRuA
 1DQb08dcnMjf35Dp0EsUMV1sfFKCZcdFibPmingC1rYRugrnhxYCI6l1NpIJlDdE36AFHT2YulN
 J7zOd4Qzc/gjMU9gp1jYrXU1ScPfmOEFhE4+m9t5BZsYCBeBZgiog6qvd2xxBFkTHs3ZtNK+xYR
 T20QKDPC1JE+f9e0Pf+tTViefA8d1RevlBZHfXEKqsQp8SvkaBCFJA/AhCUASdxD/Qvt49UGYjt
 CzCiX640AheCMDTPquAZk1mMtjtdFZSbEclA7MYS51Hd2pyeSpg=
X-Google-Smtp-Source: AGHT+IE2YsimD/CYOU2jKneSn54BkgHA3OlIA7RQlqiRVEOK2yyqOeYTzliKipTOrqE3ZCEp68WJTA==
X-Received: by 2002:a05:6000:420d:b0:39c:1257:cd3e with SMTP id
 ffacd0b85a97d-39d8f4fda81mr38561f8f.56.1744229027809; 
 Wed, 09 Apr 2025 13:03:47 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d8937734esm2526113f8f.32.2025.04.09.13.03.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 13:03:47 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Wed,  9 Apr 2025 22:03:22 +0200
Message-ID: <37fef255068496e737e9919f66f774c553c37462.1744229017.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1744229017.git.yann.morin.1998@free.fr>
References: <cover.1744229017.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744229028; x=1744833828; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dc4JmzxIy8Gp69Mlm+lkIBl3hYCGV2/oSVmvqZVguQU=;
 b=DKkWwlDtYKEUXDjk4iZiaw74ZToWddmgFCyv2HASv7pnEDdr2jGOzF+rkmXHGrQJhI
 +7QHqurUKKv67PHE69oF1QIdqveRTzttGS1R+UCadtxyusG/8DUglxMcxGuPdFlMZG5x
 Q5q60CtJhJYwv4AgvYNWkaqjo5H4lPqMsuq0Myy8WOqDW+ylt4vdB5LraI4XIobdy/Lf
 yeQWIQ2FI3BxnQCMRGNbiSc1VPQggzC6xS6W+dxO5Yl5rsgiohAmFW4z/XgmlqpAPJyh
 O2TLA8DllPWCW8JM/IXOI5z9YQ1ehkAkFJU/6zPIlX4EjESZn0WfHG/b2Kyx8cE4iY2D
 xd9Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DKkWwlDt
Subject: [Buildroot] [PATCH 07/29 v2] package/pulseview: needs some font,
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

Instead, it can also be achieved by adding fontconfig support to Qt5,
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
