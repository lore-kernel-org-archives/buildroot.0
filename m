Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C8FC433EF
	for <buildroot@archiver.kernel.org>; Sat, 19 Feb 2022 10:23:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69AC940761;
	Sat, 19 Feb 2022 10:23:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G-rvLpsYbRqb; Sat, 19 Feb 2022 10:23:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4C024028E;
	Sat, 19 Feb 2022 10:23:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8CC2B1BF344
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 10:23:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D62480BD2
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 10:23:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cI1xLK_22L2y for <buildroot@lists.busybox.net>;
 Sat, 19 Feb 2022 10:23:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5978380B9F
 for <buildroot@busybox.net>; Sat, 19 Feb 2022 10:23:52 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id k1so18540644wrd.8
 for <buildroot@busybox.net>; Sat, 19 Feb 2022 02:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hXKOQlI0IzUIzH1LBvRBYPrXXBJywygZD85XYhQc8E4=;
 b=QNCGt6+sJHJy4hm2XpoU1G34tZOSNbHIDdwbBZWvvnYxzhYb+HmZWI5bDR4d86VWkT
 HHN9+LNfz5oxZjwB5zuZ/VS8EYwFCkovUWoDGhoVA9POO/z7cqZzJ+AAp1IFLMI3u1Wg
 kxhbyrSGg3C9xxMUzISXcmaZOLnItMFwV+i+u5dmSqao7pXpAJm+WLtR1Ozhkg/BOTN4
 vStnYygPH4yTfDsIi+Qw1HOtXjJ8SI1q6uji9JSqB7BMU8nSrfOZ/SF3U8USMCLTuydS
 ou1FdDdpCnUro6TSsGnjdYX1bKRpNerM3cxxdgcmnDcFkZCHDP/nZx21d6NulZvYi/93
 57ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hXKOQlI0IzUIzH1LBvRBYPrXXBJywygZD85XYhQc8E4=;
 b=IzGIxha7AN0ac/t+sFXSnp874W4r4H438ANS7G91jiL5mp3rK68KfmpzSg7MgRLb9l
 GX/GBpl+hYrU/tJ9dxYr9Xb42jxy5XLeR0w3AzaLGOF/4rchjNBdawRdyzz7Ssi8vEH4
 Ui8MvXOz+VlT9bQWZYeE1JAjkHKMSoPsqCd7zetMCzOFGo9HkkAjAqgXiQ5+U/LqNrW4
 QTN6NVikN9BthoH52U6u9cDFyxu3aGWQ8UhmC+clr2sVblBLoZ9ZwH23qSipCKQhf9K0
 Htew06AylVvtlvdMC3beXI9N0J1wk1fPtL6usNlWu6/G5O+3+tDgMcufd8FCeOQOAfcq
 eIvQ==
X-Gm-Message-State: AOAM5317qJSYwKRliWQ7u4MLHyqVa3EJsZDkfDSx6ByiaSdr5C0AC5ja
 mDU6e/X6liV9jQfx2SfNwqpdFdiifGI=
X-Google-Smtp-Source: ABdhPJwN7LpzyCb8v7995Y36mIy+ZVeg3xPfTqOK74rNj/BKG81o/5vvyemdX8Q1dK4cgDK1kTNlCA==
X-Received: by 2002:adf:816c:0:b0:1e6:88a9:eb6c with SMTP id
 99-20020adf816c000000b001e688a9eb6cmr8862221wrm.645.1645266230006; 
 Sat, 19 Feb 2022 02:23:50 -0800 (PST)
Received: from pc-140.home ([2a01:cb15:81e5:ad00:7afb:407b:e9ac:7e79])
 by smtp.gmail.com with ESMTPSA id g5sm1896038wmk.38.2022.02.19.02.23.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Feb 2022 02:23:49 -0800 (PST)
From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
To: buildroot@busybox.net
Date: Sat, 19 Feb 2022 11:23:09 +0100
Message-Id: <20220219102309.15465-1-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libxcrypt: bump to version 4.4.28
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
Cc: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 package/libxcrypt/libxcrypt.hash | 2 +-
 package/libxcrypt/libxcrypt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libxcrypt/libxcrypt.hash b/package/libxcrypt/libxcrypt.hash
index 99ddf62be0..bdda6b47c0 100644
--- a/package/libxcrypt/libxcrypt.hash
+++ b/package/libxcrypt/libxcrypt.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  e4ff47b7fa5370fa08e27258f8a0de5cb7e9b09c297ec7ab56a8a82e229a1c84  libxcrypt-4.4.27.tar.gz
+sha256  db7e37901969cb1d1e8020cb73a991ef81e48e31ea5b76a101862c806426b457  libxcrypt-4.4.28.tar.gz
 sha256  f9b48b0bc67a92b752780710aa774cf08b62ec2ebaa3f4aebd00069fba6effd2  LICENSING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/libxcrypt/libxcrypt.mk b/package/libxcrypt/libxcrypt.mk
index 65efa2bab9..f7a0fd4308 100644
--- a/package/libxcrypt/libxcrypt.mk
+++ b/package/libxcrypt/libxcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXCRYPT_VERSION = 4.4.27
+LIBXCRYPT_VERSION = 4.4.28
 LIBXCRYPT_SITE = $(call github,besser82,libxcrypt,v$(LIBXCRYPT_VERSION))
 LIBXCRYPT_LICENSE = LGPL-2.1+
 LIBXCRYPT_LICENSE_FILES = LICENSING COPYING.LIB
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
