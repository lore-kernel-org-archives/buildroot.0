Return-Path: <SRS0=x9kH=PP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 568B2C433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 19:14:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C846C60C40
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 19:14:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C846C60C40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E06D4011A;
	Wed, 27 Oct 2021 19:14:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pg_bhH6AvTau; Wed, 27 Oct 2021 19:14:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D5DC4015E;
	Wed, 27 Oct 2021 19:14:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 29F561BF333
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 19:14:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26BC480E56
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 19:14:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DVh_ywylyuEX for <buildroot@lists.busybox.net>;
 Wed, 27 Oct 2021 19:14:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EF84480E41
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 19:14:45 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id m22so5985470wrb.0
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 12:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8aI4/QTBHypZLQtvwhlAGF/SqbHP3KA8XAYC4ftNPNQ=;
 b=LixPTi7P8pcRMcKhxat0zLZaWdUFZYvwqeiQxq5cta4qQcU3tTyleoM+nS27SGRdJD
 KwAYGdQjQhP2sikudpV7tltEoTelB26icoGewQG4X5FvCIox2oZ+n1Fiba/WtZlZ1ql+
 Mzefz8IXacKyrvXLGyyHHbm2D94ePW2mIpyEb8aN5Svaci9kW+TCE1brbJUIw9iKaQvD
 Me/dPuatphDcjCY/WiClrEdMM+VKINRy0Nu87elM3hBrD+gCQ2y5Q8BoWfwmhlFWhTPM
 TcvsuIf3tTDl1KrhQVfS7NczuAzG4iwOmgSUjSUqSjABMSgiKk8GgzbgFalVUoNtYyAA
 4sqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8aI4/QTBHypZLQtvwhlAGF/SqbHP3KA8XAYC4ftNPNQ=;
 b=qYTPDkPkDgPjiJ3JMI7jv9U3Ie7ad0ffrrmWDSPFfXnp9vqKSXSkYpoSp39Wqud5eP
 H7CJuXI/UDlSrilXulxithBtj3w3ERZ7SOGCtejOiupKVqD1AF4qrP40H633zJWGUrD+
 QHxfXcFiNk7p3n28D7+Kaqp4Uq34M1G2If3+E5f4+stbeCE2LFbaRcP6k9C6oXwnZd2q
 Lpla4AZmyrm6GIP7xfKLyTQ8T+GezcYxkrDGB/7d8Tv7zVsv84S7ts8ewGUB/Collcps
 /zJMUzv+DpaC3wUtHXiF8NQq1xZjiRNTtlhfARQYDrfuKEpYSjLyJbKCFtNPaVS6HbYo
 S7yA==
X-Gm-Message-State: AOAM5323Xz4hKcJL6Ac1vSIXiT+2kkkvQtYg/w3VZXpwoH4nD2X060X6
 uqMO4D7MzG910anqBmzXGP9Glphz+5A=
X-Google-Smtp-Source: ABdhPJxpQY62bvN2FaZfaSPQzc7oP7j/p05k5ah6zr85UBQS66rHQt0sVx1K+rJjzcpqUMtEE7HZNQ==
X-Received: by 2002:a5d:530e:: with SMTP id e14mr43451269wrv.326.1635362084003; 
 Wed, 27 Oct 2021 12:14:44 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id r1sm4698652wmr.36.2021.10.27.12.14.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 12:14:43 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Oct 2021 21:13:11 +0200
Message-Id: <20211027191311.414458-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/vim: fix build with uclibc
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

Fix the following build failure with uclibc raised since bump to version
8.2.3565 in commit 5650439b922d020cfad1131e5fb536bce73eb845 and
https://github.com/vim/vim/commit/0a7984af5601323fae7b3398f05a48087db7b767:

In file included from vim.h:27,
                 from fileio.c:14:
fileio.c: In function 'time_differs':
auto/config.h:149:22: error: 'stat_T' {aka 'struct stat'} has no member named 'st_mtim'; did you mean 'st_mtime'?
  149 | #define ST_MTIM_NSEC st_mtim.tv_nsec
      |                      ^~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/2132f9aa1b0bc618c91f7bf44fbd1b71b9d6ba05

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...for-nanosecond-resolution-timestamps.patch | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 package/vim/0001-Fix-config-of-old-systems-for-nanosecond-resolution-timestamps.patch

diff --git a/package/vim/0001-Fix-config-of-old-systems-for-nanosecond-resolution-timestamps.patch b/package/vim/0001-Fix-config-of-old-systems-for-nanosecond-resolution-timestamps.patch
new file mode 100644
index 0000000000..2e78a8d594
--- /dev/null
+++ b/package/vim/0001-Fix-config-of-old-systems-for-nanosecond-resolution-timestamps.patch
@@ -0,0 +1,56 @@
+From b5db1ebf06d2904522ebf246f9c6a8bbf8fca398 Mon Sep 17 00:00:00 2001
+From: Gary Johnson <garyjohn@spocom.com>
+Date: Tue, 26 Oct 2021 13:50:19 -0700
+Subject: [PATCH] Fix config of old systems for nanosecond-resolution
+ timestamps
+
+On old systems (e.g. 32-bit systems running Ubuntu 10.4), defining
+_XOPEN_SOURCE causes _BSD_SOURCE and _SVID_SOURCE not to be defined,
+which causes nanosecond-resolution timestamps not to be included in
+struct stat, which causes the build of fileio.c to fail.
+
+_XOPEN_SOURCE is defined for some systems in vim.h.
+
+A solution is to define _BSD_SOURCE and _SVID_SOURCE whenever
+_XOPEN_SOURCE is defined.
+
+On new systems, defining either _BSD_SOURCE or _SVID_SOURCE causes
+/usr/include/features.h to issue a warning message about _BSD_SOURCE and
+_SVID_SOURCE being deprecated and to use _DEFAULT_SOURCE instead.
+
+A solution for that is to also define _DEFAULT_SOURCE when _BSD_SOURCE
+and _SVID_SOURCE are defined.
+
+[Retrieved from:
+https://github.com/vim/vim/pull/9054/commits/b5db1ebf06d2904522ebf246f9c6a8bbf8fca398]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/vim.h | 15 +++++++++++++++
+ 1 file changed, 15 insertions(+)
+
+diff --git a/src/vim.h b/src/vim.h
+index 31d4bdefe87..f62ad88c7a1 100644
+--- a/src/vim.h
++++ b/src/vim.h
+@@ -43,6 +43,21 @@
+ // 700 is needed for mkdtemp().
+ #  ifndef _XOPEN_SOURCE
+ #   define _XOPEN_SOURCE    700
++
++// On old systems, defining _XOPEN_SOURCE causes _BSD_SOURCE and/or
++// _SVID_SOURCE not to be defined, so do that here.  Those are needed to
++// include nanosecond-resolution timestamps in struct stat.  On new systems,
++// _DEFAULT_SOURCE is needed to avoid warning messages about using deprecated
++// _BSD_SOURCE or _SVID_SOURCE.
++#   ifndef _BSD_SOURCE
++#    define _BSD_SOURCE 1
++#   endif
++#   ifndef _SVID_SOURCE
++#    define _SVID_SOURCE 1
++#   endif
++#   ifndef _DEFAULT_SOURCE
++#    define _DEFAULT_SOURCE 1
++#   endif
+ #  endif
+ # endif
+ 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
