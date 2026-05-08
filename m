Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82554CD3436
	for <buildroot@archiver.kernel.org>; Fri,  8 May 2026 08:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3707E419AB;
	Fri,  8 May 2026 08:10:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id blRp840RtN2g; Fri,  8 May 2026 08:10:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F1FC41744
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778227823;
	bh=CtH9QoBWnWbhFjNtEUnnuGZhcpvXEOwv9Up49AsNMjI=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pSCidZlFk6KIks88KmY9uhnI46RMQYhXRKZWHBPoebQD/LTm8tSLgXZpIv53esvHF
	 HMxepcwh7zCkSLCEArIVOc7p1cnegT83AagniFA4EfkO8uItAL0igMU755cw10ipgo
	 Hm+QfkPSI7RjOZ99HozQ6c6GBVhETw6UqmDT2U1p3biC/Hi2WJPeT6CVVCS3H/wpwd
	 O8uEEpD4iUxK3ZF2INI8TLnCZogVqNmp/c3Icmk5e3l1KVWLEsy76mhCczY/JzchMT
	 k4Ufm/D/XmqZ+w+zAPPE6wEOibgHJsta4rLw8sxHBPlhxe9vOJspzKeUxrnE+qihyZ
	 YxAZwVIVEaMyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F1FC41744;
	Fri,  8 May 2026 08:10:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 05678358
 for <buildroot@buildroot.org>; Fri,  8 May 2026 08:10:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF3C040C56
 for <buildroot@buildroot.org>; Fri,  8 May 2026 08:10:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qbnyGmoNeDF9 for <buildroot@buildroot.org>;
 Fri,  8 May 2026 08:10:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1411940506
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1411940506
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1411940506
 for <buildroot@buildroot.org>; Fri,  8 May 2026 08:10:20 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2b45cb89f7eso11451415ad.0
 for <buildroot@buildroot.org>; Fri, 08 May 2026 01:10:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778227820; x=1778832620;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z7j5cr5cmK7t1xblRcGbYjO4qO4nbAUr1eVZzv8gpQc=;
 b=Qk/T6c8R0y7hKTf8aXiIZnPHK6jJ+cIdZjdakjDwsCuA9kI4mo414X+h6kF6KSntbP
 H0uPH1YiHVXoMMBd/XM0Ps0/G4vvOzaRwiM1cJdespFhu8LSj+8tGZudZFsysT2cU7mJ
 oZZ6BCJGhzGu14suUplzEwynakxYNAdilCUW3aBFUAtmjoMTY0TrFJjKXhvEaatkQzuv
 YnZNe1BATPOxkn3Ph+Z9tAqpIrGdZri+5biFqKJDmVHpqC8h9qkvixf56Bl+TfEAhp2Q
 0yOopK7fyRelKA2ETnC0hRj2KLVoPkk9zHeqipFLHQgRzek6Ppp3aAdIGkGiYNdluqdb
 GCjw==
X-Gm-Message-State: AOJu0Yyq30fQMGmsjZH8ugIer1IXXL+jIEqj0y3CAhEbNTpFfbSoqCg+
 5SndIeqU0gxyd/M+XF3vufB8qpGPHgAqMMfegEfav/RfuJpayYbgf9z1/MJPZmOr
X-Gm-Gg: Acq92OEIE5RPyd8/S+95oPOYdTd1fzws6Teob6P/1NTsLFKaW47BFAnJhF84jFq8UPa
 5FIWwZdV3+MCl0jbvffSWmFE50iQuO+jm+gU2JgB1Ro2H7G2k7BMHIj5diY0SYY/VM2bONo93uh
 keNPLvSQvqLsn1Akehbkz9dLr7aZ3VcKHYq4z9Gub6vqvLPAY9MbZE0+iK+pnjyTolvRjApvZuq
 elIgWeulRzqT6/xEq/sop5hw5S0bQXwwYqdmzlYOhtEzrSSvUoyWVEA4kkP/8u/g3IOso1cYn74
 4t3EOPeeIvpwu4SJAI62YJFaVs/EcXBHJQS8HaD1vOSDvyMwUvJ8sfwjpDS+VEOA5wGn2NhGBG/
 lfrw/pSct8MNiHee6AmxtM0OBis41TGn4yrojGDLjuzXPUlDOt+c6/8QUl+BGh8tK1EczIUb2xr
 7cnZ2eqGSI/Oic7ZnWc0rfZkYB+yknt2lDEdSwq0qKHnivhRltEmey4rKsYw==
X-Received: by 2002:a17:902:cec8:b0:2b2:57df:264d with SMTP id
 d9443c01a7336-2ba794b969emr123204295ad.33.1778227819429; 
 Fri, 08 May 2026 01:10:19 -0700 (PDT)
Received: from fedora.taildae27b.ts.net
 ([2409:40e5:116d:5714:b897:b3fc:b3f:3166])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2baf1e6199csm17766425ad.55.2026.05.08.01.10.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2026 01:10:18 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Fri,  8 May 2026 13:40:07 +0530
Message-ID: <20260508081010.250838-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778227820; x=1778832620; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=z7j5cr5cmK7t1xblRcGbYjO4qO4nbAUr1eVZzv8gpQc=;
 b=jRps+sohg628WGGb7xA+fLwZPv1eYjz4VSH/MgSk6lt2E83CqF41Oy/gIlECUek/Cp
 cJPQNLCM894SPdfTniCRg2MmNiuI+jJnKV7CAPmg0IMXjBY/1fq9AioytFxH3VN5yW76
 j40mEMWMkMxnpdba4+bPetHoTOZumrFwoAlIOYNYuwt7eMft9P73UKzdFR5NrTvg5s5K
 mhun+Xdwh3+STaf4mjb3gszOpJOKb9r02BIfdJG8A5gk1RdX+O4JRYkzA+7ieR+QWrW4
 WRbGojVtppIPvGemX+PpCp8VoccjO/0Atbt3iSNvYX7FqbFwQuLyT1YbyzrBwKShu3GL
 HQMA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=jRps+soh
Subject: [Buildroot] [PATCH 1/2] package/htop: bump to version 3.5.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch updates htop from version 3.5.0 to 3.5.1, a minor bugfix
release.

Key changes in this update:

- Bumped version from 3.5.0 to 3.5.1
- Updated hash from upstream source

Changelog:
https://github.com/htop-dev/htop/releases/tag/3.5.1

Builds Tested Using:
- utils/test-pkg -a -p htop

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 package/htop/htop.hash | 4 ++--
 package/htop/htop.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/htop/htop.hash b/package/htop/htop.hash
index f452d57a88..3d015c6a9d 100644
--- a/package/htop/htop.hash
+++ b/package/htop/htop.hash
@@ -1,5 +1,5 @@
-# From https://github.com/htop-dev/htop/releases/download/3.5.0/htop-3.5.0.tar.xz.sha256
-sha256  b6586e405c5223ebe5ac7828df21edad45cbf90288088bd1b18ad8fa700ffa05  htop-3.5.0.tar.xz
+# From https://github.com/htop-dev/htop/releases/download/3.5.1/htop-3.5.1.tar.xz.sha256
+sha256  526cecd62870aa8d14d2a79a35ea197e4e2b5317d275b567cee0574b2ddb2e9a  htop-3.5.1.tar.xz
 
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index 2b99637366..f42d7bee36 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HTOP_VERSION = 3.5.0
+HTOP_VERSION = 3.5.1
 HTOP_SOURCE = htop-$(HTOP_VERSION).tar.xz
 HTOP_SITE = https://github.com/htop-dev/htop/releases/download/$(HTOP_VERSION)
 HTOP_DEPENDENCIES = ncurses
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
