Return-Path: <SRS0=O81Z=N4=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 384B9C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 21:06:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C18CF60F9E
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 21:06:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C18CF60F9E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5BB15400DB;
	Mon,  6 Sep 2021 21:06:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qMB5Hy08M0ri; Mon,  6 Sep 2021 21:06:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57AE6401C6;
	Mon,  6 Sep 2021 21:06:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 128A71BF407
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 21:06:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0208B8177C
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 21:06:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7MFPAxupeeug for <buildroot@lists.busybox.net>;
 Mon,  6 Sep 2021 21:05:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E758F80E79
 for <buildroot@buildroot.org>; Mon,  6 Sep 2021 21:05:57 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id u9so11407749wrg.8
 for <buildroot@buildroot.org>; Mon, 06 Sep 2021 14:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q2cUljQ9DdJFTmBkXip9KlKBkl4Rr2vRkSP3d2kxpag=;
 b=Pp+xOMJAGrqTLxSJd10Qy4+Wt7yYdZzqqfFOAagnAVX6pyFugcb1GIsXUhw+UA+eln
 4tmjsgkYIAiqspH+swYVuJKZzvBLMdcXV246v37jyFzfG9NPMDph0Ku5MUT2Pdiv6cAa
 KCUyTw2U9+LiA95/jSihTNFNYJgMvHWys6TrvNGlmDb5GOUR849JoAp6J0TDkWd0waET
 zQHyUnLQLam643O1XD3BEF4wAL264+vPtR/mygeVFXFuQk0PqTYQ0sRZafxnlonppk55
 0NieOx1t7HJ7C4M0n+Y8rKtiazyekL5aFBgQMtG4FisjPCy812p8dQ6VGUqnEb9Oekbz
 xKXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q2cUljQ9DdJFTmBkXip9KlKBkl4Rr2vRkSP3d2kxpag=;
 b=TSfcElcOoznQ5Bfn5yhqkxiR+8NrsGTyzymK3WNJ7kOhaS4UXQYfxDuy48OEozxyY0
 OzPZDw8o1Wq/j7oS0QKI28bmHDWAnMTrma/Oe9y9MHt7s+Xn/8fbnF1VfY/MWKokw5kp
 1kPQ+A8Cz4hbTRER5/HJkDb3t/HtUhg8U5tCujdU2VH7sY/W+GRrFRDLkZcZD2y89sBb
 iS6s+XG0j0mTtvvodYdv/DsErWSJW+jABq9IKov5yfzp3HeIQGJlljiwMIIssH+cj0OR
 pMHlDduIvbLWhHcbibOHQQ9eP/ltqE5Hsxg/2jR+XmRmpiaEfmz2HwOX5zoehj/TxSW5
 yKYg==
X-Gm-Message-State: AOAM533Hm+F5TEQRxd953XYc+Gy0c0ipMMCiE2ALHAu1tUUZ9e8hN8A+
 HSTX7rMKR7R7AzYEmU4/psoL/aMT9d4=
X-Google-Smtp-Source: ABdhPJwJrbXbgyxHO6gJNEmjdPG0nbfbZfk5Vik531CFhLg5XPC7/IE/Vir8cAgH74taECwHSn8rag==
X-Received: by 2002:adf:fb8f:: with SMTP id a15mr15475785wrr.92.1630962356010; 
 Mon, 06 Sep 2021 14:05:56 -0700 (PDT)
Received: from localhost.localdomain
 (2a01cb058f8a180098814a9aef637f91.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:9881:4a9a:ef63:7f91])
 by smtp.gmail.com with ESMTPSA id t11sm615350wmi.23.2021.09.06.14.05.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 14:05:55 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 Sep 2021 23:05:50 +0200
Message-Id: <20210906210550.2637539-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] support/testing: test_iso9660: bump to kernel
 4.19.204
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

The kernel 4.11 curently used by the test doesn't build with host
gcc >= 10 due the gcc default -fno-common. See GCC 10 porting guide [1].

/usr/bin/ld: scripts/dtc/dtc-parser.tab.o:(.bss+0x20): multiple definition of `yylloc'; scripts/dtc/dtc-lexer.lex.o:(.bss+0x0): first defined here

Update to the latest 4.19 LTS version but doing so requires to
disable CONFIG_RETPOLINE since the toolchain is not retpoline
capable [2].

Fixes:
https://gitlab.com/kubu93/buildroot/-/jobs/1564202078

[1] https://gcc.gnu.org/gcc-10/porting_to.html
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=8c4ad5d39144776c2987e81609204e1766ed4190

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 support/testing/conf/minimal-x86-qemu-kernel.config | 1 +
 support/testing/tests/fs/test_iso9660.py            | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/support/testing/conf/minimal-x86-qemu-kernel.config b/support/testing/conf/minimal-x86-qemu-kernel.config
index cc8ee6a713..45994f804d 100644
--- a/support/testing/conf/minimal-x86-qemu-kernel.config
+++ b/support/testing/conf/minimal-x86-qemu-kernel.config
@@ -2,6 +2,7 @@ CONFIG_SYSVIPC=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_SMP=y
+# CONFIG_RETPOLINE is not set
 CONFIG_HYPERVISOR_GUEST=y
 CONFIG_PARAVIRT=y
 CONFIG_NET=y
diff --git a/support/testing/tests/fs/test_iso9660.py b/support/testing/tests/fs/test_iso9660.py
index 68f4840852..412430318b 100644
--- a/support/testing/tests/fs/test_iso9660.py
+++ b/support/testing/tests/fs/test_iso9660.py
@@ -18,7 +18,7 @@ BASIC_CONFIG = \
     BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
     BR2_LINUX_KERNEL=y
     BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-    BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11"
+    BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.204"
     BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
     BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="{}"
     # BR2_TARGET_ROOTFS_TAR is not set
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
