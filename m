Return-Path: <SRS0=O81Z=N4=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07975C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 16:40:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7636260F45
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 16:40:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7636260F45
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A97540483;
	Mon,  6 Sep 2021 16:40:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rqJSJ0P7SU5l; Mon,  6 Sep 2021 16:40:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 241FF40480;
	Mon,  6 Sep 2021 16:40:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 50CA71BF32E
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 16:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A4F5823CF
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 16:40:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xdKJyAgHabgX for <buildroot@lists.busybox.net>;
 Mon,  6 Sep 2021 16:40:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 28FB8823CB
 for <buildroot@buildroot.org>; Mon,  6 Sep 2021 16:40:25 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 o39-20020a05600c512700b002e74638b567so329374wms.2
 for <buildroot@buildroot.org>; Mon, 06 Sep 2021 09:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lvvVk2L6i6z24yMnSChnSeSn9kTu3h0N8/X79SWM0Z0=;
 b=C6gVeUX/kp6v1z9BUEQY6nq4ZgcF+OaAqXokEU0NCFDQ1oegr9q2yu7oOK31V48d3T
 FPFDVT/8klObrYAyNHWJSKqS0reIA8xl4uz9FCD0dtf67XHmJJ7q9wgXyQVsUPBsxnJh
 EOHtDfYAcKbz7t802NdjaM9a8pnHlhgn92WUUmubcG7UpXOBnwS61LJQFbKPSfGoMJk9
 cLHUnC4yPmD/9hL3s30saQGoJcAWQrBFWUTWGKppAXtRBtXBWhclH420RA+9/uX2Y8dN
 a4BEq3og0cPZqC6o405j3VC8P/0urkEUGdDS0ih61mXNIpdWoyxhNrll6yj/TjYhRhMU
 ZS2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lvvVk2L6i6z24yMnSChnSeSn9kTu3h0N8/X79SWM0Z0=;
 b=BK2ndgrX1ht9HjXrV3q/DTCyZBOkRVvV1FfXcqZahwRtmYAehn09Jm2PkghiToJ3IV
 8x+FWBjFBisVSL76nODkVHp0CHwwCGyrAMC9/hx0g6xNtebVtTt7FPSTYpy0C+ZKjiIP
 MlvFFBdo9lw6hu6avn5E3QL9U82Oz81wzTWXxs7XFyOR3JCdk+5M0KLSqPzvlREYRU0F
 lqBMSGz2Zpms2hUALOPuWsK/4h5PeyG87vCeQqtqWwOQljSSE52S9a/xNL0HRKky90iJ
 Iw2WiWhj/VmrNcXDuLNNPVeeLb8AAQC4R7561ldl2n88M82Zs2iJEaTtUGcoCFLnrUkJ
 8JNw==
X-Gm-Message-State: AOAM533p+L+T1Pi656V90z4PiopOthTlR3rSuVEKp54Ik3EWv0pQMuZ+
 g3yVg5EAFEdROlGZzZVIO7pSbAx58c0mFQ==
X-Google-Smtp-Source: ABdhPJyGXWm54/Z0LUqYR6BFc4SBu8CAKRrXxR0ITQUuYWtqY4CgCG2NepIHYw/J0MOuYj98CrvHHw==
X-Received: by 2002:a1c:218b:: with SMTP id h133mr43596wmh.18.1630946423035;
 Mon, 06 Sep 2021 09:40:23 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id r129sm31550wmr.7.2021.09.06.09.40.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 09:40:22 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 Sep 2021 18:39:37 +0200
Message-Id: <20210906163937.2521-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,
 1/1] package/libgpgme: fix build with glibc >= 2.34
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
Changes v1 -> v2:
 - Use upstream commit

 ...ore-Support-closefrom-also-for-glibc.patch | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/libgpgme/0001-core-Support-closefrom-also-for-glibc.patch

diff --git a/package/libgpgme/0001-core-Support-closefrom-also-for-glibc.patch b/package/libgpgme/0001-core-Support-closefrom-also-for-glibc.patch
new file mode 100644
index 0000000000..b8db949cef
--- /dev/null
+++ b/package/libgpgme/0001-core-Support-closefrom-also-for-glibc.patch
@@ -0,0 +1,36 @@
+From 4b64774b6d13ffa4f59dddf947a97d61bcfa2f2e Mon Sep 17 00:00:00 2001
+From: Jiri Kucera <sanczes@gmail.com>
+Date: Sun, 25 Jul 2021 11:35:54 +0200
+Subject: [PATCH] core: Support closefrom also for glibc.
+
+* src/posix-io.c (_gpgme_io_spawn): Use glibc's closefrom.
+--
+
+Since 2.34, glibc introduces closefrom (the implementation
+follows *BSD standard).
+
+Signed-off-by: Werner Koch <wk@gnupg.org>
+
+[Retrieved from:
+https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gpgme.git;a=commit;h=4b64774b6d13ffa4f59dddf947a97d61bcfa2f2e]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/posix-io.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/posix-io.c b/src/posix-io.c
+index e712ef28..2a3a81fc 100644
+--- a/src/posix-io.c
++++ b/src/posix-io.c
+@@ -570,7 +570,7 @@ _gpgme_io_spawn (const char *path, char *const argv[], unsigned int flags,
+               if (fd_list[i].fd > fd)
+                 fd = fd_list[i].fd;
+             fd++;
+-#if defined(__sun) || defined(__FreeBSD__)
++#if defined(__sun) || defined(__FreeBSD__) || defined(__GLIBC__)
+             closefrom (fd);
+             max_fds = fd;
+ #else /*!__sun */
+-- 
+2.11.0
+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
