Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51FD0C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 22:16:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE1C860F55
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 22:16:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BE1C860F55
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A3F440200;
	Sat,  4 Sep 2021 22:16:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LaSiNR8vAR-O; Sat,  4 Sep 2021 22:16:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A74A401B3;
	Sat,  4 Sep 2021 22:16:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 360011BF5D7
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 22:16:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 323A94259A
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 22:16:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VdPzuPpK1lkK for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 22:16:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 45C5642586
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 22:16:44 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id m9so3907219wrb.1
 for <buildroot@buildroot.org>; Sat, 04 Sep 2021 15:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Cqdj/6Wx0iFHj5awtOO+xFOBDtPd/m9FSdp0AxBXa/k=;
 b=Lz5+RnVVH50MqSk4zRPNeHuXcEO9mPXo/3lJqfbSCo47vLXQ4xkI5RXt6OYdngdIKo
 MWdwqUWAM6ibzlZBZC+QPNBxnFKP8ttTToioponytDoBG9jQLrYD3YShIyLevwHGH6Mz
 iLHm1caHyx8TmMOZN2l+lZ1r9DE3mhjcQEgGAx+BmNDfhjZuQP8bsOuciTzY6dv+G5ux
 WuA/h3xxEYjTu0RXNu84Rg1XcGQ8QMWB40gg6Ag56b8L5HYvQ78urmzGO+3msIop9r1g
 AjhY+tihPtyp3GzzeDF3g07orfuEfHF/G2yJyixD+dyk2hzurn59AKQ0hfmWLMIorinN
 TR2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Cqdj/6Wx0iFHj5awtOO+xFOBDtPd/m9FSdp0AxBXa/k=;
 b=sc743L0y7UqI1gg9WtDpbD494sYJW3kQRUL17QQcvvf4pS5NlU9hb6n03cc6nrPjhX
 Fj+r+eH7GoEf2s/gy9K4I2Yg6CF7qSTLYUoL5HYE2U4pjoZGWUNLcQ1hLV8T8+wijvGB
 Yflrhwn/DYeU8mCgHC+Hl160mQo6y4S4AAgdTZTeRl9la3C2u5uGMFS9IWKGk/73Auiy
 2suXMu0idtOt4BS1yKO4Yzn1HO+/lGeJ1ZWkuoKGQaWqik5SitZme1Xj9+g/CHV5QVSI
 B+8onHlMq8xrvRsnc2oDxuWGMW6BR18Rc1n5AGpA8aCCJ2ljmkWfa7dJOMvBcQI81WMS
 Oovw==
X-Gm-Message-State: AOAM533drEn1RhzTL5hCnA8XnCEpO/UZsQcCs3zl0pF7WhSQC7ZhjUB/
 PvrlbHxskH9Y9hFL0MVFCQQS3SJv0OLRwA==
X-Google-Smtp-Source: ABdhPJwzTXzQ8KUNdwhrcPGmM5NU42W1mHh8dz54HajKuyI6wE5WpL+BvzBb4BKONs/o2hIXFUsqmQ==
X-Received: by 2002:a5d:500d:: with SMTP id e13mr5560779wrt.413.1630793802237; 
 Sat, 04 Sep 2021 15:16:42 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id o23sm3228201wro.76.2021.09.04.15.16.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 15:16:41 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Sep 2021 00:16:13 +0200
Message-Id: <20210904221613.445032-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libgpgme: fix build with glibc >=
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Fix the following build failure with glibc >= 2.34:

posix-io.c: In function '_gpgme_io_spawn':
posix-io.c:577:23: error: void value not ignored as it ought to be
  577 |             while ((i = closefrom (fd)) && errno == EINTR)
      |                       ^

Fixes:
 - http://autobuild.buildroot.org/results/b11094ddd35263071b7dd453a6590c5b684026ff

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...posix-io.c-fix-build-with-glibc-2.34.patch | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/libgpgme/0001-src-posix-io.c-fix-build-with-glibc-2.34.patch

diff --git a/package/libgpgme/0001-src-posix-io.c-fix-build-with-glibc-2.34.patch b/package/libgpgme/0001-src-posix-io.c-fix-build-with-glibc-2.34.patch
new file mode 100644
index 0000000000..c3cecbe0b5
--- /dev/null
+++ b/package/libgpgme/0001-src-posix-io.c-fix-build-with-glibc-2.34.patch
@@ -0,0 +1,41 @@
+From 0ab732d6265c32db0dececb9d5a46de3b37db0b9 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 5 Sep 2021 00:05:00 +0200
+Subject: [PATCH] src/posix-io.c: fix build with glibc >= 2.34
+
+Fix the following build failure with glibc >= 2.34 raised because
+closefrom doesn't return an int but a void since its addition with
+https://github.com/bminor/glibc/commit/607449506f197cc9514408908f41f22537a47a8c
+
+```
+posix-io.c: In function '_gpgme_io_spawn':
+posix-io.c:577:23: error: void value not ignored as it ought to be
+  577 |             while ((i = closefrom (fd)) && errno == EINTR)
+      |                       ^
+```
+
+Fixes:
+ - http://autobuild.buildroot.org/results/b11094ddd35263071b7dd453a6590c5b684026ff
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://dev.gnupg.org/T5587]
+---
+ src/posix-io.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/posix-io.c b/src/posix-io.c
+index e712ef28..e9485f45 100644
+--- a/src/posix-io.c
++++ b/src/posix-io.c
+@@ -570,7 +570,7 @@ _gpgme_io_spawn (const char *path, char *const argv[], unsigned int flags,
+               if (fd_list[i].fd > fd)
+                 fd = fd_list[i].fd;
+             fd++;
+-#if defined(__sun) || defined(__FreeBSD__)
++#if defined(__sun) || defined(__FreeBSD__) || (defined (__GLIBC__) && __GLIBC__ == 2 && __GLIBC_MINOR__ >= 34)
+             closefrom (fd);
+             max_fds = fd;
+ #else /*!__sun */
+-- 
+2.33.0
+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
