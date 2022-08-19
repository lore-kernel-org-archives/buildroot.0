Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD71C32771
	for <buildroot@archiver.kernel.org>; Fri, 19 Aug 2022 15:18:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C3FD81CAD;
	Fri, 19 Aug 2022 15:18:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C3FD81CAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fufpZznQEj4V; Fri, 19 Aug 2022 15:18:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A460818C2;
	Fri, 19 Aug 2022 15:18:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A460818C2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1E6C21BF5DB
 for <buildroot@lists.busybox.net>; Fri, 19 Aug 2022 15:18:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED076842FF
 for <buildroot@lists.busybox.net>; Fri, 19 Aug 2022 15:18:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED076842FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K-tii7pJH6_v for <buildroot@lists.busybox.net>;
 Fri, 19 Aug 2022 15:18:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2D6A842A5
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C2D6A842A5
 for <buildroot@buildroot.org>; Fri, 19 Aug 2022 15:18:19 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id g16so3441038qkl.11
 for <buildroot@buildroot.org>; Fri, 19 Aug 2022 08:18:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=ATGcatLRaXuvvsbfJ0avz+WJV4+mSjiN3yPIh6g5LAU=;
 b=XbUgEmP/suCYU3pVsGN5cly6I88YkKOY211RxtbMGRhudxm10lTT5AR5ZPx1uR2dMZ
 sUB3beHVAc4gXueoD1TFL3Aqaktr4vg/kOaXlVhk12Ii0QOBx7fTbloZ00JBDj7cp2Te
 EJWWNd7Xff/I9l94fARDrLZoZfLYGDhZJ2mrsKnu3M0deU/ig+RZUyYTIx2kryQsyMx8
 Kgmjtb9pDcIba9D7CwwCuy6kf4PrXI3N1Xe3/y5+AqVf6EuTqJh0xshJpqUZxujkhWnf
 IK74XM6TrxDMM1R9hZzno2e060egWhggXDuLY7m6PyNKyllNpeh9+AOHx33ob6tuxLkB
 YA9A==
X-Gm-Message-State: ACgBeo0ovscOya/J7y3NKUsXtGauKsf4FGX3uB7sQlJQbcbbhpF3MZY2
 Uj4on4lH5EApB2t2paJ+ZaSwqldkA8qYlw==
X-Google-Smtp-Source: AA6agR66U4vkpfqL40WeWUqiqesTWQ44+TPsAEppPMhxGPljHlZU8QxHzmrHJVeMA/Nc0Rsa22CBfA==
X-Received: by 2002:a05:620a:c01:b0:6b6:1aaf:bade with SMTP id
 l1-20020a05620a0c0100b006b61aafbademr5432767qki.524.1660922298484; 
 Fri, 19 Aug 2022 08:18:18 -0700 (PDT)
Received: from hefring.. ([50.212.55.89]) by smtp.gmail.com with ESMTPSA id
 br38-20020a05620a462600b006bbc09af9f5sm3368907qkb.101.2022.08.19.08.18.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 08:18:18 -0700 (PDT)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
X-Google-Original-From: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
To: buildroot@buildroot.org
Date: Fri, 19 Aug 2022 11:17:27 -0400
Message-Id: <20220819151734.926106-3-Ben.Wolsieffer@hefring.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220819151734.926106-1-Ben.Wolsieffer@hefring.com>
References: <20220819151734.926106-1-Ben.Wolsieffer@hefring.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=ATGcatLRaXuvvsbfJ0avz+WJV4+mSjiN3yPIh6g5LAU=;
 b=LNu/cjo9ZJTtyK3dq/XWI0h2liooe7HMPp2YDUJpgTcDDdW/RMAzZKEXhOQRC/meXz
 NJ7xpEyiWuJ8TiNQUyCZwdX9frZI9VxkrCodgBTJg4fEeqMnNhIo6uTlvbqt2ayjCmg9
 8H6hCeiW1Czk+z0AVQaV9+4lFHdl5UXhL04ss55a9Zb5CzSDaPaVXn8yje6Rc0OahPdK
 bOck4xav2U5YIquKVQZRHrvcpq+pOkqrPgASwp0R0PW1ObDmnO5NYL91mFB3nBnVyOPR
 jSk2SKWvt6sDWYF+IqLM8u0WQj8gpa6DUGLWAnjCnh3Ahbze/QeSNWdf/pK0i9cgBNVB
 KDGg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=hefring-com.20210112.gappssmtp.com
 header.i=@hefring-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=LNu/cjo9
Subject: [Buildroot] [PATCH v3 2/8] arch: don't enable FDPIC binaries by
 default
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
Cc: Vladimir Murzin <vladimir.murzin@arm.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Ben Wolsieffer <Ben.Wolsieffer@hefring.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

FDPIC support is being added as a new option for an existing
architecture (ARM), so we don't want to suddenly change the default.

Signed-off-by: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
---
 arch/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/Config.in b/arch/Config.in
index c5d481b9e5..0ee7077df6 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -421,7 +421,6 @@ endif
 choice
 	prompt "Target Binary Format"
 	default BR2_BINFMT_ELF if BR2_USE_MMU
-	default BR2_BINFMT_FDPIC if BR2_ARCH_HAS_FDPIC_SUPPORT
 	default BR2_BINFMT_FLAT
 
 config BR2_BINFMT_ELF
-- 
2.37.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
