Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8985CCA0EEB
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 03:59:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EEBF40635;
	Tue, 19 Aug 2025 03:59:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xMigEqRQyKOp; Tue, 19 Aug 2025 03:59:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E33340643
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E33340643;
	Tue, 19 Aug 2025 03:59:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CAE5E2
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 03:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0EB3340635
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 03:59:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F-TYWGtGYz8a for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 03:59:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com;
 envelope-from=daniel.crowe@maxmine.com.au; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 002384062D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 002384062D
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 002384062D
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 03:59:51 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2430c5b1b32so36004685ad.1
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 20:59:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755575991; x=1756180791;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s1pPhLv0QZvJafDuvXxbn2n1pKLVtg+PeZnyqeBctSo=;
 b=fTNWLGEftYXF2Kvrs2PtZL1f3WMd4q5kPtijAaPTzumjMDE4JVK+62HPp+pnZQJr20
 iqlfQpVg2gZwfPRAxkiX5Ltdvwa1qmzuGHO2qsUL6MTYOk4g14vE9wD21Hyx3exTuM0L
 8v3g3zpoNKz75bjCBG9YCWUbcjKq/tefatDuwQkQVCs4tAVsHDIJGccKmfOt4OykOtzE
 Vu0ENQlJJmNC/3Tj8e9IHX7o8LEv6omrFyxQlSNIcm2vFbJsLP5EkB52pP1lioLdp2D0
 B0pDPzC+nP0Kxvcuji6PDxQOuhiNUua2lXRyvFhgmWDK4IRlad/AJaRhUey3zb+alv+x
 Z/0A==
X-Gm-Message-State: AOJu0Yw0DXT8KVzVlm62r1fWJ0EyKgLD12x/edMN7qCdg9GwTaRT8bao
 8DCbiWi6+Q+idBAWJDEbJMG+1EMkD0FhjbRsWO9ATzloRsbeHM0EkBB5N4A5px8fxyYjOTt7f8/
 HCGYTDeU=
X-Gm-Gg: ASbGncvL0wIY7R5YAxWjXFS6ONlDseGvUIWD34uybFJ9L9GmyY8hFLVhJCjv/CdwWEj
 rqlDs4LGJwMaDYjMma08OQVVcdctJvvJVMc1kyOWMuhfPqs5fTsLXaM70S+iA8Qr03XXjMKDmsf
 1wulyZbriRaN+4H5w0PCXpkRlfShPM8irn+8LeKH2Pto5fqfRQszIwsnK8vgPCPGxHARr/8b18a
 2i6Ww7y+lhrassRsL8AA2giwXEMaU+is4krq9jbkevDFXhGbLwNhkX2tAsEr2eR+r9/BfEgnSz6
 u5FknGB9EXDTWGpbfprS8kjZ9pDWK19CDBdmfImFhZQNHjX7WSHUPnXfME/nL65FfJ0QNrkbqY1
 m/RfYE+XS3VmXlbdbd7UuV5lB4oYdoP8LDLzhWnWbOSIF3szM4MYdlwr4dU7l2QGX3FHvsPY=
X-Google-Smtp-Source: AGHT+IHLuLnqe72tAONE4nP5hD7CTzKfJtIp0yhalL/HX4t9yoTKrzkHwnK71ujU8Tk4J2MdpkTanw==
X-Received: by 2002:a17:903:1112:b0:240:ac96:e054 with SMTP id
 d9443c01a7336-245e0f49e17mr9951285ad.23.1755575990739; 
 Mon, 18 Aug 2025 20:59:50 -0700 (PDT)
Received: from res-0346.adl.internal.resolution.systems ([103.211.209.15])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2446ca9d016sm93609675ad.35.2025.08.18.20.59.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Aug 2025 20:59:50 -0700 (PDT)
From: Daniel Crowe <daniel.crowe@maxmine.com.au>
To: buildroot@buildroot.org
Date: Tue, 19 Aug 2025 13:29:30 +0930
Message-ID: <20250819035930.3666816-1-daniel.crowe@maxmine.com.au>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maxmine-com-au.20230601.gappssmtp.com; s=20230601; t=1755575991; x=1756180791;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=s1pPhLv0QZvJafDuvXxbn2n1pKLVtg+PeZnyqeBctSo=;
 b=eV838KXKnKlaPIX9FwOa8t8pGGMoQC8vEQ4BLUuYd1tJLDdrrBYyhW/T+wQOa8esuP
 Q+l2O5NCoF+7pQrpUlZXlt4ohxdOWqZR/AQ6y2N2nS4Yb9Jk3LT9onSv1RVnkOTUQTId
 0K6/y+w3VMwFT67Ib+0psFMNjIUd8u9Dn6NP/Vd82MRM7ktUjIte9tq/Msw1FpySI4hp
 H+XOEu+B4lOxzOmmFvUNe2/w4A/AGScVYQKDoYZ91Nn/YSiqWzwWi7UrgDdA10Wq3Ya6
 0I5EetR6Ri5I54x1XcoEQbiPUxNkuswwNYs490oy7cL6zH2MpBFytmam9HsAgh/nYBT2
 tIrA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=maxmine.com.au
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=maxmine-com-au.20230601.gappssmtp.com
 header.i=@maxmine-com-au.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=eV838KXK
Subject: [Buildroot] [PATCH 1/1] package/python-pyproj: bump package to 3.7.2
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
 Daniel Crowe <daniel.crowe@maxmine.com.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Daniel Crowe <daniel.crowe@maxmine.com.au>
---
 package/python-pyproj/python-pyproj.hash | 4 ++--
 package/python-pyproj/python-pyproj.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyproj/python-pyproj.hash b/package/python-pyproj/python-pyproj.hash
index 6d9d4d2a20..e42c371469 100644
--- a/package/python-pyproj/python-pyproj.hash
+++ b/package/python-pyproj/python-pyproj.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyproj/json
-md5  ad62b11249d8e62879778190a3e3ef8c  pyproj-3.7.1.tar.gz
-sha256  60d72facd7b6b79853f19744779abcd3f804c4e0d4fa8815469db20c9f640a47  pyproj-3.7.1.tar.gz
+md5  1c0501d6055ff26565dae8fe2e6083c5  pyproj-3.7.2.tar.gz
+sha256  39a0cf1ecc7e282d1d30f36594ebd55c9fae1fda8a2622cee5d100430628f88c  pyproj-3.7.2.tar.gz
 # Locally computed sha256 checksums
 sha256  a652687151814d4c4715445912fcb49e7e58f5b248d47a1a88b859a8815e0822  LICENSE
diff --git a/package/python-pyproj/python-pyproj.mk b/package/python-pyproj/python-pyproj.mk
index e2e0fada5b..ccb5c659d0 100644
--- a/package/python-pyproj/python-pyproj.mk
+++ b/package/python-pyproj/python-pyproj.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPROJ_VERSION = 3.7.1
+PYTHON_PYPROJ_VERSION = 3.7.2
 PYTHON_PYPROJ_SOURCE = pyproj-$(PYTHON_PYPROJ_VERSION).tar.gz
-PYTHON_PYPROJ_SITE = https://files.pythonhosted.org/packages/67/10/a8480ea27ea4bbe896c168808854d00f2a9b49f95c0319ddcbba693c8a90
+PYTHON_PYPROJ_SITE = https://files.pythonhosted.org/packages/04/90/67bd7260b4ea9b8b20b4f58afef6c223ecb3abf368eb4ec5bc2cdef81b49
 PYTHON_PYPROJ_SETUP_TYPE = setuptools
 PYTHON_PYPROJ_LICENSE = MIT
 PYTHON_PYPROJ_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
