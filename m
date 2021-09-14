Return-Path: <SRS0=SwR/=OE=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLACK,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F38BC433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 21:12:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3BF3610D1
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 21:12:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A3BF3610D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B504402CA;
	Tue, 14 Sep 2021 21:12:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bjMhVS-uhN7n; Tue, 14 Sep 2021 21:12:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD345402F5;
	Tue, 14 Sep 2021 21:12:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DF7A21BF57F
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 21:12:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DBD79607E9
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 21:12:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hbhI_VuDyNMB for <buildroot@lists.busybox.net>;
 Tue, 14 Sep 2021 21:12:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C60CC6072D
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 21:12:44 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id b6so381737wrh.10
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 14:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+UM6pgxisIyvk/PfCI8YR+0V43UuSzx1+OOX/Mj4ty0=;
 b=FMK0bnKPiDSbzIjZNsLtT0NU4hmYQEGiJwxGObJb5g/eni222CD/k0MGuIkJwkXOL/
 XvNns1yrVu5WekAXDMDWR2Xjsuk+knrbFqEH2Qv5n1MfpLXn92q9dL4n8dPPHtVqDtqd
 khs/Ao7ojCj2Mokfqm5v0usS0fSy3ItMrehd+11ktafniuAzLr8UJMtTRYwyMpzbmrzf
 8OsbGl2NF+0MCjxbhAwQCuIC1YXQQebQKoXi43IPllbsIlcjmPZ+eXMo1fegZ9rGgTEU
 FjVjcxDP7Fdh7FjAyAZzfir8UjiPmQUq3hja00+E+UV2irtTtCHPjomLKHhwIcTALWR+
 0ybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+UM6pgxisIyvk/PfCI8YR+0V43UuSzx1+OOX/Mj4ty0=;
 b=LgtPDUh3oClW7WN5FZmvhE0nWEHXbn8+wtlqLbN0YCV7LcBCdPE8wbr+oqCTkg6Mad
 tjQko4Z67Q2+Xeu8TP1w35BaI1C8vjptCb6D8aMWTHRdiaaN2KIg0XuxocKeqnIKBW3T
 +2wSEswKCL+Sruf7WDu+sO6HzSpSU1ktJb9zhV6ECswGPjfp8MeN0HmLyOEALE9boxzB
 XIsPX3wWyerTxwUAQb2rRobRuD4WrtzXFT0aG36C+USuvfIVQVZnF5ovUHKwjd2/fyAM
 fCDasAfgDP365J8dN6cd9167rDN7X5NTYB2hWsAno17gna6bbxm2w4hSLKvJlJuwzn9n
 sQ2Q==
X-Gm-Message-State: AOAM530f+bFf5QvdpNJnCxraX1fPj7xGwDI2NJfnHaQh9ttVpCctzwdh
 uf8PNixdzlB8PbsilEoDq5PMddcTgGE=
X-Google-Smtp-Source: ABdhPJzAg9j/lnbCanw2Rake4B+GQezZjATUy4E1rzfg0AYRdkCTNyfPG2LZQU7ssp0Vjc9IkM89NA==
X-Received: by 2002:a05:6000:124b:: with SMTP id
 j11mr1204241wrx.147.1631653962679; 
 Tue, 14 Sep 2021 14:12:42 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id v10sm11711177wrg.15.2021.09.14.14.12.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 14:12:42 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 14 Sep 2021 23:11:06 +0200
Message-Id: <20210914211106.401780-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/apitrace: fix build with glibc >=
 2.34
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Fix the following build failure with glibc >= 2.34:

/tmp/instance-0/output-1/host/lib/gcc/s390x-buildroot-linux-gnu/10.3.0/../../../../s390x-buildroot-linux-gnu/bin/ld: CMakeFiles/egltrace.dir/dlsym.cpp.o: in function `dlsym':
dlsym.cpp:(.text+0x34): undefined reference to `__libc_dlopen_mode'
/tmp/instance-0/output-1/host/lib/gcc/s390x-buildroot-linux-gnu/10.3.0/../../../../s390x-buildroot-linux-gnu/bin/ld: dlsym.cpp:(.text+0x46): undefined reference to `__libc_dlsym'

Fixes:
 - http://autobuild.buildroot.org/results/ac5e5b1e30249ae0fb8b9179338b47c60c026bcc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...and-__libc_dlopen_mode-on-GLIBC-2-34.patch | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/apitrace/0002-gltrace-Avoid-__libc_dlsym-and-__libc_dlopen_mode-on-GLIBC-2-34.patch

diff --git a/package/apitrace/0002-gltrace-Avoid-__libc_dlsym-and-__libc_dlopen_mode-on-GLIBC-2-34.patch b/package/apitrace/0002-gltrace-Avoid-__libc_dlsym-and-__libc_dlopen_mode-on-GLIBC-2-34.patch
new file mode 100644
index 0000000000..57e3ee248b
--- /dev/null
+++ b/package/apitrace/0002-gltrace-Avoid-__libc_dlsym-and-__libc_dlopen_mode-on-GLIBC-2-34.patch
@@ -0,0 +1,34 @@
+From d28a980802ad48568c87da02d630c8babfe163bb Mon Sep 17 00:00:00 2001
+From: Jose Fonseca <jfonseca@vmware.com>
+Date: Wed, 1 Sep 2021 16:34:54 +0100
+Subject: [PATCH] gltrace: Avoid __libc_dlsym and __libc_dlopen_mode on GLIBC
+ 2.34.
+
+These GLIBC_PRIVATE symbols are gone from GLIBC 2.34 due to the merge of
+libdl.so onto libc.so.
+
+This means apitrace can't defend against infinite recursion when
+used with Steam Overlay, but at least it should work otherwise.
+
+Fixes https://github.com/apitrace/apitrace/issues/756
+
+[Retrieved from:
+https://github.com/apitrace/apitrace/commit/d28a980802ad48568c87da02d630c8babfe163bb]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ wrappers/dlsym.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/wrappers/dlsym.cpp b/wrappers/dlsym.cpp
+index 5ab8465b0..5369af35a 100644
+--- a/wrappers/dlsym.cpp
++++ b/wrappers/dlsym.cpp
+@@ -34,7 +34,7 @@
+ #include "os.hpp"
+ 
+ 
+-#if defined(__GLIBC__) && !defined(__UCLIBC__)
++#if defined(__GLIBC__) && !defined(__UCLIBC__) && __GLIBC__ == 2 && __GLIBC_MINOR__ < 34
+ 
+ 
+ #include <dlfcn.h>
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
