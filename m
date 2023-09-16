Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F6FECD37BB
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 14:23:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 915356103F;
	Sat, 16 Sep 2023 14:23:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 915356103F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Z3RaVLKXJYg; Sat, 16 Sep 2023 14:23:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E508861046;
	Sat, 16 Sep 2023 14:23:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E508861046
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A47501BF40D
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 14:23:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C8CD41B77
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 14:23:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C8CD41B77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dS15BddfT03s for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 14:23:02 +0000 (UTC)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 25F1841B74
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 14:23:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25F1841B74
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4018af103bcso20082345e9.1
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 07:23:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694874180; x=1695478980;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TCfMCfag40EZLXSTDp4BqDbGT+yRI2kOr4tnfd5yjCk=;
 b=Rn75I3BUPm/Bj8tYcRYt/KiS3RR/ElVxRIXpWen2t9ihdabZ3ggXoRw8LQn1HFgH83
 04p/n2/3dgA0UgrRTp8EeZqveyFmuFo8yU+qCFdHX4+BHOngxpHrHAX5EdsaSsYMCa5C
 JwFOJNDphLQBuxALDFpb3nem8WyzqpwSFKCMX4Nz7YKEVjE0v9zzgGeb/L8muH3U1M8m
 O0DVR5HZDsrkAIHv7bNdH/V294WsVrp5LR9EbH1fwyyVw9H6rLu2fqtxBThQ2nkPYtgr
 WaUVw957pp8yH1fDhApvm2Nfnn51Ml2yGqu+20C2QS4iJHmxt9lma7WlY+3KgzP1hBKA
 msIg==
X-Gm-Message-State: AOJu0YzQStpdvSkt/zoZq8I+6tdeSiiNY8CDgfU8sJJCvE+s03jFbRJb
 64VYQlQcWAp134a0yZX4lF8NnyZkmWk=
X-Google-Smtp-Source: AGHT+IGqk7b2SYSATly0ePrWVyV+rzkDtahvXeKrod417p65PN9j+aTpW41UDx07aDo6JUvbB7qjpw==
X-Received: by 2002:a05:600c:54ed:b0:400:140c:6083 with SMTP id
 jb13-20020a05600c54ed00b00400140c6083mr5714782wmb.2.1694874179685; 
 Sat, 16 Sep 2023 07:22:59 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 l12-20020a1ced0c000000b003fed4fa0c19sm10288851wmh.5.2023.09.16.07.22.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Sep 2023 07:22:59 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 16 Sep 2023 16:22:56 +0200
Message-Id: <20230916142256.384319-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694874180; x=1695478980; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TCfMCfag40EZLXSTDp4BqDbGT+yRI2kOr4tnfd5yjCk=;
 b=OfhCyq7fgN6Uf8Fbzgs8svkgcXaFzGslc24zvOmwGxCL1c4at2GkJ6ev6x6Jw+Dzfc
 tIR5tHxHBspwXSspM4ui2+Hr1SPo8WUOfYZrvME0/FLnVPuhSVjMyfx2GCHAZCHxZLWI
 LWCTp6KSqVg3C6d28wPq82pD5f3Lb/vjs2UUtsRJYqXiRq48TTtd9JRMz+x/AqcaIMW6
 sKtpPHt9xZDMbCzXIm2RCqJ1VHUV5cnUQuU420lZkjl4MxDy/oITsuyqpeHkqF9pT18h
 4xTi6J3uIlzTxuHHM9lDiM33x3Ci3HYbGEZjy5m9a8tWr7bIc/W99fXbTxYtFXggxHhe
 zDUQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OfhCyq7f
Subject: [Buildroot] [PATCH 1/1] package/check: disable static build
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

check can't be built statically since switch to cmake in commit
6dfc789f4f21367bc5f4b5454db0922821a765bc:

/home/autobuild/autobuild/instance-2/output-1/host/lib/gcc/mipsel-buildroot-linux-uclibc/12.3.0/../../../../mipsel-buildroot-linux-uclibc/bin/ld: libcheck.so.0.15.2: hidden symbol `__fini_array_end' isn't defined

Fixes:
 - http://autobuild.buildroot.org/results/0d6/0d6fcbedef29bf0d6a1d9ecb8e4d82b4ad06cfa8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/check/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/check/Config.in b/package/check/Config.in
index 2312fbf81c..a3a7ff1f11 100644
--- a/package/check/Config.in
+++ b/package/check/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_CHECK
 	bool "check"
+	depends on !BR2_STATIC_LIBS
 	help
 	  Check is a unit testing framework for C.
 
 	  https://libcheck.github.io/check/
+
+comment "check needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
