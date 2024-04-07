Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F32CD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 09:22:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DA2E82015;
	Sun,  7 Apr 2024 09:22:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pnIAUMzSvDa0; Sun,  7 Apr 2024 09:22:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCDF981FE6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCDF981FE6;
	Sun,  7 Apr 2024 09:22:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AA2411BF94D
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 09:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9691160769
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 09:21:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ivdqkZV0pizA for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 09:21:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 214AA607CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 214AA607CF
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 214AA607CF
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 09:21:54 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-343cfe8cae1so2021510f8f.3
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 02:21:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712481712; x=1713086512;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CBw6g+V7y88fwLE1Y3CIfB82SZYYGGSWdBRPmBUSq6g=;
 b=X1h3DeW7uEVsA5Z8FfvNu03MjuFv9NQTZAk5KBHYm9shwuSwe2Gu18X9utQIwEIJgo
 kPgun3JALlRml6FbIMRuVb3p18ByzVNxjaTwGbBdt81qvCDZIfZ7yYOFH8VOa34vTEkw
 UJ1oBoows6UbcYlti1QYHU5aeVpJgDGuxT3hMOAT+wcuCCA5O57Z/CLrMJOxOA/bioKm
 yMsDjxqJajZOoQyF8a1zebCnbbQRTANiuQUIZ7zuQKgSBxDQMGbcDYebgfAr0CWJSkc6
 1c9j7o+FGKssOJslcpLjpppcb0uLCc3qrGByGTc4jXaR/cXtf8VZ7PDHAD1n9YEeENiH
 cQDQ==
X-Gm-Message-State: AOJu0YyEL4n3bQSB300vZRNg6QosQMnP4/gTnxuD2WmczqsIc9/9AxT4
 E5df15cNNEMD/eXlJBNLh5cp2Kzlzk39bwHpKn/ip93qIc2JIO1I0XgCC40F
X-Google-Smtp-Source: AGHT+IEssNf0LmmKAoSRfz9hA2HDXNSLPiVho1TdKeUbCncqhAFm3rZ4QE2d/Loe1uikjEwTOdobPQ==
X-Received: by 2002:a05:600c:198e:b0:414:842:a548 with SMTP id
 t14-20020a05600c198e00b004140842a548mr4417629wmq.13.1712481711840; 
 Sun, 07 Apr 2024 02:21:51 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 p15-20020a05600c358f00b004156b689edfsm9397478wmq.33.2024.04.07.02.21.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 02:21:51 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 11:21:04 +0200
Message-ID: <20240407092105.276261-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712481712; x=1713086512; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CBw6g+V7y88fwLE1Y3CIfB82SZYYGGSWdBRPmBUSq6g=;
 b=B7z6z5dS/yxGl8vIgnE0UCJd9X+dX0+ybL0LEpLPMGTekV9lnanr5EUBLgh+SRpIjr
 9kRGEb3F5aTjj4tLccyW7Jwo/Twc5FG3o4dP/k7TRgU2ykHKZW1LA9Zx7Lc2XwqNDx7r
 fJrKWT9/syD06dw1bweLTGaYjQLP9TAZctOcAJhFL7v8+A5e9FiJzhqZfcTbQTFa13jh
 02H/nBbdgo31Fu61mLVk90w5YuD0S/K4PzojT2LFfmMKfIC1tV6HJEpaun76ZDfTj9Y+
 cmexmDksCjGHzZ1YZDBOL440/S1MvdcPnWc5HA+bd5ICeBIAH6BBulHXxzy+P9Dh2xLG
 YpzA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=B7z6z5dS
Subject: [Buildroot] [PATCH 1/2] package/libnpth: fix musl build
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following musl build failure raised since bump to version 1.7 in
commit 3ef4d24192b20bd1eb5e34c9fa2a6aa5bde91f91 and
https://git.gnupg.org/cgi-bin/gitweb.cgi?p=npth.git;a=commit;h=575573b5b63e147b1906240f192dbe37a26ca4b9:

npth.c:392:21: error: unknown type name 'npth_rwlock_t'; did you mean 'npth_cond_t'?
  392 | npth_rwlock_rdlock (npth_rwlock_t *rwlock)
      |                     ^~~~~~~~~~~~~
      |                     npth_cond_t

Fixes: 3ef4d24192b20bd1eb5e34c9fa2a6aa5bde91f91
 - http://autobuild.buildroot.org/results/d986ba27b734679fd70b4e0f23278ebd38e13c5d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...EXPOSE_RWLOCK_API-for-musl-C-library.patch | 37 +++++++++++++++++++
 package/libnpth/libnpth.mk                    |  2 +
 2 files changed, 39 insertions(+)
 create mode 100644 package/libnpth/0001-Fix-INSERT_EXPOSE_RWLOCK_API-for-musl-C-library.patch

diff --git a/package/libnpth/0001-Fix-INSERT_EXPOSE_RWLOCK_API-for-musl-C-library.patch b/package/libnpth/0001-Fix-INSERT_EXPOSE_RWLOCK_API-for-musl-C-library.patch
new file mode 100644
index 0000000000..bc5ed70a9c
--- /dev/null
+++ b/package/libnpth/0001-Fix-INSERT_EXPOSE_RWLOCK_API-for-musl-C-library.patch
@@ -0,0 +1,37 @@
+From 417abd56fd7bf45cd4948414050615cb1ad59134 Mon Sep 17 00:00:00 2001
+From: NIIBE Yutaka <gniibe@fsij.org>
+Date: Fri, 1 Mar 2024 13:53:52 +0900
+Subject: [PATCH] Fix INSERT_EXPOSE_RWLOCK_API for musl C library.
+
+* configure.ac: Add a case for musl system.
+
+--
+
+GnuPG-bug-id: 5664
+Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
+
+Upstream: https://git.gnupg.org/cgi-bin/gitweb.cgi?p=npth.git;a=commit;h=417abd56fd7bf45cd4948414050615cb1ad59134
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index c1091b1..576a26e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -381,7 +381,10 @@ fi
+ AC_SUBST(INSERT_NO_RWLOCK)
+ 
+ case "${host}" in
+-    *-*-linux*|*-*-gnu*)
++    *-*-linux-musl*)
++        INSERT_EXPOSE_RWLOCK_API="1"
++        ;;
++    *-*-linux-gnu*|*-*-gnu*)
+         INSERT_EXPOSE_RWLOCK_API="defined(__USE_UNIX98) || defined(__USE_XOPEN2K)"
+         ;;
+     *)
+-- 
+2.30.2
+
diff --git a/package/libnpth/libnpth.mk b/package/libnpth/libnpth.mk
index dc603b607f..46c8154021 100644
--- a/package/libnpth/libnpth.mk
+++ b/package/libnpth/libnpth.mk
@@ -10,5 +10,7 @@ LIBNPTH_SITE = https://www.gnupg.org/ftp/gcrypt/npth
 LIBNPTH_LICENSE = LGPL-2.0+
 LIBNPTH_LICENSE_FILES = COPYING.LIB
 LIBNPTH_INSTALL_STAGING = YES
+# 0001-Fix-INSERT_EXPOSE_RWLOCK_API-for-musl-C-library.patch
+LIBNPTH_AUTORECONF = YES
 
 $(eval $(autotools-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
