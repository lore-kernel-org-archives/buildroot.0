Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6F97C4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 21:46:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B16260EB5
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 21:46:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6B16260EB5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AA5B838B2;
	Sun,  1 Aug 2021 21:46:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4aeY_9ov6lOX; Sun,  1 Aug 2021 21:46:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F66283848;
	Sun,  1 Aug 2021 21:46:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1BC111BF36B
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 21:46:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1875540466
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 21:46:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id evuPES78nF4j for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 21:46:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8BD04403B7
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 21:46:15 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 h24-20020a1ccc180000b029022e0571d1a0so9837138wmb.5
 for <buildroot@buildroot.org>; Sun, 01 Aug 2021 14:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hkDFF3MTPW5t5z0PDslKpKaAVt4+tgpmNjtf/mnu66Y=;
 b=KYF1rKTO3O2UEBONugqYLqQomnrm42TOw4Zwz4m7p+RO2lCrD26mFAfQwrMN4MT3wx
 6vdR9gBzL4cb+nQsFAmBurXXFxzis60TzoElH9CLtcld8GzYAN9+XUwZaQeCxtcpOQm/
 CvIfu7TDHKP9HsBy1rIp0L8p77cBxlYS+hqUa82jm3Qmnp0rzfN1uMmkJfGc8UgF4FdG
 erud7qDvez5Y8bXLB6CSAJbDoVdkCa6bSj9ti+k4SS46MBAyZ9CRDaQ3rYskw7IC/A8c
 yoUYDCS9yKE4wcFlCuIxTpMn1CtJePu+rfhb5wkhcNK7ebhiu2BJslWxZZvUlqgN/IJE
 JhXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hkDFF3MTPW5t5z0PDslKpKaAVt4+tgpmNjtf/mnu66Y=;
 b=R1ImFpcJEgQHEdbCirk5Kl/UdiLOzLwWDWSayQSzTRt6ohX62mC4cYXGw+vR88qrhv
 b8oGBSPa+6cceL7ueYaUoDhW6vdyzsnbBOcs3BLHcVIsib9GwPp7Z0zK4QCdYWnXz43A
 aQOtTpLwnm3rAMkbZXyyCM4+fTVTU89OgrXvBJ7LJbhZE8waRLP5zmOTahJgsykr6DV0
 3yOJq8AFkAqDYmcUeeXlr3uCdM/LnWq00Ychsa3qn1AyOkJr5MuJ2BJCy2nfnnh1gin2
 aokHy32qMhHOEimZwgNNxYAgX/dFHsJ/TYUx3Pf/ODFDVZ/SWqcSXGcv9JjsaUgJz9iQ
 rS3w==
X-Gm-Message-State: AOAM532KCyUacqQtN01G9av4Cx6zdfIev12kJmo7ueTyRIXE7Zh8e+dr
 3u1uVzeE8SznBDPzE98+ZPU/Xrvzqf44qw==
X-Google-Smtp-Source: ABdhPJzQbFjHmdGjmyjVfEiGzcLE4rLlYXVzCPqtyYecsKXgVFEuKczpzmx8mEZ59kfxZZDMlAuAhw==
X-Received: by 2002:a05:600c:17d8:: with SMTP id
 y24mr13638678wmo.91.1627854373524; 
 Sun, 01 Aug 2021 14:46:13 -0700 (PDT)
Received: from kali.home (pop.92-184-106-87.mobile.abo.orange.fr.
 [92.184.106.87])
 by smtp.gmail.com with ESMTPSA id a16sm9348632wrx.7.2021.08.01.14.46.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 14:46:13 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Aug 2021 23:46:00 +0200
Message-Id: <20210801214601.566970-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/irqbalance: use pkg-config to find
 numa
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
Cc: Karoly Kasza <kaszak@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Use pkg-config to find numa to avoid the following build failure when
checking for numa_available:

configure:9667: checking for numa_available in -lnuma
configure:9692: /tmp/instance-7/output-1/host/bin/microblazeel-linux-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -static -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -static conftest.c -lnuma   >&5
/tmp/instance-7/output-1/host/opt/ext-toolchain/bin/../lib/gcc/microblazeel-buildroot-linux-uclibc/9.3.0/../../../../microblazeel-buildroot-linux-uclibc/bin/ld: /tmp/instance-7/output-1/host/microblazeel-buildroot-linux-uclibc/sysroot/usr/lib/libnuma.a(libnuma.o): in function `numa_node_to_cpus_v1':
(.text+0x2a80): undefined reference to `__atomic_fetch_and_1'
/tmp/instance-7/output-1/host/opt/ext-toolchain/bin/../lib/gcc/microblazeel-buildroot-linux-uclibc/9.3.0/../../../../microblazeel-buildroot-linux-uclibc/bin/ld: /tmp/instance-7/output-1/host/microblazeel-buildroot-linux-uclibc/sysroot/usr/lib/libnuma.a(libnuma.o): in function `numa_node_to_cpus_v2':
(.text+0x2ddc): undefined reference to `__atomic_fetch_and_1'
collect2: error: ld returned 1 exit status

Fixes:
 - http://autobuild.buildroot.org/results/577a63432fba2f9ae1ed2c6c2a77c5ce54ac5521

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...igure.ac-use-pkg-config-to-find-numa.patch | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/irqbalance/0002-configure.ac-use-pkg-config-to-find-numa.patch

diff --git a/package/irqbalance/0002-configure.ac-use-pkg-config-to-find-numa.patch b/package/irqbalance/0002-configure.ac-use-pkg-config-to-find-numa.patch
new file mode 100644
index 0000000000..751367ccfb
--- /dev/null
+++ b/package/irqbalance/0002-configure.ac-use-pkg-config-to-find-numa.patch
@@ -0,0 +1,38 @@
+From 274cb8ea470a10ce46b783e77784b0eb08cf20d8 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 1 Aug 2021 23:26:01 +0200
+Subject: [PATCH] configure.ac: use pkg-config to find numa
+
+Use pkg-config to find numa and fallback to current mechanism.
+Thanks to pkg-config, numa dependencies such as -latomic will be
+retrieved.
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/Irqbalance/irqbalance/pull/188]
+---
+ configure.ac | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index c45b9ce..50c62ba 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -23,7 +23,14 @@ AC_CHECK_HEADERS([numa.h])
+ 
+ AC_CHECK_FUNCS(getopt_long)
+ 
+-AC_CHECK_LIB(numa, numa_available)
++PKG_CHECK_MODULES([NUMA], [numa], [has_numa=yes], [AC_CHECK_LIB(numa, numa_available)])
++AS_IF([test "x$has_numa" = "xyes"], [
++  AC_SUBST([NUMA_CFLAGS])
++  AC_SUBST([NUMA_LIBS])
++  LIBS="$LIBS $NUMA_LIBS"
++  AC_SUBST([LIBS])
++])
++
+ AC_CHECK_LIB(m, floor)
+ 
+ PKG_CHECK_MODULES([GLIB2], [glib-2.0], [], [AC_MSG_ERROR([glib-2.0 is required])])
+-- 
+2.30.2
+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
