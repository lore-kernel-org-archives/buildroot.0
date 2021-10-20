Return-Path: <SRS0=oNq7=PI=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC418C433F5
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 16:43:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 410D061371
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 16:43:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 410D061371
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 024C06076F;
	Wed, 20 Oct 2021 16:43:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AQkSYYkii8XW; Wed, 20 Oct 2021 16:43:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 673E660618;
	Wed, 20 Oct 2021 16:43:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1111C1BF3C6
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 16:43:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2FA6404B6
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 16:43:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NaRT95oAYskt for <buildroot@lists.busybox.net>;
 Wed, 20 Oct 2021 16:43:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 677DC4036A
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 16:43:30 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id o20so48362312wro.3
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 09:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oLrUSUO3nnQudp16PftRLyGqR9MnqFLIpHW2FXL8KSI=;
 b=X0U1RgODDfvrKkHPmWhz2q1zvdwFf/mIm3WMcUE88yaNPA/E2QbTR2K89lYGBgFX3W
 Af59yxawOd+UsYD+R1NhSarFIyZW1qN/zp7HeEj6hGkdaeof60oDoP/Td9oaYCEOdkh0
 OAqpqCfZ8I7jbIbH+d5vldjtSaZtFHY8Yseku/9Qdi5qYo2GlqL2Xc2WN5v+gbrDwjS/
 DcE4Jpm5MBuL9t8rQdwD7hThot1NWKMtZOsZgpKNEZB+Ki9iraviAnhcJXHeayOxE5ch
 Ks33wNHmcVU+m9cM9TQPzBmQE+b0Qti8zSspfG0JVvfW5qPH9PPZMAcB4GT+4BuBUS5j
 jmjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oLrUSUO3nnQudp16PftRLyGqR9MnqFLIpHW2FXL8KSI=;
 b=GmPgelnIq0T3CrXXyuBBtUERAVXSNbgRD+1CfztMMJCa7MFH4+xuJD5Y/9BgM4wDNr
 qsZeo42PlrBEtfVAnduWTskBW1r2wmtJzRPsibYSO46dvnVJVIF1d4ZjD/MVIsUr2McR
 rTJdc6nJHxoaff6VUepWR+avSRFotWNYFx1EPoQHw9BhgUhMtb4ins3UpQfsVIHIFZ+z
 CBW49QNMX9hkaPAHIbESqy+WIbeleG/3lrzkKWTIOAyKtSJgYafIXkuG+HMEfQh9VrY7
 pV9DeucgXSusEOHPZi4mjy7jgt5IN9etWKrx/dpjFuiA4UV+LHzNbUBHjoNpdZxk77+n
 6SIw==
X-Gm-Message-State: AOAM530h1nSiYxANNkMfGNJZPlChGjjzsTT8B8ZD/X5ZJpYnVaBxwbNf
 e/0PGyucy+oA7ZaEdeN47DCVGedMeCU=
X-Google-Smtp-Source: ABdhPJwfxQnWD03PT/IzUz31Rp2dB/jWqz5255I3ko68/6nYl11uAcbqrnajMFvViXLy8c4Hf313sQ==
X-Received: by 2002:a5d:55cd:: with SMTP id i13mr393735wrw.410.1634748208438; 
 Wed, 20 Oct 2021 09:43:28 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id t1sm3205854wre.32.2021.10.20.09.43.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 09:43:28 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 20 Oct 2021 18:42:07 +0200
Message-Id: <20211020164207.2698548-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/earlyoom: bump to version 1.6.2
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/rfjakob/earlyoom/blob/v1.6.2/README.md#changelog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/earlyoom/earlyoom.hash | 2 +-
 package/earlyoom/earlyoom.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/earlyoom/earlyoom.hash b/package/earlyoom/earlyoom.hash
index b0095cb8ec..ab91383ee4 100644
--- a/package/earlyoom/earlyoom.hash
+++ b/package/earlyoom/earlyoom.hash
@@ -1,4 +1,4 @@
 # locally calculated
-sha256  b81804fc4470f996014d52252a87a1cf3b43d3d8754140035b10dcee349302b8  earlyoom-1.6.tar.gz
+sha256  227234cf9e77831c21c748bd361e1a7c415e158b96034eacd59e70586779bb6c  earlyoom-1.6.2.tar.gz
 # License files, locally calculated
 sha256  e730b3ec729de46d987ae73f30ed337e4cbe832f09205330acfa71848c6e0087  LICENSE
diff --git a/package/earlyoom/earlyoom.mk b/package/earlyoom/earlyoom.mk
index 066a479bd1..d1cf9d4de1 100644
--- a/package/earlyoom/earlyoom.mk
+++ b/package/earlyoom/earlyoom.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EARLYOOM_VERSION = 1.6
+EARLYOOM_VERSION = 1.6.2
 EARLYOOM_SITE = $(call github,rfjakob,earlyoom,v$(EARLYOOM_VERSION))
 EARLYOOM_LICENSE = MIT
 EARLYOOM_LICENSE_FILES = LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
