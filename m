Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6797CC433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 21:56:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2526483422;
	Wed,  9 Feb 2022 21:56:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pf7jEdUEqlJn; Wed,  9 Feb 2022 21:56:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C8AD833B7;
	Wed,  9 Feb 2022 21:56:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A5FDD1BF302
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:43:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 94B9540504
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:43:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hwhuR57BEBl5 for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 21:43:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B36D34067F
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 21:43:42 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id j14so10818380ejy.6
 for <buildroot@buildroot.org>; Wed, 09 Feb 2022 13:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1UNN6FVWy9lCGAY7EU1dZjMbmx/CW4fft2j7LM7yr9Y=;
 b=NnDadOUxFLZj37gzrjAeW/lkb0muFRqY8YjeWOlr2eIsX4firQxz4Z0w3gjTEAbUd4
 f7gA7seIMzlU77anl7M4BUBDCn5USjvPt1XLs+x4ZmTurqbWJKTt1+uQOzha80fsDNRa
 7UwnX/1q9th3HfFKmU6l3Ek9bZ5h89UklpGS3yqCUTkk45QDy35MDD9C/6YIAwXPOagJ
 wrSNiZgwyDDpv4B/dxl1jrIQ2Hh3jjLYWZhG66YT2+JH06OL6/RRcrBF5wGDV6RbnRcM
 McCrQiWzzODDO3wdxQJvPXE9o+QrqD6ou4qBLLu+3T2ov2eSW8wMDQaqYqVJzxoAzy23
 ka9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1UNN6FVWy9lCGAY7EU1dZjMbmx/CW4fft2j7LM7yr9Y=;
 b=GBvvoh5WbA/rkJ3ZzRt+Vwj9nqYOE9KwWl7eG1MSQUI2f52e6UmVnJaMRinuESDSfn
 pc2rv8M2xD0r5G6N7dgRGStOy/wyAiQtgW0R6OFMh1EL68WbOnBoR5fRUKs53nne+4ez
 mZkgc2V/UCbQ2x3zVqZNle0DcsGaI/OLjBh3WeMt1N8FDzUXeQcmacZXOTc7E8W9HNrp
 B87f7+BHxrO4QvK3tvgST9+U2ZXks0KX84p+HQT/1aH/0PTgfn2Whd4IDbVbgSjSfRP9
 NTdf1xJZ+/0cyfN1oF4SjLLNscYMs4f5fx5Pz7Vl5LKCtDgYwRqtia3YEYoTQXHdKVmI
 Ad0Q==
X-Gm-Message-State: AOAM533JrJBCM0HHZbYAE7yRg4wV0KQEh0qxZmGXFhN8wJWpvGGTqXGd
 4dZGQUwB7QjwRuIIRXt73usnv8kqnQE=
X-Google-Smtp-Source: ABdhPJwvIk0XvZR7FUgOtI1dZiweJfCz67HD5sQzJKQ9LkdWeAMxKOXvzATg1hTS+y8jLUsS2H4SAw==
X-Received: by 2002:a17:906:644f:: with SMTP id
 l15mr3819893ejn.135.1644443020547; 
 Wed, 09 Feb 2022 13:43:40 -0800 (PST)
Received: from t450s.fritz.box (ip4d15a215.dynamic.kabel-deutschland.de.
 [77.21.162.21])
 by smtp.gmail.com with ESMTPSA id j11sm4603157ejb.110.2022.02.09.13.43.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 13:43:39 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Feb 2022 22:43:27 +0100
Message-Id: <20220209214326.21671-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/rauc: bump to version 1.6
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>, Andrey Yurovsky <yurovsky@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For release notes see: https://github.com/rauc/rauc/releases/tag/v1.6

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---

# utils/test-pkg -p rauc
                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: SKIPPED
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
                            sourcery-arm [6/6]: OK
6 builds, 1 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed


 package/rauc/rauc.hash | 4 ++--
 package/rauc/rauc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rauc/rauc.hash b/package/rauc/rauc.hash
index a025257845..f6c1446de4 100644
--- a/package/rauc/rauc.hash
+++ b/package/rauc/rauc.hash
@@ -1,4 +1,4 @@
 # Locally calculated, after verifying against
-# https://github.com/rauc/rauc/releases/download/v1.5.1/rauc-1.5.1.tar.xz.asc
-sha256  d4ea009ce702bcb083d942398ccfedec959c6bbb7adc0fd77ae9314ce11d9d91  rauc-1.5.1.tar.xz
+# https://github.com/rauc/rauc/releases/download/v1.6/rauc-1.6.tar.xz.asc
+sha256  86013788dd02321b7c3f913ad3a1f8802afbc784ec076fa278524a9e1ef9e7b0  rauc-1.6.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index 99efc16c2f..39f5255812 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RAUC_VERSION = 1.5.1
+RAUC_VERSION = 1.6
 RAUC_SITE = https://github.com/rauc/rauc/releases/download/v$(RAUC_VERSION)
 RAUC_SOURCE = rauc-$(RAUC_VERSION).tar.xz
 RAUC_LICENSE = LGPL-2.1
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
