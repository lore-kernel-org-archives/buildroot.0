Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57FB8C433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 22:47:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8900660FD8
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 22:47:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8900660FD8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BC8C60F4C;
	Wed,  6 Oct 2021 22:47:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oiSt3ckMvsLR; Wed,  6 Oct 2021 22:47:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9584160F52;
	Wed,  6 Oct 2021 22:47:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 433B11BF34E
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 22:47:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31D3B4094F
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 22:47:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JwvMap93o45O for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 22:47:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0FB074094E
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 22:47:28 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id e144so4630931iof.3
 for <buildroot@buildroot.org>; Wed, 06 Oct 2021 15:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lWPoo/hKQ0DiUEwZPKcyBLa+AdKm+a6YRFuqoqu2ncM=;
 b=NWUBFlSAH1L6qOGIMNMggtySZUbHFFPX5ozvifDvw7kmhTceQxXEXlB7jgsXE6WCvL
 /eA39XjuWWDiYenWGl2jy+W2vuhh7kb5UsYQnJ3Ej0SpvyDRnzjtynfz1rDtrnPsQZjv
 a9ICty6josfgtRrpg144cXIS7JWmQeNwBzL6WKsigmcjTpokwtBUBOrQl+3I8CsFwHHv
 aCH77uUIptpJcqqb2VaGL46X+krRbbP6gFweTspzsHKB75WKESQSkE4pw1Ku7ieEizqz
 FBzNi3vrdUuwNQoovQj+j8pMYHha4Tj8r6NkqZ1al2tRXzphUaGh2QCzAA0qO+8y/8k3
 Yx8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lWPoo/hKQ0DiUEwZPKcyBLa+AdKm+a6YRFuqoqu2ncM=;
 b=Po8a69iZK1//NoUOMK+RkXF9qnCPoLHAWdkI50riO/vo4yxA1D4Pzh69nYQYrQk7FG
 EETZcgF+cs5J6bC2witU7zAvOfDZYfFmlhyFFXoKxMoXjYRsB1MGjqPCPgHM0mgsSOlQ
 q2e5PTd26+UrQ2rCpEeFxWJ8kUbO78Dvuf2p/VrD8ISKm+JYwYqcP0aSgbvS1Z4gBRxV
 PWeLDfsE/xq3DpDURYnwhdZp8p3NwWUd6qSfarMx2R1NOolHFuknqJTb+fezG1fbpjJv
 cHogdi/ujSLAOc/nsndKeDoOAYdgJU1AlzU7ghS9N8fkmrGBebGnSlEWeX86k7I1hgXo
 A7nQ==
X-Gm-Message-State: AOAM532Re2orZAjrgXgBRZcwfnXdzJmyGj9YY8hWvkpirgYHAkhkpyhw
 sTuFjT/jbq5SnL4GQa8vwqpjl7xFHfE=
X-Google-Smtp-Source: ABdhPJyReYb0knRtiRqMfhEuPjm3RRTQrviVMub783nfNKy3vC9zHtOxC6BMJ+UBz/yFNsxkPjXAMQ==
X-Received: by 2002:a02:b0de:: with SMTP id w30mr316119jah.0.1633560448074;
 Wed, 06 Oct 2021 15:47:28 -0700 (PDT)
Received: from james-x399.localdomain (97-118-169-148.hlrn.qwest.net.
 [97.118.169.148])
 by smtp.gmail.com with ESMTPSA id s5sm12963002ilq.59.2021.10.06.15.47.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 15:47:27 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 Oct 2021 16:47:26 -0600
Message-Id: <20211006224726.3184241-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gensio: bump to version 2.2.9
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/gensio/gensio.hash | 6 +++---
 package/gensio/gensio.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gensio/gensio.hash b/package/gensio/gensio.hash
index 94f964faad..930a2fff81 100644
--- a/package/gensio/gensio.hash
+++ b/package/gensio/gensio.hash
@@ -1,7 +1,7 @@
 # From https://sourceforge.net/projects/ser2net/files/ser2net/
-md5  0adab57c4fbb55a280595f6541f202da  gensio-2.2.8.tar.gz
-sha1  3030b398eef379579680240d0c732d88fdad72a8  gensio-2.2.8.tar.gz
+md5  45cd3a4d9058816e50351b0700a035ad  gensio-2.2.9.tar.gz
+sha1  4bb34517931f5be4dc5982f6e7a567cf6fdc41b8  gensio-2.2.9.tar.gz
 # Locally computed:
-sha256  d495bfdacd30e8fe3879b29baab034eb553e606dbf145243989c97e83ad83115  gensio-2.2.8.tar.gz
+sha256  3609f66e61c98cce181ec1b37508b727b636d7cfffdb6edd4c254d2f6097a000  gensio-2.2.9.tar.gz
 sha256  501f3108e6c03e5a0a5585ebaaa369171aead5319cd0a7a4dc1f66211c1f09f1  COPYING
 sha256  dcac7d447dd81ab96d28dce00a07a6486e623f7ded94e2a2a8e83312405cdf89  COPYING.LIB
diff --git a/package/gensio/gensio.mk b/package/gensio/gensio.mk
index 9163c6a37b..ad6c39b6fa 100644
--- a/package/gensio/gensio.mk
+++ b/package/gensio/gensio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GENSIO_VERSION = 2.2.8
+GENSIO_VERSION = 2.2.9
 GENSIO_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
 GENSIO_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
 GENSIO_LICENSE_FILES = COPYING.LIB COPYING
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
