Return-Path: <SRS0=m+kO=QD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA1C7C433F5
	for <buildroot@archiver.kernel.org>; Tue, 16 Nov 2021 17:15:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0744B63217
	for <buildroot@archiver.kernel.org>; Tue, 16 Nov 2021 17:15:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0744B63217
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91A9D80F27;
	Tue, 16 Nov 2021 17:15:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zHKG0jC18eEy; Tue, 16 Nov 2021 17:15:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D781880F16;
	Tue, 16 Nov 2021 17:15:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0F41F1BF3FB
 for <buildroot@lists.busybox.net>; Tue, 16 Nov 2021 17:15:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F0EDA40224
 for <buildroot@lists.busybox.net>; Tue, 16 Nov 2021 17:15:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qK2G2HJ3Zd0J for <buildroot@lists.busybox.net>;
 Tue, 16 Nov 2021 17:15:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2E8CD4013A
 for <buildroot@buildroot.org>; Tue, 16 Nov 2021 17:15:28 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id u1so39005890wru.13
 for <buildroot@buildroot.org>; Tue, 16 Nov 2021 09:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vMZED1zYfkd38llS2yyAVp2YhZJ6z75UAS63HBhcqFI=;
 b=FD5lnoyk5ASI9Xtuv4QyD9VzDpUExXTo5O5jU69Kc2s5ngCYN8FPrOB47euS3N9YJi
 X/dnqWq7bcxsL2RURHO2F4iBVOTPgfgvKLn2Gc0WlToeGdPlmKALauzs0psC2pkFsmUQ
 KwsDZvEyKVPc3kAPWTh0BMZWvEvJsBrly/KzJ9DI1xQDbnFhAtaWuOYvw92JzsvzsrGe
 KM6JSQdp1oaGJQH97HH0awQ9NbVpMtxypdEBH4cbeCMAPPMQ0nUyoWYLz//W6IIMswQU
 hqVI4UcT7WDkcDr5qvByrr+8WI9PVZTx3VJePta7PRbeNrJ/0MzaCODAIfYsWIBjX4yU
 5Lfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vMZED1zYfkd38llS2yyAVp2YhZJ6z75UAS63HBhcqFI=;
 b=kkTFzO1AZNhmyRcxJDrrbpU7CKjKBk8pgNbqUX6KzHrBD5SDbrNd2IzqXpJM2a4XOs
 gdmpJHOMQu2S+cYUejTIom136FuP22MHAW7/v/69GHY3ecw0u/y0L1FnG3ChHIInQ39W
 e9DhiPpCp6YERdsfG6utilPv7yx7Pg1OZQGuv2paVZwOVHEVE6cWcMgL/usibdl/xIk4
 iu3CBWIi64KVHlI1m8AUMxRWl1XJQ0J2rTEyu1GDzk6tRUHgPMhgOZkJF9fW0qd3HyYi
 Y54IveYG7XTrd0ZRVlBw8vBAsP9qTTz+L8J+iF2rcWPCAEcy1HElr3G8xSdHKviRTGP7
 n2wA==
X-Gm-Message-State: AOAM53224Ia5YfxgDRLcBo3/tLASzL0B7US027yLCEPt06GBefU3V0J4
 EtrM9JyJz32m6VN/tOmpcSaHZ64s7w4=
X-Google-Smtp-Source: ABdhPJyeUXZyJtxPxErum4u13Pginq3rUkV3D9lLnGfhhuXkVygjTuMt47DUhZIeyTzoboKifUfwfA==
X-Received: by 2002:adf:9d82:: with SMTP id p2mr11237892wre.414.1637082926037; 
 Tue, 16 Nov 2021 09:15:26 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id 4sm23661900wrz.90.2021.11.16.09.15.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 09:15:25 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 16 Nov 2021 18:13:13 +0100
Message-Id: <20211116171313.4146113-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/sg3_utils: fix uclibc-ng build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Marek Belisko <marek.belisko@open-nandra.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump to version 1.47 in
commit 710b0eaebeb25d7718bfb10e87f0d67adfaf8c2f:

/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/arm-buildroot-uclinux-uclibcgnueabi/bin/ld.real: sg_dd.o: in function `sg_read_low.constprop.0':
sg_dd.c:(.text+0xc6c): undefined reference to `sg_chk_n_print3'

Fixes:
 - http://autobuild.buildroot.org/results/38a0dfc70a21ce574368b7a485deb231f778b3e7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...002-configure.ac-fix-uclibc-ng-build.patch | 36 +++++++++++++++++++
 package/sg3_utils/sg3_utils.mk                |  2 ++
 2 files changed, 38 insertions(+)
 create mode 100644 package/sg3_utils/0002-configure.ac-fix-uclibc-ng-build.patch

diff --git a/package/sg3_utils/0002-configure.ac-fix-uclibc-ng-build.patch b/package/sg3_utils/0002-configure.ac-fix-uclibc-ng-build.patch
new file mode 100644
index 0000000000..4c475ee1ff
--- /dev/null
+++ b/package/sg3_utils/0002-configure.ac-fix-uclibc-ng-build.patch
@@ -0,0 +1,36 @@
+From 1e95d5b8c507a49f6d15d2795dc46d82b4d1ded0 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 16 Nov 2021 08:41:48 +0100
+Subject: [PATCH] configure.ac: fix uclibc-ng build
+
+Fix the following build failure with uclibc-ng raised because SG_IO is
+not defined:
+
+/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/arm-buildroot-uclinux-uclibcgnueabi/bin/ld.real: sg_dd.o: in function `sg_read_low.constprop.0':
+sg_dd.c:(.text+0xc6c): undefined reference to `sg_chk_n_print3'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/38a0dfc70a21ce574368b7a485deb231f778b3e7
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/doug-gilbert/sg3_utils/pull/8]
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 0a65d94..23378ad 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -107,7 +107,7 @@ case "${host}" in
+ 		AC_DEFINE_UNQUOTED(HAVE_NVME, 1, [Found NVMe])
+ 		check_for_getrandom
+                 CFLAGS="$CFLAGS -D__USE_MINGW_ANSI_STDIO";;
+-        *-*-linux-gnu* | *-*-linux*)
++        *-*-linux-gnu* | *-*-linux* | *-*-uclinux-gnu* | *-*-uclinux*)
+                 AC_DEFINE_UNQUOTED(SG_LIB_LINUX, 1, [sg3_utils on linux])
+ 		check_for_linux_sg_v4_hdr
+ 		check_for_getrandom
+-- 
+2.33.0
+
diff --git a/package/sg3_utils/sg3_utils.mk b/package/sg3_utils/sg3_utils.mk
index 055f7befb9..e357fc1dde 100644
--- a/package/sg3_utils/sg3_utils.mk
+++ b/package/sg3_utils/sg3_utils.mk
@@ -13,6 +13,8 @@ ifeq ($(BR2_PACKAGE_SG3_UTILS_PROGS),y)
 SG3_UTILS_LICENSE += , GPL-2.0+ (programs), BSD-2-Clause (programs)
 endif
 SG3_UTILS_LICENSE_FILES = COPYING BSD_LICENSE
+# We're patching configure.ac
+SG3_UTILS_AUTORECONF = YES
 
 # install the libsgutils2 library
 SG3_UTILS_INSTALL_STAGING = YES
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
