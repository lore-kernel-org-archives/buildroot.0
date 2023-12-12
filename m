Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F73BC4332F
	for <buildroot@archiver.kernel.org>; Tue, 12 Dec 2023 21:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83F34817A7;
	Tue, 12 Dec 2023 21:23:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83F34817A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uprt78l1mMwI; Tue, 12 Dec 2023 21:23:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B070081799;
	Tue, 12 Dec 2023 21:23:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B070081799
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 01D2C1BF2FD
 for <buildroot@lists.busybox.net>; Tue, 12 Dec 2023 21:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CED4381799
 for <buildroot@lists.busybox.net>; Tue, 12 Dec 2023 21:23:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CED4381799
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ctnih-NSclNR for <buildroot@lists.busybox.net>;
 Tue, 12 Dec 2023 21:23:33 +0000 (UTC)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB32A8177A
 for <buildroot@buildroot.org>; Tue, 12 Dec 2023 21:23:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB32A8177A
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1d345b187bbso6919435ad.0
 for <buildroot@buildroot.org>; Tue, 12 Dec 2023 13:23:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702416212; x=1703021012;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ifC0Z6c0Wf992rqT4RcRFnfBghxuyfWjP6InpETBRHk=;
 b=vBogylhVTADN20RaKxpmj4myO1aCQLV7owQyr0cSxXj4DUuk8uC9U8B9IyWY+GKNS6
 nduuiaWzfCNAJZbyY0vzzFvkvxC5ihtYaF6+ixZGa10ZJ4IyL0H2PPVCNWHBHwZFW+lJ
 n9Y4Chlf3Kgd5uVUcqIv3gn3tN4CSvjpJd7zKzst+aS6Frs3d28v5DJVR6kXpLCTbP2w
 7LtEdMO2H9gk+JduGJu3Uejg4fkt6iVVSX4caYdhl86f/0HX7OCuI2jXC6/Z2RquH2hc
 T4lp1NBpP7Ek+CjnIyLVdbLPKYgeAVWwVMsMG+jHdQkRgztgdnC4l3VPABSW/XMRo+6y
 1d+A==
X-Gm-Message-State: AOJu0YxRW80qWkhgn61mr5w1mcVC/WuBfIHG0nx0uVcLXSOoVlxbfOcB
 DXfsdPEHPPXK+WFm8Vua34+F7NiszdfRMiWtndo=
X-Google-Smtp-Source: AGHT+IF8nq6Wfrcel5wfXwB/P9j3GwpULzSWtdPFnK0F/SvQB0o2eyMOjA+1y6QCGkZhe88+gbKvVQ==
X-Received: by 2002:a17:902:b408:b0:1d2:ec54:894b with SMTP id
 x8-20020a170902b40800b001d2ec54894bmr6861666plr.61.1702416212250; 
 Tue, 12 Dec 2023 13:23:32 -0800 (PST)
Received: from fedora.amarulasolutions.com ([75.174.143.7])
 by smtp.gmail.com with ESMTPSA id
 pl16-20020a17090b269000b002859a1d9fb7sm9482776pjb.2.2023.12.12.13.23.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Dec 2023 13:23:31 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 12 Dec 2023 14:23:29 -0700
Message-ID: <20231212212329.778704-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702416212; x=1703021012;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ifC0Z6c0Wf992rqT4RcRFnfBghxuyfWjP6InpETBRHk=;
 b=LoC8NHI6keJkkHaWfCpd2T9QmmEKAjhTaKkKzVPYuzxwbF5eJ+J8vd3P7/gsOppq5O
 bhTHj3/rUIQeCDIzO862J9oxQ8Ulm4KOjrb6ltMoWX5ujXYRxmylirc3TuGtozZDKpSF
 AmqrbgS68oRRp8td65BxQ6GpO84IKRFEGYuXE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=LoC8NHI6
Subject: [Buildroot] [PATCH] package/firewalld: bump version to 2.0.2
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/firewalld/firewalld.hash | 2 +-
 package/firewalld/firewalld.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/firewalld/firewalld.hash b/package/firewalld/firewalld.hash
index 53bfed0347..cbd4c7685b 100644
--- a/package/firewalld/firewalld.hash
+++ b/package/firewalld/firewalld.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  61022eec66fa7ea0561924dfe65d17bab5ec512b3559198a05048a32264612d1  firewalld-2.0.1.tar.gz
+sha256  1433247299367f707279d50e0759ed27fbcc9bb973b7b2131e8cee96e006d96e  firewalld-2.0.2.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/firewalld/firewalld.mk b/package/firewalld/firewalld.mk
index 23ba1e6c2a..eae8afc27f 100644
--- a/package/firewalld/firewalld.mk
+++ b/package/firewalld/firewalld.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FIREWALLD_VERSION = 2.0.1
+FIREWALLD_VERSION = 2.0.2
 FIREWALLD_SITE = $(call github,firewalld,firewalld,v$(FIREWALLD_VERSION))
 FIREWALLD_LICENSE = GPL-2.0
 FIREWALLD_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
