Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E681AC3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 21:50:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F18580B89;
	Tue, 23 Jul 2024 21:50:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9NIECWlqTitp; Tue, 23 Jul 2024 21:50:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B84680B76
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B84680B76;
	Tue, 23 Jul 2024 21:50:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2B83E1BF2F9
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 21:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 25182400D0
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 21:50:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Ce9X23F0T6W for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 21:50:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6AD45400BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AD45400BF
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6AD45400BF
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 21:50:45 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-426636ef8c9so43450165e9.2
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 14:50:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721771443; x=1722376243;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wqqCxQRQ9WA4K0ZURJLSZEvGCSnXWE5HUDKoJ02iCTo=;
 b=WABNk5jj3rSyEBlLGepvklfEBTFDzxEnh4oU/x6Vn/lIdZMt6akGJiPBTJfyBvRgED
 uaoSUWxDV9bXmukU9tzZfL2/vYziQSrfCR7YsiOV29H5ssR+tJyI8X005zQY9INqLffD
 9EfY8MxJ7j7R2LWw86RfhG+yt6mGR11hTywNUGy+S6kFU0AnQ5ChLIhb+WbcEDiKQDq9
 yylI6VovPsiOlkdGxP6Z4EwwO1IgpnhVkGwg69XSAk29GD5ytQFmglwcLzeQxNIYkBv6
 AgYwr5miOWNAv3cMEJce3KscIueX2YUTEqBrFq4Jbpd3Hh7taGevhlG3Ffr+/SAhIXlI
 p7KQ==
X-Gm-Message-State: AOJu0YwDFEgKrPiC6Ds4lq/Lfq1ov8W6uzaq9YHI9/jSebNacaTMj5pW
 EgqFX5c6OWAiFYdT237DvpE9kfMBuajk4hEY+ikjC45ToiUNJlLh1NIiYg==
X-Google-Smtp-Source: AGHT+IGNKscHBVmFBj8C8SBzZOVK0wwseeqssArwLNJqmW13FYvIwJgVEjCDdnugBllDcoLpGqQEmA==
X-Received: by 2002:a05:600c:1c2a:b0:426:6320:225e with SMTP id
 5b1f17b1804b1-427dc515312mr79748495e9.6.1721771443250; 
 Tue, 23 Jul 2024 14:50:43 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427f9413547sm2078025e9.44.2024.07.23.14.50.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 14:50:42 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 23:50:41 +0200
Message-ID: <20240723215041.771843-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721771443; x=1722376243; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wqqCxQRQ9WA4K0ZURJLSZEvGCSnXWE5HUDKoJ02iCTo=;
 b=IXLvh3YFlK4R1+YqCVYiS5uW/PK/xhCvCzV338a1/QIv7ioQMPfvBTQ92Grcwygdu+
 8FFSVv1UizOIyuy5xVUUiyzmgYPGCQZiY7v3m9uHkAQrs4ZcE2Ks31NnblH8zyV+9kHq
 jgOzFxwjkVBT6K7vqHeZPa9ri64GsiD+zBGXmcbzcjhJkb5iwlwLsoEI+G4DBRrEZo7Q
 M6bRCtjwEvYn5kcEwg+0qPOxM8PqrmBilxMI86wi6b+aP+uIeNgnOIIA3YhvyC9beCSL
 QQqweNFHXzaphHcnkR1pS+T193F0efI5cuyrVJ5IQ9OAX+8CqJxwgBfzJkJwtRVU0etQ
 Vidw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=IXLvh3YF
Subject: [Buildroot] [PATCH 1/1] package/xz: fix musl static build
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

For an unknown reason, runnning autoreconf is needed to avoid the
following static build failure on musl which is raised because LDFLAGS
(which contains -static) is not passed:

/home/autobuild/autobuild/instance-16/output-1/host/lib/gcc/armeb-buildroot-linux-musleabi/13.3.0/../../../../armeb-buildroot-linux-musleabi/bin/ld: /home/autobuild/autobuild/instance-16/output-1/host/lib/gcc/armeb-buildroot-linux-musleabi/13.3.0/libgcc.a(_dvmd_lnx.o): in function `__aeabi_idiv0':
/home/autobuild/autobuild/instance-16/output-1/build/host-gcc-final-13.3.0/build/armeb-buildroot-linux-musleabi/libgcc/../../../libgcc/config/arm/lib1funcs.S:1499:(.text+0x8): undefined reference to `raise'

This build failure is raised by autobuilders since bump to version 5.6.2
in commit d1d77eb274761d1f2d24ee4b55a374e917c67a8e but it can also be
reproduced on version 5.4.7 (but not on 5.4.6). There is probably an
issue with these two official autotools tarballs which have been
released the same day (on May 29 2024).

Fixes: 40240ac30afc4c6af765794f38e6815162ca61fa
 - http://autobuild.buildroot.org/results/344813b202644a23c166920aa7e861ebf408536b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/xz/xz.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index 8dfd76f8b9..9fb93ff4d6 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -12,6 +12,8 @@ XZ_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 XZ_LICENSE = Public Domain, BSD-0-Clause, GPL-2.0+, GPL-3.0+, LGPL-2.1+
 XZ_LICENSE_FILES = COPYING COPYING.0BSD COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv2.1
 XZ_CPE_ID_VENDOR = tukaani
+# autoreconf needed to fix a musl static build failure
+XZ_AUTORECONF = YES
 
 # The package is a dependency to ccache so ccache cannot be a dependency
 HOST_XZ_ADD_CCACHE_DEPENDENCY = NO
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
