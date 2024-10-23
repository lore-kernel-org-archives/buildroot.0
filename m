Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4709CCFA44A
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 16:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A709406A0;
	Wed, 23 Oct 2024 16:00:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HqScp8IM-0SV; Wed, 23 Oct 2024 16:00:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B87264065C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B87264065C;
	Wed, 23 Oct 2024 16:00:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 66B3F59B4
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 16:00:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2989810ED
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 16:00:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ew5JWAEcwRmP for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 16:00:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D59E5810E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D59E5810E8
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D59E5810E8
 for <buildroot@busybox.net>; Wed, 23 Oct 2024 16:00:25 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4315baec69eso65982825e9.2
 for <buildroot@busybox.net>; Wed, 23 Oct 2024 09:00:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729699224; x=1730304024;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BdyQNUqHgspQAeuC40S/Ro2Qy7HjBBc8QxR/0Rallvc=;
 b=ROnP1b0uYpWuOVwYZ4zTfbYXVGLR4BLocC/VrJcu6t6IBXLkFKzkYjWheb5ROyXpdC
 eXhSEnQ4EhDFvUogHUr69ASrL3KpLzCMk+DoiPaIAedSV4IyODEyUkXgOin+1CbkWfws
 12+ADYA0mZFaqVSta23td8Sw7rpC5z4R77BgLzJXhc5OeuPXw+Dm4r3tmtHWUQ36lDbw
 8ohQW+zf2gn3JGDhF/dJoeVSGLmxc7keZ4HB8oakpEmPnAIxBMFRB0XkEqL/grCJbIjE
 +mqMUM8NtdLgmutoD+fsK95cE1vQOeabnYpQYPPakt28yyzJRxVMG1YdOD3W2nr0uQ2a
 eGVA==
X-Gm-Message-State: AOJu0Yw/h6pMLVtQdmUIpbY5P/jtxBlGmBWrgFwngXazkxZ4C6yvRF46
 LMmpP25XzKblcRSt6xoh3KVUMzLfTIzHyCqcUj7MpEBepdC8CXKqHlFc92JvUq6p4QlQNC7ihMZ
 D4w==
X-Google-Smtp-Source: AGHT+IHoy/OUsdEY8oIk4z+nLxirYkG6ZDmlV7Dg8ttSYddGUlsk7o/C4O+BdRSTYFswdN/hf2cn4A==
X-Received: by 2002:a05:600c:4ed4:b0:426:6edf:6597 with SMTP id
 5b1f17b1804b1-431842207d9mr25832335e9.19.1729699223776; 
 Wed, 23 Oct 2024 09:00:23 -0700 (PDT)
Received: from vm-2404.. (206.34.66.37.rev.sfr.net. [37.66.34.206])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37ee0b94356sm9214111f8f.67.2024.10.23.09.00.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 09:00:23 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 23 Oct 2024 18:00:09 +0200
Message-ID: <20241023160014.568872-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023160014.568872-1-francois.perrad@gadz.org>
References: <20241023160014.568872-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1729699224; x=1730304024; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BdyQNUqHgspQAeuC40S/Ro2Qy7HjBBc8QxR/0Rallvc=;
 b=abXjfD2vuH0SDk7K/aDXHg8PE2n1pMZVjx4vQ9jO4EzP3A2F9IFUFwpcx5m7ZPcDjn
 lsReTzepTq5/G7g3q8uMtHwtE1cDupfJ8rWYG88RVhWHcteEAh8Q2SUR53RoYYWeuQ0i
 /RV9XUz7o/tGeWC6X0DqR03t/NvtsEyL6b/5x1iFPG4ZSZG4uIP7lzJD5DfJg/gXU5L3
 QSuFoQZGAcJ543I7EIu29riHNe65nIKjszFhI9vzTEvVlWs/ybgnfEvG866hxftRBnzy
 kT2LMCrJhkAOA8GKtz2ogg3BjYr+5hYjzYraXJ45ux8s98Iwg/CVr5Is7BpNinfjA8th
 YxmQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=abXjfD2v
Subject: [Buildroot] [PATCH 2/7] package/perl-extutils-installpaths: bump to
 version 0.014
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
 .../perl-extutils-installpaths.hash                           | 4 ++--
 .../perl-extutils-installpaths/perl-extutils-installpaths.mk  | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-extutils-installpaths/perl-extutils-installpaths.hash b/package/perl-extutils-installpaths/perl-extutils-installpaths.hash
index 4ad0a8e7d..9838345b6 100644
--- a/package/perl-extutils-installpaths/perl-extutils-installpaths.hash
+++ b/package/perl-extutils-installpaths/perl-extutils-installpaths.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  84d9af4ab9c2d5211681122bcc6e67a3  ExtUtils-InstallPaths-0.013.tar.gz
-sha256  65969d3ad8a3a2ea8ef5b4213ed5c2c83961bb5bd12f7ad35128f6bd5b684aa0  ExtUtils-InstallPaths-0.013.tar.gz
+md5  34fb12d1b245e44142846c72905beffc  ExtUtils-InstallPaths-0.014.tar.gz
+sha256  ae65d20cc3c7e14b3cd790915c84510f82dfb37a4c9b88aa74b2e843af417d01  ExtUtils-InstallPaths-0.014.tar.gz
 
 # computed by scancpan
 sha256  bddd4809100e5b59fa3b029b2cd303d6384cff751c3898d53827777181a9aabd  LICENSE
diff --git a/package/perl-extutils-installpaths/perl-extutils-installpaths.mk b/package/perl-extutils-installpaths/perl-extutils-installpaths.mk
index face0ed14..31727194d 100644
--- a/package/perl-extutils-installpaths/perl-extutils-installpaths.mk
+++ b/package/perl-extutils-installpaths/perl-extutils-installpaths.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_EXTUTILS_INSTALLPATHS_VERSION = 0.013
+PERL_EXTUTILS_INSTALLPATHS_VERSION = 0.014
 PERL_EXTUTILS_INSTALLPATHS_SOURCE = ExtUtils-InstallPaths-$(PERL_EXTUTILS_INSTALLPATHS_VERSION).tar.gz
 PERL_EXTUTILS_INSTALLPATHS_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEONT
 HOST_PERL_EXTUTILS_INSTALLPATHS_DEPENDENCIES = host-perl-extutils-config
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
