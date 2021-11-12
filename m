Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48F27C433F5
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 19:07:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B92DA61057
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 19:07:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B92DA61057
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92FD961547;
	Fri, 12 Nov 2021 19:07:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SbShjxpfk2Ij; Fri, 12 Nov 2021 19:07:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04DD761546;
	Fri, 12 Nov 2021 19:07:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7BDD81BF31F
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 19:07:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 78CA26151C
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 19:07:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2GRHXQRhYhOE for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 19:07:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2193461545
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 19:07:00 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id d3so17212186wrh.8
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 11:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2udvc6mZBfNqqcqGOSfGBVbd3bduPJGp9XUoSMMnVfc=;
 b=qACO5kBNS6YtZ27cNVM2mPwqVvLMTSdvv8WM+UMQneXTQTETPGi38yp+lAx60thgoN
 qwk+A43PkNjcwxXPeJTjQEQ/y89SDTdahhzdrq62jRT/m6WpCC5hBVl+T17ZA5eLXwSp
 XT0zGbsscvF5smYwxdFdkvfKRRwShrFBzuMGhc7VRwAYAeuX6sDHdAFz916M4aLXTi3W
 s2LPEZpvzRQyM1CtiM3bWQYnH6GS+23yaOp0T55z7cCGs4NIodzDmdjPk7jVLALQkL6B
 U6HJWYQ2UQvyuiigFXjhhx6UQvDNrDikEgBOvm39+pO2T1LIxApl/JlnGJ3si3oAmSrX
 UXUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2udvc6mZBfNqqcqGOSfGBVbd3bduPJGp9XUoSMMnVfc=;
 b=AAarjGqo1mFwLC02zmyJzPRnuzCcRGwEjnOkE3lnE1Az3O4EzAyFGSWTI+xBlGTMWO
 dZCIWlhvWWYidowOFUQQYqpoKPPEMkzVat8Oa1HH+ObfQnRDF+unAdiElB9ew4kT2DId
 AZN9gU8q+GhEtWykNXiupSWzfhg8QfiT/ENTc/NbC63SBWNcGn44qV6eBunG2lC9M5AX
 Ab6ZJflFIKkpasFIna7O1Kf1xnN0PVEUrOIV6yXUgPKnET6jMQAS63P8MDps+FvU27Lm
 nTawLrlHD6StmnXW4/yAF7LWPNvG/i1AXjBSS+qltp9hrGArlCZwSSwYAVtfHtKOmfI/
 knVA==
X-Gm-Message-State: AOAM5309wSZ9UhV3mpM0+vRWf+ogyAqN0Dv6MoFshQySNaMC/a/8ftsC
 LzQXOM8dWAZKTHxdLgypalj9GaYvBZg=
X-Google-Smtp-Source: ABdhPJyoB6h1nJ0vdW5fOp90VYM6bsEjK+ZMdYbdJ+CWSd//mGSzmxslGLpsYyn8ABgFa6gV44jyVA==
X-Received: by 2002:adf:ca05:: with SMTP id o5mr21307657wrh.7.1636744018510;
 Fri, 12 Nov 2021 11:06:58 -0800 (PST)
Received: from atlas.home (arennes-651-1-314-16.w2-12.abo.wanadoo.fr.
 [2.12.73.16])
 by smtp.gmail.com with ESMTPSA id d15sm9462604wri.50.2021.11.12.11.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 11:06:57 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 12 Nov 2021 20:06:48 +0100
Message-Id: <20211112190650.84234-5-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211112190650.84234-1-romain.naour@gmail.com>
References: <20211112190650.84234-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 4/6] package/luajit: building for 64-bit
 target requires a 64-bit host for all platform
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
Cc: Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently only x86_64 target requires a 64-bit host but building
aarch64 target with a 32-bit host is allowed.

This constraint is for all architectures [1].

[1] http://lists.busybox.net/pipermail/buildroot/2021-November/628301.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Francois Perrad <francois.perrad@gadz.org>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
v2: fix typo BR_HOST_ARCH/BR2_HOSTARCH (Yann)
---
 package/luajit/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/luajit/Config.in b/package/luajit/Config.in
index f6d01ed09a..c313cd3248 100644
--- a/package/luajit/Config.in
+++ b/package/luajit/Config.in
@@ -1,13 +1,15 @@
 config BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
 	bool
 	default y if BR2_arm || BR2_armeb || BR2_aarch64
-	default y if BR2_i386 || (BR2_x86_64 && BR2_HOSTARCH='x86_64')
+	default y if BR2_i386 || BR2_x86_64
 	default y if BR2_powerpc
 	default y if (BR2_mips || BR2_mipsel) && !BR2_MIPS_SOFT_FLOAT \
 		&& !BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6
 	# -m32 flag is used for 32bit builds and host-luajit has
 	# limited architecture support
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	# Building for 64-bit target requires a 64-bit host
+	depends on !BR2_ARCH_IS_64 || BR2_HOSTARCH = "x86_64"
 
 config BR2_PACKAGE_LUAJIT
 	bool "luajit"
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
