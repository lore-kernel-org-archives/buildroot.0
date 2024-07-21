Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FCB7C3DA5D
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 16:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC37F605B0;
	Sun, 21 Jul 2024 16:50:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RppsAqmpVpXl; Sun, 21 Jul 2024 16:50:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BED38605D4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BED38605D4;
	Sun, 21 Jul 2024 16:50:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F10371BF321
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:50:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8B2880A7E
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:50:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H8W9RdmOfr24 for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 16:50:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AF6B880A7C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF6B880A7C
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF6B880A7C
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 16:50:27 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-42726d6eca5so25281915e9.1
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 09:50:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721580625; x=1722185425;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1OUvjkH6SrsA0/nqnrGV2fSMcHBOinCFIcm8yggHv04=;
 b=Yo7JS1jgmlGRcbgDgrZPK1Vo8XMs3OIdp5YlRpdvljR2YpyDXUAL+3UtH9/lgLuha8
 LGcM+o5s5cpnK+OU/pVYJRF74+W8xvW68XTBGLAZAInU2TtYR1J96pX+x+IgOJGbeu1j
 MluyfmCB206ub+Xqx0hgY+9GVZnRs/RYEN1w6X9enOAvyjitc8saOMX6ElkdLPDHAJYx
 CRKqe/cdhdz8Z82UpJyQpNcAetEqTVp2XCaljkLuZrDZGf2E9t1DpSHj955xFL0/On1t
 HtlILUs5oKosrodBpvtTU/hkiNa0p3yUSt+g3xvYfdf9mcFmJOvBlII3fj02o107Dvgy
 5Ijw==
X-Gm-Message-State: AOJu0YwGO7rnhyo2OXRl+as+bpKgfHIYSttLhIcoDLgPcbBbJExDPkTO
 Gnjr2vI1l42dul4CfE1n3rQYR40YfkoczsjELT0l9yK5iEGGvEkrlqBM5w==
X-Google-Smtp-Source: AGHT+IEp0PY2XqRweTEiq7hHjl+Sb1E5TaZwcoUkrap4K2lHqk4WqEmzFTCbYXpP24mZR+bOQe9R0A==
X-Received: by 2002:a05:600c:468e:b0:426:6ead:5709 with SMTP id
 5b1f17b1804b1-427dc520518mr28376495e9.9.1721580625128; 
 Sun, 21 Jul 2024 09:50:25 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d2a3c09csm123588395e9.9.2024.07.21.09.50.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jul 2024 09:50:24 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 21 Jul 2024 18:50:23 +0200
Message-ID: <20240721165023.1988603-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721580625; x=1722185425; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1OUvjkH6SrsA0/nqnrGV2fSMcHBOinCFIcm8yggHv04=;
 b=Pghrfs6Po8bwTCiC0irSt45lv+49VtjRoUYoU2r8AgUnIEhlebwAlsbrb0NmHHv14Q
 03+RQpL01krfplZIH1ZSWs6WUq/J7Q55059EctPPpDbSk5ZsJ61QZZbiqLexUOCvRNSE
 NwYjxL/YtxeP/uDUijRGrkVswJaEZZkyxggIYauFHXDOduoqbNCKu8Hb2MOCSI8Gde3W
 GrJP2uJL+2wXSgS6z2YTlovXzBb0IqxNUo5ud2+w9PAcy/ARdRFqKbtE8Tf+Xw5Z9Qff
 MRx4m9eldfj1g9+bPg169q/PZlFy28Ijru3/mNDoWAkWlEC5bK1MdfZ+JxpDxDD+e+52
 zXKw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Pghrfs6P
Subject: [Buildroot] [PATCH 1/1] package/sysprof: needs headers >= 5.12
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
Cc: Will Newton <will.newton@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

sysprof unconditionally uses PERF_RECORD_MISC_MMAP_BUILD_ID which is
only available since kernel 5.12 and
https://github.com/torvalds/linux/commit/88a16a1309333e43d328621ece3e9fa37027e8eb
resulting in the following build failure with kernel < 5.12 since bump
to version 46.0 in commit 0d57555407f2a0708515e7c377f57a6466c78b1b:

../src/libsysprof/sysprof-sampler.c: In function 'sysprof_sampler_perf_event_stream_cb':
../src/libsysprof/sysprof-sampler.c:186:33: error: 'PERF_RECORD_MISC_MMAP_BUILD_ID' undeclared (first use in this function); did you mean 'PERF_RECORD_MISC_MMAP_DATA'?
  186 |       if ((event->header.misc & PERF_RECORD_MISC_MMAP_BUILD_ID) != 0)
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                 PERF_RECORD_MISC_MMAP_DATA

While at it, also fix a typo in "library"

Fixes: 0d57555407f2a0708515e7c377f57a6466c78b1b
 - http://autobuild.buildroot.org/results/9a9f8462bd1d7127dc80de7f280ab9d100db47fe

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sysprof/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/sysprof/Config.in b/package/sysprof/Config.in
index be4f7653b0..32a5f99798 100644
--- a/package/sysprof/Config.in
+++ b/package/sysprof/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_SYSPROF
 	depends on !BR2_STATIC_LIBS # libunwind, polkit
 	depends on !BR2_OPTIMIZE_FAST # polkit
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_12
 	select BR2_PACKAGE_JSON_GLIB
 	select BR2_PACKAGE_LIBDEX
 	select BR2_PACKAGE_LIBGLIB2
@@ -19,12 +20,13 @@ config BR2_PACKAGE_SYSPROF
 
 	  http://sysprof.com
 
-comment "sysprof needs a toolchain w/ dynamic libraray, wchar, threads, C++, gcc >= 7"
+comment "sysprof needs a toolchain w/ dynamic library, wchar, threads, C++, gcc >= 7, headers >= 5.12"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
-		BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP
+		BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_12
 
 comment "sysprof can't be built with Optimize for fast"
 	depends on BR2_OPTIMIZE_FAST
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
