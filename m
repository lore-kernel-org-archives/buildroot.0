Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21907C83F1A
	for <buildroot@archiver.kernel.org>; Sun, 20 Jul 2025 19:36:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D641740EF4;
	Sun, 20 Jul 2025 19:36:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PITpIOiiCADc; Sun, 20 Jul 2025 19:36:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0A8440F64
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0A8440F64;
	Sun, 20 Jul 2025 19:36:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 15B56127
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 19:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFBFB83DEA
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 19:36:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8QWgGinBNmFI for <buildroot@buildroot.org>;
 Sun, 20 Jul 2025 19:36:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::136; helo=mail-il1-x136.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 283FE83D86
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 283FE83D86
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 283FE83D86
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 19:36:41 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-3df2d8cb8d2so13822105ab.2
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 12:36:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753040201; x=1753645001;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MrFQyGo8jQ8DSjs6QWmVilVCrWZIo6+261nND9zZnIE=;
 b=qcyne5vmNDgYFb4HDSOdVWNl7Jz4KkaUmkCEeAMEt5eg0KAMHqyVcRL7b44B/2sU5F
 mgC4b0DwJ1j4LtANAx5TtXp5r/Y8lXGB2VrHCxI/M9mYHWsnFO6EIUqblntaPdwkJDlI
 M59ieMP7q8thlmZbpbE8RJhoHMzc2ZsBGO04RG/gF8RLaDc33iCwYoVFScyOcFnnanWm
 EuB1NFkoqEerSzqMHJtza/GDlV47zs0LqpjsLCzbIifQP0Ng3hOwkpjWmw0r9HniZVQf
 c8YRGg6Ymm386aVvCX53GcUsy99+hYCxCq2HHo847k3HeRYe09qqVGD59byumQIKcVDj
 Ngmw==
X-Gm-Message-State: AOJu0YyzrVy8akUjygI5uj8ayeasH1fYSVXRrvORx5GNDmdnk9Zb6f42
 n7ZM7TZukz28yvQAB5H1j+3oJqbO5VGQTvWicg64XIhQM5GqF4NaEASBL3RRekNg
X-Gm-Gg: ASbGncsYMAPtTYxPrJjIgRv9rbHmnywjYD5w6BVIBDDBj/JyU87VW+KDgryGlTygFBZ
 lMKqY/4xGdWHWq7MFm4rQtUFZRCdaCiGc/3L3JkJgcllQfN169VV3BRdpij6uULOgQU8ArWZ9v+
 EljpNxv2Wkvl3ZDk1YzCi9oelsw4sx7W/FIpPk3sTTxYSFoQqrHu7MJoleRTSjf1X8BZA6FK5en
 iaTFa7u0j562koI/ePRDPqsiYRVPvsr5bimEkxtV5jdERz3C0lrC15IWYB7hnt6MGx1ZKruaW5i
 Sdrr6W1ZD+kyzw1o42+vSLFPWP9jVhQEzhnaGccn3nL+jCUMxdeBp2lVrpQXdD66PnIP4LpTswy
 UOcNd7fV9mzIZ/jYm0pF1Z044goCERjbUnVQ/XOs3Li5HAdiz9NI+jyG5mGg8UjBk0Y1QtgY2FH
 E/Es6cX9s=
X-Google-Smtp-Source: AGHT+IErfSba55gaC7wsh3aydxs8dNDOBvjiAEENUiXZWAJ6tqNcMiC9ds681KXB8nOstgA/k0ahmw==
X-Received: by 2002:a05:6e02:308b:b0:3e2:96c0:edf with SMTP id
 e9e14a558f8ab-3e296c00f6bmr126337115ab.2.1753040200755; 
 Sun, 20 Jul 2025 12:36:40 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-100-179.hlrn.qwest.net.
 [71.218.100.179]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-5084ca03da6sm1484009173.100.2025.07.20.12.36.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jul 2025 12:36:40 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 20 Jul 2025 13:36:26 -0600
Message-Id: <20250720193626.3220686-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753040201; x=1753645001; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MrFQyGo8jQ8DSjs6QWmVilVCrWZIo6+261nND9zZnIE=;
 b=JRaUzaYTL6EtjlBEDRv4TW+gzQ9bESFTFUpeu06mnGG7Vfk7UY9oabNku3fC4L2wq0
 dp6/tMpvdYP8X0AtvhDHEq9tq706I+o838fKAsB4pDoGQceB33HWVka1fsoHTHxi8aYo
 Y4EFKn6z0DHJLm/RDEznR86f2uS4zVdEjk1NH4+fH0zLf3pL+QlqcC0PqwdhQ0CU1Rjf
 Qn7PRwYb+ZPxPSzzfwidvtxCqrTeLxhuZxZZlOvwLa99C+9cBAG6KdZlgZZbriTMiqy8
 QPnh09nON+eRHIn20Y8PYPfHmkdmNRQCELXHGV7MV5LnsS1YeCz7xp8ic1SwhkpOXDDC
 T0qA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JRaUzaYT
Subject: [Buildroot] [PATCH 1/1] package/python-alembic: bump to version
 1.16.4
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
 package/python-alembic/python-alembic.hash | 4 ++--
 package/python-alembic/python-alembic.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-alembic/python-alembic.hash b/package/python-alembic/python-alembic.hash
index 3795afa260..a8ed0dc92e 100644
--- a/package/python-alembic/python-alembic.hash
+++ b/package/python-alembic/python-alembic.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/alembic/json
-md5  5fd5fe35fe820d03c0594cb3edd16829  alembic-1.14.1.tar.gz
-sha256  496e888245a53adf1498fcab31713a469c65836f8de76e01399aa1c3e90dd213  alembic-1.14.1.tar.gz
+md5  5499d3918aec406a1903aed530f7e2a4  alembic-1.16.4.tar.gz
+sha256  efab6ada0dd0fae2c92060800e0bf5c1dc26af15a10e02fb4babff164b4725e2  alembic-1.16.4.tar.gz
 # Locally computed sha256 checksums
 sha256  35ea9c3419b261faf1be448c4f47d9255281bf6b36b5ffea55052227d4ba54de  LICENSE
diff --git a/package/python-alembic/python-alembic.mk b/package/python-alembic/python-alembic.mk
index c6dcce445c..8dbbd0c7d8 100644
--- a/package/python-alembic/python-alembic.mk
+++ b/package/python-alembic/python-alembic.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ALEMBIC_VERSION = 1.14.1
+PYTHON_ALEMBIC_VERSION = 1.16.4
 PYTHON_ALEMBIC_SOURCE = alembic-$(PYTHON_ALEMBIC_VERSION).tar.gz
-PYTHON_ALEMBIC_SITE = https://files.pythonhosted.org/packages/99/09/f844822e4e847a3f0bd41797f93c4674cd4d2462a3f6c459aa528cdf786e
+PYTHON_ALEMBIC_SITE = https://files.pythonhosted.org/packages/83/52/72e791b75c6b1efa803e491f7cbab78e963695e76d4ada05385252927e76
 PYTHON_ALEMBIC_SETUP_TYPE = setuptools
 PYTHON_ALEMBIC_LICENSE = MIT
 PYTHON_ALEMBIC_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
