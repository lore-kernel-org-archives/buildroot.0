Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF1CAC4332F
	for <buildroot@archiver.kernel.org>; Wed, 20 Apr 2022 20:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78B0D83F1F;
	Wed, 20 Apr 2022 20:01:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E-EyyrFA7kAk; Wed, 20 Apr 2022 20:01:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FC5B83E9B;
	Wed, 20 Apr 2022 20:01:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BEAB01BF418
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 20:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACD0B4058E
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 20:01:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jh-FrdABd6-D for <buildroot@lists.busybox.net>;
 Wed, 20 Apr 2022 20:01:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 578CB4027F
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 20:01:13 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id u3so3740771wrg.3
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 13:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NvdGsjvamD/tvGlxLgJYFdHlWdUWqLb5jLA2OpOggcM=;
 b=LaTppmatT8aeUySGJm9AAcAJ3YRti9jTQ3ti0m3UQ38Y2QcVbZ99wtdfTjqgVCjKnW
 41Qawgs7U6/LBm7NxCJw5MM7fczOln4Cauw/rchzAlTZP+d9UR+eel78cIxHXHbVeaX+
 TM8Gm/3VeA8o8n/MJmMlGdlhVlKmJr2ycnbV0I4xXe4dYkQ8dBH+PuOZAxJ3nnqFiYKz
 O8UJ7gwvUCsmcveOaR9XJbZGHfCg62MxAWanV8EM0KPGvAANAe3KVXjpNtEg5UR8wEXm
 z+klS3TS7bnkfIMghHwRQREVT62UeTNEPHTqTWErOv22mtHZBmmQqCcyN4ak/4S8VQXD
 8+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=NvdGsjvamD/tvGlxLgJYFdHlWdUWqLb5jLA2OpOggcM=;
 b=yhNTlxCNSgLU5r8GAbyjm48rFpR8OW7mJLwY0cN7/JrG1XqZes9Lf/jfj2PRp1LGng
 Ox+85qFHbU5vlx6O62CFFX697qMmhCRbFQKsTUpfFmMk6KOY7N4U+WfUs25+1tySikU7
 yIpgPsnpG3yENyP88i76hauSbMAHrkiRvUhaQRCsWloAT9pr1FMzegg5qgZ2YC20Flgt
 Rme1FRMmn7BvukRKSXIPZIdK991EXYu25OTgnfkhQUQ1M9xl9iUM85D0zquTJnNx30Vm
 a9MBNUClVmd50X0cVawxws/yR4wXJjRGDJoFvLyTYswVQe1oSQ+EE30s33aRD9S+hD6u
 r36A==
X-Gm-Message-State: AOAM531IPZcEzLfEwqBOfH10jb31CXM6NElC1opPR7JDy43KTQQf+sDN
 eSBfBOB0UcE9hX8Gsp/io9BqX+sPWH8=
X-Google-Smtp-Source: ABdhPJweXGyhxnt88Sy8GHXCIUcB9yYXGD+6bXeXlVXaxc63qTiz/+ojX4LT/D/gIgBK6ri4Guzg6w==
X-Received: by 2002:adf:eece:0:b0:20a:7bc8:d51 with SMTP id
 a14-20020adfeece000000b0020a7bc80d51mr17599000wrp.339.1650484871498; 
 Wed, 20 Apr 2022 13:01:11 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b51:cb00:7d82:8745:111f:47d9])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a5d5587000000b00207a8cde900sm599017wrv.19.2022.04.20.13.01.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 13:01:11 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 20 Apr 2022 22:01:02 +0200
Message-Id: <20220420200102.2420626-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/wtfutil: new package
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Some of wtfutils modules (i.e. plugins) can call to external tools, so
it needs to fork(), so needs an MMU.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

---
$ ./utils/test-pkg -c wtf.cfg -d $(pwd)/test-pkg -k -p wtfutil -a
                             andes-nds32 [ 1/45]: SKIPPED
                             arm-aarch64 [ 2/45]: OK
                   bootlin-aarch64-glibc [ 3/45]: OK
               bootlin-arcle-hs38-uclibc [ 4/45]: SKIPPED
                    bootlin-armv5-uclibc [ 5/45]: OK
                     bootlin-armv7-glibc [ 6/45]: OK
                   bootlin-armv7m-uclibc [ 7/45]: SKIPPED
                      bootlin-armv7-musl [ 8/45]: OK
                bootlin-m68k-5208-uclibc [ 9/45]: SKIPPED
               bootlin-m68k-68040-uclibc [10/45]: SKIPPED
             bootlin-microblazeel-uclibc [11/45]: SKIPPED
                bootlin-mipsel32r6-glibc [12/45]: SKIPPED
                   bootlin-mipsel-uclibc [13/45]: SKIPPED
                     bootlin-nios2-glibc [14/45]: SKIPPED
                 bootlin-openrisc-uclibc [15/45]: SKIPPED
        bootlin-powerpc64le-power8-glibc [16/45]: OK
           bootlin-powerpc-e500mc-uclibc [17/45]: SKIPPED
                   bootlin-riscv32-glibc [18/45]: SKIPPED
                   bootlin-riscv64-glibc [19/45]: SKIPPED
                    bootlin-riscv64-musl [20/45]: SKIPPED
                      bootlin-sh4-uclibc [21/45]: SKIPPED
                   bootlin-sparc64-glibc [22/45]: SKIPPED
                    bootlin-sparc-uclibc [23/45]: SKIPPED
                    bootlin-x86-64-glibc [24/45]: OK
                     bootlin-x86-64-musl [25/45]: OK
                   bootlin-x86-64-uclibc [26/45]: OK
                   bootlin-xtensa-uclibc [27/45]: SKIPPED
                            br-arm-basic [28/45]: OK
                    br-arm-full-nothread [29/45]: OK
                      br-arm-full-static [30/45]: SKIPPED
                   br-i386-pentium4-full [31/45]: OK
                br-i386-pentium-mmx-musl [32/45]: OK
                      br-mips64-n64-full [33/45]: OK
                 br-mips64r6-el-hf-glibc [34/45]: SKIPPED
               br-powerpc-603e-basic-cpp [35/45]: SKIPPED
               br-powerpc64-power7-glibc [36/45]: SKIPPED
                       linaro-aarch64-be [37/45]: SKIPPED
                          linaro-aarch64 [38/45]: OK
                              linaro-arm [39/45]: OK
                     sourcery-arm-armv4t [40/45]: SKIPPED
                            sourcery-arm [41/45]: OK
                     sourcery-arm-thumb2 [42/45]: OK
                         sourcery-mips64 [43/45]: FAILED
                           sourcery-mips [44/45]: SKIPPED
                          sourcery-nios2 [45/45]: SKIPPED
45 builds, 26 skipped, 1 build failed, 0 legal-info failed, 0 show-info failed

The failing one is not even a build failure of wtfutil itself, but
really just host-go that fails to build, because of some issues because
of missing GOMIPS64 setting for soft-float, which when fixed opens
another can of worms of itself...
---
 package/Config.in            |  1 +
 package/wtfutil/Config.in    |  8 ++++++++
 package/wtfutil/wtfutil.hash |  2 ++
 package/wtfutil/wtfutil.mk   | 12 ++++++++++++
 4 files changed, 23 insertions(+)
 create mode 100644 package/wtfutil/Config.in
 create mode 100644 package/wtfutil/wtfutil.hash
 create mode 100644 package/wtfutil/wtfutil.mk

diff --git a/package/Config.in b/package/Config.in
index 20d7156cea..f1e8b64e0d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2500,6 +2500,7 @@ comment "Utilities"
 	source "package/tmux/Config.in"
 	source "package/ttyd/Config.in"
 	source "package/which/Config.in"
+	source "package/wtfutil/Config.in"
 	source "package/xmlstarlet/Config.in"
 	source "package/xxhash/Config.in"
 	source "package/ytree/Config.in"
diff --git a/package/wtfutil/Config.in b/package/wtfutil/Config.in
new file mode 100644
index 0000000000..8c3efcea5d
--- /dev/null
+++ b/package/wtfutil/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_WTFUTIL
+	bool "wtfutil"
+	depends on BR2_USE_MMU  # fork()
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	help
+	  WTF is the personal information dashboard for your terminal.
+
+	  https://wtfutil.com/
diff --git a/package/wtfutil/wtfutil.hash b/package/wtfutil/wtfutil.hash
new file mode 100644
index 0000000000..deb162794e
--- /dev/null
+++ b/package/wtfutil/wtfutil.hash
@@ -0,0 +1,2 @@
+sha256  d15b2e8833d31d5b1ad7b4317777dc7aa045124d1d91994f02c9b5709f09fef3  wtfutil-0.41.0.tar.gz
+sha256  b59f3dbd83c6aa4e003b6eafa80bc53f0629e4d164e8b125c56869c2603dbc8f  LICENSE.md
diff --git a/package/wtfutil/wtfutil.mk b/package/wtfutil/wtfutil.mk
new file mode 100644
index 0000000000..6e841411a9
--- /dev/null
+++ b/package/wtfutil/wtfutil.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# wtfutil
+#
+################################################################################
+
+WTFUTIL_VERSION = 0.41.0
+WTFUTIL_SITE = $(call github,wtfutil,wtf,v$(WTFUTIL_VERSION))
+WTFUTIL_LICENSE = MPL-2.0
+WTFUTIL_LICENSE_FILES = LICENSE.md
+
+$(eval $(golang-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
