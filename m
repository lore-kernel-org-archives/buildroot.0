Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75130C433EF
	for <buildroot@archiver.kernel.org>; Mon, 17 Jan 2022 12:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0786E60A7D;
	Mon, 17 Jan 2022 12:46:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oh2cCXqHEBAe; Mon, 17 Jan 2022 12:46:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32F73605EA;
	Mon, 17 Jan 2022 12:46:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 69AAC1BF3EE
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 12:46:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6585D8125B
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 12:46:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ztlu6jLwNkc3 for <buildroot@lists.busybox.net>;
 Mon, 17 Jan 2022 12:46:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A09A78124C
 for <buildroot@busybox.net>; Mon, 17 Jan 2022 12:46:17 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 q9-20020a7bce89000000b00349e697f2fbso23465519wmj.0
 for <buildroot@busybox.net>; Mon, 17 Jan 2022 04:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KDMam1B9jQsMEzFfZc6FL7YVty0586k/A+fMtMTfZ9U=;
 b=KaI2uZuOI97Bnloddr4Lp2SVEnyvxyhUk2Ep8OnXhqGgbl1cshnqa6hAO77MySU/Kl
 tBXx/QWL1CKklC6hvg/lzKxPbw+1G0RrZ+IcPszwtZyJnOSr/+OGoJ5ZEZyR2TIXnbS9
 xr4SFFny+DFF8gau6DF8in6347FDxsiYOJJ+eoFkZHt7/Mec+4bM3ehkEksCD4GHeNjl
 y7Utn48f0ukr0zKS7Adcz/qJJlOhEZkqNa/yANxVkZQ4xbCWgUuImqsyk60G+TI+Bic8
 F4vAgsJDdgdRj0jOiSfn26RWrza2sAQyg6FAuZxRrwTyK0nBSBmWtpgqD+fBSCfUAoGu
 KPkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KDMam1B9jQsMEzFfZc6FL7YVty0586k/A+fMtMTfZ9U=;
 b=RAsg4/C47gWJ0Rb0qmiFQj3rCc2Ma22grAJOFgtSZ8dYLns8Iy0RCrN9lARjf0/Ftb
 aY4y3W8ky1ewjXx1hM5w8dfLHJds/Q11tigSwaNZkEarb5fVIFJEtL4cEuFzMHc9+tNP
 MEXbJ74gRfMgsFu0/DLWwC9td7jOauzmq/cXdrsU+l0G//DpgoMhEEZrR5M3+VkJQHuh
 ell5bQXrtHoQ3Y9gHwQiI7OKJCCUp2gWZJuFywWtVQ+Y+M7VJ7PLo1RsQhTAsteWLAmi
 jp4TY+wqjDtEcp1J0HvU752/TcvH5t+BGFD1g3SCgtznjtVl/X3BFv8A+yXtVphvLUx8
 /pyg==
X-Gm-Message-State: AOAM531MsSvMIlMX+OU0SnPYZwdE4Y9dEO/VKTjJNIOx3KzBmMWKVfT1
 6Aw03tjHwKL7+p42uj7z7nZfwYrig10=
X-Google-Smtp-Source: ABdhPJw0Bol+880SwY8qC/ZT+kIExllIZmPcw2sxhtPRitj/kj5d6QwA9+gdiLFACB6Jn9LCD1L8fA==
X-Received: by 2002:a05:6000:510:: with SMTP id
 a16mr9222803wrf.605.1642423575600; 
 Mon, 17 Jan 2022 04:46:15 -0800 (PST)
Received: from pc-140.home ([2a01:cb15:81e5:ad00:7afb:407b:e9ac:7e79])
 by smtp.gmail.com with ESMTPSA id r3sm4382745wrz.92.2022.01.17.04.46.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 04:46:15 -0800 (PST)
From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
To: buildroot@busybox.net
Date: Mon, 17 Jan 2022 13:46:05 +0100
Message-Id: <20220117124605.17592-1-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libxcrypt: bump to version 4.4.27
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
index b47f470020..2b95a35229 100644
--- a/package/libxcrypt/libxcrypt.hash
+++ b/package/libxcrypt/libxcrypt.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  e8a544dd19171c1e6191a6044c96cc31496d781ba08b5a00f53310d001d58114  libxcrypt-4.4.26.tar.gz
+sha256  e4ff47b7fa5370fa08e27258f8a0de5cb7e9b09c297ec7ab56a8a82e229a1c84  libxcrypt-4.4.27.tar.gz
 sha256  cead8b3d94a143f64ccb571ada1cea47a70a0b847c8d95306e8d78ed68951f3d  LICENSING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/libxcrypt/libxcrypt.mk b/package/libxcrypt/libxcrypt.mk
index 3c98b30dd5..65efa2bab9 100644
--- a/package/libxcrypt/libxcrypt.mk
+++ b/package/libxcrypt/libxcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXCRYPT_VERSION = 4.4.26
+LIBXCRYPT_VERSION = 4.4.27
 LIBXCRYPT_SITE = $(call github,besser82,libxcrypt,v$(LIBXCRYPT_VERSION))
 LIBXCRYPT_LICENSE = LGPL-2.1+
 LIBXCRYPT_LICENSE_FILES = LICENSING COPYING.LIB
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
