Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29634C4167B
	for <buildroot@archiver.kernel.org>; Mon,  2 Jan 2023 07:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78E494048F;
	Mon,  2 Jan 2023 07:15:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78E494048F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ccrQtkeRxv4N; Mon,  2 Jan 2023 07:15:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CEA940493;
	Mon,  2 Jan 2023 07:15:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CEA940493
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0E2861BF3E0
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 07:15:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA49281E29
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 07:15:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA49281E29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UuiPmWEmdJWl for <buildroot@lists.busybox.net>;
 Mon,  2 Jan 2023 07:15:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C86E281E23
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C86E281E23
 for <buildroot@buildroot.org>; Mon,  2 Jan 2023 07:15:43 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id u8so8574724ilg.0
 for <buildroot@buildroot.org>; Sun, 01 Jan 2023 23:15:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NxY/m2tZBsGDf2oceH8LqeuN0gKslc3EiEHGeAMgMy0=;
 b=ZixXeGJ2E3sMABgHY6ov24nRuhCV6yeLQ5GjotwwL48Pl2bR97FJ2QHMt/ETGtQR7e
 JJ1sTze4eb0YlcoH3QoZxdyR7+gfsWwooQH8VPJ+ekHT8HI2vKWGlXrInetlGzUY7Jcm
 HLo6AXHw/x2Bw9hebnDIC41sY2D7xtDr5RD87CkB31nw+yK0PxtQkRXbo5TCTBLj3p6F
 3YfpcnlYUkqf+CAlQblgR12U5aioubWJDYc85IHZRlJPCm/hO3vydCVGWeRejo8Snvgr
 ViOtV8+gKhmDad8P7YDMS5Q4zUVPCPr/u6L+gAVCroGbPMUgyBTCTgzPhmQ+LsxgWA8a
 OG7g==
X-Gm-Message-State: AFqh2krKy03b5Tliw3yP1eQty/wwqlQ9cbdnsTSBTvcUqcURaYjEab9M
 abS+log3kMd8slkOXLlqZn247r2A/vg=
X-Google-Smtp-Source: AMrXdXsb0pR921xYsEYC0L4MW0Twc610cySsAB4olMT4PLd2UXP8rawkyLrOkb6F9tz7WzHWWWPC/w==
X-Received: by 2002:a92:c7c1:0:b0:30c:5319:96c4 with SMTP id
 g1-20020a92c7c1000000b0030c531996c4mr614406ilk.13.1672643742473; 
 Sun, 01 Jan 2023 23:15:42 -0800 (PST)
Received: from joel-desktop-ubuntu.. ([2601:282:2180:1402:63ee:4b97:d744:9ad9])
 by smtp.googlemail.com with ESMTPSA id
 u24-20020a02b1d8000000b0038a5b48f3d4sm8891734jah.3.2023.01.01.23.15.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jan 2023 23:15:41 -0800 (PST)
From: Joel Carlson <joelsoncarl@gmail.com>
X-Google-Original-From: Joel Carlson <JoelsonCarl@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  2 Jan 2023 00:15:22 -0700
Message-Id: <20230102071522.3229935-1-JoelsonCarl@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NxY/m2tZBsGDf2oceH8LqeuN0gKslc3EiEHGeAMgMy0=;
 b=NYAbGkBDjEHiZgeSZ9+/EtFVBJ8ssIIOGIrDJSJJJr3qPWcfFOFsX1lg8bb7SyD6iC
 CS7znMCQiSZ9EIZkM28Yzy3Nd/Q0FJC2VXlEzeVbJXIoaUgLtH0jrwBPUJVNv3d5gwT1
 IM8Iwyg8ZJINc5L5puHTtFoin3iAGpVn2LVWxpuo6yuSA+6tf1K/+ccLF/rLmS65yfcm
 X4T+loDhuhA3KFq3QLxDW0c6UkkrqDNZ4lTBlWZm2lzLy/aKKGRd5O3W/RHgjz0WQ1fM
 WocVz9PX7b0Mw5VVE8Vg372CvsoXJ17b6M1MhPz4iknIircjyytyAwT66y8CECBQKpzb
 0/2A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=NYAbGkBD
Subject: [Buildroot] [PATCH 1/1] package/cmocka: don't allow building for
 Thumb1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The cmocka package checks if a toolchain supports the
-fstack-clash-protection compiler flag, and if it does automatically
uses it. That flag is not supported by GCC for Thumb1 builds (at least
as of both GCC 11 and GCC 12). So disallow building cmocka for Thumb1.
Building for ARM or Thumb2 is fine.

As an example in GCC 12.2.0, within the file gcc/config/arm/arm.cc, the
error occurs in the thumb1_expand_prologue() call:

    /* If we have a frame, then do stack checking.  FIXME: not implemented.  */
    if ((flag_stack_check == STATIC_BUILTIN_STACK_CHECK
         || flag_stack_clash_protection)
        && size)
      sorry ("%<-fstack-check=specific%> for Thumb-1");

An example build error output:
/tmp/instance-7/output-1/build/cmocka-1.1.5/src/cmocka.c: In function 'c_strmatch.part.0':
/tmp/instance-7/output-1/build/cmocka-1.1.5/src/cmocka.c:539:1: sorry, unimplemented: '-fstack-check=specific' for Thumb-1
  539 | }
        | ^

Fixes:
http://autobuild.buildroot.net/results/4044b3a71d3130d934c7a7c0c5badfabb2a97030/

Signed-off-by: Joel Carlson <JoelsonCarl@gmail.com>
---
 package/cmocka/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/cmocka/Config.in b/package/cmocka/Config.in
index cf49d0f6be..6cadaa616a 100644
--- a/package/cmocka/Config.in
+++ b/package/cmocka/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_CMOCKA
 	bool cmocka
 	depends on !BR2_STATIC_LIBS
+	depends on !BR2_ARM_INSTRUCTIONS_THUMB
 	help
 	  cmocka is an elegant unit testing framework for C with support
 	  for mock objects. It only requires the standard C library,
@@ -11,5 +12,5 @@ config BR2_PACKAGE_CMOCKA
 
 	  https://cmocka.org
 
-comment "cmocka needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
+comment "cmocka needs a toolchain w/ dynamic library, and can't be built for Thumb1"
+	depends on BR2_STATIC_LIBS || BR2_ARM_INSTRUCTIONS_THUMB
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
