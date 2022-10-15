Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E5DC4332F
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 22:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B80F560DED;
	Sat, 15 Oct 2022 22:24:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B80F560DED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SK2NKOhB4vEK; Sat, 15 Oct 2022 22:24:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDA5160DCB;
	Sat, 15 Oct 2022 22:24:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDA5160DCB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 80BFB1BF35C
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 22:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B5C860DCB
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 22:24:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B5C860DCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id teMvD-Ap4OTb for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 22:24:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C40960D9D
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3C40960D9D
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 22:24:25 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id a10so12810833wrm.12
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 15:24:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n8OHapATY1agwnBADkqa1OYQPmxTEAQulbFIND0fReE=;
 b=j1i/WawCEPSVSLfX4Fk2BCQ6QjpKSEl9nMP9WnCuQ4mAqrvFUOOnjCeJ8w7FRaZ+WS
 I8NlE/ncy6spZL3ED2CHSyezDqGCCnKYYJS/atgLlXmYhFQJKvq3ZY0mavDaj1RVSLp5
 iZYif+hvfv29QLi/EZl0Tv3UuVIQyk2j/osIxSADDEP9F33OFSWhmsjPLmg2GWezAj3B
 iV8wgGfqH6kRJF5dKvN7FWpOYj0mD3Vnm8fAyyF44sd2hzvqZTQ8BhKQ5ceJKMxV2WX/
 1q8yFum5G7pePdrwepXvVq0CafsLv0bt7lmG+/gan57L/uDzYaFG5UmRvVu25hKxEBqR
 wnVA==
X-Gm-Message-State: ACrzQf2Rz4hoLDlCyy6MaxpVyuAVobWaNharuY+pluEK0PlWP9mLxKxF
 QcAlJVjIv20yv3ZlagJcBnmz4MNkSoM=
X-Google-Smtp-Source: AMsMyM7ppzsZcoARlkJLrO4AmrUEpcCeckK196NJyptQ2fJpOnHhTd7WcqVnBj4I/hijeRNIlN+RwQ==
X-Received: by 2002:adf:f7d2:0:b0:22e:3ca4:a657 with SMTP id
 a18-20020adff7d2000000b0022e3ca4a657mr2380454wrq.177.1665872663003; 
 Sat, 15 Oct 2022 15:24:23 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 bl13-20020adfe24d000000b00228de351fc0sm4922605wrb.38.2022.10.15.15.24.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Oct 2022 15:24:22 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 16 Oct 2022 00:24:20 +0200
Message-Id: <20221015222420.165934-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=n8OHapATY1agwnBADkqa1OYQPmxTEAQulbFIND0fReE=;
 b=GsXQxDHqaURW0cV9ZnainJQwHS03gHEPwKbRRI24FNvFgTYDBo8DEyOPgKQoTPKBN7
 cqzvhzGZZ2AOHWmVZaC/2NRF2R7QBrD8Gg6ybby4gkPrpYVv2KxZol6sXyXnDz5cDRC6
 kdihNXX9agZ/TuYLHIQzFGXoUGmoli3LnLJegDFCkhiTcjltAKgBS3ZwVc8whGZ6QCnR
 hBq0ZgdzEoOlnAsEdbG5FEMfl6WjNpbhy2LZNEZTRmSNH9fy0kiFOKgnRdLcYIuMI3mn
 ZQmWZGw0Q5COBG9U+rEgVM06JGfrpzUJkvqBJDeAHY9cZnqWR+GIrebvF2vF7C3rbOoT
 fILg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GsXQxDHq
Subject: [Buildroot] [PATCH 1/1] package/lrzip: security bump to version
 0.651
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
Cc: Sam Lancia <sam@gpsm.co.uk>, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2022-26291: lrzip v0.641 was discovered to contain a multiple
concurrency use-after-free between the functions zpaq_decompress_buf()
and clear_rulist(). This vulnerability allows attackers to cause a
Denial of Service (DoS) via a crafted Irz file.

https://github.com/ckolivas/lrzip/blob/v0.651/WHATS-NEW

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lrzip/lrzip.hash | 2 +-
 package/lrzip/lrzip.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/lrzip/lrzip.hash b/package/lrzip/lrzip.hash
index 19295383c3..cb03ff07cc 100644
--- a/package/lrzip/lrzip.hash
+++ b/package/lrzip/lrzip.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  9b6b4bb1ae76dafbaab96ec9d50d41af5fed45a6c4f2e06feea828c2cd8025c0  lrzip-0.641.tar.gz
+sha256  48bd8decb097c1596c9b3777959cd3e332819434ed77a2823e65aa436f1602f9  lrzip-0.651.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/lrzip/lrzip.mk b/package/lrzip/lrzip.mk
index 27d9fde204..55f28e3212 100644
--- a/package/lrzip/lrzip.mk
+++ b/package/lrzip/lrzip.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LRZIP_VERSION = 0.641
-LRZIP_SITE = $(call github,ckolivas,lrzip,v$(LRZIP_VERSION))
+LRZIP_VERSION = 0.651
+LRZIP_SOURCE = lrzip-$(LRZIP_VERSION).tar.xz
+LRZIP_SITE = http://ck.kolivas.org/apps/lrzip
 LRZIP_AUTORECONF = YES
 LRZIP_LICENSE = GPL-2.0+
 LRZIP_LICENSE_FILES = COPYING
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
