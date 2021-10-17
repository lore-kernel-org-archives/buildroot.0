Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87E51C433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 09:32:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37C3A60F6E
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 09:32:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 37C3A60F6E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 020D74039D;
	Sun, 17 Oct 2021 09:32:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nZ-sLUQobOmh; Sun, 17 Oct 2021 09:32:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59FBD40399;
	Sun, 17 Oct 2021 09:32:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 411DF1BF3CD
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 09:32:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22E7E40399
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 09:32:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AJzQYIZMjA9g for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 09:32:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0774C40394
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 09:32:21 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 l38-20020a05600c1d2600b0030d80c3667aso5838735wms.5
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 02:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Cgqt3SwmF2TBOKQkLK/W9vnGtlrhskgwDNzOWIlPSck=;
 b=ge4rNcnKA6QplS0TDkm+erOufQwx5CX4jo6xz5FkOXU8TI+Ax4HMfniLi8U/7FkJvq
 65sbFAlAaxy0jOo69L5PcxGhQBDyPL5kHtNVC65waNTZEwoAs6TLpsk3qc5rfcQewRRC
 hWmLsMBbXkse1FZkn+qsh2bH8zVM2jZz9U5awTv5jUuUavIg9ofjPhsUeNcKtO6OYGQc
 FS3uW49otkaHWv/5mIFlXHU5CnhRnBKTxi0raPu3WolmUHOm7CQlNW7zviXNhwcFOL/Z
 4LAQ16JWM+qbJlqd+PH9GYD42rTf4h+PqpBEDeWNbHbeHG9jgq7/ld06D5b7xzb0IcsO
 QSeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Cgqt3SwmF2TBOKQkLK/W9vnGtlrhskgwDNzOWIlPSck=;
 b=PqHTf5hQEeYYy2O0JRFk6fKK3V2iJO3hgScOJxK8/M+IUEHmZHFYhybMsSzggp+7s+
 wdQ30Eo7y8pr5n7V+ORRYFGyisTOeyJGhrtmynpbhl6lFT9B5jyyY8uae02eSnb1XB9b
 6GYdC5YudRoqjdVmR+ahsxVqEALxSJvmyAREBrfcxVqJpzRpPVkSLsETiO7CPIPc5Bd3
 CRYfriuaRku5D1T8BqMhaPzTxJF18Bkn3blIS75RHKY4N/pHvNGNBFgFXlEPolD0UQbW
 O8HPaZ8Y+9U35jKOO/s+Rz6gFb285BKDQxZpXlrS2B71Wqw/YszzyV8JN2X0w6NrDAGg
 8WIw==
X-Gm-Message-State: AOAM533bOGHqiBtIgtUZl2T7h7qMNKGpDD7my3raAj0aRJWWYlsqDeO4
 D3hknUUeFDzVUxLQVT4mRtima57RGJE=
X-Google-Smtp-Source: ABdhPJytW8pIm1yBXqwdQP6zZlhBaWqYvhPM6JZkaShK24hby5b/YUry7m9e3qo+86vOPlt7RJSQCw==
X-Received: by 2002:a05:600c:4103:: with SMTP id
 j3mr37610017wmi.30.1634463140030; 
 Sun, 17 Oct 2021 02:32:20 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id u15sm3752532wmq.12.2021.10.17.02.32.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 02:32:19 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 17 Oct 2021 11:31:01 +0200
Message-Id: <20211017093101.984498-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/firmware-utils: bump to
 86739f2b3ae9502368b89ef37fa6f31c42aad6f4
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
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This bump will fix the following build failure raised since the addition
of package in commit 21d2a0c2ecfdddb250007ce75d1839ba81278e5b thanks to
https://git.openwrt.org/?p=project/firmware-utils.git;a=commit;h=f9ad6b335e0fd699398370d4c6e2e45e1c459dea
and
https://git.openwrt.org/?p=project/firmware-utils.git;a=commit;h=86739f2b3ae9502368b89ef37fa6f31c42aad6f4:

/home/giuliobenetti/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc64-buildroot-linux-gnu/9.3.0/../../../../powerpc64-buildroot-linux-gnu/bin/ld: CMakeFiles/ptgen.dir/src/ptgen.c.o: in function `gen_gptable':
ptgen.c:(.text+0x234): undefined reference to `bswap_64'

Fixes:
 - http://autobuild.buildroot.org/results/1e8/1e80722954fc7bd090780200b1a58b6078b601ed/build-end.log

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/firmware-utils/firmware-utils.hash | 2 +-
 package/firmware-utils/firmware-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/firmware-utils/firmware-utils.hash b/package/firmware-utils/firmware-utils.hash
index 152b0753c1..16197cabd0 100644
--- a/package/firmware-utils/firmware-utils.hash
+++ b/package/firmware-utils/firmware-utils.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  57b95dac6b011f4c773d6e661f7eb5b2c992079901f87610d1ed16aaacb22542  firmware-utils-2f70fedc92bd08f9e182fcc388688f36310a597d-br1.tar.gz
+sha256  0df1b7912d68822025f9bb6a7ddfdf9675e2116d34c3c74bbdc83defcefe203c  firmware-utils-86739f2b3ae9502368b89ef37fa6f31c42aad6f4-br1.tar.gz
diff --git a/package/firmware-utils/firmware-utils.mk b/package/firmware-utils/firmware-utils.mk
index 93f56dbb36..151a01882d 100644
--- a/package/firmware-utils/firmware-utils.mk
+++ b/package/firmware-utils/firmware-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FIRMWARE_UTILS_VERSION = 2f70fedc92bd08f9e182fcc388688f36310a597d
+FIRMWARE_UTILS_VERSION = 86739f2b3ae9502368b89ef37fa6f31c42aad6f4
 FIRMWARE_UTILS_SITE = git://git.openwrt.org/project/firmware-utils.git
 FIRMWARE_UTILS_LICENSE = \
 	BSD-2-Clause (tplink-safeloader), \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
