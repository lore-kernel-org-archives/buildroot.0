Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E827C54E5D
	for <buildroot@archiver.kernel.org>; Thu, 14 Mar 2024 21:42:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F34AD402D7;
	Thu, 14 Mar 2024 21:42:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1Wmcsjn5Z4qs; Thu, 14 Mar 2024 21:42:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FA4040414
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1FA4040414;
	Thu, 14 Mar 2024 21:42:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 943901BF3E9
 for <buildroot@lists.busybox.net>; Thu, 14 Mar 2024 21:42:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8095A820EE
 for <buildroot@lists.busybox.net>; Thu, 14 Mar 2024 21:42:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WugopnWjUbrB for <buildroot@lists.busybox.net>;
 Thu, 14 Mar 2024 21:42:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6EAA6820E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EAA6820E0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6EAA6820E0
 for <buildroot@buildroot.org>; Thu, 14 Mar 2024 21:42:32 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-33e8b957a89so982680f8f.0
 for <buildroot@buildroot.org>; Thu, 14 Mar 2024 14:42:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710452550; x=1711057350;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bRDrlZbCRJ2QWZbHNJ/FLGk+wVZ9JjajkZ8ITs7LgWI=;
 b=Vwskt/c5Pq08pZJVKqKv7iPH+9nGiCen4DRLZT80LW6cu0dG27sxtbIJu0hnfqnnLL
 scVQOCdy1+xTA7scVd0ktQ5XthbQBM5BNL3GXlpKjUEqdWN1Edeo+4gNgUO4ty0joAUr
 7WHzQN063R2Y/OETAsWnOacp3RqHT7AGKhJGtvX2R3meSRs0iT70Ocrx/VuqHZPF8roV
 vGd95sLt94baI6qBV1Tg+lbA+UkcE24joSanImLGNbG7+uAcLlJknb4ztur1l2EHjuh4
 RpWTY5kA732JwN4rvDu5POjzF8eEbwz4aml2ihYk52ZZZZRnucY0fZkhCtxOm6uJQ8TH
 gBAg==
X-Gm-Message-State: AOJu0YwxciFN6xbeJLqpn0Aljo1XDs/H3j3dwjlRTws11aQ2HBNV0zgi
 5aLmi4++NQkea6q/l8cG5USoemnrDdx/jlNgODgrnH4XcoOp4a5QHDD3QL1Z
X-Google-Smtp-Source: AGHT+IHnquDuXtRPJ1WT1+Y83VZnicj5DqCg3p9bT+PkalarPld7M+hiYLNqlwdm3cRU0boigWlxtQ==
X-Received: by 2002:a5d:5384:0:b0:33d:8029:b136 with SMTP id
 d4-20020a5d5384000000b0033d8029b136mr952950wrv.55.1710452549546; 
 Thu, 14 Mar 2024 14:42:29 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 bs17-20020a056000071100b0033d9f0dcb35sm1634220wrb.87.2024.03.14.14.42.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Mar 2024 14:42:29 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Mar 2024 22:42:25 +0100
Message-ID: <20240314214225.398600-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710452550; x=1711057350; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bRDrlZbCRJ2QWZbHNJ/FLGk+wVZ9JjajkZ8ITs7LgWI=;
 b=DYUFMPcvX5A/TXvqJKxIVHIsIFpcf6QnodvXuE1EF2JfJ7UwJcLoMcxtlIwHh7qCoz
 lmD8f6hnWa/muFSChQt/I7f9SoKc8fFhhF+dywSXUV0nu3/odFkQqF7LrS4e3YvP2hRO
 2rM0r2wNbEgodF/43p2HJHMRNatPQGEtPhkI/sUm+D0zyKxZKHeco3zJ/KUvwBpSl20D
 c/t6rWIcVYnua+8uwz6FvU5QzaCwnXGWDC2Cnq79xBb+6m6aAoooPcvkh3//YhWhtPPq
 LOQed5vGqDb5UwRkvpOo00CcQYjYjOIA9GwjXdquVc3UyS5VdtQokcnmnnB/XuwIyahz
 vbKA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DYUFMPcv
Subject: [Buildroot] [PATCH 1/1] package/libnfs: bump to version 5.0.3
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/sahlberg/libnfs/blob/libnfs-5.0.3/CHANGELOG

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libnfs/libnfs.hash | 2 +-
 package/libnfs/libnfs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libnfs/libnfs.hash b/package/libnfs/libnfs.hash
index b67a5d2eda..c5e5197c13 100644
--- a/package/libnfs/libnfs.hash
+++ b/package/libnfs/libnfs.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  637e56643b19da9fba98f06847788c4dad308b723156a64748041035dcdf9bd3  libnfs-5.0.2.tar.gz
+sha256  d945cb4f4c8f82ee1f3640893a168810f794a28e1010bb007ec5add345e9df3e  libnfs-5.0.3.tar.gz
 sha256  edd960c0142b8ada98b43b6396b78f4e557b0bc70ac601a51e397ad04070e2c5  COPYING
 sha256  d9406ced95457941032aa11d04623b8ab71f2827a3395ebef137aec475be35b1  LICENCE-BSD.txt
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENCE-LGPL-2.1.txt
diff --git a/package/libnfs/libnfs.mk b/package/libnfs/libnfs.mk
index 19044527e0..e5e302a4f8 100644
--- a/package/libnfs/libnfs.mk
+++ b/package/libnfs/libnfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNFS_VERSION = 5.0.2
+LIBNFS_VERSION = 5.0.3
 LIBNFS_SITE = $(call github,sahlberg,libnfs,libnfs-$(LIBNFS_VERSION))
 LIBNFS_INSTALL_STAGING = YES
 LIBNFS_AUTORECONF = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
