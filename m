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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E928C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 14:12:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2004E60BD3
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 14:12:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2004E60BD3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F089B826D6;
	Sun, 12 Sep 2021 14:12:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bAAluL6ZnHq5; Sun, 12 Sep 2021 14:12:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 408F6826AA;
	Sun, 12 Sep 2021 14:12:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F1D951BF471
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 14:11:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EEDFE4014E
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 14:11:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g8lnurCf0RvG for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 14:11:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CCC964013A
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 14:11:49 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id x6so10355553wrv.13
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 07:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q2cUljQ9DdJFTmBkXip9KlKBkl4Rr2vRkSP3d2kxpag=;
 b=nzrDYHVq3KjmVF0Tyotd9xH8t0GcJNk/uFBz4cyoQhnAVWNTt+NEe7sAoUjs3iWvAu
 Zfkeov/AI5NeAUzeRGieD5g8i8DR2bbRxdxYu8PdFXck2O8tb5IN80mmlw/NOAdFmMQk
 xDE3vh2qPYJrsQeqkyNM52gkB9K39YWPtLNA6ztRwYUHyw6hXLhD/vl8KISuNho8wPBz
 P8momwJ22cMLsXX574c65XhVpkHQnGgfupmpWFXFk+pF9Zht8k9YRqNsGFPlBJnZWS4w
 KdfRcSUR2XXFycXbHV3lI/tdkKq8yQYC/bQ5PBxHUuhdOowH+T4OGiEIWvRE42H/izAS
 5SjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q2cUljQ9DdJFTmBkXip9KlKBkl4Rr2vRkSP3d2kxpag=;
 b=zYES7SuNpsFbo99WyhN1fbqIJ0DRZ6rcPu3w6a2B24XinhLWeAm3JebE/yIjEPw8Sa
 x8nA+7xbwFwagz52EuT61WETu3UiYsfEr1SFxEmKzSDj36Y2FoUe2Yh1+nzSxyTM/Vuw
 imXsNVPlaewQloEOcAWgH4Kw+v2O8g3J7aTHORc330V5tjNv+ZHnUCgZoUcqMLKhJ9d7
 0ZgW8X99vIh+y2Y3cEQ1B6yoiurKouMIe1adeS9kUIgc0vwAZ7eUIhkwTkiHlIJR++aF
 shNl7FQkail5Juk4VicwzCRau8YwD/XLtTVGMRD6xqvVwfzRe/gFzPyfgawvKIXfzkw9
 Qh7Q==
X-Gm-Message-State: AOAM530y6YWx+qg4ebejvPQa+JCZvEoATuVWXYNBR0QSEi96QgLlg3Vb
 LBOWZ/OgnbfYpRr7DDUqlrVSHZY4yZ8=
X-Google-Smtp-Source: ABdhPJyBYX7JNJ1Dbwa4+s73fbVRaELdVb2cDp11PtHzuJhpbSWQd5u4F2xKHy6uxWaQH5E2Kp/QRQ==
X-Received: by 2002:a5d:43d2:: with SMTP id v18mr7749459wrr.98.1631455908202; 
 Sun, 12 Sep 2021 07:11:48 -0700 (PDT)
Received: from localhost.localdomain
 (2a01cb058f8a180022164e4eb697b4ce.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:2216:4e4e:b697:b4ce])
 by smtp.gmail.com with ESMTPSA id i5sm4570062wrc.86.2021.09.12.07.11.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 07:11:47 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Sep 2021 16:11:30 +0200
Message-Id: <20210912141140.253778-4-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210912141140.253778-1-romain.naour@gmail.com>
References: <20210912141140.253778-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 06/16] support/testing: test_iso9660: bump to
 kernel 4.19.204
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
