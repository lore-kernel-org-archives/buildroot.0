Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D5AC369AB
	for <buildroot@archiver.kernel.org>; Fri, 25 Apr 2025 00:42:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34A3E40D86;
	Fri, 25 Apr 2025 00:42:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pI-QAlAuUsDC; Fri, 25 Apr 2025 00:42:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38B7340B9E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38B7340B9E;
	Fri, 25 Apr 2025 00:42:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 633FE159
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 00:42:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 493298143D
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 00:42:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dhdIbznvbJag for <buildroot@buildroot.org>;
 Fri, 25 Apr 2025 00:42:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 157DF8143B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 157DF8143B
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 157DF8143B
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 00:42:48 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-85e15dc8035so57159239f.0
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 17:42:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745541767; x=1746146567;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xCD5ixFp73Kp9HG/PrJ5MB6gVBZf2FMHst8QcuzMxZA=;
 b=r2vKIIOS1bq6LpJHJW7Ee2A+4fBDZ/cWDtLn3BxcEoXulrW491Vm21xYFQQFUBiO2G
 PBwkHvT6W7Vg1ofEwpUg1fGUwW175fKvoiWpL5z/ub+thDGDgfofO7JKPWJSp4GcFJcU
 5+2sCcFroEyZZ8avp9eDm86IQSWEE1BJcK5Kb6J1uYjU3ezxTydhs0c6rWz3ClvFwx/g
 Gc2sEZyOknkebdPzeELX08Tgc3zcQ1j/rx/FrqPEkOqUrw7ugjjUXsoefefVhdQZGfld
 Y/+XkTsK7hp7IupUKUR8JN1ANLjWsNObz9R/6KDcEJvAtvMjbTHO5NLKM+ytf79w3i4Z
 HvjA==
X-Gm-Message-State: AOJu0Yx+tT2iclZqp0fIAjul4NOpvdIzw/L37NQNwRpL/bpUcCz2NEYY
 0Bps7hGHIhM7PX/7/aclT/loS1fZTL/cjAm4x7eIs10mz31gCF8qtveyegmD
X-Gm-Gg: ASbGncuXMGFGMGXoymiRRmnpPdBNQG11pMs7svbWNDb0sRXfnmQgCcdwAGIsrk2L5Qa
 47w626En74+fmoK2p29I9sXyopCcm1d7/HlyraBE4kzuqxyI9DRIZHEOg19JeBNg+v75jWPJKX7
 n9zL57jXfstO19gD2T7iKMd2H8UmYMtbC0rnnc4ZDsOKwHN0J27XP/ddKRq4vFourtDw6Qo7aKy
 Co6gc2xgPSxdfXC1tA5jGwdzlVi370VwHDyZVH1aE3yxRnRiS+9VABt/1F69dE+0ZNPyUKBk26k
 w0lH/CcyWfv0EAfX1k65YxYrrHLDRQY8oDaxnt3VM9bUyJuhdyNkQ16ugRCYrlRydU+DmRkhkh5
 Lql8mkOQBvnSmr6ivRb6Eo4bG1V7OYA==
X-Google-Smtp-Source: AGHT+IHqde+ZRLsdJ060wJJFVBVblQJmL0RhPgV2/agOXYNFrgz2Z51RYjpvKHCdGIDwE5wy+KBZQw==
X-Received: by 2002:a05:6602:6019:b0:85a:eecd:37b with SMTP id
 ca18e2360f4ac-8645cd58790mr42065439f.11.1745541766833; 
 Thu, 24 Apr 2025 17:42:46 -0700 (PDT)
Received: from james-x399.localdomain (71-218-120-130.hlrn.qwest.net.
 [71.218.120.130]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-864519cbfbdsm36521739f.38.2025.04.24.17.42.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 17:42:46 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 24 Apr 2025 18:42:43 -0600
Message-Id: <20250425004243.218301-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745541767; x=1746146567; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xCD5ixFp73Kp9HG/PrJ5MB6gVBZf2FMHst8QcuzMxZA=;
 b=XF/qwl55qSfAJb+Qyr1Orx+GVTizWOwZRrL1YooNuR+levQ9lGCK+ZLq/B6IGSZM+S
 OyuU3cXksIrTWT9GxRAQRFhJea7kofzre/I3bUFMfLiiX8gM9HG250LJ5+hpAT1A1xKs
 YuAW1iXpZelJId9R0F78zLVzNPxsWs+4LjJBnC6BNc91lokD4nDgX5NQIsYFx+m2NWnt
 o4lExuqsiBHyE0ZmgDpFAAqe+PlFwuFjKZQ23jMgJ+eFdYKnu98LGoLAwFCUMo+8j8N3
 2QYCkX/MIxB2tCR4kwV04/4iVQDAzYAV1veCeJ8BaKk9RyWtEsDxt7ISBoPuur6vbKPg
 0bxw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=XF/qwl55
Subject: [Buildroot] [PATCH 1/1] package/libubootenv: bump to version 0.3.6
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/libubootenv/libubootenv.hash | 2 +-
 package/libubootenv/libubootenv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libubootenv/libubootenv.hash b/package/libubootenv/libubootenv.hash
index 887ad6843d..986b651e42 100644
--- a/package/libubootenv/libubootenv.hash
+++ b/package/libubootenv/libubootenv.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  dc27ddcb377e259d898256e90449bc3128437660cacc33dc75f6630d3e52c44e  libubootenv-0.3.5.tar.gz
+sha256  7946006781ad518aac1f06e2ad7e0281e4ece3d59e9616cccb01fd0c169a3e0b  libubootenv-0.3.6.tar.gz
 sha256  0558101984550fa84d1d13c2af11d116c20079d2be58711e8d99cadce7009192  LICENSES/CC0-1.0.txt
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSES/LGPL-2.1-or-later.txt
 sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  LICENSES/MIT.txt
diff --git a/package/libubootenv/libubootenv.mk b/package/libubootenv/libubootenv.mk
index e5f5e9b15a..5c2c36e90b 100644
--- a/package/libubootenv/libubootenv.mk
+++ b/package/libubootenv/libubootenv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUBOOTENV_VERSION = 0.3.5
+LIBUBOOTENV_VERSION = 0.3.6
 LIBUBOOTENV_SITE = $(call github,sbabic,libubootenv,v$(LIBUBOOTENV_VERSION))
 LIBUBOOTENV_LICENSE = LGPL-2.1+, MIT, CC0-1.0
 LIBUBOOTENV_LICENSE_FILES = LICENSES/CC0-1.0.txt \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
