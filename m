Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35164C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 20:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7BDC40AAE;
	Sun,  5 Nov 2023 20:31:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7BDC40AAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4G-8z2OVNbaW; Sun,  5 Nov 2023 20:31:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E360340AEE;
	Sun,  5 Nov 2023 20:31:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E360340AEE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0F9051BF48C
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 20:26:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA53C418A7
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 20:26:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA53C418A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JgeI6oD6xYnh for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 20:26:32 +0000 (UTC)
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2981E418A8
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 20:26:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2981E418A8
Received: by mail-pl1-x642.google.com with SMTP id
 d9443c01a7336-1cc3bb4c307so31084975ad.0
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 12:26:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699215991; x=1699820791;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qKdyh/y5xmhlGeQ388aWEkKyeIbdETpc7Rra2maiuhA=;
 b=qJiRbpg7rNCSt+if80e397z9pVWXIPoaP7OK9sr+7kex4rxYZCKkLam/fo2K3Kwxoc
 vwzk804FiDu92Dgz6VYpbEld4UtlvoQReE4nA1xHPK2NBLzBDIKzlL5WB70j8+8hNHJ9
 X5yBybc8spWsnfHLVW3il0Sbg+vuem99xbZrudIf4YIHBHYPBLvcXbf/v0ckLjJhnPrV
 LVNMVm322ITKceDmnZZks9WPYoWitMVOVznGS1Ki8s6m761ZJ+0mvSPYYsJPN5xV1o7/
 8ShhWBBJ2k0lS/gieiz0+MTFaZxf4FFQzDuGC8D/9O7TLeRG5JD0VLeo5ocUBSxrSsv7
 3sRA==
X-Gm-Message-State: AOJu0YwOqPn2mqxy1S/Sh5Dx/kt6bc0MP8MVJ5oJqaOoWoajQqd+OwHk
 8ZSft85ItrUVUwXUPFjYGTlkJhgEvIJZrubDqkVItKTaE9c=
X-Google-Smtp-Source: AGHT+IGq1ssAdKkYhJmjzKJ8a+XVAy2sdRPGrCHU8yCEg4R7mYvUMQZipH4BKrw/ag1RWyf4r1jHyA==
X-Received: by 2002:a17:902:d50f:b0:1cc:4e9f:d27 with SMTP id
 b15-20020a170902d50f00b001cc4e9f0d27mr19714577plg.1.1699215991201; 
 Sun, 05 Nov 2023 12:26:31 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.196])
 by smtp.gmail.com with ESMTPSA id
 z20-20020a170902ee1400b001c735421215sm4478175plb.216.2023.11.05.12.26.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 12:26:30 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 13:25:53 -0700
Message-ID: <20231105202555.359391-22-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231105202555.359391-1-adam.duskett@amarulasolutions.com>
References: <20231105202555.359391-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699215991; x=1699820791;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qKdyh/y5xmhlGeQ388aWEkKyeIbdETpc7Rra2maiuhA=;
 b=ctO5ode/aPa7sWlrSCK6wiHdzgUCHlpMxd6Ih0gne5/QL8YZGWwYi1jNL16oFo9Qbi
 htfodH/veCuCjnBKY36p9eB5zRGO/CRPMgsHcAMYEMeLf1e7g3+L/yulLry9KqgrN4PZ
 R4RFV2VJcpjNzlDrQk0QSjGRECxcN0ck3d0Mk=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=ctO5ode/
Subject: [Buildroot] [PATCH v2 22/24] package/kmod: drop python support
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The python bindings provided by kmod were last updated 9 years ago.
  - They are not compatible with Python 3.12.
  - No major distribution uses this option.

Remove the option.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v1 -> v2: Add this patch to the series

 package/kmod/kmod.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index dae84611fe..d83fb85a3e 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -62,11 +62,6 @@ else
 KMOD_CONF_OPTS += --without-openssl
 endif
 
-ifeq ($(BR2_PACKAGE_PYTHON3),y)
-KMOD_DEPENDENCIES += python3
-KMOD_CONF_OPTS += --enable-python
-endif
-
 ifeq ($(BR2_PACKAGE_KMOD_TOOLS),y)
 
 # add license info for kmod tools
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
