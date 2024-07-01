Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E831AC2BD09
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 18:30:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3B54810CF;
	Mon,  1 Jul 2024 18:30:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SrBaehWW4RLz; Mon,  1 Jul 2024 18:30:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5AB58119F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5AB58119F;
	Mon,  1 Jul 2024 18:30:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0D47A1BF33C
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 18:30:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC177412F6
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 18:30:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0443dRayZoOJ for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 18:30:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A969B40600
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A969B40600
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A969B40600
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 18:30:07 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-7f3d884e70bso177680339f.3
 for <buildroot@buildroot.org>; Mon, 01 Jul 2024 11:30:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719858606; x=1720463406;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3MzRRWOD9VBjv5u7KWFboJ4tIkKLiCPw33OUBGs564M=;
 b=ZudQjBg8KwwWMJWWz2T6Ub4nF+hBuRZWAVlH/4yPSVMgQUQ0prWD4mexJ14uwVepkM
 He/uyf6E368aO4ZxkJOiHGir2eOIxbJpnY1MYKISv3IjnHgtgKCapEtSSwqqrhbKeA4E
 kpYspJaqkFpsEjKDCIgYMElAZ2SUG+jHu3eyd9lfMreMwfzQ5HdAUIyEBMoplPQpTaFS
 kw20zz8UhT9cEdZP+7EfifpHpWLyync8urXuEYqmZQs4GMEXthh31Ee4Swc6kptqnDqu
 QADILRVK9gN3bFl+Hx0wG7znAPjfoJhlA35Zpm8HRtwDOobVteNgivazH4CamiAR3wdc
 Ot3w==
X-Gm-Message-State: AOJu0YxFxR7cC2DFsKXDlNOD4Dg9nNGpKdN3oVTlWi7WI1e22edCKYhi
 dTQYK8feVSqb3ns8A7soydmJ2VS45O9CMOPFJZHnkdvJrGx0PHnEP1pV1w==
X-Google-Smtp-Source: AGHT+IF1PgL1M62YIq+3sBMUSKQtWfGCoMesVEaqsyi9sAEUVf4JBMRB+UiAct6gZnR1o5hfAaK8DA==
X-Received: by 2002:a5d:954e:0:b0:7f3:c683:2257 with SMTP id
 ca18e2360f4ac-7f62ee79dacmr884392839f.19.1719858605487; 
 Mon, 01 Jul 2024 11:30:05 -0700 (PDT)
Received: from james-x399.localdomain (97-118-179-167.hlrn.qwest.net.
 [97.118.179.167]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-7f61ce9d84fsm209935139f.21.2024.07.01.11.30.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 11:30:05 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Jul 2024 12:30:03 -0600
Message-Id: <20240701183003.1746036-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719858606; x=1720463406; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3MzRRWOD9VBjv5u7KWFboJ4tIkKLiCPw33OUBGs564M=;
 b=fRZ7MbmNgRxWc9i0VDEDkQPrdbL0v2RyeNdcSRDZ2yMM6zvUcq7IZ+/l2lvz9dXgm1
 KbpyHcGw6VV+LQslpySjIwKDS/VbeAENgpLa4GtYeRinT6P8uPeibGHJW1rBg4K25JcB
 JCsFPyxwoHU/MCPR8ooL5W3mqt5TNsxwqxHqwz4+3iqW5wnOm7jLdnPVYhumCa1Jn/Rc
 XLkHN+rRF++iBxSesbt28vYXudAItXOC6QbXmZu72SlI1oIXPstdxlEaahF3Ln+uvfMe
 zF+vmr415h3ojxLb8/zEHTC027mnHxQlfIa+nEjnJsKCtZRLMuAfTMLscWfeYz60oLnD
 vrcA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fRZ7MbmN
Subject: [Buildroot] [PATCH 1/1] package/python-dateutil: bump to version
 2.9.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-dateutil/python-dateutil.hash | 4 ++--
 package/python-dateutil/python-dateutil.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dateutil/python-dateutil.hash b/package/python-dateutil/python-dateutil.hash
index a52fb30a0f..c127582376 100644
--- a/package/python-dateutil/python-dateutil.hash
+++ b/package/python-dateutil/python-dateutil.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-dateutil/json
-md5  5970010bb72452344df3d76a10281b65  python-dateutil-2.8.2.tar.gz
-sha256  0123cacc1627ae19ddf3c27a5de5bd67ee4586fbdd6440d9748f8abb483d3e86  python-dateutil-2.8.2.tar.gz
+md5  f4888298c0f2d5239c85c6457455a975  python-dateutil-2.9.0.tar.gz
+sha256  78e73e19c63f5b20ffa567001531680d939dc042bf7850431877645523c66709  python-dateutil-2.9.0.tar.gz
 # Locally computed sha256 checksums
 sha256  ba00f51a0d92823b5a1cde27d8b5b9d2321e67ed8da9bc163eff96d5e17e577e  LICENSE
diff --git a/package/python-dateutil/python-dateutil.mk b/package/python-dateutil/python-dateutil.mk
index b75f510bce..a2f1620b9f 100644
--- a/package/python-dateutil/python-dateutil.mk
+++ b/package/python-dateutil/python-dateutil.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_DATEUTIL_VERSION = 2.8.2
-PYTHON_DATEUTIL_SITE = https://files.pythonhosted.org/packages/4c/c4/13b4776ea2d76c115c1d1b84579f3764ee6d57204f6be27119f13a61d0a9
+PYTHON_DATEUTIL_VERSION = 2.9.0
+PYTHON_DATEUTIL_SITE = https://files.pythonhosted.org/packages/d9/77/bd458a2e387e98f71de86dcc2ca2cab64489736004c80bc12b70da8b5488
 PYTHON_DATEUTIL_SETUP_TYPE = setuptools
 PYTHON_DATEUTIL_LICENSE = BSD-3-Clause
 PYTHON_DATEUTIL_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
