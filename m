Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02054C433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 22:50:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8224660FF2
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 22:50:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8224660FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25B1F40954;
	Wed,  6 Oct 2021 22:50:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AjoEwlzbR4VF; Wed,  6 Oct 2021 22:50:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F8DE4094F;
	Wed,  6 Oct 2021 22:50:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8FAA81BF34E
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 22:50:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F73184020
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 22:50:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kN0Uo3NTQIkG for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 22:50:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 49FF984057
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 22:50:52 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id d18so4581285iof.13
 for <buildroot@buildroot.org>; Wed, 06 Oct 2021 15:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R5idyXxquowcAKD+ovFcURr153QLxwOA7KxWX0UfGx0=;
 b=WrziyLACH3A8jj3BLFwrVN9Qc5rXFmzqYqWB1Q7KwCHtKg4Xy22I6EM0PzXytH98V5
 3NefGr9OVbsu23WQgfnJ4XjbkRGu/uVie7LVs+xBdU9lZtDQml3k1qsqIVWup0j6OPE8
 1ZqzRvfaNbtXP/pyC4KaJ11uFX1pzwWxm6K+CTc2+0npXcVYtrIowBeOyKcLwrbPKVXn
 Fg36dvfFpkWhQe5zsW1+mPalDIcTyCjfXnBKMxG3qeKL5XCy5UQgvlBLGIvCAQtiYbjS
 r6NgQZ1DgGCWrfOdqUvz3rNn6cZ83liQ4upzdX+2cSRw0RbVwMYRrsg0VZc0vT5kmDQV
 CflQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R5idyXxquowcAKD+ovFcURr153QLxwOA7KxWX0UfGx0=;
 b=Afa49P7Ha/wTy/obD5K7VOx/v9y4oQqQdGZDHLA/7gNNnMJEqxv7TXLbnbhTuQvETq
 8bPh9ESO9qe26tTCDH1n4z6yHUORpmrCj8T6RYlDrdBTIVhUrgPCQWMX/IJDPlb11C+/
 efhMwyscYs248wgjxtnEWfbQQs1hh6yjyDUPOiOLmyCEIvOuyo+KvjmWe2H1+RVIUjgf
 gWdj2t8tXtlSY3Jf29az1sWK6L9dWzecGSa0PphbaFdsiNggPSS9FIj/mmOFnXRjCiZL
 BmGt8MKGKVYXCoAr4tBlK9S4DmRBnv0LQLU+VqDJf8eJmBzFXXANNyIIL24IEnbBGe7r
 ewXg==
X-Gm-Message-State: AOAM531h1vfAt7WwBhmNW4xpNMZmaJMLPwFHPVJmgTk4prPHP75aGDp2
 +tbXy7QeNK+5jDzqpPO+jtti3UE96LQ=
X-Google-Smtp-Source: ABdhPJzAj244o8QhXhG6kulRiHt92nL5zryCiKQxZw2StWprdEYz24taXsdAPK0ZoYOH2ybKXfjj1A==
X-Received: by 2002:a05:6638:3052:: with SMTP id
 u18mr289003jak.148.1633560651355; 
 Wed, 06 Oct 2021 15:50:51 -0700 (PDT)
Received: from james-x399.localdomain (97-118-169-148.hlrn.qwest.net.
 [97.118.169.148])
 by smtp.gmail.com with ESMTPSA id n12sm12745331ilj.8.2021.10.06.15.50.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 15:50:50 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 Oct 2021 16:50:48 -0600
Message-Id: <20211006225048.3195569-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/ser2net: bump to version 4.3.4
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Francisco Gonzalez <gzmorell@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/ser2net/ser2net.hash | 6 +++---
 package/ser2net/ser2net.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ser2net/ser2net.hash b/package/ser2net/ser2net.hash
index c6f0bb12a3..31a7518428 100644
--- a/package/ser2net/ser2net.hash
+++ b/package/ser2net/ser2net.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/ser2net/files/ser2net/
-md5  8209d3dc88a6e16b4f62adbc367e510a  ser2net-4.3.3.tar.gz
-sha1  d735a3f6daaa8334e0ef5d8d1a81f88b61dafb8f  ser2net-4.3.3.tar.gz
+md5  e6d88a440852e28b8e2978003b00e154  ser2net-4.3.4.tar.gz
+sha1  74d02c19c2eef219b59a47fbc61b4fb09cf608d3  ser2net-4.3.4.tar.gz
 # Locally computed:
-sha256  f5be52033a690bd0dd711209a64ebaec024ee4542b1357350aad8489dc2bf720  ser2net-4.3.3.tar.gz
+sha256  c714d6777849100b2ca3f216d1cfc36d4573639ececc91d5c7809dfe27c8428e  ser2net-4.3.4.tar.gz
 sha256  501f3108e6c03e5a0a5585ebaaa369171aead5319cd0a7a4dc1f66211c1f09f1  COPYING
diff --git a/package/ser2net/ser2net.mk b/package/ser2net/ser2net.mk
index 0650ba5b99..bec2a9c202 100644
--- a/package/ser2net/ser2net.mk
+++ b/package/ser2net/ser2net.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SER2NET_VERSION = 4.3.3
+SER2NET_VERSION = 4.3.4
 SER2NET_SITE = https://downloads.sourceforge.net/project/ser2net/ser2net
 SER2NET_LICENSE = GPL-2.0+
 SER2NET_LICENSE_FILES = COPYING
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
