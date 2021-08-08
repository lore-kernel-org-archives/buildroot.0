Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB5BAC4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 17:15:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6155C60EE4
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 17:15:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6155C60EE4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C1CB40331;
	Sun,  8 Aug 2021 17:15:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x_5bY1eJY81g; Sun,  8 Aug 2021 17:15:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7169340324;
	Sun,  8 Aug 2021 17:15:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 956951BF575
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 17:15:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 923AD40324
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 17:15:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tfXdt1k1X4Eo for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 17:15:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 75D2240322
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 17:15:38 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 m36-20020a05600c3b24b02902e67543e17aso1805910wms.0
 for <buildroot@buildroot.org>; Sun, 08 Aug 2021 10:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HDQ2gCuJpBLP0mg+jQny3+k9ntxH8hr+SCtpvPTenvM=;
 b=jllsnnPUeDTkwlHcKpIqNz3iV8ZlpOv6bseR4edCo4TAY7Js6bxqFZ8wJu9veGeWos
 DxtxK1LwS1N8M/1GPmAPArWAomGMCBi0XGADSQ20JPBr5BKfP+Ua2F1jzoPvB55FM9OX
 2cFHipoXtb0UdX7T/GWrNQ8UrAm0evtbSFz9UpZumfGbssnKp/C3SeJRADfT/qtxE6Tf
 5WWxyn0glIT+LbFJ0R4KtcqGpco9nJz3noRYe595HhVzve4jSB9es9tzylLRefI/vnmQ
 tXn9TU8A3A8cvH9IrqVfC+7VhUqPgDPCYquGO9dswCsN7rNtHnWLS/yd6QEZZAmwJPfj
 R4Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HDQ2gCuJpBLP0mg+jQny3+k9ntxH8hr+SCtpvPTenvM=;
 b=jk42oyx19yVg919qxFfOyGd74oghCc1gKM6acIRILWNsIxf54rq6twShRjGYMnOw1v
 i2Wh38FClN0vbbwrUDWiYKKzWOdIwy8ab4EBStdOPPxfwx5IQ6UyHCV07ITjjXSI1a4t
 KZT8biXf0k4wsbZb9HK0XZFdIbrtOifm9nzjrBsbOHXTYIGAKOs/omwL+kx/7OhYap44
 iJZ8chlIlj5+5QAfGujQ4RMSfsWiuaRyjbuZexMWO9msEzpbIldgZtHrB0EBL2Xp2Wnl
 MZDb9CpQ8DIIZtSPWyjGPYPbDdy0IyXSBrwaybyXtAshOjjjIerq++ewHWh7vXjy8y48
 XEWg==
X-Gm-Message-State: AOAM530KhOZD5kwuDAcl4qhllIZlBe83wxpfQIB0JW9AFkEl5UjWfruP
 Jgsa9rAo9jsXQW73HA+9bNvVc5YwWd3XLQ==
X-Google-Smtp-Source: ABdhPJx7jLC+3fvxzawJW7cvM+b0/ueg2asGH2taAnuezxkVh/VrZVMOC/Nv+YZmSe53hHoI8JOrZQ==
X-Received: by 2002:a05:600c:3b9b:: with SMTP id
 n27mr30018519wms.188.1628442935972; 
 Sun, 08 Aug 2021 10:15:35 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id f26sm16749273wrd.41.2021.08.08.10.15.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 10:15:35 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Aug 2021 19:15:18 +0200
Message-Id: <20210808171518.3700828-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/seatd: fix build with gcc < 7
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Since its addition in commit daae31149017cbf8b03634cfc56da132f7e1ad83,
seatd fails to build with gcc < 7 because it unconditonally uses
-Wimplicit-fallthrough which is only available since gcc 7.1 and
https://github.com/gcc-mirror/gcc/commit/81fea426da8c4687bb32e6894dc26f00ae211822
resulting in the following build failure:

arm-none-linux-gnueabi-gcc: error: unrecognized command line option '-Wimplicit-fallthrough'

Fixes:
 - http://autobuild.buildroot.org/results/0ee6816a7cceebdafd07612677a594bdf68e0790

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...003-meson.build-fix-build-with-gcc-7.patch | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 package/seatd/0003-meson.build-fix-build-with-gcc-7.patch

diff --git a/package/seatd/0003-meson.build-fix-build-with-gcc-7.patch b/package/seatd/0003-meson.build-fix-build-with-gcc-7.patch
new file mode 100644
index 0000000000..0e9f437cc3
--- /dev/null
+++ b/package/seatd/0003-meson.build-fix-build-with-gcc-7.patch
@@ -0,0 +1,48 @@
+From 0b32c33978fbe8772df6d185c9b9d646c442dc5d Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 8 Aug 2021 19:00:35 +0200
+Subject: [PATCH] meson.build: fix build with gcc < 7
+
+Test if -Wimplicit-fallthrough is available before using it as it has
+been added only since gcc 7.1 and
+https://github.com/gcc-mirror/gcc/commit/81fea426da8c4687bb32e6894dc26f00ae211822
+and so it will raise the following build failure with gcc < 7:
+
+arm-none-linux-gnueabi-gcc: error: unrecognized command line option '-Wimplicit-fallthrough'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/0ee6816a7cceebdafd07612677a594bdf68e0790
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/kennylevinsen/seatd/pull/1]
+---
+ meson.build | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 1131b4b..c366a59 100644
+--- a/meson.build
++++ b/meson.build
+@@ -31,7 +31,6 @@ add_project_arguments(
+ 		'-Wold-style-definition', # nop
+ 		'-Wpointer-arith',
+ 		'-Wstrict-prototypes',
+-		'-Wimplicit-fallthrough',
+ 		'-Wmissing-prototypes',
+ 		'-Wno-unknown-warning-option',
+ 		'-Wno-unused-command-line-argument',
+@@ -45,6 +44,11 @@ add_project_arguments(
+ 	language: 'c',
+ )
+ 
++cc = meson.get_compiler('c')
++if cc.has_argument('-Wimplicit-fallthrough')
++	add_project_arguments('-Wimplicit-fallthrough' , language : 'c')
++endif
++
+ if ['debugoptimized', 'release', 'minsize'].contains(get_option('buildtype'))
+ 	add_project_arguments('-D_FORTIFY_SOURCE=2', language: 'c')
+ endif
+-- 
+2.30.2
+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
