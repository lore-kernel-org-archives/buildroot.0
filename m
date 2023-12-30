Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07575C4706F
	for <buildroot@archiver.kernel.org>; Sat, 30 Dec 2023 17:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9200D8143C;
	Sat, 30 Dec 2023 17:08:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9200D8143C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lelPSPw9RbvB; Sat, 30 Dec 2023 17:08:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0760681324;
	Sat, 30 Dec 2023 17:08:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0760681324
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3553E1BF40B
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 17:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0CE9440907
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 17:08:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CE9440907
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Sw6nFHphIYR for <buildroot@lists.busybox.net>;
 Sat, 30 Dec 2023 17:08:26 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EF7A9408FF
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 17:08:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF7A9408FF
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40d5b7b8adfso20699205e9.0
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 09:08:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703956103; x=1704560903;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FcCg8ptf6JGcY/jCzgETVdBhf7AsyD1dhwvna7djUR0=;
 b=Uy13IVnvjM87/dk35p/Gt5TqPCJUUqCqEUr1Jfl9HF2NIoMbxPnzj7qwGRpPeT19vf
 lKoRNVtHKdNOf4/MCKOYF0najGS7YD7+jEw2uLySKqdyQU58SyOg8YSge8znBtxiYbRI
 /jn5sJ5jTrsdoSOabtL/apiWRvIaDKCCr179HkRisZr2un7GhBa9ly0qB8qTg+VnKV3W
 Zw3Wp+pqscEhUEi7Wew3s8srLTEFiq16lJ17aR9c+ISa1jWfBqxZkAMynABWGgAW4cfP
 b/QKoK/lZQgNAGUVh2ulGn2PyyEdCMGghcRUyE5F3hSSg4ACO0l4U1wxAfWjath+SLw9
 pO0A==
X-Gm-Message-State: AOJu0YxJlq8xMScD3UmlJhYsP06EW69SGc55UdU1WF4vehNTMpbgKYba
 ICuDE6r0MsmXrNygfzfqO1vI88SnZlo=
X-Google-Smtp-Source: AGHT+IFz1D5o+39xBNnlkz8Gw0zLqfEYufkm1fidURiWqP04kYQGckbpA+WG4UwifLNqrlXVh2UGng==
X-Received: by 2002:a05:600c:6019:b0:40d:70cb:d831 with SMTP id
 az25-20020a05600c601900b0040d70cbd831mr1825432wmb.82.1703956103201; 
 Sat, 30 Dec 2023 09:08:23 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 h15-20020a05600c314f00b0040d5f466deesm12604198wmo.38.2023.12.30.09.08.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Dec 2023 09:08:22 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Dec 2023 18:06:33 +0100
Message-ID: <20231230170633.895947-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703956103; x=1704560903; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FcCg8ptf6JGcY/jCzgETVdBhf7AsyD1dhwvna7djUR0=;
 b=YBxkr2Wpk75aJW5cOPon+TNGdWRQEE1BOOljMd2lzaF5pJol3bTFLum+WFho32N8+1
 tV9Fxw2g2jJvSltQRB1KY0KeGi7aJkFpuXKRsaPZIJ6fg0SRmTLiNMjTiF3vV7uu1BZJ
 dzBqgnlC6Psx9IUUvwOUIlpw9OrPA6XYQw3e6x3RX8KePDksSU7SmkzXakLgSzv2as8/
 u6QCB6jJQMv1pXU4Gtb9b14KIkzPJaefwxsALbWQNztSEip6RsME4wyvkn+kEm/xv4Se
 RooCkUHDP593MI+0y6W9BMyQmQaLkwqQ2lD6Er8crUphTxCmSUDksEyQzI5Eck2CkIj9
 W8Ag==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YBxkr2Wp
Subject: [Buildroot] [PATCH 1/1] package/dump1090: bump to version 9.0
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

https://github.com/flightaware/dump1090/compare/v8.2...v9.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dump1090/dump1090.hash | 2 +-
 package/dump1090/dump1090.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dump1090/dump1090.hash b/package/dump1090/dump1090.hash
index 8a4c3a4818..a493e76560 100644
--- a/package/dump1090/dump1090.hash
+++ b/package/dump1090/dump1090.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1ab8a5acd891bdbba586e2e9f2d9b056210940bd47b5c1a19d133eb091f31555  dump1090-8.2.tar.gz
+sha256  6190622c3625713ec9cff882a9d6f6a51b6d2f83ef20e6e1905a3902c7b08483  dump1090-9.0.tar.gz
 sha256  804f68c803eb5c127c53ad17c4f4e5033ef158e514bb76950dc7b1773f9ce4b0  LICENSE
diff --git a/package/dump1090/dump1090.mk b/package/dump1090/dump1090.mk
index 60ef4a9bcb..e06babb082 100644
--- a/package/dump1090/dump1090.mk
+++ b/package/dump1090/dump1090.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DUMP1090_VERSION = 8.2
+DUMP1090_VERSION = 9.0
 DUMP1090_SITE = $(call github,flightaware,dump1090,v$(DUMP1090_VERSION))
 DUMP1090_LICENSE = GPL-2.0+
 DUMP1090_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
