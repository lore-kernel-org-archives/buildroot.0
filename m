Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62228E7718B
	for <buildroot@archiver.kernel.org>; Mon, 23 Dec 2024 16:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E71A4141D;
	Mon, 23 Dec 2024 16:25:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ixGCl6A9bFuQ; Mon, 23 Dec 2024 16:25:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0BB9413CB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0BB9413CB;
	Mon, 23 Dec 2024 16:25:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 79A78D3
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 16:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6455A408E2
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 16:25:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uSk1PYWAdKuD for <buildroot@buildroot.org>;
 Mon, 23 Dec 2024 16:25:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 463B9408CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 463B9408CF
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 463B9408CF
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 16:25:40 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-84435dbda4bso192601939f.0
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 08:25:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734971139; x=1735575939;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ufQUO0Tv4PGaBZHx1sywFfV7ZvuGwqImk/vivOls0DQ=;
 b=YfbP7GO+SGpEgreH4eyqz/PtAbOGakgZ23XdUXH3ORHkDTtAE4ZhOz/cEd1ECjvZoL
 jiN32ddtcMRTdrUjhgJJ5yb+NCozgsDfNrIiV4qa7AxcJaYVHxBsnPMbDGtArxysiG8J
 jRRK2/vHiyuT+hFuPXnqte+D4fhM2WSej8qNXptArMd9shuTI+vEAYeubSINn4qYN2rE
 ki8ibX/1X0G2Agk4mnhHQ5TdtHPCs1jZLRQfTP9afUMOW+khshO0dc+dl4pNgK0oeeiQ
 4QRKbSDlKVvXDs28JM3jd7r1mL0HxH+2kk7ROWBEmi78y0jCXuwy0RSGylGyaIniofbp
 oybg==
X-Gm-Message-State: AOJu0YzEuM2M2Q/N3Egz19ovU4uTZ7YZFdMFEsKuKTgkcdJgmyeQ6TAM
 0jLp/q4Mjx4ghwjHuOb7m/YE5EPxQ236ISEb97M9fyXcLdW2LW+6UjFZcSb0a/0=
X-Gm-Gg: ASbGncsRqSCb35GR7e5CLXw/pe+4Loa06kPdq7PbMVqlg94MECqy54WNIVcTPjyOefh
 obUbevz/ZUsvI1r5G+JopDo0P7V0zAJn1rhkcDRJT2/phqx1UjqriYzd/T5VKFqmZCCSvwyTGbt
 vuB1rSmTkPSMLmxttAPjtfKNvk2XbceMq/aPQ3rDOW3bWGmWh0EDTKoz7Z1WU0fQfKAY/z+uoi2
 GMj4tklVimHSYVKezLgfwToN+81Bj2lponIqYyeW4cJMY4D3R9c16bne0MOzyczJ5Q8us9ebtdD
 Bh6rwKwGKbd2eEIA47svxgwudcRO3j0szA==
X-Google-Smtp-Source: AGHT+IHusOrRRLzCiopXNFdd6eXS91B1FfURSjIfMg0aji1dOwfajBeSnXrttR6jV4lLAknkzpV5Bg==
X-Received: by 2002:a05:6e02:1488:b0:3a7:e956:13fc with SMTP id
 e9e14a558f8ab-3c2fee1244amr110770355ab.5.1734971138892; 
 Mon, 23 Dec 2024 08:25:38 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-232.hlrn.qwest.net.
 [71.218.105.232]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3c0deae6a06sm24761155ab.18.2024.12.23.08.25.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2024 08:25:38 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 23 Dec 2024 09:25:36 -0700
Message-Id: <20241223162536.1865762-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734971139; x=1735575939; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ufQUO0Tv4PGaBZHx1sywFfV7ZvuGwqImk/vivOls0DQ=;
 b=WYG60fS+9iXGipzhN9YpgVqa9AVLByGY5J8skg9sY5sVugLsMh0NT7WjBCicIrxcbl
 p2CRHRMfs2aKYkAiyP3e8s8vtO3tZM191m5AE+XYVHkzywWz3G8zaNg3n33PHqEQztvr
 YeUZzjdge2Ml6iqbX6Qf7geDRsEQxqjdxrndnn5+wER0mqjHXOI27YknVafVkpS+PwWo
 AFq8Nh/fGUrn3GZ9SK7hF+LnssH/XtytSZESRKQ0qJR8x3FAnAodYqkkHdNVnI7dcBhr
 lZrbV//jYes1cN9rXj2TW19lx9LXDs6bYoj1nfFQBqYUJb6SkH9rTCPxnLZ6KMVwNSex
 rc4Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=WYG60fS+
Subject: [Buildroot] [PATCH 1/1] package/python-contourpy: bump to version
 1.3.1
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
 package/python-contourpy/python-contourpy.hash | 4 ++--
 package/python-contourpy/python-contourpy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-contourpy/python-contourpy.hash b/package/python-contourpy/python-contourpy.hash
index 8902607ec8..aef7c3de74 100644
--- a/package/python-contourpy/python-contourpy.hash
+++ b/package/python-contourpy/python-contourpy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/contourpy/json
-md5  81447a2ceaf933b28db04d02086a22ed  contourpy-1.3.0.tar.gz
-sha256  7ffa0db17717a8ffb127efd0c95a4362d996b892c2904db72428d5b52e1938a4  contourpy-1.3.0.tar.gz
+md5  06a4ae6ab30b855514797cac7073ed08  contourpy-1.3.1.tar.gz
+sha256  dfd97abd83335045a913e3bcc4a09c0ceadbe66580cf573fe961f4a825efa699  contourpy-1.3.1.tar.gz
 # Locally computed sha256 checksums
 sha256  c7d0a153bffaa104044463ebc633793d451722efd3138b5ffd2527b40f1505a2  LICENSE
diff --git a/package/python-contourpy/python-contourpy.mk b/package/python-contourpy/python-contourpy.mk
index 3804fce8c3..08c45f3805 100644
--- a/package/python-contourpy/python-contourpy.mk
+++ b/package/python-contourpy/python-contourpy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CONTOURPY_VERSION = 1.3.0
+PYTHON_CONTOURPY_VERSION = 1.3.1
 PYTHON_CONTOURPY_SOURCE = contourpy-$(PYTHON_CONTOURPY_VERSION).tar.gz
-PYTHON_CONTOURPY_SITE = https://files.pythonhosted.org/packages/f5/f6/31a8f28b4a2a4fa0e01085e542f3081ab0588eff8e589d39d775172c9792
+PYTHON_CONTOURPY_SITE = https://files.pythonhosted.org/packages/25/c2/fc7193cc5383637ff390a712e88e4ded0452c9fbcf84abe3de5ea3df1866
 PYTHON_CONTOURPY_LICENSE = BSD-3-Clause
 PYTHON_CONTOURPY_LICENSE_FILES = LICENSE
 PYTHON_CONTOURPY_DEPENDENCIES = python-pybind host-python-meson-python
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
