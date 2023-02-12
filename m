Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21CE9C05027
	for <buildroot@archiver.kernel.org>; Sun, 12 Feb 2023 14:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9405340268;
	Sun, 12 Feb 2023 14:43:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9405340268
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VbjgSLs6K6Ee; Sun, 12 Feb 2023 14:43:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 987CB40240;
	Sun, 12 Feb 2023 14:43:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 987CB40240
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 263B71BF3B0
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 14:43:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D30D8145C
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 14:43:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D30D8145C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NItIN5fneGiX for <buildroot@lists.busybox.net>;
 Sun, 12 Feb 2023 14:43:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48E96813C4
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 48E96813C4
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 14:43:22 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id bu23so9800992wrb.8
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 06:43:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L10rO8cwzlKYdJnYGgPWil+3CmbweNwIONjimC2c7hg=;
 b=MXJafdZ2UlBhM+FNjXWOlaCP01TEB27uKyTnlm5bMpx7RCwu9bIVho780Jef7tVCMk
 XImwccI0z8hTROq6EkZjQShGf11Vkd1UY8ELFUkVMa1fOErP09pw+x+cwQ+M981W43Zm
 S83OmZ9GRaQ3id9/GoCx00hAkl0SXWFY4/ySCgPDmW6CvSOE/qDEZgWZi4yVmg42FE4K
 m9HFBDAUYLSQ7VwMj/hx75q6RFcZwBkqiOLIcxmx7AKfvJfI5JI1wcP6HegKutFXEgoq
 meLI8gBluG0T7msaW5+L81COcNrbHKx2B9o9QPEzy9Hr+pjxR8bZq0Bs47TFH2UNHPvm
 roWA==
X-Gm-Message-State: AO0yUKVQrnHXRnXR0164FbjdkrPYRstMdadam9p+4N94qEojrhquzVeu
 TvalZvACVcK45T0k1n9s/3WngEMQwVQ=
X-Google-Smtp-Source: AK7set9zc+zQTJCjl2XMyEK3GkoKMjGAuKYzQDtM+YiTjjuatPDw6c0BVMAVYX6o6rARfuZgC2O4OA==
X-Received: by 2002:adf:eb0c:0:b0:2c3:f812:1cad with SMTP id
 s12-20020adfeb0c000000b002c3f8121cadmr18738504wrn.37.1676213000127; 
 Sun, 12 Feb 2023 06:43:20 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 r8-20020adff708000000b002c53cd6d281sm8248280wrp.4.2023.02.12.06.43.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 06:43:19 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Feb 2023 15:43:15 +0100
Message-Id: <20230212144316.1181860-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=L10rO8cwzlKYdJnYGgPWil+3CmbweNwIONjimC2c7hg=;
 b=IohfgfiTMV2QCOTxncaNoY5Hgat5nyI1ntvQzXCR/EmdWuTakzdRSLQF8ToZZz9YBJ
 GMagkTgjUce4y/38K+jtc3K4VNDDp9ocJ7miuzPrczgpJW+DSkqsVGn5HIkDEZZ3Y+sR
 U3+6Mvd6b2VQhn7QM/5VKyN0crDnHLan27FAETlCEv5oyhYjO2e+Y8UYiKIFjs6rPqn5
 ozHdonR7QUAqoUTOJVYSaeNyC5b0Anwl6/+nkoo4KlOHq1ZZ+DDKWaEblOy9UxFmxypf
 rZxGApwrGGHS9YZcsmk+7SqQJn17xm2bXhYyNIsacREQY4/vDdbCfehSfBFioilHFFcf
 G7ow==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=IohfgfiT
Subject: [Buildroot] [PATCH 1/2] package/libsolv: drop unrecognized variables
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
Cc: TIAN Yuanhao <tianyuanhao3@163.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop unrecognized variables:

CMake Warning:
  Manually-specified variables were not used by the project:

    BUILD_DOC
    BUILD_DOCS
    BUILD_EXAMPLE
    BUILD_EXAMPLES
    BUILD_TEST
    BUILD_TESTING
    BUILD_TESTS
    CMAKE_CXX_COMPILER_FORCED
    DISABLE_STATIC
    ENABLE_SHARED

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libsolv/libsolv.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/libsolv/libsolv.mk b/package/libsolv/libsolv.mk
index 29f8a6a3d2..04fdb387fd 100644
--- a/package/libsolv/libsolv.mk
+++ b/package/libsolv/libsolv.mk
@@ -11,16 +11,15 @@ LIBSOLV_LICENSE_FILES = LICENSE.BSD
 LIBSOLV_CPE_ID_VENDOR = opensuse
 LIBSOLV_INSTALL_STAGING = YES
 LIBSOLV_DEPENDENCIES = zlib
-LIBSOLV_CONF_OPTS = -DCMAKE_CXX_COMPILER_FORCED=ON
 
 ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
 LIBSOLV_CONF_OPTS += -DENABLE_STATIC=ON
 else
-LIBSOLV_CONF_OPTS += -DDISABLE_STATIC=ON
+LIBSOLV_CONF_OPTS += -DENABLE_STATIC=OFF
 endif
 
 ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
-LIBSOLV_CONF_OPTS += -DENABLE_SHARED=ON
+LIBSOLV_CONF_OPTS += -DDISABLE_SHARED=OFF
 else
 LIBSOLV_CONF_OPTS += -DDISABLE_SHARED=ON
 endif
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
