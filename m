Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 157C9C4332F
	for <buildroot@archiver.kernel.org>; Sun,  4 Dec 2022 22:11:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94D0C8174D;
	Sun,  4 Dec 2022 22:11:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94D0C8174D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HhkC6BBFj5D6; Sun,  4 Dec 2022 22:11:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1E52814A0;
	Sun,  4 Dec 2022 22:11:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1E52814A0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5530B1BF599
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 22:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 294F940217
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 22:11:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 294F940217
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eTSzzfnvIfc8 for <buildroot@lists.busybox.net>;
 Sun,  4 Dec 2022 22:11:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21DA340134
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 21DA340134
 for <buildroot@buildroot.org>; Sun,  4 Dec 2022 22:11:52 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id bx10so16137329wrb.0
 for <buildroot@buildroot.org>; Sun, 04 Dec 2022 14:11:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5dSizYIx3nTK0x9wykXtyd+jyb/kGxCw0dME8I5b4qg=;
 b=3C7HVAxQfcV2QuN0T9YhRNNViEvj2R5nVPC8sLdko6W9Fg5V+TvBMm5tEdqxniN87e
 +YKFhidmqKvd/xaYi59VBDcZfb+qwM6JARMu76c0fDeHzTPOSrbArcB6nh6e+egd7Kr2
 fcFReGBZ2aKkfsBySLnIzGcvy4ZW9hW766DFRNW7sFgNvmzyADIGqGOGtvgLk9DVhFw2
 2MD5/m+ouqSYb3G2wC5cyV/lCgEEZ0IMRi5NSuYcljUiWaDhng6eFQ4DTzx/leGOzApb
 M3ig2y1zri1liC+jtY42GeiEYQ7FcuhqJCtQU1VDGQMyqw6VJuGU9j7FoGlX/tUlmlmb
 Cgcw==
X-Gm-Message-State: ANoB5plGtQajyg3NtaygikV7c21nD20c/uR+alC6APhNE4izTdLvXMFF
 Tw+QcPski1awYZYZspv6QdTW91+7d28=
X-Google-Smtp-Source: AA0mqf67oSbHS0eu7+ZzKd/ReHm+56caQvj/rEP9gXEDAOAQIepDvrKXl9wwYhkADohWKByJ6itmHQ==
X-Received: by 2002:adf:e848:0:b0:242:11f1:ed1 with SMTP id
 d8-20020adfe848000000b0024211f10ed1mr22451032wrn.61.1670191909562; 
 Sun, 04 Dec 2022 14:11:49 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 n15-20020a05600c3b8f00b003c6deb5c1edsm17349175wms.45.2022.12.04.14.11.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Dec 2022 14:11:49 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Dec 2022 23:11:45 +0100
Message-Id: <20221204221145.9093-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5dSizYIx3nTK0x9wykXtyd+jyb/kGxCw0dME8I5b4qg=;
 b=B3s3C3kju9NDPg9uonyXwKBK0FKNO8L5Y0rxDPn3MVXNQ0hMnbG3JpA9bDNfQ2EAcr
 9XlSg5nUzkm3aUKETY/8wkizL+EFr11kK5jdt0FIMWNABjJ9exposTXlFJGvAgW3EXZG
 DuMeBgCPWJly9jNgcj6XnhsB/QaOiG65lrKW+ngRNrH9qscjRoW+0Mb6kVtl3rIxLGNd
 wm8h+FRvDn2iGiGteViR/+tuNPm/6/wf+8iVVobB5nBzfzAtkVH2UXuaHTurd8PaTD99
 ybNKWYc3Fl9vvBR85ikxtW5UsAQPRHTr2saO0dD/Tj7DTb7zIhpE6GFmxKdrmHqhH2Y/
 hKxA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=B3s3C3kj
Subject: [Buildroot] [PATCH 1/1] utils/genrandconfig: add mxs-bootlets board
 handling
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

Add a custom case to make sure that a random configuration with an empty
board for mxs-bootlets doesn't fail. It reverts to
BR2_TARGET_MXS_BOOTLETS_STMP37xx in that case.

>>> mxs-bootlets 10.12.01 Building
BOARD= CROSS_COMPILE="/home/thomas/autobuild/instance-1/output-1/per-package/mxs-bootlets/host/bin/arm-buildroot-linux-uclibcgnueabi-" /usr/bin/make -j1 -C /home/thomas/autobuild/instance-1/output-1/build/mxs-bootlets-10.12.01 power_prep
/home/thomas/autobuild/instance-1/output-1/per-package/xinetd/host/bin/arm-buildroot-linux-uclibcgnueabi-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2 -g0  -static -DNO_RPC  -I../../include   -c -o inet_aton.o inet_aton.c
make[1]: Entering directory '/home/thomas/autobuild/instance-1/buildroot'
make[1]: warning: -j1 forced in submake: resetting jobserver mode.
build power_prep
/usr/bin/make -C power_prep ARCH= BOARD=
make[2]: Entering directory '/home/thomas/autobuild/instance-1/output-1/build/mxs-bootlets-10.12.01/power_prep'
/usr/bin/make -C ./../mach-/hw
make[3]: Entering directory '/home/thomas/autobuild/instance-1/output-1/build/mxs-bootlets-10.12.01/power_prep'
make[3]: *** ../mach-/hw: No such file or directory.  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/44a2efc64b9b8ff4541430d6b649e7a11a4e4873

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 utils/genrandconfig | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 1a700766a5..7c97a1cdb4 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -544,6 +544,13 @@ def fixup_config(sysinfo, configfile):
         if 'BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT=y\n' in configlines:
             return False
 
+    if 'BR2_TARGET_MXS_BOOTLETS=y\n' in configlines and \
+       'BR2_TARGET_MXS_BOOTLETS_CUSTOM_BOARD=y\n' in configlines and \
+       'BR2_TARGET_MXS_BOOTLETS_CUSTOM_BOARD_NAME=""\n' in configlines:
+        configlines.remove('BR2_TARGET_MXS_BOOTLETS_CUSTOM_BOARD=y\n')
+        configlines.append('BR2_TARGET_MXS_BOOTLETS_STMP37xx=y\n')
+        configlines.remove('BR2_TARGET_MXS_BOOTLETS_CUSTOM_BOARD_NAME=""\n')
+
     if 'BR2_TARGET_MXS_BOOTLETS=y\n' in configlines and \
        'BR2_TARGET_MXS_BOOTLETS_CUSTOM_GIT=y\n' in configlines and \
        'BR2_TARGET_MXS_BOOTLETS_CUSTOM_GIT_URL=""\n' in configlines:
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
