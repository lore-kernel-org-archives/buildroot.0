Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 738CEC02181
	for <buildroot@archiver.kernel.org>; Fri, 24 Jan 2025 20:58:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2003082048;
	Fri, 24 Jan 2025 20:58:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zcnTvXDZfUy8; Fri, 24 Jan 2025 20:58:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F9D182055
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F9D182055;
	Fri, 24 Jan 2025 20:58:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E726D1183
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 20:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D3A8D4026B
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 20:58:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pbDAGkgHE9xC for <buildroot@buildroot.org>;
 Fri, 24 Jan 2025 20:58:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12a; helo=mail-il1-x12a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A38A24012F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A38A24012F
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A38A24012F
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 20:58:35 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-3ce7c4115e8so11310025ab.1
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 12:58:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737752314; x=1738357114;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T6vaIU7XJz9KiUZFMQsgWLoMKErsoF8FaGMEbrFEdwE=;
 b=hJAT96HD+v2F3yEgDqDSw+9cwAcjfn51aVSOoRhL4dbpUj+z8QHCtfNwghc0JiMu2v
 MDR5b2YlBZSkixtLxJsp/DzDEkL2tRmm+F/MjAH3wnwj5+iLkHN9NpdBaUZoErIdiYVw
 do4M/aXDvo0hTNsqffvcUV2OMkB/8VBbj/8F3yc/R0CPFAf/Ns+iiFNIvepnDWyjfSK9
 IS3yg5DBCiAp7hKHFC9+ByMLQAjHBOcRAM9ckI8A20xFqYjWMdhQ+0EI3D8QxRVYiUtp
 ut/OFxFSiCuExsHIOHvTz1XEHkDBKN0UaOkT1HElw7IVmLgFz3wPsTTIC9DKnk+pJgC7
 fJYA==
X-Gm-Message-State: AOJu0YxFEH2rng94n5N8zn15hwpZsK1a4fnGhWQl+DGR57Edw8Rcr3/S
 rtZKUwtCnLAMXafxdxzhWudsGP5Yw++C0dCXV3ADk/UVvQ5125/SSUudOOj8
X-Gm-Gg: ASbGncsmr6WnEFbHjcInYVf1780qkPcmirHHXruvcgaOwMAse1Jgh9VzMruxNNgY477
 kxR99PMji88s57hF8G4YFYkhfKCXoDDnY8pVSPWXwb9oHom6j6756v4ieJ9ccOveDy2SN7CmaiT
 uSObJ4Zyx7b3MV7mLxClr54r3lIE/qucIUrylbYELsaToQpvNpIw9avLRvQjXH59dRvCKbjjeca
 zN4uxxnWWceGbtgBhjSdMxZc7aJYaB1Aa16SgaWpYv7QuOc0duU3JHRt91gMezRWk4cr2Hlr02L
 aeU3b9HfXKgEpczLd98iNwLomXE2EJDPvRHq3QtCQre9CJKR+ysEDq4=
X-Google-Smtp-Source: AGHT+IG2Aq0yOXEvNc/rQ3OgKxk0raqWS2B0UBQhnsS2Hn8i0laMafuaGpyeM8vOuk92OHauiBnFPQ==
X-Received: by 2002:a05:6e02:18c9:b0:3ce:6a08:2584 with SMTP id
 e9e14a558f8ab-3cfc7a29d40mr39961715ab.7.1737752314249; 
 Fri, 24 Jan 2025 12:58:34 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da2de7esm858668173.32.2025.01.24.12.58.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 12:58:33 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Jan 2025 13:58:32 -0700
Message-Id: <20250124205832.3861948-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737752314; x=1738357114; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=T6vaIU7XJz9KiUZFMQsgWLoMKErsoF8FaGMEbrFEdwE=;
 b=Hbggmg8fCRVCjKm8l1NBbgbFLImlEwElIss999gUupboh4oYHMcFe5439Z44hljEbF
 D2Y6TxHwqE0RH3k6A4c18eCnX10jxPvp8gvCsHg3NTbiUbcq7WN8H/yLif1/UHqtoats
 hfA1KZDFUw4hkIueoROKkwTGD6EqVHzS6IXRFaSYfeGVD05RTENrYYSnI3WLQ4+oid++
 iPN1SRZR0VfRmRSbZ5AekZvjjWK2j0VgR23h0m1c7zaT/dNLlfs0Dm7C2uoytUailmow
 hEVLXkwJ+VI43hq8EEbM0+QWAaqADpaYT1y06e9EcqDvdO9PlVIESq0k2mza8BRU2YpN
 /MPA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Hbggmg8f
Subject: [Buildroot] [PATCH 1/1] package/python-tomli-w: bump to version
 1.2.0
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
 package/python-tomli-w/python-tomli-w.hash | 4 ++--
 package/python-tomli-w/python-tomli-w.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tomli-w/python-tomli-w.hash b/package/python-tomli-w/python-tomli-w.hash
index 1d0bbf881e..61b5baf9a8 100644
--- a/package/python-tomli-w/python-tomli-w.hash
+++ b/package/python-tomli-w/python-tomli-w.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tomli-w/json
-md5  8a074845fdcbb1fb6855bec753f0f94e  tomli_w-1.1.0.tar.gz
-sha256  49e847a3a304d516a169a601184932ef0f6b61623fe680f836a2aa7128ed0d33  tomli_w-1.1.0.tar.gz
+md5  bfc49ccce117afc20bcaf50e80fcecfe  tomli_w-1.2.0.tar.gz
+sha256  2dd14fac5a47c27be9cd4c976af5a12d87fb1f0b4512f81d69cce3b35ae25021  tomli_w-1.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  b80816b0d530b8accb4c2211783790984a6e3b61922c2b5ee92f3372ab2742fe  LICENSE
diff --git a/package/python-tomli-w/python-tomli-w.mk b/package/python-tomli-w/python-tomli-w.mk
index a6ca0cfbbc..b8881eb15b 100644
--- a/package/python-tomli-w/python-tomli-w.mk
+++ b/package/python-tomli-w/python-tomli-w.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TOMLI_W_VERSION = 1.1.0
+PYTHON_TOMLI_W_VERSION = 1.2.0
 PYTHON_TOMLI_W_SOURCE = tomli_w-$(PYTHON_TOMLI_W_VERSION).tar.gz
-PYTHON_TOMLI_W_SITE = https://files.pythonhosted.org/packages/d4/19/b65f1a088ee23e37cdea415b357843eca8b1422a7b11a9eee6e35d4ec273
+PYTHON_TOMLI_W_SITE = https://files.pythonhosted.org/packages/19/75/241269d1da26b624c0d5e110e8149093c759b7a286138f4efd61a60e75fe
 PYTHON_TOMLI_W_SETUP_TYPE = flit
 PYTHON_TOMLI_W_LICENSE = MIT
 PYTHON_TOMLI_W_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
