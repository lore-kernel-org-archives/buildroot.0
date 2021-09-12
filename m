Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11ECCC433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 14:12:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B928460FED
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 14:12:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B928460FED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FD6660BE6;
	Sun, 12 Sep 2021 14:12:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AtatT5mBzSEH; Sun, 12 Sep 2021 14:12:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B06B960BDB;
	Sun, 12 Sep 2021 14:12:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2FB441BF471
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 14:11:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FDDF60BDB
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 14:11:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zKYNYnwBAeIl for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 14:11:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 26C5F608B8
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 14:11:49 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id e26so4723900wmk.2
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 07:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0tbGnSZBZUAw94TrCBroegrfuMYT0mae9YQhS/suOq4=;
 b=ZZHRzC+XwzpueWkf1NMUuPsIHjFaqugdX0CcJ131pV9PRdnm2HC7B9AHsT4FLmlndF
 Z+cbuu31AqWpeXbbYlh21BiH2U4v3fNyUy8eEIGqJ/t9Fe/Yf8rhFCoU7XdiY3ID5Iux
 T8KRAvROri3pDC2fGttxOPzIBqrGJuAiXOv5Vh/creEqUfA8+61EuKJInSoFQChRpqPZ
 xpj6tTc9gUJGV6TlAmjSYW1cb/oxIN3dnflk4ua3nOWGJWGgQfjAeKSwZNYxjMsoZMr7
 vQoX5PWhD88S1tXKIWcnWE6uv3h4WJn9eQ6879OQDE1d+mVpbt/OLo25k9M2Q7DM9+o3
 Ky3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0tbGnSZBZUAw94TrCBroegrfuMYT0mae9YQhS/suOq4=;
 b=gyAjxd6MEF6y0VV4+6Scj7KBLPYBlxNFci0XWVdATQh7bTtupLTjUY+IxvePTuJLX0
 H3HdhyTrWK2Y4zCrwT40SvQ8r5+b0YyRtue+fCjJYyhoAEFwYcurKH4qmQ1yImS4wl8o
 YuZzTuClBJbqQMV9IdReUrNWCehVEOQpNOPI5685pCImhy2vhyhFlzQRoql5jprJRJBi
 VY11o2glhvcbEcafvJF7M/HpbG8MPV8OgSesEsR3YTUY67di/40QbgSxjOm2s92VC1WE
 xUYCr1dVumJhfk/F95p5Qcn4MRyTepuqWFVgybhOgsTSvgqiD1SEa9GDj06Opq8Gh15R
 CorQ==
X-Gm-Message-State: AOAM531/jHPwMlvb2fXdfnWtf6UezJE27FSM2p4tMLkVnv32zBynRric
 7VjD0gPgINzH0m2ygZ9Zf+NUGMLRwKs=
X-Google-Smtp-Source: ABdhPJzYIz43+vGmlsffyb+vyZFTkWeg9EzOSSPwC0v7UMWcK7mjogko7Qo1pmRKNS+9g4RRI2clzw==
X-Received: by 2002:a05:600c:354a:: with SMTP id
 i10mr516988wmq.77.1631455907407; 
 Sun, 12 Sep 2021 07:11:47 -0700 (PDT)
Received: from localhost.localdomain
 (2a01cb058f8a180022164e4eb697b4ce.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:2216:4e4e:b697:b4ce])
 by smtp.gmail.com with ESMTPSA id i5sm4570062wrc.86.2021.09.12.07.11.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 07:11:47 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Sep 2021 16:11:29 +0200
Message-Id: <20210912141140.253778-3-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210912141140.253778-1-romain.naour@gmail.com>
References: <20210912141140.253778-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 05/16] support/testing: test_openrc: switch to
 ARM arm toolchain and builtin kernel
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

The kernel 5.5.7 curently used by the test doesn't build with host
gcc >= 10 due the gcc default -fno-common. See GCC 10 porting guide [1].

/usr/bin/ld: scripts/dtc/dtc-parser.tab.o:(.bss+0x20): multiple definition of `yylloc'; scripts/dtc/dtc-lexer.lex.o:(.bss+0x0): first defined here

But we can't just update this test to the next linux kernel LTS 5.10.y since
the minimum gcc version has been updated to gcc 4.9 since 5.8 kernel [2]
and the Sourcery CodeBench ARM 2014.05 is used (gcc 4.8 based).

Enable arm cortex A9 and VFP support to switch to the ARM arm prebuilt
toolchain (the Bootlin toolchain could be used).
While at it use the prebuilt buildin kernel for the vexpress target
recently updated to 5.10.7.

Fixes:
https://gitlab.com/kubu93/buildroot/-/jobs/1564202094

[1] https://gcc.gnu.org/gcc-10/porting_to.html
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=6ec4476ac82512f09c94aff5972654b70f3772b2
[3] 3cf2782906d5cc05a3966c25518d2ce01f11afc8

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 support/testing/tests/init/test_openrc.py | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/support/testing/tests/init/test_openrc.py b/support/testing/tests/init/test_openrc.py
index 14839434ef..c6ade7676d 100644
--- a/support/testing/tests/init/test_openrc.py
+++ b/support/testing/tests/init/test_openrc.py
@@ -5,15 +5,11 @@ class InitSystemOpenrcBase(InitSystemBase):
     config = \
         """
         BR2_arm=y
+        BR2_cortex_a9=y
+        BR2_ARM_ENABLE_VFP=y
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_INIT_OPENRC=y
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
-        BR2_LINUX_KERNEL=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.5.7"
-        BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
-        BR2_LINUX_KERNEL_DTS_SUPPORT=y
-        BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
         # BR2_TARGET_ROOTFS_TAR is not set
         """
 
@@ -34,7 +30,7 @@ class TestInitSystemOpenrcRoFull(InitSystemOpenrcBase):
         """
 
     def test_run(self):
-        self.start_emulator("squashfs", "zImage", "vexpress-v2p-ca9")
+        self.start_emulator("squashfs")
         self.check_init()
 
 
@@ -46,5 +42,5 @@ class TestInitSystemOpenrcRwFull(InitSystemOpenrcBase):
         """
 
     def test_run(self):
-        self.start_emulator("ext2", "zImage", "vexpress-v2p-ca9")
+        self.start_emulator("ext2")
         self.check_init()
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
