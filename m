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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31F71C4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 08:25:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA68B60EE9
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 08:25:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CA68B60EE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C53740329;
	Sun,  8 Aug 2021 08:25:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gMe61BJsVrKh; Sun,  8 Aug 2021 08:25:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7C4E40327;
	Sun,  8 Aug 2021 08:25:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 44AB61BF580
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 08:25:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F6DD401CB
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 08:25:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p0SPc9DTZgaS for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 08:25:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0AA9D4016F
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 08:25:45 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id b13so17089441wrs.3
 for <buildroot@buildroot.org>; Sun, 08 Aug 2021 01:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iWgbs0dCRe25MsmXQSUIxzk1FjMvgZGtdoeUbbJHGaY=;
 b=famod1UpLQBfGdyK1v6/9M8Ow4/zh02hkoTgbp4j4czD3EPJMXxERee6sN8kyrp4Vp
 czbn9Bo0KKlIQO7QkrY/hM522vf+Hj0bKOBzIeUeAIN9tZb4UWR13yn4GwPWgP6KMjbA
 toVsF/U8tr41lYHRJBOt1lXBfOWwjawqIh8y1tSKuyRftZbQ609ySS+zGFsAO8ZbL+ue
 7nSmSunIVOqAbyOhNntCQ+lqJ4+JxeJ+qIohMCs9AmsqFCV9BtIvBdwk4px8bdxq5X9L
 XvVbYbqPuKPgP8wqfw4reMEjuniHdQVVxjuMVPqiqMz3jtl/t54icZ1gRR24ZBEaumrO
 SKTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iWgbs0dCRe25MsmXQSUIxzk1FjMvgZGtdoeUbbJHGaY=;
 b=ZQUWn7Vl7LpRE/BMtcAHwNn44xFmBDDswmkC8vucLDAz+kjjFAMg67uuCc7y0xQUo6
 J4n3NmKCAusGpp0+nbjajgsI1tAEz2uZYFQ99d2DJ2KiR6zwlGfaBckWJ47bEzvv14nt
 GXA+QToHJMuNlN+6gEG7taGUtS44d4clJL6YowjxQfTN84/m8PDVOaL3/f4omzzdo35v
 FPCxuy5hr+ok2MqlfTSY2+Y3cmDvSFMQR3HnyUHYavXJ4/etARK9qKuukav22G7/Aveq
 bI03c6dx5TLDsH2EXS+DkHbkLGcSJsWQEtI2ltj0Qtd9qa4O23j/2i/swKcykt/p7juf
 D+cA==
X-Gm-Message-State: AOAM532VCcEkUEcOZ3d4h4gAQtFHGK7WrdDjPqvH+PoXfQTVTaPoMi6I
 vrOfYqDsrXBrrjdXVyGoxl4Eubi9pTEinw==
X-Google-Smtp-Source: ABdhPJx9A0s95ugxDhWUpwfXsJnBDF6K81risLkmq5POy+lw/Eq64AYe6Ypig48rn+CUQnLE4vejbw==
X-Received: by 2002:adf:d194:: with SMTP id v20mr18921162wrc.126.1628411143957; 
 Sun, 08 Aug 2021 01:25:43 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id y3sm3816518wma.32.2021.08.08.01.25.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 01:25:43 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Aug 2021 10:25:06 +0200
Message-Id: <20210808082506.3113286-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/efl: fix build with tslib
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Build with tslib is broken since bump to version 1.25.0 in commit
cf57eceabcca134197fed79c043587439b3d4e39:

/data/buildroot-autobuilder/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/9.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: src/lib/ecore_fb/libecore_fb.so.1.25.1.p/ecore_fb_ts.c.o: in function `_ecore_fb_ts_fd_handler':
ecore_fb_ts.c:(.text+0x4c): undefined reference to `ts_read_raw'

Fixes:
 - http://autobuild.buildroot.org/results/fa111306b95316eed54771550474dae804fa261e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0003-ecore_fb-fix-build-with-tslib.patch  | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/efl/0003-ecore_fb-fix-build-with-tslib.patch

diff --git a/package/efl/0003-ecore_fb-fix-build-with-tslib.patch b/package/efl/0003-ecore_fb-fix-build-with-tslib.patch
new file mode 100644
index 0000000000..8eb159505f
--- /dev/null
+++ b/package/efl/0003-ecore_fb-fix-build-with-tslib.patch
@@ -0,0 +1,35 @@
+From 9a785396a7940ec541cf4793f9c9f92548c99d4c Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 10 Jul 2021 22:38:03 +0200
+Subject: [PATCH] ecore_fb: fix build with tslib
+
+Build with tslib is broken since version 1.25.0 and
+https://git.enlightenment.org/core/efl.git/commit/?id=8e3606698eb439eecd7302a885504365aca7e564:
+
+/data/buildroot-autobuilder/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/9.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: src/lib/ecore_fb/libecore_fb.so.1.25.1.p/ecore_fb_ts.c.o: in function `_ecore_fb_ts_fd_handler':
+ecore_fb_ts.c:(.text+0x4c): undefined reference to `ts_read_raw'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/fa111306b95316eed54771550474dae804fa261e
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/lib/ecore_fb/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/lib/ecore_fb/meson.build b/src/lib/ecore_fb/meson.build
+index 6d50e0f146..7c7f6786c3 100644
+--- a/src/lib/ecore_fb/meson.build
++++ b/src/lib/ecore_fb/meson.build
+@@ -22,7 +22,7 @@ ecore_fb_src = files([
+ ecore_fb_lib = library('ecore_fb',
+     ecore_fb_src, pub_eo_file_target,
+     c_args : package_c_args,
+-    dependencies: ecore_fb_pub_deps + ecore_fb_deps,
++    dependencies: ecore_fb_pub_deps + ecore_fb_deps + ecore_fb_ext_deps,
+     include_directories : config_dir,
+     install: true,
+     version : meson.project_version()
+-- 
+2.30.2
+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
