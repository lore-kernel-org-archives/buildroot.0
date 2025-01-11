Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78970E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 12:59:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43A4883C29;
	Sat, 11 Jan 2025 12:59:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WXnFCLpEWk3M; Sat, 11 Jan 2025 12:59:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5840083C2A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5840083C2A;
	Sat, 11 Jan 2025 12:59:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 23644950
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 12:59:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 026B983C2B
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 12:59:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q0Vu3Y4npNti for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 12:59:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0D76E83C2A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D76E83C2A
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0D76E83C2A
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 12:59:34 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-844df397754so88403739f.2
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 04:59:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736600373; x=1737205173;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=juVxK2EApfRKDz9/Dhyi+myHKWaGXnVu/onyzzIxzwo=;
 b=NMwM1vCFVJYFtk6hMjcPDm7hTY62JGG1UcgtGWs+y5RwT/uN466zUkZEQmWGAI+QgK
 NCGD9oVN/v6cFtHFDbg+RZ2Yz62HZOc104iOVEVSlQoRGcm2x7Lh4oI3IcbsDsEYY7gb
 SqUspu/EBIU8t2cXNCPC+4JadsRlnqVJCGct+/4KF+smUII+x/LLg76ItB24wxgMECbz
 UFL+wmc9SsHUh54EsHKk5yIZY1j38MoKeRj78CAw51STq7Vvc/ZcKsGUSw6eZmjbbQLK
 e7srNUQAq9GUDgIjo99TZ0S4FlmdKEFmolEHljmjL1ULXbLf1tzAik2QsHWUNn6GzSSx
 M/Vw==
X-Gm-Message-State: AOJu0Yz6LzgfUu2yvlAnLnRFrrHuv/vs17DNDtPW+Ak6Mt15FpGjPFkP
 PlIKUEtb1owfL6rSa4hHLsRzdxon/lvU5zFIwHh0pSp+44Cd/TEhM5757sjAzpU=
X-Gm-Gg: ASbGncvvr0aBk9BDHuBP3a5/tUKdVFJ9ayk1WHRkq9ys8KF7+xqMB9tVNTY26dUuxL7
 7Ce7811kFucCI8EilmbAnlRajbsPTXr84fl6oRSosmdLR9dBpse99eYbQ/JAfycV7mZvltSEpA1
 u+8+rkEAUOG8eRe/59D+Ik2wTnKAFyZ8o7R8P1tzMlf1gFl/78pRUkDsZijC+lt321bwWDGBkCG
 hlIfpo4a4DYFKrfzhNVkIuO3RGoPe0WgtHAqA2b3sgghPmOSi8OftZKq7sV60IEp7ZYnOq85S7T
 WOBAyiMaWITPKL0Jt1trFCKjPOE1IOc=
X-Google-Smtp-Source: AGHT+IFzFvpdWemQ1yDd8PLvK36WX6zM02JU9QM1t4HeKBTBFAW77hGVDM64fsE9rLjBCJdVndMNiw==
X-Received: by 2002:a05:6e02:1fe1:b0:3a7:e7a9:8a78 with SMTP id
 e9e14a558f8ab-3ce3a9c1918mr92148835ab.17.1736600373354; 
 Sat, 11 Jan 2025 04:59:33 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3ce4ad93d39sm15688125ab.7.2025.01.11.04.59.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 04:59:32 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 05:59:31 -0700
Message-Id: <20250111125931.2456371-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736600373; x=1737205173; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=juVxK2EApfRKDz9/Dhyi+myHKWaGXnVu/onyzzIxzwo=;
 b=cz0Voykolry3zAKyP9dt7urIxsBMiWGz0aURH9p2+ZJIGU8IcRAz7bsOuGfymIAamX
 FmtVeMMm4rsx7HxKBM0Rb2QZ6szOfuC5Rsx1u3DOrOkIuMuXx7hbajhNzFn7BWUmXS/s
 Y2M7V2WGRwbKivH5dkI/XNSCymOiMJUs8ugpHYEDs6Dymko3VcQ+hm3favMTjg5JPcPS
 lmHfHIX34ZioJx9YR/fiilKHxv63zi6aIW5DmXuHeTPaypWVXCokdhKLFLijUYdfx5gH
 GPK250blL8PUeKoYQb2N1H0Pwee9+ERNyasn6H5goBZXqqXf8gaE4+bAoVYEDKZsLfae
 Ul3w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cz0Voyko
Subject: [Buildroot] [PATCH 1/1] package/python-lmdb: bump to version 1.6.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-lmdb/python-lmdb.hash | 4 ++--
 package/python-lmdb/python-lmdb.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-lmdb/python-lmdb.hash b/package/python-lmdb/python-lmdb.hash
index 064c76fb58..f729c197f8 100644
--- a/package/python-lmdb/python-lmdb.hash
+++ b/package/python-lmdb/python-lmdb.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/lmdb/json
-md5  bdd78148e8374cb0001af06cc64bfefb  lmdb-1.5.1.tar.gz
-sha256  717c255827d331e02f7242b44051aa06466c90f6d732ecb07b31edfb1e06c67a  lmdb-1.5.1.tar.gz
+md5  f9d67b42a6d708ec1cfc860f67e20387  lmdb-1.6.2.tar.gz
+sha256  d28e3fa59935ff688858760ec52f202ecb8c1089a3f68d1f162ea3078d151e73  lmdb-1.6.2.tar.gz
 # Locally computed sha256 checksums
 sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
diff --git a/package/python-lmdb/python-lmdb.mk b/package/python-lmdb/python-lmdb.mk
index 7105fd1464..1648ed7054 100644
--- a/package/python-lmdb/python-lmdb.mk
+++ b/package/python-lmdb/python-lmdb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_LMDB_VERSION = 1.5.1
+PYTHON_LMDB_VERSION = 1.6.2
 PYTHON_LMDB_SOURCE = lmdb-$(PYTHON_LMDB_VERSION).tar.gz
-PYTHON_LMDB_SITE = https://files.pythonhosted.org/packages/67/2c/0cc9375341121ca1f4b31a2137f955dc24550e095d733c9b42ea94113ba1
+PYTHON_LMDB_SITE = https://files.pythonhosted.org/packages/71/54/fb1d5918406a72fcf46fbfaece7c0349d88cd8685f5443a142ddd7dac05b
 PYTHON_LMDB_LICENSE = OLDAP-2.8
 PYTHON_LMDB_LICENSE_FILES = LICENSE
 PYTHON_LMDB_CPE_ID_VENDOR = py-lmdb_project
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
