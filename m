Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4595FF8875
	for <buildroot@archiver.kernel.org>; Wed, 29 Apr 2026 10:04:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72E366151D;
	Wed, 29 Apr 2026 10:04:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0n5BqhFMg1qY; Wed, 29 Apr 2026 10:04:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DF0761513
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777457050;
	bh=V/Vg0M74RfIfaw4nF/q0RVlncPHgY5AQcJMBw2B1f/Q=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=k2ganPXPyDG6ym26t0OYm3DeZwjLcIrKaSCTFTqdY0rUb0OcyYIGzpy+volRWchYl
	 V65rfV0Waz1fNxe5I1T9zBJ1aM5FB4Maoi6RX6085PZNfiwDe8J9aC/mXW2z1HI8mr
	 5PeMKO0YllL8V04GQcLIcl20B+9oe94Q3xp4zZ0IT1z4jb+D4QgyuE8qWDbgk1Gij+
	 qbTE5gat5L+m2F9HNo2XdR6dwf+h5k8uv9M3f0PzdntYYfYY9XUERvrvpxzx42ivXh
	 HZCBtK2gA1cjzTJzs8ZkWx2Jqm+PNOfmtHh/YG7cZoM9kBZeVgSE05AL4Wax7x5NJj
	 JPnq3TGCcmzEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DF0761513;
	Wed, 29 Apr 2026 10:04:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E8BA231
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 10:04:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 541AF84368
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 10:04:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zbI61q3coBfI for <buildroot@buildroot.org>;
 Wed, 29 Apr 2026 10:04:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BFAD184363
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFAD184363
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BFAD184363
 for <buildroot@busybox.net>; Wed, 29 Apr 2026 10:04:06 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-488e1a8ac40so150842055e9.2
 for <buildroot@busybox.net>; Wed, 29 Apr 2026 03:04:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777457044; x=1778061844;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OIeN9ZMfkok0feMOQah2J5/6KxF6MguQYr5BZUgHZHs=;
 b=tBPvzBRpVmdA0O9SRxH5NmWS/dQN8mNc7RAvKOqCHxcD3n25VG/sD+odTKRqGAzm8V
 64xIKvklUcuQ7eHubWdOINB0T68OxwTLkIvmiKg4/vOhpJj5tarqtOMB9SfMjT5j3In4
 qHh+FZRCcVAPUcT5gYlOjX8LjN29gE7BTgBUaDdyTK9IEexHqLIcT0mJedXBQ3zemYVX
 JV7COSk7Mjd+ca4J0tc1Ctv+IcCo4c1AJdkFcVQ0OCCZaSb+I8uHIkq2t1OMTM6JPD/R
 TbhEa5hyVPEOA8eOCvVnVL7v+hIyLygCrV5zj1wmFunVm1aEeIhDEjXPe2mfPtlfsT8o
 Qr7g==
X-Gm-Message-State: AOJu0YzBmH0LH0W42oWDmKaKGJz0lga4Ehdv+EDHN9kwdWNNETQoqpFT
 iKitKBWVFnee5lk2K6Is7W96fJiTgHvL0iBE4aYLPESlt1L+4g72yBXMExFtkZe0zeFtTT6qOAs
 xDyB3TKND
X-Gm-Gg: AeBDieuMDbbPhpQ9pRdxn5cteGgoyhXkJonv9iEtzID7FMm2kVxBRA6iYuTBX7tpdxi
 yfMicF3OREnKpEJvHuzMvBBhTjPinYDbkQkfYanJ36Wx3nGs4x7ZC9OLzFm0SEjPi8zTpyFcNRJ
 //vSjef9Co1A6bljPLcOAU46JHzoy2PnB4z4MJVOr087uQZNuNtpjLYx5YZLfdCB2+OwpFPXvMY
 1QM14MU8vQmV1fC3dcFgFnNM/QEptzrZmFvCOwRqMxU/gVCS+RjDoIcxzFjinOtRyI3a0uA3XJ2
 +CZhX/sXFHhXKTllOBSbknmZePhblGcMi7JyVccPsfT83NWW9uQSlGnBAQ4si92UzALMuZ6Wg+A
 0OSHgD2RaJfpBX1ci9zEdDofe/H740PcF8/9MxBHz3rBDh2L+5MjH4jsK7YNjvD60m2kOw+ppZ+
 QbLEQJfsFu/c1GjQoGshsxyvpZnX7I+je6MsURjKPR+Mvp1mQGuZ0u9sgSaDSd1HBKvZhnVE8=
X-Received: by 2002:a05:600c:4fcd:b0:485:7f02:afd5 with SMTP id
 5b1f17b1804b1-48a77aea3ddmr110196525e9.13.1777457042538; 
 Wed, 29 Apr 2026 03:04:02 -0700 (PDT)
Received: from vm-2404.. (222.186.66.37.rev.sfr.net. [37.66.186.222])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a7c5d2919sm42104745e9.15.2026.04.29.03.04.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2026 03:04:01 -0700 (PDT)
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad@gadz.org>
Date: Wed, 29 Apr 2026 12:03:56 +0200
Message-ID: <20260429100357.148986-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1777457044; x=1778061844; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OIeN9ZMfkok0feMOQah2J5/6KxF6MguQYr5BZUgHZHs=;
 b=Lxv03ePrZXMBy9ojPAGL4pAH6Kt8fepEYBgJdUDVhus3/LqrToOd4+znwoh+BzZ31N
 v9BbijpIUTWRXBOTV+tf1mwX7F6pBGUJQr9yWlDA4JhMijXH+Nf+ZIPGagHkheyAOmow
 mzm+JFrizIicDNClZGWWMfOOObP+3ROjBy81EV4x1uhBPzszVL/Z6iuMrs0fu6Hy2G/H
 LuVEdk/wWftnJJaojk1JFUejkvYw4+021KVXgHjIxzvSjQKkq6ZpXnSkTI0dxK411/+/
 hUVkDdePZVhF5nohFDwCgB/Sg32Ebii4b6f6q4zVq/BeCPVmvGBYTYJmYzSU/o7Zaznk
 vTpg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=Lxv03ePr
Subject: [Buildroot] [PATCH] package/lmdb: bump to version 0.9.35
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

for changes, see:
https://git.openldap.org/openldap/openldap/-/blob/LMDB_0.9.35/libraries/liblmdb/CHANGES?ref_type=tags

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lmdb/lmdb.hash | 2 +-
 package/lmdb/lmdb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lmdb/lmdb.hash b/package/lmdb/lmdb.hash
index 4b80953df..e0856136b 100644
--- a/package/lmdb/lmdb.hash
+++ b/package/lmdb/lmdb.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d19d52725800177b89d235161c0af8ae8b2932207e3c9eb87e95b61f1925206d  openldap-LMDB_0.9.33.tar.bz2
+sha256  98e28ab0a5c23fb2eb8ad12c12d7ad5fc5e4c3563f41d0b91e9420a075974d6f  openldap-LMDB_0.9.35.tar.bz2
 sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  libraries/liblmdb/LICENSE
diff --git a/package/lmdb/lmdb.mk b/package/lmdb/lmdb.mk
index e4f929c7f..2792c9300 100644
--- a/package/lmdb/lmdb.mk
+++ b/package/lmdb/lmdb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LMDB_VERSION = 0.9.33
+LMDB_VERSION = 0.9.35
 LMDB_SOURCE = openldap-LMDB_$(LMDB_VERSION).tar.bz2
 LMDB_SITE = https://git.openldap.org/openldap/openldap/-/archive/LMDB_$(LMDB_VERSION)
 LMDB_LICENSE = OLDAP-2.8
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
