Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D11FCCF9EB
	for <buildroot@archiver.kernel.org>; Mon, 27 Oct 2025 17:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F7CC610E6;
	Mon, 27 Oct 2025 17:28:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0iwKTKVnuCxf; Mon, 27 Oct 2025 17:28:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31DEC61189
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31DEC61189;
	Mon, 27 Oct 2025 17:28:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 839C943F
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 17:28:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69C824105A
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 17:28:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KIKaBooVPQcH for <buildroot@buildroot.org>;
 Mon, 27 Oct 2025 17:28:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 948A6400D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 948A6400D7
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 948A6400D7
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 17:28:26 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-940d327df21so206599139f.1
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 10:28:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761586105; x=1762190905;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EkVMzyOr92+t9ZKR4uz+4m8su31twkCZWSD8zlPHF9w=;
 b=qfsaIujOhWOeheTHIfdQYDmh7YzK1b0WBk8pr0aI4g4T7cIB5DYIPuBiRSf6n/JeQ9
 ToOxdMXd8RPdbzvifJ94ZnonkJeG4CVghYKFX6FTGMuqjMu5YLzCqFwQMkv4MDUSbp6I
 vX/yYEPtA8TDTF1csw67H9yI7RhIDcb0us3oWpBUz1axLuPCWFVHpdMtVDmOCV4/1J0/
 ivaE+NQ3Tmg41zG+TmvMPIQGLwepLMPQaEf8OrCdq5pVtKRFJ3b2M4kAC82ZzCr6vSqA
 xLkzksPeT1znCm50Nxy6m76gH2wp5Swp9h2RKqfm6ySbelVj1IBn1c85co7YkpcqrfNl
 6wvg==
X-Gm-Message-State: AOJu0YzdrNFmTOmxn7qTe9iyTUy5PIKP5O5kOBzLa37HaQdaVfQN0NYW
 pbrg3QpjDHjibIARJyWQcogJkMvjBOn3zdcbopK76k2k90aq6sZqS6RtUWNpOC1L
X-Gm-Gg: ASbGnctE1GxPBn4+ld5bgFaaK3DB+4VV7Pp+DXXIJvLO4kjXz10esQs03Hb2csgwmF3
 KDMbhAd9EPojOOs+c1k6Qiewvk2Kc6uzuPOFaDJKLIw4faXlLDZR1BmBqnXjcP8sgBIj3IhpLwq
 77e7ufHXasrpETbECD44GwRt4R5m5NSh8iTWNv7L9ZeMvPRjphZ+G0nm9QB4UkIxuEuu3tdNsTO
 miAezU5ZwlePmTFssr/NmTGC5vDobFEtzBOrGhBPSq2eaQqw0xx312/PqHsgK/VoWdCnMo3tFae
 h9QiRn8f8XFISzdNjuIL9EoO/lCPbQk1vAx475TvHhtvrEUTEKuzYpy8T8tNe/f2oNOf6hzYk0F
 Azb9BCxzZmcueOv30JUlYNdBzq9XOzPn0Ue9bTrtQvcRjSMK7FXn9A5NSSp+TGVyCfKMxrkV/bE
 0Ya//ftEGYxxdwx/UyFV7GMW+JYFN/PdP+jPqmYt2oJEkibTAUci9mDvHAag==
X-Google-Smtp-Source: AGHT+IFEy++V4v7Oup2NuOQLY22NEBmMoOWOEhomJjmGuqqUFimazUVrVs2w5k3x0aesM751gQ+YtA==
X-Received: by 2002:a05:6e02:1d85:b0:42f:9353:c7bc with SMTP id
 e9e14a558f8ab-4320f7a280bmr15359825ab.6.1761586104992; 
 Mon, 27 Oct 2025 10:28:24 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-113-64.hlrn.qwest.net.
 [71.218.113.64]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-5aea995d420sm3324003173.43.2025.10.27.10.28.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 10:28:24 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Oct 2025 11:28:14 -0600
Message-ID: <20251027172814.839233-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761586105; x=1762190905; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EkVMzyOr92+t9ZKR4uz+4m8su31twkCZWSD8zlPHF9w=;
 b=CeMqkl6UzAZag2Fuuri1KiaoU8cxt0WOn/urYxFuRCFC5V60gp1tvLMpmaInYSlzdB
 InXObLHc8YeRh1NsOl1BxD4gebvhhe7mQc0cjRFWl/go1B5MSYutYwh5ECYgjXxvOKkB
 xm/SrclSg0GMEUzOjUCH1fg+lFGH0PNH77N4ibuTAYBg351h74/4+g5/+1WHlrjWv/PJ
 5S3KKdB9Q7YRt/B6lkgy/AZiSVBPwvysW/a7NMuUE5+/noqCCrIHkIL8h9dv2vHqTE1g
 +LkvmtzkdiiIcPWQFmpnBGRJX12Ltg6X1HnCuTNY/p96AhqqshfHTB8bvUFT2ut6ZebJ
 iW/Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CeMqkl6U
Subject: [Buildroot] [PATCH 1/1] package/python-meson-python: bump to
 version 0.18.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-meson-python/python-meson-python.hash | 4 ++--
 package/python-meson-python/python-meson-python.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-meson-python/python-meson-python.hash b/package/python-meson-python/python-meson-python.hash
index 11f1807144..fa1ac831c7 100644
--- a/package/python-meson-python/python-meson-python.hash
+++ b/package/python-meson-python/python-meson-python.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/meson-python/json
-md5  bf1299782f02e4bb590a437bd140fd12  meson_python-0.17.1.tar.gz
-sha256  efb91f69f2e19eef7bc9a471ed2a4e730088cc6b39eacaf3e49fc4f930eb5f83  meson_python-0.17.1.tar.gz
+md5  b4d7f9ef6f09deb8dc8a7e5cbf16778e  meson_python-0.18.0.tar.gz
+sha256  c56a99ec9df669a40662fe46960321af6e4b14106c14db228709c1628e23848d  meson_python-0.18.0.tar.gz
 # Locally computed sha256 checksums
 sha256  8f82ea9ef9a55b47f4170536d02e48b5bc33fc5135e5b4a1b5f8d6404833ec9b  LICENSE
diff --git a/package/python-meson-python/python-meson-python.mk b/package/python-meson-python/python-meson-python.mk
index be8ab00c6a..542b64943d 100644
--- a/package/python-meson-python/python-meson-python.mk
+++ b/package/python-meson-python/python-meson-python.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MESON_PYTHON_VERSION = 0.17.1
+PYTHON_MESON_PYTHON_VERSION = 0.18.0
 PYTHON_MESON_PYTHON_SOURCE = meson_python-$(PYTHON_MESON_PYTHON_VERSION).tar.gz
-PYTHON_MESON_PYTHON_SITE = https://files.pythonhosted.org/packages/67/66/91d242ea8dd1729addd36069318ba2cd03874872764f316c3bb51b633ed2
+PYTHON_MESON_PYTHON_SITE = https://files.pythonhosted.org/packages/26/bd/fdb26366443620f1a8a4d4ec7bfa37d1fbbe7bf737b257c205bbcf95ba95
 PYTHON_MESON_PYTHON_SETUP_TYPE = pep517
 PYTHON_MESON_PYTHON_LICENSE = MIT
 PYTHON_MESON_PYTHON_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
