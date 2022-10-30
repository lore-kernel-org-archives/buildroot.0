Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02AC6C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 10:09:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B2768126D;
	Sun, 30 Oct 2022 10:09:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B2768126D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YWN5xcjTKJWV; Sun, 30 Oct 2022 10:09:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C24F81260;
	Sun, 30 Oct 2022 10:09:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C24F81260
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 80E771BF2B7
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 10:09:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C29E81260
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 10:09:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C29E81260
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5X72onLsdGId for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 10:09:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EED98125D
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5EED98125D
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 10:09:15 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id h9so12196065wrt.0
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 03:09:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2fg7uyl+p1Pg65OsIX6UbvFCxHnVCRyGHOyR57I0g5k=;
 b=O8L/rexJIJ4rx7N+Nw7YqdPerYgZVftZ37N3kw/Bw0AQwtWKpUJ/vvbvT7xQzoVw0H
 OB3sqZIrqG5lKG4A3pfe5M4hMm1Ex6uuhGbhWatJIzJ5dhQHgByipaYEPHTrHpkWQ2bs
 PwA2SIctU+tyKMHMw73jy1+ytwfqHinCuxOlKXVYTzbFiEnxYgp1I+gqZd0Ik7VSDTiU
 ghp7s1kMeZ0NvqRP5zGtFyu4DA0AJ2nSYHtVjX6lzBjmW8Mev6Cifu0yHMNgFMS9ioXl
 JCmOp1oZXvVeCVVw37HDc/7p2PXHqk5Jq69UOfWaXLw2QoD5TLopY1YLJ2pNCT5wKDbe
 BfDA==
X-Gm-Message-State: ACrzQf3D7Wr5bSgd9PqLX2aH1qdxVZLzFDJJzlB9gRxd5cNTSx8+xyjN
 aTy1JW7gTdff9gOmpaX79cQxe2P4AvY=
X-Google-Smtp-Source: AMsMyM6y2mt5643shFNzUmJiaPKnUmM1KRt80J5u9XaWYNvU58VAtFjE/+61jU3w/4n7WVuJ/LwzHw==
X-Received: by 2002:adf:a31c:0:b0:236:ba0d:246b with SMTP id
 c28-20020adfa31c000000b00236ba0d246bmr2642319wrb.448.1667124553217; 
 Sun, 30 Oct 2022 03:09:13 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 i7-20020adffdc7000000b002366c3eefccsm3736295wrs.109.2022.10.30.03.09.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 03:09:12 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 11:09:04 +0100
Message-Id: <20221030100904.76419-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2fg7uyl+p1Pg65OsIX6UbvFCxHnVCRyGHOyR57I0g5k=;
 b=dMz8y5hhDD14NAsBU4UK3dw04dmrUA9GfPg76D4hhSNke3G2wYnwFSQ6lAkPT+wWwE
 PBMMytXbdHypgA9Co2uJyH/wIShl/wCiyMPyjajhoRAGVrLfkuimyIZrhW+YILqjUmV0
 DWZrH5rUKTz0wSu88QDrpwGm6sYyw5cj3G/r5f143MbPx9eytf57uP/JXDVMFxfqK1+Q
 MmtHGFO2h3DgjoO3KBLntoAxF+puRJ2cDmgAyfZXrhDYyPdIktuV7+bTbmbmGSDWkr8w
 w3p86z9/1iJ6Jg53NQEZPlmgvDsjmDT4S8Z5BjEb2tHM8LprLBp28I1uErdS6vOkZohm
 JqvA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=dMz8y5hh
Subject: [Buildroot] [PATCH 1/1] package/libnl: bump to version 3.7.0
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

https://github.com/thom311/libnl/compare/libnl3_6_0...libnl3_7_0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libnl/libnl.hash | 4 ++--
 package/libnl/libnl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnl/libnl.hash b/package/libnl/libnl.hash
index a0f1388528..8a1bd56780 100644
--- a/package/libnl/libnl.hash
+++ b/package/libnl/libnl.hash
@@ -1,4 +1,4 @@
-# From https://github.com/thom311/libnl/releases/download/libnl3_6_0/libnl-3.6.0.tar.gz.sha256sum
-sha256  532155fd011e5a805bd67121b87a01c757e2bb24112ac17e69cb86013b970009  libnl-3.6.0.tar.gz
+# From https://github.com/thom311/libnl/releases/download/libnl3_7_0/libnl-3.7.0.tar.gz.sha256sum
+sha256  9fe43ccbeeea72c653bdcf8c93332583135cda46a79507bfd0a483bb57f65939  libnl-3.7.0.tar.gz
 # Locally calculated
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
index d3bd185093..6896188f4d 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNL_VERSION = 3.6.0
+LIBNL_VERSION = 3.7.0
 LIBNL_SITE = https://github.com/thom311/libnl/releases/download/libnl$(subst .,_,$(LIBNL_VERSION))
 LIBNL_LICENSE = LGPL-2.1+
 LIBNL_LICENSE_FILES = COPYING
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
