Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D26B0EDF020
	for <buildroot@archiver.kernel.org>; Thu, 12 Feb 2026 02:59:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 491F541CD4;
	Thu, 12 Feb 2026 02:59:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j7b0zrDMglzG; Thu, 12 Feb 2026 02:59:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DDA141CC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770865141;
	bh=eg8l9XlKVX+Qc8/bzL08HssZRKHASTbnuKkumOKD3X0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HKJgG9Ge5pdlEyigcpZUhfMVZaWFXO59KNlLhx3DQ1gxKtEJ+C9VbT5LnGlqLj9Py
	 k6EOs3YwJRPsLagXbMhCdNE+S0xR9gUXd50h9KVqBxz+/Dn1+BcRTyjGLU8tAsU4Uh
	 E1KAkwOGFR5QXl8waND/BsXVgoiWa6cQshMKqcobcyJgGPFhHMlOBJc1n5+VFLCRNt
	 8lm7JT/gfpRYkLLi2dOpALX+hTdVwrxqptos+8U/lLhZogtHrFyi8d5cHqkSpmIYp4
	 fs/ToB9ZOg/OFsMfei6FB6RkmdEUF5aFKoA+LMoKTm9DdT3z8V7DnFWj4SWjq0kDai
	 SXU2XvtZw5Guw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DDA141CC1;
	Thu, 12 Feb 2026 02:59:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 257AF1F6
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 02:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F83740061
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 02:59:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ufb2cY7UTfe4 for <buildroot@buildroot.org>;
 Thu, 12 Feb 2026 02:58:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com;
 envelope-from=alistair23@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7FB3B4004D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7FB3B4004D
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7FB3B4004D
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 02:58:59 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-8249aca0affso745418b3a.3
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 18:58:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770865138; x=1771469938;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wz8az1WfEGhJvwYG4dmJb2OKWc6c/qZzF/0BDvU9ePU=;
 b=xNRkFnc+CWUcK1xKU1vJdCkQ18Eg8xQxJGgDMPJpPveyNHKlCirC4uyKjxLrZwqD0Y
 UmCcB/A067lyVQQLNZZLeyQZHtu688ycVk6oYNEFtw7lDOvi8j7kicr1m4f6cBoI4cj5
 2+SDULuv9AT/nOmsj3CHqYdMM4Vp1S6nILU6PA2M0BkSdUQ3EK87xS94GUQHQnuxyg5A
 UIEXuLUuTQWda6NfGhp3G6/WvcIlmapnNpqfXrquPkJQo7D3IFCHYtL1K7Hj3LfapfYH
 IKM7EUvGmlSt4Wo5qojhKyH5aE1A3IEtaiTQMOVl50h13uvyw+CTwgWXsAjRauk2dXus
 d6fg==
X-Gm-Message-State: AOJu0YxjmfA2vBUHbrmXDkJ4xEf3r5vARA648zY617CUqUJb13fYgHwI
 YlH4lOrW+vuaa5UjK5LQ+jcfYKhzwHVqifVgQgCLTmLAO/kHluAuuYav8YR4wLKGgbg=
X-Gm-Gg: AZuq6aL5S/VoCld+FhSTv8B8/OFzIzYxe5en9HmyQdtrR079xV/Uj5M2rOT598Pg1Iy
 Hk6xmtcUzADkvpJjREVlOsXQ/NeJzSwwdK9V2vNdCBvcE6Mu3diYNdBl22bX1XxbQUlrbFZGvx3
 7Z9ObXjr23B4GGVekyhTHeDrqvWaGUhBm8QfkcTL5UsNjE/7pZwV3skmltE5jGA/I1Fo49ufPrV
 b12HU8yWHvK0ChR/L4Js0UmU7hrAtmiOMKCkmnbtou5e8dj3kOOshoqzAU4Ce/tyWpRZMNaFv81
 pwkO11+BadADwc91AimrZ/MvoFpkGOPnV+NL5vWMCi0LbVsDaeSZAC9NDeXIXpKnlKDNpTlfzxN
 gjEu6h0SyE4Xz2zBwCmKMz/dZlo6XJbuweTzLlNniXD5KF7PNXqYBxaFjfr8fXr6aKwvMVdaGkS
 Go3xZq8vdq1Ah9a87ZY2HWKZhnHn4E1TRinPhlKodzow==
X-Received: by 2002:a05:6a00:1142:b0:81e:ef16:b288 with SMTP id
 d2e1a72fcca58-824b043292dmr1200412b3a.22.1770865138194; 
 Wed, 11 Feb 2026 18:58:58 -0800 (PST)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:6209:4521:6813:45b7])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8249e841d7bsm3396434b3a.54.2026.02.11.18.58.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Feb 2026 18:58:57 -0800 (PST)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: buildroot@buildroot.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Date: Thu, 12 Feb 2026 12:58:45 +1000
Message-ID: <20260212025845.207257-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770865138; x=1771469938; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Wz8az1WfEGhJvwYG4dmJb2OKWc6c/qZzF/0BDvU9ePU=;
 b=Q3dxOF5Nn9g8DJGuEfUfpxCNZwgKaUWAgKUQn6Ypyi+mF01jfYlFp4oqrQCNSbXCSe
 h4LBTkqZa8yj1lt4tgzR54rZrulsEAGCIfk9ux1tME/AibKrVmgA4McisHB3vgraqnG+
 mMHwthd5GHw0+XjDMwzNqZqVTLRisH9kM+GQJq1o66eF+Wu89l3kLZyxDZwwfQEaGINi
 XNMBI1+m9ObB8BRfS5577DZ8G3bzHVrXWxSZKd/X8j1FKMeAMGWrHtk5tn8LSU/3/KV9
 hcPKbJH4TtRA5zyb48eWtTD82x+o0V0WImHw+QCRJxjqHgzrhNOqoSuZWcXN6ROW74Bn
 Xt9w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Q3dxOF5N
Subject: [Buildroot] [PATCH] package/libspdm: bump version to 3.8.1
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

From: Alistair Francis <alistair.francis@wdc.com>

Fixes two issues:

 * Unaligned memory access in VENDOR_DEFINED_* : #3196
 * Build failure when mutual authentication is disabled : #3178

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 package/libspdm/libspdm.hash | 2 +-
 package/libspdm/libspdm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libspdm/libspdm.hash b/package/libspdm/libspdm.hash
index 86358dad62..1c7b6b3158 100644
--- a/package/libspdm/libspdm.hash
+++ b/package/libspdm/libspdm.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e7aefb9bc546bbd3ff10d707a6f05213cfb2e679354438ea0d1b5c483b5daa85  libspdm-3.8.0.tar.gz
+sha256  2184a586bfe030218c6f336750d0fb0c3747fcfb0ed8af9a921bccb567029671  libspdm-3.8.1.tar.gz
 sha256  8c891ecf439cca84ceab33fc819c029a72c198f31818aa53a3788a0553841d6e  LICENSE.md
diff --git a/package/libspdm/libspdm.mk b/package/libspdm/libspdm.mk
index 4d29429811..f76262c77b 100644
--- a/package/libspdm/libspdm.mk
+++ b/package/libspdm/libspdm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSPDM_VERSION = 3.8.0
+LIBSPDM_VERSION = 3.8.1
 LIBSPDM_SITE = $(call github,DMTF,libspdm,$(LIBSPDM_VERSION))
 LIBSPDM_LICENSE = BSD-3-Clause
 LIBSPDM_LICENSE_FILES = LICENSE.md
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
