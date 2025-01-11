Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D18CDE7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 17:53:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7806C4055F;
	Sat, 11 Jan 2025 17:53:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BXf76pCm9KAr; Sat, 11 Jan 2025 17:53:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EFE44055C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EFE44055C;
	Sat, 11 Jan 2025 17:53:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BDCDE940
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:53:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9EFF44050D
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:53:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u-gxTxTM65Qa for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 17:53:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::130; helo=mail-il1-x130.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8298640544
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8298640544
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8298640544
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:53:26 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-3a8180205f3so12808035ab.0
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 09:53:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736618005; x=1737222805;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IJK6QLuOMcK6nK/xcP/pN9xkwP8NPJ9cxUchszKnXJ0=;
 b=kp5Qvc0Rgs3hMRtifdlOqWLmdPgC21ebiZ5IDRTFhCCVZN5fxZTofRns2gDv2zI2Zi
 d1nmaa7QUowrvbJRj21hVi8C3ZTTfqWox8W5fdsj2aayM0WAumuhiZJy665X6BzeRuvt
 9a9cY29pyxaXqa0Q71Lc1FHIrwQidilhIRVSIzYrQ0oHllZdsg9ylsDQBABoUspqzNKl
 MEA3RLgFzFNL2qllVWxhsGnQMQg+rOFwZ6pEoGRnaspuYQkmsbSuIhbmxC9SCkm+eokM
 pz+v6/QumKxArQ1eURYkkmLhcv342b3YEk+OEZzXKap6Ki4+mslJV2/RQ8p8DFcNhkkV
 SFBQ==
X-Gm-Message-State: AOJu0YybmmQurC4f3UUfhhnzURsKLTRPQQ2qSkcmgCOZw43u8ZPPmT4N
 zGRCf9pLXaXERt12VNn0qVdSTwKzB/AvG94KF+vHRR8ciZt0NuJaKcq5kd8+hvI=
X-Gm-Gg: ASbGnctdawbsaO2MN2+DEu/pm1CjwXmARnQt+XBumBQSNv6SbcspdrYeTLKUDC0S6mH
 XZFyd48vfkpH+7piG2kr6G9qZCBiXdzOP9nkk7fJc5geBU4Y0u7f3nHTvZZI2Pr2bdKfLuq4CeN
 SYuSiXZ4pHl6dfEnK6kSy15gpu5NZbkYHeqZvf9SDFRCMAbrZJ9HhXF1FkQqhDiO+nFFmYWiNpB
 tb03MZkU9ip+OITVntLiswmDAOh0DtwWQFzpbv0U/2FXgPJTfN4kwhL6LzWzYvdpu60xvs5Mwoi
 6T768Ht5qOgLJZNcZQDF3PJaImTJnBQ=
X-Google-Smtp-Source: AGHT+IEsoiMHF91P820RXeXkC8MXkj0p9bn+eMA4gl0rOgPSG3wdUUnHMS4OojGE+g5CKGJ68EPh+g==
X-Received: by 2002:a05:6e02:164e:b0:3a7:cce2:d349 with SMTP id
 e9e14a558f8ab-3ce4b09a7c9mr75484865ab.8.1736618005256; 
 Sat, 11 Jan 2025 09:53:25 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3ce4add8827sm16535075ab.35.2025.01.11.09.53.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 09:53:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 10:53:22 -0700
Message-Id: <20250111175322.2920538-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736618005; x=1737222805; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IJK6QLuOMcK6nK/xcP/pN9xkwP8NPJ9cxUchszKnXJ0=;
 b=lWOvVBA4K384GkFdZJpMS96vJW4q5cUIEbhWstthi1C2b8cZWnNdn5eU6F1uaHqN/H
 2mAa1KdganHln3fg2Jj7cH8DlEAkStxdeXghwwjKMe6+wdqWCzYfbOGUJyBMX0z6kJr7
 R+fiFkR+pKrR0CoJPMJAqhIDocWUkRn0qhMBf952PI5iVF3LuE21DDu+bx+oRRboGFnh
 joBYS0NXKSdsbbX7ePx89OqqDbrXytXOULjHv8tkGegGGoB9V6aLxLxlqHUIrFe/S0oD
 /vXOJt/d2xNd49ni5Irf6mW7tMH3z3oGvMCxHlbgHcQ4sMmtG6SomwCjri3PVhMWKZpk
 uN7w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lWOvVBA4
Subject: [Buildroot] [PATCH 1/1] package/python-sqlparse: bump to version
 0.5.3
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
 package/python-sqlparse/python-sqlparse.hash | 4 ++--
 package/python-sqlparse/python-sqlparse.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sqlparse/python-sqlparse.hash b/package/python-sqlparse/python-sqlparse.hash
index 1fe8429724..3e54d227f4 100644
--- a/package/python-sqlparse/python-sqlparse.hash
+++ b/package/python-sqlparse/python-sqlparse.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sqlparse/json
-md5  969a64f03d7da1144fc74aad390f9db4  sqlparse-0.5.1.tar.gz
-sha256  bb6b4df465655ef332548e24f08e205afc81b9ab86cb1c45657a7ff173a3a00e  sqlparse-0.5.1.tar.gz
+md5  9764a42264c9a3102526c87260e73d11  sqlparse-0.5.3.tar.gz
+sha256  09f67787f56a0b16ecdbde1bfc7f5d9c3371ca683cfeaa8e6ff60b4807ec9272  sqlparse-0.5.3.tar.gz
 # Locally computed sha256 checksums
 sha256  c1938235b80d39e93138eae89edc3af67e18ecbc40d266529fa57b2dce426310  LICENSE
diff --git a/package/python-sqlparse/python-sqlparse.mk b/package/python-sqlparse/python-sqlparse.mk
index de5ee15bee..0140961393 100644
--- a/package/python-sqlparse/python-sqlparse.mk
+++ b/package/python-sqlparse/python-sqlparse.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SQLPARSE_VERSION = 0.5.1
+PYTHON_SQLPARSE_VERSION = 0.5.3
 PYTHON_SQLPARSE_SOURCE = sqlparse-$(PYTHON_SQLPARSE_VERSION).tar.gz
-PYTHON_SQLPARSE_SITE = https://files.pythonhosted.org/packages/73/82/dfa23ec2cbed08a801deab02fe7c904bfb00765256b155941d789a338c68
+PYTHON_SQLPARSE_SITE = https://files.pythonhosted.org/packages/e5/40/edede8dd6977b0d3da179a342c198ed100dd2aba4be081861ee5911e4da4
 PYTHON_SQLPARSE_SETUP_TYPE = hatch
 PYTHON_SQLPARSE_LICENSE = BSD-3-Clause
 PYTHON_SQLPARSE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
