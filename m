Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 435B7C32789
	for <buildroot@archiver.kernel.org>; Mon, 22 Aug 2022 09:11:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE9D960D80;
	Mon, 22 Aug 2022 09:11:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE9D960D80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kgz0zjM75sO0; Mon, 22 Aug 2022 09:11:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6A1460D75;
	Mon, 22 Aug 2022 09:11:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6A1460D75
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CD6331BF306
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 09:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A215A408E5
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 09:11:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A215A408E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FZJ0Hk2YnY6u for <buildroot@lists.busybox.net>;
 Mon, 22 Aug 2022 09:11:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0EFA40912
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D0EFA40912
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 09:11:39 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id a133so3669706oif.4
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 02:11:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=5jB/0kedXtDSv2qnjktxmmOoUJQ/2rI9/GQJmLztPyM=;
 b=XH5mhHzMvlgUX0AlMEy/7DYi6mNaZeB0aD8xxBhqCZ4dA4VIJULu2V57B5ES+dcghX
 0COLRHdkOVUUw2Yi7h+nf5o2tWHOHAwzm62PutwjvmAjYiIVOw1JNW/WAAR6X8aA0H7r
 KAGOCbr3ZX6T3Tao/FNYejzDoToiDh6DWSHpWkORdDeWrolx5hJYS6QEtBoBuvD5YIZ2
 XG2nwLKmf4+dp7qwB+W9kQsWFsX6/OSMoSnUiIigHockjNyAVSWCP8OImHq4BKhHJ1wd
 MTphW7and7YKQ6XZh6HTC1/Ot+9uMjhSK0PKnEZGNVLI3tnIxQAa/ZA7fvdrx1JEiD/U
 Adlg==
X-Gm-Message-State: ACgBeo0bw7iHv+FlWKShg77g7GF0igw4+KnhBat0c3NaWDkPA7kdvOAb
 cQMnjpxt4YXzRSQxxVz7TuWL9W+Uc8c=
X-Google-Smtp-Source: AA6agR7eSxPFCs7tkpgfwugHOwZmUjNPfTejsXZ8X2PCYsmP17+oSj/VhTBp4Rh/fN/INNqLX1bYBw==
X-Received: by 2002:a05:6808:1395:b0:345:29c9:eec9 with SMTP id
 c21-20020a056808139500b0034529c9eec9mr6875782oiw.10.1661159498377; 
 Mon, 22 Aug 2022 02:11:38 -0700 (PDT)
Received: from james-x399.localdomain (71-33-138-207.hlrn.qwest.net.
 [71.33.138.207]) by smtp.gmail.com with ESMTPSA id
 z20-20020a544594000000b00344eb5a9416sm2525043oib.55.2022.08.22.02.11.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 02:11:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 22 Aug 2022 03:11:35 -0600
Message-Id: <20220822091135.4114651-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=5jB/0kedXtDSv2qnjktxmmOoUJQ/2rI9/GQJmLztPyM=;
 b=WZb3v4adL/t81YWIl294eQW0IP4qgF8Im2XtmoskqGwzcY+4rmLHl/vpJ2faRQD4OP
 ZP9x3UsjP0qzzCcLyhYuEeiZPFjm3Tr1/a/Ve15CabaSuQEfj+ujFrGQYFeS5GYODPbx
 OeLKugQ06rOV+nT8nt7omcBlIfaWtH6wPphjJrSyvoCJMMhwQfnRTOYgyWzLpcM+RgpN
 8s0j0Kyww+6yUYnty6dT15wS4HekpLDKYvRI8jPKJ50Hr1B0GfILdG6zVzfLTIxo4tb8
 wZXW6VAQjaWukeSy0R6zX2gZxQoB8g1fUXI7yPjlxQrPeVijbBWsodOnvhkX4lJt4Poj
 OxTw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=WZb3v4ad
Subject: [Buildroot] [PATCH 1/1] package/ser2net: bump to version 4.3.7
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
index 31a7518428..db493b28cb 100644
--- a/package/ser2net/ser2net.hash
+++ b/package/ser2net/ser2net.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/ser2net/files/ser2net/
-md5  e6d88a440852e28b8e2978003b00e154  ser2net-4.3.4.tar.gz
-sha1  74d02c19c2eef219b59a47fbc61b4fb09cf608d3  ser2net-4.3.4.tar.gz
+md5  3323783668b20016d79458e82327cff8  ser2net-4.3.7.tar.gz
+sha1  88c0542b3b5e8ce03bc99ace00b2e163382e726e  ser2net-4.3.7.tar.gz
 # Locally computed:
-sha256  c714d6777849100b2ca3f216d1cfc36d4573639ececc91d5c7809dfe27c8428e  ser2net-4.3.4.tar.gz
+sha256  542915e240ae8b5c7dcec8d1589e6067818532900d45cfef226cea9f0e671d13  ser2net-4.3.7.tar.gz
 sha256  501f3108e6c03e5a0a5585ebaaa369171aead5319cd0a7a4dc1f66211c1f09f1  COPYING
diff --git a/package/ser2net/ser2net.mk b/package/ser2net/ser2net.mk
index bec2a9c202..393d358033 100644
--- a/package/ser2net/ser2net.mk
+++ b/package/ser2net/ser2net.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SER2NET_VERSION = 4.3.4
+SER2NET_VERSION = 4.3.7
 SER2NET_SITE = https://downloads.sourceforge.net/project/ser2net/ser2net
 SER2NET_LICENSE = GPL-2.0+
 SER2NET_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
