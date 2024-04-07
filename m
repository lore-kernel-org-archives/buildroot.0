Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32DEFCD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 16:13:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0086881EB8;
	Sun,  7 Apr 2024 16:13:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5AuT4Szpuzka; Sun,  7 Apr 2024 16:13:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F326881E9F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F326881E9F;
	Sun,  7 Apr 2024 16:13:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7AA491BF326
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 16:13:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 729F44168F
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 16:13:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wMj8VytdB6SN for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 16:13:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 015C5415AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 015C5415AB
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 015C5415AB
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 16:13:44 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4166ccac75cso1598525e9.0
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 09:13:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712506422; x=1713111222;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xRvlWSOeGh+4UvzQhb/17ZU2hDry2/QFw7N+td3v/sY=;
 b=Qz5Dc8ngNQp3abE8e+HQHD0r6rKMpgdR6RPGDs19vw53ZR8NwkTdV6Jd7iuVUc4TZ3
 mvIdiziiO40lxyiPzwPgdQtrP4FiJOrMcQs85XlUd7T9gXIgNxDLvx9I1GEIK/2HSoUm
 scN/YpXdiZz9apG4wFeaeT7CEbpzEEnom+7PKOUwXA74CinEC1HzafUdTPD/isOnhLDN
 2Iljqbqt1IjYIQm9rNECRKBFy0CT7VMcGmKZHIBi/BdAw6V2xzlGpz4JrECzohVxo2Pc
 PInOe03O/V7YbWeNKg1weBKTR2QRGGnamXFaL6SSj0cZvkmylW8t4+KmMYh7sv6mFz8L
 Zj6Q==
X-Gm-Message-State: AOJu0YwT0VtElY2uBEvbnTq4OWI3N4Rlv/QZG4khpRzSoDYbyjBXYVp3
 /jfpYEFR3xh8Sel7BbrTCkclOrjwVAzXl87NhPN2PyXEE1DzXH+npmJyjX1g
X-Google-Smtp-Source: AGHT+IEbxWJ1WJIinUgB9TLbtZKKjL/a/q1qU69NUc4PcpV7G+pwpI4y4u4ppMVdjowARd1S6T21TA==
X-Received: by 2002:a05:600c:45c3:b0:414:7b3b:ca7c with SMTP id
 s3-20020a05600c45c300b004147b3bca7cmr4937507wmo.14.1712506422566; 
 Sun, 07 Apr 2024 09:13:42 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 t12-20020a05600c450c00b004161bffa48csm10311733wmo.40.2024.04.07.09.13.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 09:13:42 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 18:13:39 +0200
Message-ID: <20240407161339.2439456-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712506422; x=1713111222; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xRvlWSOeGh+4UvzQhb/17ZU2hDry2/QFw7N+td3v/sY=;
 b=WEUyGzONb8m7y+RZMQhUQKnYdKM2kYq9ydHAL7IZGQ0RI4uX74MSpP9HwEJQSR/pEB
 G8g6GurPTUch5XBc1IkT+S6+YMapfoQOy/lAfpLqGrF7qm64c212hrTBdXW5s528N33d
 ilX378+ZBdppfkreCcUEIKNRQu3TCyP58RVFwcOi/kfaDMILNOBedC17tDQPSIelpw+p
 R2/tQgLgd8KSk5tEazhuM5aajzni6dqaNokXpxF4giSCjlyLnXW4YeWaA3QZsCwSYHB7
 N9/X+r+PGQF3DnZk3Cm4ynZ3vc1kTzys2VjjWNO+Q3yzVsF7boHFqtpP+HsfMASn4GdF
 WI4g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WEUyGzON
Subject: [Buildroot] [PATCH 1/1] package/clamav: fix CLAMAV_LIBS
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CLAMAV_LIBS is ignored since bump to version 1.0.1 and switch to
cmake build system in commit 203725a46bc6b61ed7e4fdb3d76f62327d3e47fa
resulting in the following build failure:

/home/buildroot/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-musleabihf/12.3.0/../../../../arm-buildroot-linux-musleabihf/bin/ld: CMakeFiles/clamonacc.dir/inotif/hash.c.o: in function `onas_ht_add_hierarchy':
hash.c:(.text+0xa84): undefined reference to `fts_open'

Fixes: 203725a46bc6b61ed7e4fdb3d76f62327d3e47fa
 - http://autobuild.buildroot.org/results/fe71ab29d02caeed609f1a181fccbd46b6feff65

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/clamav/clamav.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 7c6dfce6f2..c548897c37 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -45,9 +45,8 @@ CLAMAV_DEPENDENCIES += musl-fts
 CLAMAV_LIBS += -lfts
 endif
 
-CLAMAV_CONF_ENV += LIBS="$(CLAMAV_LIBS)"
-
 CLAMAV_CONF_OPTS = \
+	-DCMAKE_EXE_LINKER_FLAGS="$(CLAMAV_LIBS)" \
 	-DCMAKE_SKIP_INSTALL_RPATH=ON \
 	-DENABLE_JSON_SHARED=ON \
 	-DENABLE_MAN_PAGES=OFF \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
