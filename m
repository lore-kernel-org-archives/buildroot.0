Return-Path: <SRS0=uMfR=NA=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4BF0C4338F
	for <buildroot@archiver.kernel.org>; Mon,  9 Aug 2021 08:54:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 980316103B
	for <buildroot@archiver.kernel.org>; Mon,  9 Aug 2021 08:54:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 980316103B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56D61402A6;
	Mon,  9 Aug 2021 08:54:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iBeGAT-pqCQw; Mon,  9 Aug 2021 08:54:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97E40402A0;
	Mon,  9 Aug 2021 08:54:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B62181BF3FF
 for <buildroot@lists.busybox.net>; Mon,  9 Aug 2021 08:54:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B281582B81
 for <buildroot@lists.busybox.net>; Mon,  9 Aug 2021 08:54:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sVmK-Y75XkqS for <buildroot@lists.busybox.net>;
 Mon,  9 Aug 2021 08:54:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9F64482B53
 for <buildroot@buildroot.org>; Mon,  9 Aug 2021 08:54:54 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id i4so2907831wru.0
 for <buildroot@buildroot.org>; Mon, 09 Aug 2021 01:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4EwJYAGkv1AbSUdu/a1HQHz31vxRACJHAVzwHc/tQ44=;
 b=mRk2/mWiTlOH1Q4jKfeYfRkpeYcOjzNuYXV0Pe3ZYpPa32/ByToW32BcavBYlU2p5R
 5YvxnGG1rQzI4MuMqzaD6NQs/kErpibzQOi3/iapA/+p2AEaY4wdFYyaw1iG13uOo6Pu
 zpHVSMltuiuQ7o5/4Ovsv7gXjXP9cK3EncaYAPhxqpZAEryQ0vMZi3plAyRLNsy22tRf
 WAEpBb9rV2AknRAo7Y/hYXYQm2QRD6qkTPKDkRNld3uMBoojaI2NhV0xuwDg4o2Z7dwX
 UaWhC0khDD97KrrqzUhPfZiOxVadlEBMH3sHhlXxVgiMQNaI//rAGhEjth58DgGXSi5c
 1V0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4EwJYAGkv1AbSUdu/a1HQHz31vxRACJHAVzwHc/tQ44=;
 b=cwZRE/j8JYVqEC3ZBgqT1lCQ2yStWgJAJQo7VsTJAWTAHPaRhrhDkKbb1pVh7wMSbU
 L44r8RFOg83rx/+8r8hjC3dS0lyhY3sfNNmHAvF7H5nM72SGH+aIDa4P8iCVGKetnZjE
 sUd5AOHgUfydjdw4AVP20+qlXb7fpyxqKro36Z+okwMnShPkzM2zpVhRCeaQFN5N1I/n
 sdazMh32IbQd2ukSlHjx3ZpVQ2qBSzT+0TE/7s/bN9pFOvUgk68xFR0LcX7RjUQj4R+O
 JAC2aYW6soJ99/Z0aEEjPNg1AzpRw8+HRiqra6/e3uCUwsWGny05L+B7704ju9E3k/C9
 3Kbw==
X-Gm-Message-State: AOAM530Nffigf2NK5byVl4T06uUYUNIVZ0cOBp1mYSoUwMIxBHy/VGCd
 DKfMUPMgNVbaQUp66mb8bpuE70nHQ4QNaA==
X-Google-Smtp-Source: ABdhPJz1LHMEchxDFAFF2ydn0UMdNPcI4y7BL8jdHi9BW0WVtF0SKXa60gwVp3nIwUYfc5v4b9qwLg==
X-Received: by 2002:a05:6000:10d0:: with SMTP id
 b16mr24121127wrx.332.1628499292684; 
 Mon, 09 Aug 2021 01:54:52 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id x18sm16559103wmc.17.2021.08.09.01.54.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 01:54:52 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  9 Aug 2021 10:54:26 +0200
Message-Id: <20210809085426.809613-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/qemu: add libfuse3 optional
 dependency
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

libfuse3 is an optional dependency which is enabled by default since
version 6.0.0 and
https://gitlab.com/qemu-project/qemu/-/commit/0c9b70d5900a5108e899edfdd6f3790f8cb6bdc2

So add this dependency and fix the following build failures on musl
raised since bump to version 6.0.0 in commit
6b86c9335fc3ff381878156c6243454d4b688df9:

../block/export/fuse.c: In function 'fuse_fallocate':
../block/export/fuse.c:563:23: error: 'FALLOC_FL_ZERO_RANGE' undeclared (first use in this function)
  563 |     } else if (mode & FALLOC_FL_ZERO_RANGE) {
      |                       ^~~~~~~~~~~~~~~~~~~~
../block/export/fuse.c:563:23: note: each undeclared identifier is reported only once for each function it appears in
../block/export/fuse.c: In function 'fuse_lseek':
../block/export/fuse.c:639:19: error: 'SEEK_HOLE' undeclared (first use in this function)
  639 |     if (whence != SEEK_HOLE && whence != SEEK_DATA) {
      |                   ^~~~~~~~~
../block/export/fuse.c:639:42: error: 'SEEK_DATA' undeclared (first use in this function); did you mean 'SEEK_SET'?
  639 |     if (whence != SEEK_HOLE && whence != SEEK_DATA) {
      |                                          ^~~~~~~~~
      |                                          SEEK_SET

Fixes:
 - http://autobuild.buildroot.org/results/0196609043bd37543e6a0d17ffc2254302ea7ba3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...5-block-export-fuse.c-fix-musl-build.patch | 46 +++++++++++++++++++
 package/qemu/qemu.mk                          | 13 ++++++
 2 files changed, 59 insertions(+)
 create mode 100644 package/qemu/0005-block-export-fuse.c-fix-musl-build.patch

diff --git a/package/qemu/0005-block-export-fuse.c-fix-musl-build.patch b/package/qemu/0005-block-export-fuse.c-fix-musl-build.patch
new file mode 100644
index 0000000000..0da6b3ff73
--- /dev/null
+++ b/package/qemu/0005-block-export-fuse.c-fix-musl-build.patch
@@ -0,0 +1,46 @@
+From 4d5280c066eb46a31556044fb52c2618928b0019 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 9 Aug 2021 10:04:07 +0200
+Subject: [PATCH] block/export/fuse.c: fix musl build
+
+Fix the following build failure on musl raised since version 6.0.0 and
+https://gitlab.com/qemu-project/qemu/-/commit/4ca37a96a75aafe7a37ba51ab1912b09b7190a6b
+because musl does not define FALLOC_FL_ZERO_RANGE:
+
+../block/export/fuse.c: In function 'fuse_fallocate':
+../block/export/fuse.c:563:23: error: 'FALLOC_FL_ZERO_RANGE' undeclared (first use in this function)
+  563 |     } else if (mode & FALLOC_FL_ZERO_RANGE) {
+      |                       ^~~~~~~~~~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/b96e3d364fd1f8bbfb18904a742e73327d308f64
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: sent to qemu-devel@nongnu.org]
+---
+ block/export/fuse.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/block/export/fuse.c b/block/export/fuse.c
+index ada9e263eb..07e31129a6 100644
+--- a/block/export/fuse.c
++++ b/block/export/fuse.c
+@@ -635,6 +635,7 @@ static void fuse_fallocate(fuse_req_t req, fuse_ino_t inode, int mode,
+             offset += size;
+             length -= size;
+         } while (ret == 0 && length > 0);
++#ifdef FALLOC_FL_ZERO_RANGE
+     } else if (mode & FALLOC_FL_ZERO_RANGE) {
+         if (!(mode & FALLOC_FL_KEEP_SIZE) && offset + length > blk_len) {
+             /* No need for zeroes, we are going to write them ourselves */
+@@ -654,6 +655,7 @@ static void fuse_fallocate(fuse_req_t req, fuse_ino_t inode, int mode,
+             offset += size;
+             length -= size;
+         } while (ret == 0 && length > 0);
++#endif
+     } else if (!mode) {
+         /* We can only fallocate at the EOF with a truncate */
+         if (offset < blk_len) {
+-- 
+2.30.2
+
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 96d6eb18f7..ecaa05d670 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -91,6 +91,19 @@ else
 QEMU_OPTS += --disable-tools
 endif
 
+ifeq ($(BR2_PACKAGE_LIBFUSE3),y)
+QEMU_OPTS += --enable-fuse
+QEMU_DEPENDENCIES += libfuse3
+# musl does not support SEEK_HOLE/SEEK_DATA
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+QEMU_OPTS += --disable-fuse-lseek
+else
+QEMU_OPTS += --enable-fuse-lseek
+endif
+else
+QEMU_OPTS += --disable-fuse --disable-fuse-lseek
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
 QEMU_OPTS += --enable-seccomp
 QEMU_DEPENDENCIES += libseccomp
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
