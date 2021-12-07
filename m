Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D852CC433F5
	for <buildroot@archiver.kernel.org>; Tue,  7 Dec 2021 12:16:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5472A827A9;
	Tue,  7 Dec 2021 12:16:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id epLxRhJLoUHR; Tue,  7 Dec 2021 12:16:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0D5E81BD9;
	Tue,  7 Dec 2021 12:16:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E854D1BF31C
 for <buildroot@lists.busybox.net>; Tue,  7 Dec 2021 12:16:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D7018403D8
 for <buildroot@lists.busybox.net>; Tue,  7 Dec 2021 12:16:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q82rzoVyMOWB for <buildroot@lists.busybox.net>;
 Tue,  7 Dec 2021 12:16:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4FE1E402E0
 for <buildroot@buildroot.org>; Tue,  7 Dec 2021 12:16:17 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id d10so13128890lfg.6
 for <buildroot@buildroot.org>; Tue, 07 Dec 2021 04:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jaVhzvD2W+cmiPwQOQ1peuMOi6UA3itH5pXH+nNSDvA=;
 b=E9Ef9NwbNbetjXjppYTpAanbPKiDVCFlIWEYnuUwAP5MvVvHWIje4YB3VKnGlweijN
 ntaBog1gcbIpcTEQAH11MPmCp562UgrIBC1aTyuPJTMTi1Jks8C2+8bYAIRkjm1e4Wy8
 p9dMcU+ILSBQiSrTUzGiD1kMGG5mz/BCH4BjgsM/uaohrukLw1gCNlS/P3PtXjyu/vtc
 8voJdwz1e1iEzWxq0hjp41rP3DIfXZqKGLsYoRc3WCpS5FzbNZFz0AqDuRYd0SZSBcTP
 RRZ1BdFktj0B/nxnazEI/iVH4Lni/hgEl2n12FYVw7RaioerSJepbD2yCGYmOS2xeSSo
 pjEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jaVhzvD2W+cmiPwQOQ1peuMOi6UA3itH5pXH+nNSDvA=;
 b=gqi0TDUbCK0MjXdZcP9eKPpCDLaJccLW8pUFGlyBd3YAp4w5l/opU3WzshZDq4/PgD
 CAdTYyKHJPvZuYF0741Tc8QEaXgb7N8ksvcJ1UuvWhmoc+2ssxfGBkmYEz87zV1Hy8mF
 PhEBguCTwWWhui6Tr6GL+Mxobch7xUVw9YRY9dTCdoG8+zk6ieaEA/gaXBNPck3tu6RD
 4aN2Blfv++zYPaClQodKHT/dE1NyvpBGKlURdW75L88HoUjtSkIXVn+Lc15OAm80kk0g
 DsGMEKoReRLcpfQa0JA8wzo4+l0q776zuWSKQTuKkgnSZ2Uo6bhz0y8e6/VN35wo06U0
 fm3w==
X-Gm-Message-State: AOAM531iCFOjlh7g0oyQwF1C+zGgyt1reCksEAHSi8f1Q7m7BeOHgeLA
 GE/330cfUluGSfeoibzGLXXYs8eUQnc=
X-Google-Smtp-Source: ABdhPJwzFCQyudx5FQjTGJz3eJLFSN2IELLzIwH18hIgkSJIWA+Ncn4en7bOGI0pbuDSldpOCQrgwQ==
X-Received: by 2002:a05:6512:36c9:: with SMTP id
 e9mr41465308lfs.87.1638879375744; 
 Tue, 07 Dec 2021 04:16:15 -0800 (PST)
Received: from localhost.localdomain (82-209-154-112.cust.bredband2.com.
 [82.209.154.112])
 by smtp.gmail.com with ESMTPSA id m14sm1662539ljg.2.2021.12.07.04.16.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 04:16:15 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  7 Dec 2021 13:16:23 +0100
Message-Id: <20211207121623.910124-1-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH]  package/libostree: bump to version 2021.6
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
index 1f8a02994e..e81deb82a6 100644
--- a/package/libostree/libostree.hash
+++ b/package/libostree/libostree.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b45a32ded72c9fb6d2ab508adeae0306e4e2bb348db152f3d1b3708375829e1f  libostree-2021.5.tar.xz
+sha256  e80631cb1363d4734fe9d0c91f69a68be3848166d6e0481db19ce44a9cb4f531  libostree-2021.6.tar.xz
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index 4f79885d20..a6b09f95e5 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOSTREE_VERSION = 2021.5
+LIBOSTREE_VERSION = 2021.6
 LIBOSTREE_SOURCE = libostree-$(LIBOSTREE_VERSION).tar.xz
 LIBOSTREE_SITE = https://github.com/ostreedev/ostree/releases/download/v$(LIBOSTREE_VERSION)
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
