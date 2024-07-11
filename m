Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA5FC3DA45
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 16:04:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0740D4155C;
	Thu, 11 Jul 2024 16:04:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DG0mIjvE-P-Q; Thu, 11 Jul 2024 16:04:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4E4741553
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4E4741553;
	Thu, 11 Jul 2024 16:04:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0CB701BF577
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 16:04:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED76580F89
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 16:04:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FSwcF-4unnl4 for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 16:04:45 +0000 (UTC)
X-Greylist: delayed 4579 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 11 Jul 2024 16:04:42 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C380A80F4B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C380A80F4B
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=46.105.40.176;
 helo=9.mo584.mail-out.ovh.net; envelope-from=julien.boibessot@armadeus.com;
 receiver=<UNKNOWN> 
Received: from 9.mo584.mail-out.ovh.net (9.mo584.mail-out.ovh.net
 [46.105.40.176])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C380A80F4B
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 16:04:42 +0000 (UTC)
Received: from director3.ghost.mail-out.ovh.net (unknown [10.108.9.253])
 by mo584.mail-out.ovh.net (Postfix) with ESMTP id 4WKczS3LQ9z1NYj
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 14:48:20 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-p6knh (unknown [10.111.174.233])
 by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 02BD31FD4E;
 Thu, 11 Jul 2024 14:48:19 +0000 (UTC)
Received: from armadeus.com ([37.59.142.103])
 by ghost-submission-6684bf9d7b-p6knh with ESMTPSA
 id hnH3NrPwj2awHAAAOQ0HoQ
 (envelope-from <julien.boibessot@armadeus.com>);
 Thu, 11 Jul 2024 14:48:19 +0000
X-OVh-ClientIp: 86.235.104.210
From: Julien BOIBESSOT <julien.boibessot@armadeus.com>
To: buildroot@buildroot.org
Date: Thu, 11 Jul 2024 16:48:10 +0200
Message-Id: <20240711144810.2291029-1-julien.boibessot@armadeus.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Ovh-Tracer-Id: 17344488068556050897
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 49
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeftddrfeeggdekudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecuogfuuhhsphgvtghtffhomhgrihhnucdlgeelmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefluhhlihgvnhcuuefqkfeugffuuffqvfcuoehjuhhlihgvnhdrsghoihgsvghsshhothesrghrmhgruggvuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpeejlefhkefgudetieffgfelheeugffhjeehieektefguedvheejfeefieevffevfeenucffohhmrghinhepshhouhhrtggvfhhorhhgvgdrnhgvthenucfkphepuddvjedrtddrtddruddpkeeirddvfeehrddutdegrddvuddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehjuhhlihgvnhdrsghoihgsvghsshhothesrghrmhgruggvuhhsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdpoffvtefjohhsthepmhhoheekgedpmhhouggvpehsmhhtphhouhht
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=9kP8dramSm/Qxrnb4VIxORxhhXIX85TiTMit6AuOiV4=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1720709300; v=1;
 b=TJdS/CtXM+bNRP8H1tX0vI3jC65HQTtO/lcmq7NB2H8UEa+3qLtww2yVDWQz1Gmgs9Ph79MR
 wqlCTxo3YmQvGWPaMCujzu7NM0I9mKcluV9nhlpeJZtgqrGuWjLYdGzYWnlpqc09SsN0vgiKGr8
 BJImyf67BW/Jr0lL11now6b4aKHvfcX82cr2HUkP8O+favpp0+maHXOkpULzWN9VuzWgYtp+U0x
 L3/z6lwBwBlhNxPto+BdJWWRvqgKeljf3IowjjlwwEfCQP98gR0hxqzfFESiCnmc3v9xCkRYMZY
 Xo7X4GIMXAJlr+8E9crt7Gc21rKDrWkB8C+WZgt5caVng==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=TJdS/CtX
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005b77a91da-5a85-4b1b-bd96-4e0d69629fcc,
 05E343665D7C41E3FDDC56377E599F7C2F18E325)
 smtp.auth=julien.boibessot@armadeus.com
Subject: [Buildroot] [PATCH 1/1] package/ltris: bump version to 1.3.2
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
Cc: Julien BOIBESSOT <julien.boibessot@armadeus.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As requested by Buildroot's autobuilder tracking outdated packages.

Build tested with:

$ ./utils/test-pkg -c ltris.config -p ltris -a
                             arm-aarch64 [ 1/41]: OK
                   bootlin-aarch64-glibc [ 2/41]: OK
               bootlin-arcle-hs38-uclibc [ 3/41]: OK
                    bootlin-armv5-uclibc [ 4/41]: OK
                     bootlin-armv7-glibc [ 5/41]: OK
                   bootlin-armv7m-uclibc [ 6/41]: SKIPPED
                      bootlin-armv7-musl [ 7/41]: OK
                bootlin-m68k-5208-uclibc [ 8/41]: SKIPPED
               bootlin-m68k-68040-uclibc [ 9/41]: OK
             bootlin-microblazeel-uclibc [10/41]: OK
                bootlin-mipsel32r6-glibc [11/41]: OK
                   bootlin-mipsel-uclibc [12/41]: OK
                     bootlin-nios2-glibc [13/41]: OK
                 bootlin-openrisc-uclibc [14/41]: OK
        bootlin-powerpc64le-power8-glibc [15/41]: OK
           bootlin-powerpc-e500mc-uclibc [16/41]: OK
                   bootlin-riscv32-glibc [17/41]: OK
                   bootlin-riscv64-glibc [18/41]: OK
                    bootlin-riscv64-musl [19/41]: OK
                 bootlin-s390x-z13-glibc [20/41]: OK
                      bootlin-sh4-uclibc [21/41]: OK
                   bootlin-sparc64-glibc [22/41]: OK
                    bootlin-sparc-uclibc [23/41]: OK
                    bootlin-x86-64-glibc [24/41]: OK
                     bootlin-x86-64-musl [25/41]: OK
                   bootlin-x86-64-uclibc [26/41]: OK
                   bootlin-x86-i686-musl [27/41]: OK
                   bootlin-xtensa-uclibc [28/41]: OK
                            br-arm-basic [29/41]: OK
                    br-arm-full-nothread [30/41]: OK
                      br-arm-full-static [31/41]: OK
                   br-i386-pentium4-full [32/41]: OK
                      br-mips64-n64-full [33/41]: OK
                 br-mips64r6-el-hf-glibc [34/41]: OK
               br-powerpc-603e-basic-cpp [35/41]: OK
               br-powerpc64-power7-glibc [36/41]: OK
                       linaro-aarch64-be [37/41]: OK
                          linaro-aarch64 [38/41]: OK
                              linaro-arm [39/41]: OK
                         sourcery-mips64 [40/41]: OK
                           sourcery-mips [41/41]: OK
41 builds, 2 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

$ cat ltris.config
BR2_PACKAGE_LTRIS=y
BR2_PACKAGE_LTRIS_AUDIO=y

Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
---
 package/ltris/ltris.hash | 2 +-
 package/ltris/ltris.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ltris/ltris.hash b/package/ltris/ltris.hash
index abe6853d9b..3b2043a2c8 100644
--- a/package/ltris/ltris.hash
+++ b/package/ltris/ltris.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  1291c6a642d06b9ee153ac0a2e7855a2c983e839c618f1a294df04d829525cb0  ltris-1.2.7.tar.gz
+sha256  ff28c55a18c61f28a86ba7f30f13222dfed0f7fbeb492acd95c97de9c659cec9  ltris-1.3.2.tar.gz
 sha256  67f82e045cf7acfef853ea0f426575a8359161a0a325e19f02b529a87c4b6c34  COPYING
diff --git a/package/ltris/ltris.mk b/package/ltris/ltris.mk
index b34ac142ce..6ebaa74294 100644
--- a/package/ltris/ltris.mk
+++ b/package/ltris/ltris.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LTRIS_SITE = http://downloads.sourceforge.net/lgames/ltris
-LTRIS_VERSION = 1.2.7
+LTRIS_VERSION = 1.3.2
 LTRIS_LICENSE = GPL-2.0+
 LTRIS_LICENSE_FILES = COPYING
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
