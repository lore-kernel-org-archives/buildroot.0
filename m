Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E1EE7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 17:15:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17DBF40939;
	Sat, 11 Jan 2025 17:15:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B-PcQ0FdetdP; Sat, 11 Jan 2025 17:15:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F22A408F3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F22A408F3;
	Sat, 11 Jan 2025 17:15:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 94482942
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:15:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 75EBB61242
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:15:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pZajkPMOiZFV for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 17:15:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6AA5761238
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AA5761238
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6AA5761238
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:15:38 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-844e6d1283aso130192539f.1
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 09:15:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736615737; x=1737220537;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vFJKNQTtG3rmWckJcOwmIUqb/Wc7vrXYvBgkG8jrJCo=;
 b=Wz6ZmQq8a6kTNMoHzlyMmiLGtV0jTJKe9TLTCU98shVUvK6B0vlsIXbfJ0k/xPCrAw
 tNUlxo9Ab5qap/3CDwpaZRhjXAKkjR/iI8ikX5GMRLTBnSPRp/y1TmJs13AVBwe/m6xd
 jlT/pG+4GtfqNTYGcf4xd0PwTDz/M6veEDqPeGCt1yaMEcijEk5U4YM0LFHcXhhAH9Qs
 fgIQivBkyn5xpbLSNMHYn9xARRe8Dxl01oneT4kYVDL7xt4SH3kiZCGc/OKvv4KHmhV/
 Wt1MgSz2pRjyZ0fC3oZVTZzkIZCRloy6VIToHIMJVEFQlYWbF2wgogU3biKH0qy+Ea0f
 8lhg==
X-Gm-Message-State: AOJu0YwgIlvi2lHI5ZIAramnCOLN+JA3lq7OT4MlvSWIB44ZhcaDC+lD
 2BMwNLDDqR/UcCNkLSSvRg1lEaUuUgI/a+idq3YSOhk0dL/v+SDx3Q7X3p4jnQo=
X-Gm-Gg: ASbGnctnerQYvEnhtJPHClc/FyDbzb3HOIWf/DjM14cTvFXbJPpyE5z/l8uNzgVGMQi
 WNytOkXIYrlHdA73ggLkqoDoVdA9JIUTc6akzDSztbEhGePXww8X9aNZI8bSQMGL38HhcQ0G2Xu
 KHhrfBVE9sCYz8Z42j8nhauO+e5WmQgvY3fpgrcxtcDl1DMSZfA6WTiSQRsIlPPDbZ+mKFBIWSd
 ObpOjPmw+0HyiHGYWHCJDqyP6BCyFFNTpa7J9lMoffNN5oYMoAmp3en/WldBV3S3ezerq0N6Za7
 QeeThWCVIcDzlw4Ck0ZzO0DbK6GIiPM=
X-Google-Smtp-Source: AGHT+IGqisp5St9snDilrKSQYMwTAgvUC4Hh0uuLInMvgMf25kFxnt+keIyq4ZF+X259gTFz6ID7cA==
X-Received: by 2002:a05:6602:7207:b0:82a:a4e7:5539 with SMTP id
 ca18e2360f4ac-84cebed0ecbmr954565639f.2.1736615737186; 
 Sat, 11 Jan 2025 09:15:37 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-84d4fb5bbe5sm160990439f.29.2025.01.11.09.15.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 09:15:36 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 10:15:35 -0700
Message-Id: <20250111171535.2908123-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736615737; x=1737220537; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vFJKNQTtG3rmWckJcOwmIUqb/Wc7vrXYvBgkG8jrJCo=;
 b=AYwxYRG+FJtzwW35ePSdNXKMhtJV0si6dC+AGXN5V8kQjMBnu41CBmnVFr3jpRc2SR
 ow67PtzZK1k6eJX20yTvrnAMmT+R68EEQogPaPBKxZhjptK0Sr5kTD+1Q8M8MZ3DGRCr
 D+0F2gLdGIxkiiY5a2uacYzslO7VE4ISSwOQZciP8oETakDBmPZ4/d66K6psJZPrrY+L
 qOl2Zjz5KfoSZdIubS562jhfsnq3lfwJHFmXbEDSwtF3sbu4uLXhQLDayWqCbjxpew//
 2xpe5gQLWDnycDvyK/vshssJVQVHGr1Wqw61SIbke9C+GgvJswh24eMGAOR3BxwhEMgr
 oiKw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=AYwxYRG+
Subject: [Buildroot] [PATCH 1/1] package/python-simplesqlite: bump to
 version 1.5.3
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

License hash changed due to year update:
https://github.com/thombashi/SimpleSQLite/commit/1f6e12a532cdee1408d6c34e38829b94c08b6cc7

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-simplesqlite/python-simplesqlite.hash | 6 +++---
 package/python-simplesqlite/python-simplesqlite.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-simplesqlite/python-simplesqlite.hash b/package/python-simplesqlite/python-simplesqlite.hash
index 8060437718..a17f20ff97 100644
--- a/package/python-simplesqlite/python-simplesqlite.hash
+++ b/package/python-simplesqlite/python-simplesqlite.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/simplesqlite/json
-md5  a907352592539345bf8145c3e39015cb  SimpleSQLite-1.5.2.tar.gz
-sha256  f9a25b9e43d7aa28f551d170a42cfae10139c5c81a1bcb8776f857816ef5ae0f  SimpleSQLite-1.5.2.tar.gz
+md5  a80e1e92454eac4c33c684c9f2a7f4a8  simplesqlite-1.5.3.tar.gz
+sha256  b0841881422107fc1bd26f8393e6a114b0fc54dc9bb74282556dd6e055ed06c5  simplesqlite-1.5.3.tar.gz
 # Locally computed sha256 checksums
-sha256  a93d75bcb0774e2990106380cadad6dcb2de193c55d435ffc56ba345a08b1dc2  LICENSE
+sha256  130a35b917df1951aefbf366120491d5124045a87ded123f20ded21521f4e3a2  LICENSE
diff --git a/package/python-simplesqlite/python-simplesqlite.mk b/package/python-simplesqlite/python-simplesqlite.mk
index d8efe23a6c..81399b9941 100644
--- a/package/python-simplesqlite/python-simplesqlite.mk
+++ b/package/python-simplesqlite/python-simplesqlite.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SIMPLESQLITE_VERSION = 1.5.2
-PYTHON_SIMPLESQLITE_SOURCE = SimpleSQLite-$(PYTHON_SIMPLESQLITE_VERSION).tar.gz
-PYTHON_SIMPLESQLITE_SITE = https://files.pythonhosted.org/packages/c8/07/92e3291fda6f1bbf6e7ff4721d87566e1615572d9c205ef64398c5d22efe
+PYTHON_SIMPLESQLITE_VERSION = 1.5.3
+PYTHON_SIMPLESQLITE_SOURCE = simplesqlite-$(PYTHON_SIMPLESQLITE_VERSION).tar.gz
+PYTHON_SIMPLESQLITE_SITE = https://files.pythonhosted.org/packages/59/a8/c8f4af95618dda725d91a081476036656fbf3660bb6f1728d1a5d088d6cc
 PYTHON_SIMPLESQLITE_SETUP_TYPE = setuptools
 PYTHON_SIMPLESQLITE_LICENSE = MIT
 PYTHON_SIMPLESQLITE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
