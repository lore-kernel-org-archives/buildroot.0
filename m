Return-Path: <SRS0=49zi=O7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 170EBC433EF
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 07:17:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 842C360EBB
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 07:17:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 842C360EBB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D4EB81B4D;
	Mon, 11 Oct 2021 07:17:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aveBcqCQKGtR; Mon, 11 Oct 2021 07:17:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B020A81B10;
	Mon, 11 Oct 2021 07:17:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 179271BF29D
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 07:17:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0766860787
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 07:17:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y4doUV0DRiEK for <buildroot@lists.busybox.net>;
 Mon, 11 Oct 2021 07:17:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D6BE06073C
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 07:17:08 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id n8so67249510lfk.6
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 00:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QFQ0xEjiRd4Zj+lkyWq0rA9Kk6KBOJklXJrceZ8L2yc=;
 b=WmhaTum5/nhWc1dxkkoSpYLgfby+cgHIoeqQAOPo/D8TyVVdV3wtTfnRmHe0Qs4MYo
 wKXzGRyRcBQji3X+Up+m4PdefiRfYAg8pNbVhj+YYDHdJ1ncYGGJ5cttbf5Mm+SkDdtN
 1LCrlCtW8XculMOBkQJl87TYuOXZwYxhP7zV3OWPoBaQPJrTm6stu5jsUot49RtC9Qlj
 3wRB0DuYG6BuDvsGviJqmPOg+6cBCbgR6iT2g5SyrUJcJRVB3BzKx+DBby3KDqfJc1m4
 NLWY1inEC0ifWy6XD6yc2/FCdFcxfqb3t6Bup4NCVhBfliBqbLuqnJYOhBtE8Uc6c+Z2
 ssVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QFQ0xEjiRd4Zj+lkyWq0rA9Kk6KBOJklXJrceZ8L2yc=;
 b=voj2yMjcLkJm5YgEBPB8hyiiKUzvvvY7zwj+nFpryyD+xnVrFOlhDee9wzovrO3a2r
 kwy2bs0nte/mTeUiAKNorEl4M2CQ3nepe20x2byswiZ3fnbrSbgkKDeTd1+qF3fSv5O2
 S1qRLggamDbHBpcp6nDRKjEoq/4l4YfyPm0wiMzWanPdSl0NoPQ9MsdUDdk5dbN9uar6
 8qgctRxwhCIeYki9BwmMK/Qu+eyPZDDN73LGmHYIuqnyNUKJ0+r+cMdGvc739y2CSRhI
 MxH7FMy+xDPuZhunH7QkxrnxAj7iMdJQ8KWEJmfVgmW8TbSl972fhkGpq8AltGKbO3vo
 UbAw==
X-Gm-Message-State: AOAM531jD545wgJQONXi8P1BlvZYcZd4KYKt/G2lHXL5o8gCsRH7D1h4
 6Evyb+Ggcp3qMSC/fTy8qXmimN6klFc=
X-Google-Smtp-Source: ABdhPJwzlvxsrZJDkbo7asRw53f2DblAfauGNuDiK/SY6CbBDt9R9b4thCH4BN2p0PgVHJx4L5kRTw==
X-Received: by 2002:a05:6512:3503:: with SMTP id
 h3mr25487859lfs.513.1633936626397; 
 Mon, 11 Oct 2021 00:17:06 -0700 (PDT)
Received: from localhost.localdomain (82-209-154-112.cust.bredband2.com.
 [82.209.154.112])
 by smtp.gmail.com with ESMTPSA id m27sm179249lfo.48.2021.10.11.00.17.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 00:17:05 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 11 Oct 2021 09:17:01 +0200
Message-Id: <20211011071701.1720447-1-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libostree: bump to version 2021.5
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 package/libostree/libostree.hash | 2 +-
 package/libostree/libostree.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libostree/libostree.hash b/package/libostree/libostree.hash
index f281e1593c..1f8a02994e 100644
--- a/package/libostree/libostree.hash
+++ b/package/libostree/libostree.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  db5ce01a1606af3466ec77236700f53a63ce20e4984a549d0eaba3f66a3d9361  libostree-2021.4.tar.xz
+sha256  b45a32ded72c9fb6d2ab508adeae0306e4e2bb348db152f3d1b3708375829e1f  libostree-2021.5.tar.xz
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index b202b54d85..4f79885d20 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOSTREE_VERSION = 2021.4
+LIBOSTREE_VERSION = 2021.5
 LIBOSTREE_SOURCE = libostree-$(LIBOSTREE_VERSION).tar.xz
 LIBOSTREE_SITE = https://github.com/ostreedev/ostree/releases/download/v$(LIBOSTREE_VERSION)
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
