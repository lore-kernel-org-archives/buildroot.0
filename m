Return-Path: <SRS0=yDzA=MT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AB1FC4338F
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 17:41:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9393B600CD
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 17:41:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9393B600CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4799640299;
	Tue, 27 Jul 2021 17:41:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hrWaW8x1wi4b; Tue, 27 Jul 2021 17:41:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 390FC4029E;
	Tue, 27 Jul 2021 17:41:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F341E1BF9C2
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 17:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E24EE40299
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 17:41:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 00zW9aMZymbH for <buildroot@lists.busybox.net>;
 Tue, 27 Jul 2021 17:41:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1F81B4029E
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 17:41:37 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id r2so16197065wrl.1
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 10:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5LIcSwyJRR7442FcCzCV3sWpX2T+ZY1/TB/SUB8MrSM=;
 b=INVo0BEXuHMVA3gXtQX/OD4jUESZvyO9k+32maFIjPhkprTfuW/bU0PLe4uS0yl5sa
 psWS07GHqQywN+DzGB7Lp34F5WyGW+zbrk7cjTBk1DabY32f7RZPNAu42eHXI6hU/Jdu
 VA0jxHpg7M9nvTOpq3u/U7sKEvcg+PRGILIP7k1vcMoMtjw/T4ErbZU+Czw5B169SB2r
 8AnAVymT5Gq+szq5GXg89aGqUL3gcnNOyWl+fY4JP5yfCH/49E/K7i4kn0AnxbdTmfv5
 sq9CMho5rJXVEo5XAhxPR/eVKYo9PKgkxTl2Ni2sM0AtHBkEvnejRG5pNj0zzE1K5PMS
 rTVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5LIcSwyJRR7442FcCzCV3sWpX2T+ZY1/TB/SUB8MrSM=;
 b=NA5zvbCpV55Y2qTQhtSrJY8rXP3cqt+s0h+5bJ/JbKvw48SE8PWj2xVxw+6s2RlyWV
 MWMJESEJcSSmmTDceN0wBl/zYIURRbtzghp9UH+5bAC10naXws5YqvJ1+fbFZNf+AnOn
 cDScNjj/8jRa5adO5aECB9JGSrX7D+xBAu/Bz79wF76FKKy95yx5BsmtcGdQ9/U9zp3P
 frcT1lsDNHvSokU2zWPfgbG+AVckfN0w/Gr13GiMwsmrH3NsZ3b5ynR8IlNSE3rWVMLz
 GRq6nqeUbN1D54ho5fCH3pX6Xvn/t/T0QvBt+zhAnt3nRM+amwCxff988gDCOxqT8/xe
 ViUw==
X-Gm-Message-State: AOAM5339/2g3C5EmS9C18Mzx1VdGqHBAnSBc5q2EgTD4VLk7A3lSpJom
 DSYCNAkHTFwD8wMQjWt5KS1bUbbcgIJdSA==
X-Google-Smtp-Source: ABdhPJzDaxWZVkRdj3XiQiXhwsV251d2FOoruCvarYhP1NKvgUDSpnRbcct3E8a9WWSEE6H4W6UYYw==
X-Received: by 2002:a5d:522a:: with SMTP id i10mr4325778wra.280.1627407695263; 
 Tue, 27 Jul 2021 10:41:35 -0700 (PDT)
Received: from dell5510.suse.de (gw.ms-free.net. [95.85.240.250])
 by smtp.gmail.com with ESMTPSA id o29sm3369388wms.13.2021.07.27.10.41.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 10:41:34 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 27 Jul 2021 19:41:24 +0200
Message-Id: <20210727174124.10736-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/iputils: bump release to 20210722
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Hi,

NOTE new version added tests, which require iproute2. I'd expect I'd
have to backport 3163c49 ("meson: Make tests optional"), but it's not
needed for Buildroot.

Tested:
                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: SKIPPED
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
                            sourcery-arm [6/6]: OK
6 builds, 1 skipped, 0 build failed, 0 legal-info failed

                             andes-nds32 [ 1/45]: OK
                             arm-aarch64 [ 2/45]: OK
                   bootlin-aarch64-glibc [ 3/45]: OK
               bootlin-arcle-hs38-uclibc [ 4/45]: OK
                    bootlin-armv5-uclibc [ 5/45]: OK
                     bootlin-armv7-glibc [ 6/45]: OK
                   bootlin-armv7m-uclibc [ 7/45]: SKIPPED
                      bootlin-armv7-musl [ 8/45]: OK
             bootlin-microblazeel-uclibc [ 9/45]: OK
                   bootlin-mipsel-uclibc [10/45]: OK
                bootlin-mipsel32r6-glibc [11/45]: OK
                bootlin-m68k-5208-uclibc [12/45]: SKIPPED
               bootlin-m68k-68040-uclibc [13/45]: OK
                     bootlin-nios2-glibc [14/45]: OK
                 bootlin-openrisc-uclibc [15/45]: OK
           bootlin-powerpc-e500mc-uclibc [16/45]: OK
        bootlin-powerpc64le-power8-glibc [17/45]: OK
                   bootlin-riscv32-glibc [18/45]: OK
                   bootlin-riscv64-glibc [19/45]: OK
                    bootlin-riscv64-musl [20/45]: OK
                      bootlin-sh4-uclibc [21/45]: OK
                    bootlin-sparc-uclibc [22/45]: OK
                   bootlin-sparc64-glibc [23/45]: OK
                   bootlin-xtensa-uclibc [24/45]: OK
                    bootlin-x86-64-glibc [25/45]: OK
                     bootlin-x86-64-musl [26/45]: OK
                   bootlin-x86-64-uclibc [27/45]: OK
                            br-arm-basic [28/45]: OK
                    br-arm-full-nothread [29/45]: OK
                      br-arm-full-static [30/45]: OK
                br-i386-pentium-mmx-musl [31/45]: OK
                   br-i386-pentium4-full [32/45]: OK
                      br-mips64-n64-full [33/45]: OK
                 br-mips64r6-el-hf-glibc [34/45]: OK
               br-powerpc-603e-basic-cpp [35/45]: OK
               br-powerpc64-power7-glibc [36/45]: OK
                       linaro-aarch64-be [37/45]: OK
                          linaro-aarch64 [38/45]: OK
                              linaro-arm [39/45]: OK
                     sourcery-arm-armv4t [40/45]: OK
                            sourcery-arm [41/45]: OK
                     sourcery-arm-thumb2 [42/45]: OK
                           sourcery-mips [43/45]: OK
                         sourcery-mips64 [44/45]: OK
                          sourcery-nios2 [45/45]: OK
45 builds, 2 skipped, 0 build failed, 0 legal-info failed

Kind regards,
Petr

 package/iputils/iputils.hash | 4 ++--
 package/iputils/iputils.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/iputils/iputils.hash b/package/iputils/iputils.hash
index 3e30ca9383..3eafc7ab4e 100644
--- a/package/iputils/iputils.hash
+++ b/package/iputils/iputils.hash
@@ -1,5 +1,5 @@
-# https://github.com/iputils/iputils/releases/download/20210202/sha256sum.asc
-sha256 3f557ecfd2ace873801231d2c1f42de73ced9fbc1ef3a438d847688b5fb0e8ab  iputils-20210202.tar.gz
+# https://github.com/iputils/iputils/releases/download/20210722/sha256sum.asc
+sha256 6d1a44b0682d3d4b64586dbaebe61dd61ae16d6e2f4dc0c43336d0e47a9db323  iputils-20210722.tar.gz
 # Locally computed
 sha256 b8ea785d12fa6a44916601104dd746216957e93f13a26d3eb858b3b5a4ad66ab  LICENSE
 sha256 9acc4bc871a4742550158e3696dcb381953172ef808d04ca248184f9f6322712  Documentation/LICENSE.BSD3
diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 715779a633..af93909edf 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -11,7 +11,7 @@
 # and IPv6 updates.
 # http://www.spinics.net/lists/netdev/msg279881.html
 
-IPUTILS_VERSION = 20210202
+IPUTILS_VERSION = 20210722
 IPUTILS_SITE = $(call github,iputils,iputils,$(IPUTILS_VERSION))
 IPUTILS_LICENSE = GPL-2.0+, BSD-3-Clause
 IPUTILS_LICENSE_FILES = LICENSE Documentation/LICENSE.BSD3 Documentation/LICENSE.GPL2
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
