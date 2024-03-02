Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE9FC5478C
	for <buildroot@archiver.kernel.org>; Sat,  2 Mar 2024 21:29:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A299D81FA7;
	Sat,  2 Mar 2024 21:29:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xWemcMu3BUtH; Sat,  2 Mar 2024 21:29:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3CC2828C5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3CC2828C5;
	Sat,  2 Mar 2024 21:29:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F14301BF2BA
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 21:29:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA9FB404F8
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 21:29:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jlBmOfjEn5sd for <buildroot@lists.busybox.net>;
 Sat,  2 Mar 2024 21:29:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 68B4A40131
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68B4A40131
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 68B4A40131
 for <buildroot@buildroot.org>; Sat,  2 Mar 2024 21:29:00 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-33e122c8598so1801982f8f.1
 for <buildroot@buildroot.org>; Sat, 02 Mar 2024 13:29:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709414937; x=1710019737;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QO0H8NwTTiCHGZgOyMb02N8zDk6/mAI6um3ZIbOJB04=;
 b=UZACFju+It6W4wAy5UIinhpGLNEgOyBAEzzgitC6hSqCm111fIvWmZMiiX0vjmqUQo
 FZjljnDwDW+VmWSsEP1NQGMiXwwC41sal4LoOf1/lwSgUy9HN60aaMj8UVvO2ZfdzSQd
 tJRcqGqO6ZhhAUWJvNDg57PIrlY00e3xY/tga6zu1kNZjmzWgo/H5PD1SHBld5/DxCYD
 lk0zOqKvSKfaYz+UJj/ln+hizN1IrvjNd6Jn+Cz5GT9tTz8BVdFh+IyyNULWkOfx+kD7
 2Vjg/szFlDaC4qfoZPy3NllTrSWhjnDwXgOUdZS/5Lr/O7zxuPexQ2Yh/CxRYSpWGE8T
 7TFA==
X-Gm-Message-State: AOJu0YxTHiHWfjoTyqwQdgWFRKvvB7Z3LCNtqg9evW1rO1PH96/t4eGY
 4KfD5MSTBorLRw1OBsuiIkRZcQ0oX1lnURQLbkasGpEEm+DoRibHzU8XHZJQ
X-Google-Smtp-Source: AGHT+IEgpi1JAvoT2R+yWqvSWA+4914eGUUekQ2dVJSlKMNJtuDi1+5at6sp6fPv973SiMEmI6VS7g==
X-Received: by 2002:adf:f40f:0:b0:33d:e4c2:1d0d with SMTP id
 g15-20020adff40f000000b0033de4c21d0dmr3641939wro.40.1709414937345; 
 Sat, 02 Mar 2024 13:28:57 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 n8-20020a056000170800b0033e2291fbc0sm4529099wrc.68.2024.03.02.13.28.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Mar 2024 13:28:56 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  2 Mar 2024 22:28:52 +0100
Message-ID: <20240302212852.197223-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709414937; x=1710019737; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QO0H8NwTTiCHGZgOyMb02N8zDk6/mAI6um3ZIbOJB04=;
 b=k2vHhKqJMqiaHBdnVg1fKPEvaSITpWNbHs2CAi9SIykQlLZLhDtwL+V0I+TmcAULOy
 KrVZKx++Xxgp10BlPQ2kxI/ZG/yt3Wmhvk/Mi7EkLN6fegVWG5wKN9F/cIes6l4ldhMz
 yLauVc1oVWk4AAMiB+BlZsyL51OjTyToFakNdLB8wnGcgCz5kieHzjeOxvEzmEkjt1LV
 uevLLjFNVHVmIAkk/+6Iyj7AQBLMJdlUjJ3+Z/VXBeDietCal3Kbnws/DLQ/1VJ6Bagh
 euF3fl13gr8zC/+GjCtgTbzXFR6EJxoVlN3gHx8myYNrxa3k7Um3b1jZ8LrgvdF/x4Wq
 uLpw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=k2vHhKqJ
Subject: [Buildroot] [PATCH v2,1/1] package/powertop: fix gettext build
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
Cc: Steven Noonan <steven@uplinklabs.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix gettext build raised since bump to version 2.15 in commit
d65b960859046be486ced6c490d3671bd1392661:

*** error: gettext infrastructure mismatch: using a Makefile.in.in from gettext version 0.18 but the autoconf macros are from gettext version 0.20

Fixes: d65b960859046be486ced6c490d3671bd1392661
 - http://autobuild.buildroot.org/results/bb80a7842d18651e5069f3a91f06a9c23218d260

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Yann E. Morin):
 - Set POWERTOP_AUTOPOINT=YES instead of patching

 package/powertop/powertop.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/powertop/powertop.mk b/package/powertop/powertop.mk
index 0481caee07..a7a57939e0 100644
--- a/package/powertop/powertop.mk
+++ b/package/powertop/powertop.mk
@@ -20,6 +20,7 @@ POWERTOP_DEPENDENCIES = \
 POWERTOP_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 # 0001-add-disable-stack-protector-option.patch
 POWERTOP_AUTORECONF = YES
+POWERTOP_AUTOPOINT = YES
 POWERTOP_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive
 POWERTOP_CONF_OPTS = --disable-stack-protector
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
