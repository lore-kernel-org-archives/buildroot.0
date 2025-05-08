Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8247BC3ABCD
	for <buildroot@archiver.kernel.org>; Thu,  8 May 2025 04:29:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EE2640E57;
	Thu,  8 May 2025 04:29:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GdF0JJxkloNH; Thu,  8 May 2025 04:29:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53A5041197
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53A5041197;
	Thu,  8 May 2025 04:29:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A71B439
 for <buildroot@buildroot.org>; Thu,  8 May 2025 04:29:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B9B381F0E
 for <buildroot@buildroot.org>; Thu,  8 May 2025 04:29:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gZK4xdV0m4zP for <buildroot@buildroot.org>;
 Thu,  8 May 2025 04:29:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::531; helo=mail-pg1-x531.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5974981FD4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5974981FD4
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5974981FD4
 for <buildroot@buildroot.org>; Thu,  8 May 2025 04:29:21 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-af579e46b5dso299767a12.3
 for <buildroot@buildroot.org>; Wed, 07 May 2025 21:29:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746678560; x=1747283360;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oziGvWa949YnWFDbaVTZ7aT5YVq3hyl1GbnUfdLXk9s=;
 b=Lo+yo3cqIA4rs8lv7uDQjHZRLH0jGkCOwsL9L4Mbk81QwOYIi2Nih3dQHA4Dmp1ACS
 zMYIvspS+Bf8CCFS9iTxL1/otHzCa9jlxJlqKjaQ62cSN13n/joBqnBsQvR/sE46jJK0
 OicrMy8eFDsKXOeK7Npv5zBHy9ZlApFBRrxAJdb1Ufizy+gIZyd+FTWfsJGmYy0+LRuK
 uu/PM7kYgmnLga7LsKdyZHe8FHjyfrIP5VVAkz4roWgHky3g++WVjfnmE0NFoF8gFYnL
 gKqvp9Ags+1zBq/6EV6HYl5PMTfQUz/5nNMHs/TqgGqfATZWOHcVYYbw3nKklBpS9d9w
 Cr2g==
X-Gm-Message-State: AOJu0YyliWHqWntCqrxISVu8nK1HG70WHiXdV29SoOSwjTof3/hvS1c7
 jtHn+9b4BCm0gKXUrhE+sEVI2OpcvynIsZb5k5jElQmkstvD+oy3AH3KgSEL
X-Gm-Gg: ASbGncsjYhGt0ArOrIT4Qe+7NU/qCiOPNrSt6GpmxnG4MAGR+lRJd6yqI111R+kOgSS
 qzrNBpIyPfFCojaHrN1xZlEqhpCpdep1DfjxzPfzOCRPNPqn33uFHsB429yPkB++3aJVqElY98H
 CUO8u7LgFC5ubLXtN9+MxIKujqsvX9BkVbWdXCHY9yVWjsxVApDgLP9F26VGRp8HCmWuPM4GjII
 2fdx00G7oA6ampnwTPiLxjqA4taQtw0wY9psPzEOQicdWRmd2kMWqFNJ6Ri0Rf0n7rA+NLAoSt0
 UV0UOP0rSlmN4u4N8Kc4YM35Li/oc8TuDaDTDCAN4Tp9Vbhv4GUdSLGc1Pd28p+qRE2ZFeE/pXf
 olTfe4QrEY3IrAUTG0cZiIfWD3go=
X-Google-Smtp-Source: AGHT+IHPie93FqAkB71tNL/Cb4iGAbJ2skICa5Dvw3hRT2+8VVr3aMoKNlpnagpJVrkRUtmHsxiYsw==
X-Received: by 2002:a17:90b:3b41:b0:2ee:e317:69ab with SMTP id
 98e67ed59e1d1-30b18c3a51dmr2804628a91.0.1746678560071; 
 Wed, 07 May 2025 21:29:20 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30ad39d65f8sm1155142a91.0.2025.05.07.21.29.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 21:29:19 -0700 (PDT)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Cc: Kadambini Nema <kadambini.nema@gmail.com>
Date: Wed,  7 May 2025 21:29:11 -0700
Message-Id: <20250508042911.29426-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746678560; x=1747283360; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oziGvWa949YnWFDbaVTZ7aT5YVq3hyl1GbnUfdLXk9s=;
 b=KPLH6bDG4lVPLKHNm1Nx0EMgThast6lRlooN2nKY6dzDjtFRWPd9EIIJK/8CE1ai/b
 8XuhQBOq5ImU1ycUSSUI3peSXFM9gfWNxKyantKuQwOp7ZqyxXPIwm/sqUBioYEynj9s
 AuNoGJfQ5RhQ/5TMm1PeHDSV/tAIicL8J7LnMvvutIrRe3S01d5zh9GM+pRgqCom6RDE
 UKYasNORf3JRbjR6Szjz29KCoIBd+ZANg4uP8DL4bfh66KMtYcFaPA74/Hzuanbadj1q
 b8GthQveVvWR8hMVKidjgzuhydX7/9iXtv86HACVbbC6yoFvWgvjcYjH+cu2ykZp6naQ
 YOSw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=KPLH6bDG
Subject: [Buildroot] [PATCH 1/1] package/hwdata: bump version to 0.395
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

Release notes:
https://github.com/vcrhonek/hwdata/releases/tag/v0.395

Changelog:
https://github.com/vcrhonek/hwdata/compare/v0.394...v0.395

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/hwdata/hwdata.hash | 2 +-
 package/hwdata/hwdata.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hwdata/hwdata.hash b/package/hwdata/hwdata.hash
index eb4ecc191d..8eb0597a98 100644
--- a/package/hwdata/hwdata.hash
+++ b/package/hwdata/hwdata.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  b7c3fd7214a3b7c49d2661db127a712dc11cffd1799f793947aa1cb20aaf3298  hwdata-0.394.tar.gz
+sha256  1166f733c57afa82cfdad56e62ef044835fbc8c99ef65f033e6a5802716b5c66  hwdata-0.395.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  21d0406f93e884a050426ebc21931839a45d56bfcbcbfdda7686d583f36f107f  LICENSE
diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
index f47df2ebb8..4de227b650 100644
--- a/package/hwdata/hwdata.mk
+++ b/package/hwdata/hwdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HWDATA_VERSION = 0.394
+HWDATA_VERSION = 0.395
 HWDATA_SITE = $(call github,vcrhonek,hwdata,v$(HWDATA_VERSION))
 HWDATA_LICENSE = GPL-2.0+, BSD-3-Clause, XFree86 1.0
 HWDATA_LICENSE_FILES = COPYING LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
