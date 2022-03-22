Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B784C433EF
	for <buildroot@archiver.kernel.org>; Tue, 22 Mar 2022 23:24:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C94158412B;
	Tue, 22 Mar 2022 23:24:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6eO-uscgV0ZI; Tue, 22 Mar 2022 23:24:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E418C824C1;
	Tue, 22 Mar 2022 23:24:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 03BA81BF427
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 23:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 001BA418EB
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 23:22:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dE5jiCqXdQrf for <buildroot@lists.busybox.net>;
 Tue, 22 Mar 2022 23:22:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5B3EE418E7
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 23:22:42 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id i12so9133587ilu.5
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 16:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u8e//hUm5vJ2kHVeWKClPIKWuwe0MtbuWbPA7N4blDA=;
 b=CLL1jg6ziUBpi1IiV7tVIrXaGudEy96IFBaiZC9kqtdwXrCSz5pll/s43t8wzXvnE1
 UZCmbfx91IZYhXavYd+uXwA/YvSV12376jufVgyLXwkiI9B+HxiWLHGLZFyov7aWoWBh
 FAJ4SAKt/INF6Fx869wjzL8ZsBoc//k5QGpn6ndM7E8STI8cZduVMvJtlx711OdO6MhJ
 qfIu4CA6ahZ5WbOAYSG9z3M6pvP46hD/64FPf+MUYCaJqI00XZnhji3CUr8MqNDa2N0z
 reESBjMrjStqPa6Vl6wY/tQpS9vWgpKm3zL3eCHvJSVppatj4Ua8AKOOUzr3Vwn7rlO/
 Cj+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u8e//hUm5vJ2kHVeWKClPIKWuwe0MtbuWbPA7N4blDA=;
 b=AMykDHRQxnH0NJqYXQzSLBEcxbVONPcCIZOXS2UMDIOwbk+/XmcpNOjFEOawn5ZiIH
 pW9SL8/uap19bgOhLe9T4YJfs1+JCGf/YZJ9iiUb6jAzyKMRu0pyx90jkTtIQnZ2kIHu
 YFuotVw9WNviYBbiZozOlWonjc8Znqt1UXdRBriAlAnMOHP3z1JqCjlHc3bq2paANm7Q
 EV69xABw1VqrfD4ID2DRXSARiWyoDoqpLT2fMtVPdyOsTrBFyzEnIq+m5ez2/LXJ6tjA
 /WJU1uxfTAG70zauMvNwzK+9zyxvGwmkAAhjwHt66efZzo3BNoCQ5kXFYOl2ZNRbOLE8
 LlNg==
X-Gm-Message-State: AOAM531StSYllYvtjrsrRtGCMJzFUScCJQqtlUvOA2n63yZCUVLu8NJd
 qvNTEV1eFoIe6D+ojspr0JJM9LtC8n76Y+Lx
X-Google-Smtp-Source: ABdhPJyLnBIinDRfjoD1Ummuq7zKzi55mB37LmDQnZOwG0mCLYafHFstTwxvCUmd1HyaWnQ2jTJBew==
X-Received: by 2002:a05:6e02:1e09:b0:2c7:c807:1b94 with SMTP id
 g9-20020a056e021e0900b002c7c8071b94mr12630031ila.116.1647991361221; 
 Tue, 22 Mar 2022 16:22:41 -0700 (PDT)
Received: from james-x399.localdomain (71-218-122-133.hlrn.qwest.net.
 [71.218.122.133]) by smtp.gmail.com with ESMTPSA id
 i81-20020a6bb854000000b00649c1b67a6csm2006324iof.28.2022.03.22.16.22.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 16:22:40 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 22 Mar 2022 17:22:24 -0600
Message-Id: <20220322232224.2842266-11-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220322232224.2842266-1-james.hilliard1@gmail.com>
References: <20220322232224.2842266-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v12 11/11] package/compiler-rt: runtime test use
 toolchain-wrapper
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Bernd Kuhls <bernd.kuhls@t-online.de>,
 Matt Weber <matthew.weber@rockwellcollins.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Matt Weber <matthew.weber@rockwellcollins.com>

The toolchain wrapper for clang allows the build of the
libfuzzer package to not point at "-B $(HOST_DIR)/opt/ext-toolchain"
which prevents a build failure to link due to missing crtbeging.o
and libgcc.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 .../clang-compiler-rt/package/libfuzzer/libfuzzer.mk            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/br2-external/clang-compiler-rt/package/libfuzzer/libfuzzer.mk b/support/testing/tests/package/br2-external/clang-compiler-rt/package/libfuzzer/libfuzzer.mk
index 6c6371bea7..0515b9da35 100644
--- a/support/testing/tests/package/br2-external/clang-compiler-rt/package/libfuzzer/libfuzzer.mk
+++ b/support/testing/tests/package/br2-external/clang-compiler-rt/package/libfuzzer/libfuzzer.mk
@@ -12,7 +12,7 @@ LIBFUZZER_DEPENDENCIES = compiler-rt
 
 define LIBFUZZER_BUILD_CMDS
 	$(HOST_DIR)/bin/clang++ --sysroot=$(STAGING_DIR) \
-		-B $(HOST_DIR)/opt/ext-toolchain -fsanitize=address,fuzzer \
+		-fsanitize=address,fuzzer \
 		$(@D)/tutorial/libFuzzer/fuzz_me.cc \
 		-o $(@D)/fuzz_me
 endef
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
