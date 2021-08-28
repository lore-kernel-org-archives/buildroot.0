Return-Path: <SRS0=/RLo=NT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59D0AC432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 07:14:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E09816108D
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 07:14:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E09816108D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A41D1400D4;
	Sat, 28 Aug 2021 07:14:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z57SlY62euyR; Sat, 28 Aug 2021 07:14:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75A6640165;
	Sat, 28 Aug 2021 07:14:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6AF0D1BF398
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 07:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65DBA40165
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 07:14:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cttEwcnYLpWv for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 07:14:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 42730400D4
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 07:14:09 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id i6so13890982wrv.2
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 00:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MfnfRUdEKHS9EjR5VQ6YI37L/53Gh/XXqiNwWAhvJfA=;
 b=HN1v91GV9xojGZXeCWqUSuoWyfEbT9VQ+/B0Fb5/yHpX5OkxbVjJsphYw7e2bsbdBY
 ggtAsU7mdeYVYEU1F0spuw2YZg2Yk0R/mpW/wUDAHejFsHfLE4OcyUAduo7L1n/EBkSR
 0iPmZ3dC73GXLqBZPMh1pj3xfijMzU6ffUVT0FjpchTKZljDpzs25TptRzusfa6ki0/X
 tWdZeFDnSOao8vfwHqEEnMEGCBw8kBescAGZlU5UXJU2noaH6zAONhucqi81I3FoPd9d
 FOWxeAtpquCH9p2+u8MFoldzXxp+WYJ7qrtdD7OLRwaGUjF9dXhySZOeHgGlNYjpUs0W
 GFAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MfnfRUdEKHS9EjR5VQ6YI37L/53Gh/XXqiNwWAhvJfA=;
 b=Jnx312vTvgGlQSWtMTliYuwJ9yBRTr4gedAkw7hGk9C4/QsYPkNCn9R5em9KG7Ee//
 v4CS/ZvusN103kJdkKWcV8lWjZX90h84SLXS85dbeSfeLGYfkC1U3IVq6GapWK2MHmhN
 M7Drfha0N/bEr0ZQUajNB7PxU+bm6emq2pdLMZtWjXLnlKDzX/12AGqBE2bGu8vqISkh
 3Ru5ZACQbA9F2RMvma3oKTIYH+PRzyg8DIG0GXRNHXw8fZGO5AJi0ON6aMDnAwRxcRku
 ekKmWorRwlXxDh4Bk+o2MXiv3lAKSwa0tP8NdywwI99OTjoi4krcyYYZl/noPC3dnikM
 mcFw==
X-Gm-Message-State: AOAM530ba3Nq9bD529i5yAqcVQlsxH+d1yfh1w2k5WN6769iWnI9fQ2N
 ra2pvKHHl9xyvayBZUubSmhdm54x/UYeEg==
X-Google-Smtp-Source: ABdhPJys0eXjX6ElMAQGVyTMRtzWePnMcB0bVl0nQpbTCYj0y9q23Hqbdc43c/B6ngzhab+dxug8sQ==
X-Received: by 2002:adf:fa82:: with SMTP id h2mr14043781wrr.129.1630134847120; 
 Sat, 28 Aug 2021 00:14:07 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id o21sm7288075wms.32.2021.08.28.00.14.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Aug 2021 00:14:06 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 28 Aug 2021 09:13:52 +0200
Message-Id: <20210828071352.359497-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/ushare: fix NLS build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Commit c4e1a075101914f8e0d47f8bb9c06bea13ba0fd2 forgot to add
--enable-nls to patch resulting in the following build failure:

Unknown option "--enable-nls".

Fixes:
 - http://autobuild.buildroot.org/results/6ab2555b419355f01310f230fe612f2a3699bbfd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-t-build-po-files-if-NLS-is-disabled.patch | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/package/ushare/0001-Don-t-build-po-files-if-NLS-is-disabled.patch b/package/ushare/0001-Don-t-build-po-files-if-NLS-is-disabled.patch
index f0fa89998f..3fbda2838e 100644
--- a/package/ushare/0001-Don-t-build-po-files-if-NLS-is-disabled.patch
+++ b/package/ushare/0001-Don-t-build-po-files-if-NLS-is-disabled.patch
@@ -1,4 +1,4 @@
-From 977171781f5d49e61b46c0241fb67cbb7d666498 Mon Sep 17 00:00:00 2001
+From c9f5783bb2df4a19c6281daeda30e8ab905d2ca3 Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Sun, 22 Aug 2021 10:44:48 +0200
 Subject: [PATCH] Don't build po files if NLS is disabled
@@ -7,8 +7,8 @@ Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 [Upstream status: https://github.com/ddugovic/uShare/pull/12]
 ---
  Makefile  | 7 +++++--
- configure | 1 +
- 2 files changed, 6 insertions(+), 2 deletions(-)
+ configure | 3 +++
+ 2 files changed, 8 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile b/Makefile
 index ebd8f91..6686cfd 100644
@@ -31,10 +31,19 @@ index ebd8f91..6686cfd 100644
  	for subdir in $(SUBDIRS); do \
  	  $(MAKE) -C $$subdir $@; \
 diff --git a/configure b/configure
-index 4a3efe0..162a776 100755
+index 4a3efe0..f48806a 100755
 --- a/configure
 +++ b/configure
-@@ -723,6 +723,7 @@ append_config "LDFLAGS=$LDFLAGS"
+@@ -414,6 +414,8 @@ for opt do
+   ;;
+   --with-libdlna-dir=*) libdlnadir="$optval";
+   ;;
++  --enable-nls) nls="yes"
++  ;;
+   --disable-nls) nls="no"
+   ;;
+   --enable-dlna) dlna="yes"
+@@ -723,6 +725,7 @@ append_config "LDFLAGS=$LDFLAGS"
  append_config "INSTALL=$INSTALL"
  
  append_config "DEBUG=$debug"
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
