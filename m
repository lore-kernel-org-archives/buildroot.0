Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3D7C43334
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 17:28:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1860383FAD;
	Tue,  7 Jun 2022 17:28:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RtKgupvbMLuW; Tue,  7 Jun 2022 17:28:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 717DD83EC4;
	Tue,  7 Jun 2022 17:28:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 86B201BF2C0
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 17:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 758D841677
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 17:28:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IH_bmoWhcIg9 for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 17:28:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0AB6741679
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 17:28:06 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id p10so25111434wrg.12
 for <buildroot@buildroot.org>; Tue, 07 Jun 2022 10:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U4RYh+miUlkIVrUzLht7ILyRkfyzC/M+MKpCQ8uy2AY=;
 b=jqXCsTutKkVBxUWAv7H5hp6AFcaZptjr+Ekl6L11unqO3KDisJrOOYWQKJ5tDrN6br
 yRz8ytgKTWfd2soy/zkqF9QvEHd7kaGBW/nt+rHtbEDCunBvoP3IgFArff9djac14gtn
 LV6uKzl2O5WzcycVBZYW/7VDSsYHpWwroRFbd0rJ96GQRc4qcyxA4alJMHv4NNkB1oO9
 lDEOepyNfOiLfOoWYwOYLDwNP+OjFsO08ih6nlNeYWcuJdLCxUVej/BSuKTirMkPIW+1
 o3yaMK4QvIY7m5MDaql/MG1ip6xbkkGL0qIrRiRH8RKJBtBWJ1cc+kHEKMZQlsygCw+v
 VgAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U4RYh+miUlkIVrUzLht7ILyRkfyzC/M+MKpCQ8uy2AY=;
 b=I9kaz+nvGTaDXj0FWPlJJzIgb+H6/8CPRn/eWd2KwOvTM4b+sL5iXSsVG2Nx8ccUmq
 PB8mrcobv/RWQsFw8MH5thulypqWnAXvH31TsZ85JbFLbCuvIG1LkEUY2RbftlPe1Ztd
 Oj7ratvBdSEhxQ2JqWvguon8X0kZtIiA/6Be01ZCVw0cx/g9M423l4C/Kk3zD8rnqNwn
 W0B79Focl6ovvV2P9fbeQhAemut6x4DxrxgpxKqVLrTipiwp5etTHyKKHFylq5AZK7hI
 LgFFWbaMKE/F9ZWM/FDiJ6CJ2hvZBfvHUP9+R1T0EX7VCAwvHGbJ5OcW5IfNgEfxxtJJ
 FWyg==
X-Gm-Message-State: AOAM530AHDh1Q2Is0/EaUx6jc2Dt5U5NyZ8EGzTDWGQZIWnmYEToj2X6
 cWbGHczAkfdUJ8dafvaS+ayZinW/EKE=
X-Google-Smtp-Source: ABdhPJzwaHnA7HgPtim6IRVUn1hUpjcaT2Ks+vwU2v+bIBZxD/EhYBes5N6B5rQIlGiGZSNhrEnB4Q==
X-Received: by 2002:a5d:47cf:0:b0:213:bbe1:ba4d with SMTP id
 o15-20020a5d47cf000000b00213bbe1ba4dmr23654428wrc.173.1654622884834; 
 Tue, 07 Jun 2022 10:28:04 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 n16-20020a1c7210000000b0039c4d9737f3sm7689789wmc.34.2022.06.07.10.28.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 10:28:04 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  7 Jun 2022 19:25:26 +0200
Message-Id: <20220607172526.910675-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/dieharder: pass _GNU_SOURCE in
 CFLAGS
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
Cc: Julien Viard de Galbert <julien@vdg.name>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop third patch and pass _GNU_SOURCE in CFLAGS to avoid the following
build failure:

In file included from /nvmedata/autobuild/instance-18/output-1/host/microblazeel-buildroot-linux-gnu/sysroot/usr/include/bits/stat.h:25,
                 from /nvmedata/autobuild/instance-18/output-1/host/microblazeel-buildroot-linux-gnu/sysroot/usr/include/sys/stat.h:101,
                 from ../include/dieharder/libdieharder.h:23,
                 from bits.c:7:
/nvmedata/autobuild/instance-18/output-1/host/microblazeel-buildroot-linux-gnu/sysroot/usr/include/bits/struct_stat.h:99:33: error: field 'st_atim' has incomplete type
   99 |         struct timespec         st_atim;      /* Time of last access.  */
      |                                 ^~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/4609c8e2af24d9536eb33397a4659ad740aca742

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...RCE-for-uint-and-M_PI-with-musl-libc.patch | 28 -------------------
 ...0003-Add-static-to-inline-functions.patch} |  0
 ...ch => 0004-Remove-defunct-rgb_operm.patch} |  0
 package/dieharder/dieharder.mk                |  6 +++-
 4 files changed, 5 insertions(+), 29 deletions(-)
 delete mode 100644 package/dieharder/0003-Add-_GNU_SOURCE-for-uint-and-M_PI-with-musl-libc.patch
 rename package/dieharder/{0004-Add-static-to-inline-functions.patch => 0003-Add-static-to-inline-functions.patch} (100%)
 rename package/dieharder/{0005-Remove-defunct-rgb_operm.patch => 0004-Remove-defunct-rgb_operm.patch} (100%)

diff --git a/package/dieharder/0003-Add-_GNU_SOURCE-for-uint-and-M_PI-with-musl-libc.patch b/package/dieharder/0003-Add-_GNU_SOURCE-for-uint-and-M_PI-with-musl-libc.patch
deleted file mode 100644
index d71cd57445..0000000000
--- a/package/dieharder/0003-Add-_GNU_SOURCE-for-uint-and-M_PI-with-musl-libc.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 526510a27ef47a16699dd34a2373ad9b6bb5e8f3 Mon Sep 17 00:00:00 2001
-From: Julien Viard de Galbert <julien@vdg.name>
-Date: Sat, 14 Jan 2017 14:19:47 +0100
-Subject: [PATCH] Add _GNU_SOURCE for uint and M_PI with musl libc
-
-When building with musl libc _GNU_SOURCE need to be defined
-to provide uint type and M_PI macro
-
-Signed-off-by: Julien Viard de Galbert <julien@vdg.name>
----
- include/dieharder/libdieharder.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/include/dieharder/libdieharder.h b/include/dieharder/libdieharder.h
-index d98b758..c1a5023 100644
---- a/include/dieharder/libdieharder.h
-+++ b/include/dieharder/libdieharder.h
-@@ -17,6 +17,7 @@
- 
- /* This turns on uint macro in c99 */
- #define __USE_MISC 1
-+#define _GNU_SOURCE 1
- #include <stdint.h>
- #include <sys/types.h>
- #include <sys/stat.h>
--- 
-2.1.4
-
diff --git a/package/dieharder/0004-Add-static-to-inline-functions.patch b/package/dieharder/0003-Add-static-to-inline-functions.patch
similarity index 100%
rename from package/dieharder/0004-Add-static-to-inline-functions.patch
rename to package/dieharder/0003-Add-static-to-inline-functions.patch
diff --git a/package/dieharder/0005-Remove-defunct-rgb_operm.patch b/package/dieharder/0004-Remove-defunct-rgb_operm.patch
similarity index 100%
rename from package/dieharder/0005-Remove-defunct-rgb_operm.patch
rename to package/dieharder/0004-Remove-defunct-rgb_operm.patch
diff --git a/package/dieharder/dieharder.mk b/package/dieharder/dieharder.mk
index cbf28922fd..e15bac6bbe 100644
--- a/package/dieharder/dieharder.mk
+++ b/package/dieharder/dieharder.mk
@@ -36,9 +36,13 @@ endif
 # parallel build fail, disable it
 DIEHARDER_MAKE = $(MAKE1)
 
+DIEHARDER_CFLAGS = $(TARGET_CFLAGS) -D_GNU_SOURCE
+
 # Too many fixes needed to build with -fno-common which is default since gcc 10
 ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_10),y)
-DIEHARDER_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -fcommon"
+DIEHARDER_CFLAGS += -fcommon
 endif
 
+DIEHARDER_CONF_ENV += CFLAGS="$(DIEHARDER_CFLAGS)"
+
 $(eval $(autotools-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
