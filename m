Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF4DC369AB
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 19:56:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06F85610F2;
	Tue, 15 Apr 2025 19:56:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9gZlTqSZazB8; Tue, 15 Apr 2025 19:56:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FFAB611D7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FFAB611D7;
	Tue, 15 Apr 2025 19:56:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C5BDF109
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 19:56:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B3694411C4
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 19:56:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dby54exso5WU for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 19:56:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B18EC403BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B18EC403BE
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B18EC403BE
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 19:56:17 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4394a823036so59739765e9.0
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 12:56:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744746975; x=1745351775;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Avyp2IMTo3bmPRrcmtlne5do3DqtWnXrKIBeSIxbEQ8=;
 b=KHZRu8zz2KliOVX4spS82hBfdKHiucr4NLccWcfdhQ8Xyrf1zmQWXioHwUfKvSon+Z
 PgXmpQzEU4I/XRuAFtPoGXOn5iwrqwWgQGSkCxp/G6c3A3NA5xt0RFREnrYvwGXVORJ0
 d1bBtLJr+lY2W8ig4gY/8B0to1FkCL9sOyizDFweaUw5er8ItigXFvWNPI24Y51Az/3O
 h3NXd33uPQOF4R7Mqhs+k3kDo1oUMCb2K2jCdxy/ljqyTVTYIKUjChgGip6HyMdEUBnc
 CtRamybKhQIewdY1O4AwftShZluMy4kAD2fqptIA660P/6OUwGAoxpG1SltgG5ZYC5Kr
 KbbA==
X-Gm-Message-State: AOJu0Yz+f5D2ujM+DRpLf103AfGlEYEboOKUxWwpiHcByFhsnFuIwxT6
 GnzfHoVwhtk+GDfWEKxx4eHp76GhyWSOyIFi3ibtuGJoAbzC/PfWVOB32Nw2+rDTLlu2kZtVca6
 y
X-Gm-Gg: ASbGnctPCc+okmtRrLpQCi2++ndAFVV4xudsQNU3T5is3vbl2gkiIbb0PTqTM+Z7IcI
 XYoF3vyBqqSaomz3wg9FPiH1LxpuWBj78bwjD79KAx1vxPDaGE+82hPlqYFmKWpL8Y6Zt2I1eeI
 51/n1wvEw0g8iRWJK5Ir3e2Mtjg2g5w7GkFGvbXfg8pmDLi1K7LQW1vsh4J/bvmETdKEiHJuLh6
 MgDT4UpA4kWXtUfKnJcuayEs44LOHrCv3RwvHQdzWkSQpoLguE8L5f5Uv8aFlG3Q/jQsEECwEWu
 p+LYCA88YRuyBBUeR1+D2OwHmXOLScmS3rL+4makFXlfHTNZmAFThVtFA/7WEI/ieA==
X-Google-Smtp-Source: AGHT+IHCxu5P8a6aKuUpCeCt6iM7fXPaTTj+OjMMI92kBIE9kGAAB6Y0eaHBubb5wga4qlDy4oQz6A==
X-Received: by 2002:a05:600c:a4b:b0:43d:49eb:9675 with SMTP id
 5b1f17b1804b1-4405a0f54f8mr2086295e9.22.1744746975470; 
 Tue, 15 Apr 2025 12:56:15 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.61])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eaf447777sm14957366f8f.100.2025.04.15.12.56.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 12:56:15 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 15 Apr 2025 21:55:39 +0200
Message-ID: <20250415195547.199428-7-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250415195547.199428-1-thomas.perale@mind.be>
References: <20250415195547.199428-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1744746975; x=1745351775; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Avyp2IMTo3bmPRrcmtlne5do3DqtWnXrKIBeSIxbEQ8=;
 b=c3/GRO5l0Y2e2LsAGMCLR82qRn+vEPNWhyxhqlWNc6oL609PMcohPpdcNyAKec3LhC
 SaR19dEhcHuB5PZ3SLr6TeWPaOKe9cqTWGhPuu1FiM3vVpVLYFPax/7fSjsIKlDva471
 QQpm0ZwUi+trTeGQT6+KCdzyzpoh5VSjMhg6qOMOsb2gIotkYsepjLBlxNi4nqJ83dUP
 /h+IRyg/xg225YbeFXtefvCsgT/PE3LEPXIX/ekRAhB5Y1hoUbga9lTdysPn0tHfexr3
 Cl8eF8jgVQGzCULIwz80Bhq6SSu32VRtwyRGKHfCEClrbDOSJ4Zjs6/zYrzdfw7TcTEC
 ycKw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=c3/GRO5l
Subject: [Buildroot] [PATCH 5/7] package/pkg-perl: support PURL generation
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Perale <thomas.perale@mind.be>,
 Christian Stewart <christian@aperture.us>,
 Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The PURL specification for CPAN packages follows the coordinates from
the following:

https://github.com/giterlizzi/perl-URI-PackageURL

 - The PURL type is defined as 'cpan'.
 - The PURL namespace is the author of the package.
 - The PURL name is '<pkg>_DISTNAME' variable

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/pkg-perl.mk | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/package/pkg-perl.mk b/package/pkg-perl.mk
index 1ecf31eff9..1e10d21274 100644
--- a/package/pkg-perl.mk
+++ b/package/pkg-perl.mk
@@ -193,6 +193,30 @@ define $(2)_INSTALL_TARGET_CMDS
 endef
 endif
 
+ifndef $(2)_PURL_TYPE
+ ifdef $(3)_PURL_TYPE
+  $(2)_PURL_TYPE = $$($(3)_PURL_TYPE)
+ else
+  $(2)_PURL_TYPE = cpan
+ endif
+endif
+
+ifndef $(2)_PURL_NAMESPACE
+ ifdef $(3)_PURL_NAMESPACE
+  $(2)_PURL_NAMESPACE = $$($(3)_PURL_NAMESPACE)
+ else
+  $(2)_PURL_NAMESPACE = $(notdir $($(3)_SITE))
+ endif
+endif
+
+ifndef $(2)_PURL_NAME
+ ifdef $(3)_PURL_NAME
+  $(2)_PURL_NAME = $$($(3)_PURL_NAME)
+ else
+  $(2)_PURL_NAME = $$($$(3)_DISTNAME)
+ endif
+endif
+
 # Call the generic package infrastructure to generate the necessary
 # make targets
 $(call inner-generic-package,$(1),$(2),$(3),$(4))
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
