Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A30C282EC
	for <buildroot@archiver.kernel.org>; Mon, 17 Mar 2025 22:06:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39F60811FC;
	Mon, 17 Mar 2025 22:06:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7fBRNT8p0O0L; Mon, 17 Mar 2025 22:06:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 460C1820E3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 460C1820E3;
	Mon, 17 Mar 2025 22:06:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 07F891A6
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 22:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CFB2940DE9
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 22:06:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MEEMaWvPZ8Dd for <buildroot@buildroot.org>;
 Mon, 17 Mar 2025 22:06:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12c; helo=mail-il1-x12c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9F1A740DCE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F1A740DCE
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9F1A740DCE
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 22:06:00 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-3cda56e1dffso25833255ab.1
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 15:06:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742249158; x=1742853958;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QHSLL26mgvTwam5BTrCTrfOIjDUMYnKCnHSvQvNxcXw=;
 b=SRn3PBSXvEJYULMZXV8fkrjJZEofqXggE2PuZumVUQsalAa7SiPDIk3b2iIwC5fyuX
 mFFenrB+HYy2bCR6Y/1/Z17sHl3YEeMHEtwih/iqFmv9Lu/Xi2qR6PUUk5B+90LPpb7y
 /OnyMO8hFohpnDj/U5EBL9zMzqMhmqwpsp4nZl/kdDq79Rnj7wDYdZenLnOEr5jIexHz
 EmGPG98yHg9aEpJEqXdFSn1hy1IbVgQRJ8vDju1ufQNyy3065F8+9oC/jrUEg6W8Ip8v
 rXaSNjSKiPwNLrjUvrD0CAcTOD4y1o5cN04Mtw4Yh7zdmHeH+B/ImUSTD/GBKFKbnsEN
 hrzA==
X-Gm-Message-State: AOJu0Yx1Hbd23x9c8xGmUHF69CCs0Dd16TyH23UkTzg6wKsHJ7tXe5cF
 l+N94PddN/yrbif5oqqsVUUgPF469Ql2AasIN9IogMp2+88JKa4JrKhGOQ==
X-Gm-Gg: ASbGncveYV4uUN3BulKspVE3FM+vFaaYyzJnSZ4Gydi/EXGydPq4AoV5Kt5qWcgVLwM
 aevxbJkCVFC/eVKHT7vv3Mf/aLfmqc7tGPGOFD/kPToHpl7CYPjNtYnYDeWB7WoTvleOmBDeFhL
 rx85PPhZWvnCCR5ZJTI+wwPwLE4T8yxwt75HJhHCSY+4cBzRGa7yE6CcVnx7yGOZorzom12T85s
 lyODaR4vU8SPzDgGSkd6trcz3ANY7AePd1DMs/DWxskt3NJYsLiPx3IOAPfn4Hg66Udz99X5H7l
 YYuPIxBNTXYeN7WLkPvHRaJK6F99wq9CDubdJAqE4ob7+hDM8kTeXIeqpMvJs/o2qQ1VCwCNBG+
 BZNWmYNsoOQ3KN67+xTTM
X-Google-Smtp-Source: AGHT+IFQZSqIyxLmzs4j/uTSEPQAlEX0OY78RGuHPkGdT2ZWcKTfM8/azzuqBPYUJHx4nZleerCr1w==
X-Received: by 2002:a05:6e02:4702:b0:3cf:c7d3:e4b with SMTP id
 e9e14a558f8ab-3d483a8914cmr131145865ab.21.1742249158302; 
 Mon, 17 Mar 2025 15:05:58 -0700 (PDT)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4f2637199cbsm2492444173.51.2025.03.17.15.05.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 15:05:57 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 17 Mar 2025 16:05:55 -0600
Message-Id: <20250317220555.3059151-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742249158; x=1742853958; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QHSLL26mgvTwam5BTrCTrfOIjDUMYnKCnHSvQvNxcXw=;
 b=geB4w87b2zwWXdMJvgRFdLMZqVYQLJsmugIwjoY29bI4+rLNynrujdp8f8r9o8v3pU
 txAbDorJmogXIYryuVPdmWfFOOpPp2N5CjYRM60Izi9C3myBIx6J7mcv8tR6K3qCpVw/
 jkdfJbQPMCE42RrK5XrhiWWw/zQozJm5ScK1TyqZycKwJZ5Szc9wJXDzxuqOxcakOhmp
 9SGShmC+PW18A/U5aeQmFlSuGLCZumYcqD2ZTNEgPPi3Z3Gk+4piQ50Ze0epAv/eGmZ5
 5pf9BPWCzyTrap5Y4fqawse0Ur6IsLTOEDBVFhp5FQ1lYC6BLjtaRvhUI8egNeEuMRLT
 lvEA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=geB4w87b
Subject: [Buildroot] [PATCH 1/1] package/python-maturin: bump to version
 1.8.3
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
 package/python-maturin/python-maturin.hash | 2 +-
 package/python-maturin/python-maturin.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-maturin/python-maturin.hash b/package/python-maturin/python-maturin.hash
index 1b295127f6..16d0c79af6 100644
--- a/package/python-maturin/python-maturin.hash
+++ b/package/python-maturin/python-maturin.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  da4ab5a84c35d0ab00c0fb63975f25c497d6570dcdeaae0ec0f7d9f70f1d5382  python-maturin-1.8.1-cargo2.tar.gz
+sha256  91da291029b8d62103044a91d8b9cf0220c73e282de096c20d1a38c55aa82dd1  python-maturin-1.8.3-cargo2.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  license-apache
 sha256  ea7882c559733766ad08343bde1d1ec80a4967c03a738fb8e0058ef6289f7b7c  license-mit
diff --git a/package/python-maturin/python-maturin.mk b/package/python-maturin/python-maturin.mk
index b9816e2119..af6cf44b68 100644
--- a/package/python-maturin/python-maturin.mk
+++ b/package/python-maturin/python-maturin.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MATURIN_VERSION = 1.8.1
+PYTHON_MATURIN_VERSION = 1.8.3
 PYTHON_MATURIN_SOURCE_PYPI = maturin-$(PYTHON_MATURIN_VERSION).tar.gz
-PYTHON_MATURIN_SITE_PYPI = https://files.pythonhosted.org/packages/9a/08/ccb0f917722a35ab0d758be9bb5edaf645c3a3d6170061f10d396ecd273f
+PYTHON_MATURIN_SITE_PYPI = https://files.pythonhosted.org/packages/30/0b/3fd746cf5cfa3c8d7e20ea08c0dbc2c2c765ae051d0fc43d808a38bc9548
 PYTHON_MATURIN_SITE = $(PYTHON_MATURIN_SITE_PYPI)/$(PYTHON_MATURIN_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_MATURIN_SETUP_TYPE = setuptools-rust
 PYTHON_MATURIN_LICENSE = Apache-2.0 or MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
