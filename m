Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC7F1C432BE
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 17:06:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69EFD610A2
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 17:06:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 69EFD610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31380404CF;
	Tue,  3 Aug 2021 17:06:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OL4qXzjOh802; Tue,  3 Aug 2021 17:06:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F527404A9;
	Tue,  3 Aug 2021 17:06:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E8B091BF831
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 17:06:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D85FF404A9
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 17:06:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6j15itUUYjES for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 17:06:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 88D4540336
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 17:06:40 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 n28-20020a05600c3b9cb02902552e60df56so2580332wms.0
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 10:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LJCmmEE6Q7H4FHqFuoPWHQdXQysXvUhBASkLE/YrfBA=;
 b=b129d/VImCgbYczlQCasbjsD8YeTIpmmLeauk27/8Pu65kmmS9dhnbgeWnl5a1lvsn
 z8k76hU8JQCt0KKx2cy8lsHPypZBn+voSqFG33XjqOELtmWsOolWeCzid+GJ6yclzWcD
 eq/nnHHHGWl9qWrdR1VWP9N5jxD1E6MbwlU9qMtfsFXy3hMb9Ci3gc3St7EuUo+/U/Mw
 XGFtSdi3FpLGM9cxrdd3Q0MROVqzNRPBXjrRVPgiu9hzIwYqdhmNcTzo2Ob5Wl+Yn5kd
 s284RR3uNTPcvbfFzUccP9h1PgmqwKHR63keViIfVGhCloZkMPwfzjiEJhQGzuXVLgeq
 HE+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LJCmmEE6Q7H4FHqFuoPWHQdXQysXvUhBASkLE/YrfBA=;
 b=eb+2c2//mBPc8/qS2KUIK3Sj9iu3wcQH2fJEhGN0B6f/PuHofTlsvaTQhe/NUacKjM
 Ia5sdtAXFZrEDhbwkLpKCT2mP81HXvFIJBptO2rGJXLQPnNeL3FP8ZcBAV7aGwA+LQOD
 bKF5DR4psJCtpcgxtos2ftr7AjnrG5VlBWYRawbNPAkmWMadeFZwa68YWUexsU2n8RIe
 WR0wYsKnFWuyAUlcyv5zEIsAhdWs+rCSmyO9U/bkw+F02XJ8x2DiPGgmafVjXDHhSsU8
 CrIH+Yaw0wsARbPAgWOwuBd7S6YIWX49iMjsE7qyhX0NwYKW/hwvZUHGLOCMbKqv+uRN
 PVIQ==
X-Gm-Message-State: AOAM533zoSGGA5LSBQB8RkATmSfsZ6Ndr3G4jySWutg9Vo7FI52B9nAu
 97t4JUlVjASdHVRBnvx4B+FS0WkiolcJJA==
X-Google-Smtp-Source: ABdhPJxTczWzNYucpVe2BYXGP6i6FiBStSfZGFv+PoaDmvuryL1byor5ma3M4fz+Dc3vNz9JDWwUng==
X-Received: by 2002:a05:600c:2e4a:: with SMTP id
 q10mr5354872wmf.133.1628010398364; 
 Tue, 03 Aug 2021 10:06:38 -0700 (PDT)
Received: from kali.home (pop.92-184-97-13.mobile.abo.orange.fr.
 [92.184.97.13])
 by smtp.gmail.com with ESMTPSA id g138sm17159978wmg.32.2021.08.03.10.06.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 10:06:12 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  3 Aug 2021 19:06:02 +0200
Message-Id: <20210803170602.343034-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/php: opcache needs dynamic library
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

opcache needs dynamic library since version 8.0.0 and
https://github.com/php/php-src/commit/9a06876072b9ccb023d4a14426ccb587f10882f3
otherwise the build will fail on:

/tmp/instance-4/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /tmp/instance-4/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libc.a(__uClibc_main.os): in function `__uClibc_fini':
__uClibc_main.c:(.text+0x15c): undefined reference to `__fini_array_start'
/tmp/instance-4/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: __uClibc_main.c:(.text+0x160): undefined reference to `__fini_array_end'

Fixes:
 - http://autobuild.buildroot.org/results/526d2e3108ff2506482d1665bcc3ed083961430f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/php/Config.ext | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/php/Config.ext b/package/php/Config.ext
index 7c97316048..5da5d8bed9 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -10,8 +10,12 @@ config BR2_PACKAGE_PHP_EXT_FILEINFO
 	help
 	  File Information support
 
+comment "OPcache needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
 config BR2_PACKAGE_PHP_EXT_OPCACHE
 	bool "OPcache"
+	depends on !BR2_STATIC_LIBS
 	help
 	  Enable the Zend OPcache accelerator.
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
