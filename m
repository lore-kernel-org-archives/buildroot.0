Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78EECC04FFE
	for <buildroot@archiver.kernel.org>; Wed,  8 May 2024 08:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2317C81438;
	Wed,  8 May 2024 08:49:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hv-1oTN2Slw7; Wed,  8 May 2024 08:49:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 260878144A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 260878144A;
	Wed,  8 May 2024 08:49:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ED1141BF408
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 08:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D6C58605CD
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 08:49:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Eq7i57de-GCt for <buildroot@lists.busybox.net>;
 Wed,  8 May 2024 08:49:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9F933605BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F933605BD
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9F933605BD
 for <buildroot@buildroot.org>; Wed,  8 May 2024 08:49:28 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-41dc9c83e57so3102165e9.0
 for <buildroot@buildroot.org>; Wed, 08 May 2024 01:49:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715158166; x=1715762966;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rRZ1g+5YmTNN327rh1a8TSrTKPxnM1+OocPxv8NaMpg=;
 b=RjPyOo9mAOBQfj41UjkT3BFCs1qNRMRWa1+v+8H52i8ahXyS4GcezPh9vMEongQWp9
 KWsFqXXCIKluWzACIL+Ovvg1fI/1FAz/ZjReo3gv/jgkvdER4YtKkmQg0210palfKvRT
 Qc4iei4ZoBoMyqPXzO1vihqES3D5PFfqpKs4m2EWduj4p9EjXrySU7pMsqLcK2+z2eLU
 K9zvGb0ADP/O+qDLK2gr0PKrD7makTIVcZn4v1wjJh5QLXMYVE5b60/8K6dOUwp/xc4S
 lMuRxwfgjO7At4nMJnIWXcXKqQ948C9tAJlySxXGwOtGF05Kfrn2stEPE9tqexP94wga
 VWBw==
X-Gm-Message-State: AOJu0YwY8Nq2qLMEA7g6kEMPu/Bbk5ldk2jxLAlPWt04Mex2O91jA/ig
 xIL7/d3El9qiXwpeSnvp3Xa19IFpoi3+7t9qQlb+0WxC8ILe/iLMvRYWjA==
X-Google-Smtp-Source: AGHT+IEpWVh7qpmob0jZluz+UQs/kKOcryiOWJsMTMpKu1sN7motmNjQHv16QInVU7mAztWJPrZgXw==
X-Received: by 2002:adf:f850:0:b0:34f:89d6:ca7e with SMTP id
 ffacd0b85a97d-34f89d6caecmr3969463f8f.1.1715158166027; 
 Wed, 08 May 2024 01:49:26 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 c4-20020a5d5284000000b0034b1a91be72sm14783683wrv.14.2024.05.08.01.49.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 May 2024 01:49:25 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  8 May 2024 10:49:18 +0200
Message-ID: <20240508084918.472419-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715158166; x=1715762966; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rRZ1g+5YmTNN327rh1a8TSrTKPxnM1+OocPxv8NaMpg=;
 b=RVLDK/5D5ObxIaaEYdCqLqWOfdcuGFuIHa/WYJS3cIwnTdWCvKEVpP9k97RSzbf1zt
 3HN3XLRawfCDyUM6gdafa0TBZJFDjnEEsDtmUtG/DiCVCvPMZaJFw2tUPFZQ8M+6erCI
 /FK/6DNTZj6GFHh14ZS/r7Jex6n9OuivlXRJdZwa88iWF9HhLHxFRpKKKxi1qx2jnp2X
 DQyS2KUW0mGluByz2cg3H/suCvErmtP0rR/fucn3jrPV8980dD5YlLtx9Bduv7lj2umH
 yYUyB2kSyxSzKx6FjLnr4a0ri2FLMXQDChDK+EPzkrMJUDz3HDMyJUsn8stCxSGuyP2H
 jblA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=RVLDK/5D
Subject: [Buildroot] [PATCH 1/1] package/igt-gpu-tools: disable chamelium
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable chamelium to avoid the following build failure if gsl is found
but not alsa-lib raised since the addition of the package in commit
d8a729d1731339da141612be33c5e59bc9928748:

In file included from ../lib/igt_audio.c:35:
../lib/igt_audio.h:35:10: fatal error: alsa/asoundlib.h: No such file or directory
   35 | #include <alsa/asoundlib.h>
      |          ^~~~~~~~~~~~~~~~~~

Fixes: d8a729d1731339da141612be33c5e59bc9928748
 - http://autobuild.buildroot.org/results/a7818af881d9aafa9a36f87dc7c882a6880554e8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/igt-gpu-tools/igt-gpu-tools.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/igt-gpu-tools/igt-gpu-tools.mk b/package/igt-gpu-tools/igt-gpu-tools.mk
index d4997c9c28..e3e7d4a896 100644
--- a/package/igt-gpu-tools/igt-gpu-tools.mk
+++ b/package/igt-gpu-tools/igt-gpu-tools.mk
@@ -23,7 +23,9 @@ IGT_GPU_TOOLS_DEPENDENCIES = \
 	udev \
 	zlib
 
-IGT_GPU_TOOLS_CONF_OPTS = -Dtests=disabled
+IGT_GPU_TOOLS_CONF_OPTS = \
+	-Dchamelium=disabled \
+	-Dtests=disabled
 
 # On x86 systems, libigt resolves igt_half_to_float and igt_float_to_half as
 # indirect functions at runtime by checking CPU features with igt_x86_features.
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
