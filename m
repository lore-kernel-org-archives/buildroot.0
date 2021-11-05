Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33216C433F5
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 19:34:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2ABE61101
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 19:34:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A2ABE61101
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41BF560775;
	Fri,  5 Nov 2021 19:34:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2hsMeuDTLLaJ; Fri,  5 Nov 2021 19:34:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A550160715;
	Fri,  5 Nov 2021 19:34:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 207021BF580
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 19:34:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1CC1A60715
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 19:34:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9gJXhyjevj0d for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 19:34:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2284960710
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 19:34:37 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id d24so15369991wra.0
 for <buildroot@buildroot.org>; Fri, 05 Nov 2021 12:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Eq97Xr6nqpOVwR0WG/9GRl45VpWCeqjvWfUYxfVzJac=;
 b=RwBYmP25emjP7k04MbAkNIBRaWZ9PXarPdT/z3p4b+1P0yTfnBFYCTonqBJxwNXSQf
 frVgtZHIb8fAHI2pSvZeml5kPb/eqIndjY4Emd6FMlNjxNHyci0zxL+uR2Zr7SVccw3Z
 XZEkHkELN6EgIYsAfZ77aOAwqIfYxLlg7u9xTiS5QXRpgGLu7m5M/m1IHMtc8GpJPye4
 mRd5x2IZbkJEFEPPRIs39o+wf5I9EU1WBHtNbtcFZyxzFgzUSMj/E+1ZzMWUJiX2Ymi6
 D9GgNnzPyAh9mm/LSmalkEaR/uRbMfieF04x6jLqjePYsOjeNjWwlyCTVU811LrM7x9I
 nohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Eq97Xr6nqpOVwR0WG/9GRl45VpWCeqjvWfUYxfVzJac=;
 b=5x9vwrSjl4PVyRBb1m40H1JndApQqrrN+JUjoTjZTYYxs0MGH3qwDzD5a9Ql6xRZbq
 RjW3Cc1OZJjefO3Lu4IYRC2MfkVNIc6fNdnB5h0inh1D4ggmjY51rw+Buw7hbC+x4fYT
 SADXWt6NNqIAa4m+RVZNjPR0ub2Ahvn/30G1yK6wH67GKBpU08VRem0huXlC/mrhEQ7B
 1vbHYDokwaFlIpxscPedu6efNTDYwBBr8+jwZ7pU5z6tnV44WlezB232/runOn029c32
 MU8AYxWpDotiwK6eeRNwidGbkSG0ieJREzae7toiFVhXNXt7loUNHRxu8vllC7IKU6WA
 tB9g==
X-Gm-Message-State: AOAM533/vA/e6le8ji3SN8RaotLYNSnTin7iR9yb2vzB5AOXIDL7JBQj
 VVC6nD47znwNY1Fi+59ZRYU0uZkDfQg=
X-Google-Smtp-Source: ABdhPJyufgYYwSHMDG9apTN/a8KvgTblRpvadewmMlyp7icJBOuSG70RiCLjxwLm/VrqQY5C7b30+Q==
X-Received: by 2002:a05:6000:18a3:: with SMTP id
 b3mr27637939wri.343.1636140874973; 
 Fri, 05 Nov 2021 12:34:34 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id x13sm8813042wrr.47.2021.11.05.12.34.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 12:34:34 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  5 Nov 2021 20:32:43 +0100
Message-Id: <20211105193243.2530585-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/janet: link with -latomic if needed
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Link with -latomic if needed to avoid the following build failure since
bump to version 1.18.1 in commit
1ffdab3eac6ea111e37fcc5077f8a64b611c55be and
https://github.com/janet-lang/janet/commit/eb0b37f7296611a411b9a86d9d65fe620b0454d8:

/home/giuliobenetti/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/9.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: janet.p/meson-generated_.._janet.c.o: in function `janet_abstract_incref':
janet.c:(.text+0x2790): undefined reference to `__atomic_fetch_add_4'

Fixes:
 - http://autobuild.buildroot.org/results/8d204d8f065e6e4bc1376edd1f639864b3c69c0b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/janet/janet.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/janet/janet.mk b/package/janet/janet.mk
index 20917ec8fa..71e9e08e62 100644
--- a/package/janet/janet.mk
+++ b/package/janet/janet.mk
@@ -15,6 +15,11 @@ ifeq ($(BR2_STATIC_LIBS),y)
 JANET_CONF_OPTS += -Ddynamic_modules=false
 endif
 
+# Uses __atomic_fetch_add_4
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+JANET_LDFLAGS += -latomic
+endif
+
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
 JANET_CONF_OPTS += -Dsingle_threaded=true
 endif
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
