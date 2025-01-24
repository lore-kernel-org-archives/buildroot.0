Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D31C02181
	for <buildroot@archiver.kernel.org>; Fri, 24 Jan 2025 18:40:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BEDB3821DB;
	Fri, 24 Jan 2025 18:40:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qwY9KonwEy3S; Fri, 24 Jan 2025 18:40:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B73AF8230A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B73AF8230A;
	Fri, 24 Jan 2025 18:40:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2680B94A
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 18:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 060CE42942
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 18:40:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1fAAd03i67uq for <buildroot@buildroot.org>;
 Fri, 24 Jan 2025 18:40:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12a; helo=mail-il1-x12a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D9BBD42A1A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9BBD42A1A
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D9BBD42A1A
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 18:40:41 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-3ce7a77e5a1so6846725ab.0
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 10:40:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737744040; x=1738348840;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pXIMQXDG5X8U52YVt/kqmougfKXQychUs5n30DUsz64=;
 b=iT/ScPyPEzMdLJOoK5sXlFcexHmzSc2YIIkTSWZ8fkq+TQqjkWYAi975VfV3ZaI21T
 WfZHi95GJBbuB42Zg3dV+2RXuLcpAo6ZneStScCTcL+HstcqnxJsWF/2BWFI5fvk5Cmy
 2iX1X0DZRaygFIb5udqXgfovpDrD9jn6sk5cOv8YXt5BCZgHAhbrUeX35dbuv8lWBaqi
 nmnSVZ/+yzP9Q9S8zcP9Oahu3VI8tkxKddfMAwpZt6JUEVElT7/+hetNa9TOtrK+jgRS
 /PfnZgHrAI/7LZCggB0G5xnb83Hrq1iQGGmO/mOi9VQ0lUTVD9yFxxaZ+6k880GT2tN3
 hdRw==
X-Gm-Message-State: AOJu0Yy+rUIgkKqoUx277mNJp3nXzq3h0wuHxAy/up9bOMmCgUnSy+dL
 fcs2pDCVnDwvlToDgAe1N7zrpySlsz2Xkp5v7nbMnOUHu2u2zo11hJotco1u
X-Gm-Gg: ASbGnctSjJwznmhYpOnk2X73X6ds4RbcWpNGXs7odIinaRO8bsK/s0CwIoUKbHXTpPw
 UIIqxhjwgqxJxrQjncQ4mMTykwPzm1rhXbi7L6K8NIyD4PvRoU5Vl7UvdMcj2lqi+2E7SgLlRaz
 o2FNW6momcSeUOpgXnSLLabWWcVh9I1DZLFxWBCaDy/jJo27YyfJAiYcL2IEeqtcATZWTDVE6nV
 x1wYOBXIO8HmORkTWpLoUSyEfGCUMluMvpy7KoVjWfsJM3T3FUkxSgreIEal43VjC2g3b0z56GL
 OGjOKUUMdMWxjZ9s/Ud0s8OQV75YoQnXN/Uwyo4fEFGzJN0hPAew7ZM9hVpmBD7TeA==
X-Google-Smtp-Source: AGHT+IEzflkJYtixNd4KZBNk1wBDEQsaRId9m/M03WkkDAR4Q50iZQKyDVBplV1XNtObuBWD8edXbw==
X-Received: by 2002:a05:6e02:b2c:b0:3cf:b87b:8fde with SMTP id
 e9e14a558f8ab-3cfb87c4a87mr86063815ab.17.1737744040567; 
 Fri, 24 Jan 2025 10:40:40 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da0397bsm774797173.1.2025.01.24.10.40.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 10:40:38 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Jan 2025 11:40:36 -0700
Message-Id: <20250124184036.3791393-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737744040; x=1738348840; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pXIMQXDG5X8U52YVt/kqmougfKXQychUs5n30DUsz64=;
 b=K+HCezv2kPPv4Pq1NCh2eD2ig1cCYLmSmaJJOqTx6xhfuGrh2xpE0pu4Hom4/CHovA
 /0wz2BAo8Xi+vYaDdd66Q6UqfXfxFCZqRKAs3Yi+wKqEH//+1z0hWfhe/C5Mzio3a+7a
 v+KQ9hIxS5a91obWMuzO19Cto5ZH9GumcyWByzKRRhAf9NlAeIloOQATKYcNDT2RqSD3
 Zb1bwczf7d9JcJv9SQ1WracWSams+kTdbT2K7dqRthrsk7bHSYNtBw35KFJTsTUC4KdD
 eDpSad5iiixmZ/fkYc2VHxp07u254myfB2En1V7mLOzygZsAaE9xAG/1H7VyREK+FQ7F
 7ELw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=K+HCezv2
Subject: [Buildroot] [PATCH 1/1] package/python-fastapi: bump to version
 0.115.7
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
 package/python-fastapi/python-fastapi.hash | 4 ++--
 package/python-fastapi/python-fastapi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
index 11e5837a3a..ec6e6ecd97 100644
--- a/package/python-fastapi/python-fastapi.hash
+++ b/package/python-fastapi/python-fastapi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fastapi/json
-md5  977d2052173cde94dd66c669110c2ac4  fastapi-0.115.6.tar.gz
-sha256  9ec46f7addc14ea472958a96aae5b5de65f39721a46aaf5705c480d9a8b76654  fastapi-0.115.6.tar.gz
+md5  294d889a46608f0a7d614f463aa3d2ce  fastapi-0.115.7.tar.gz
+sha256  0f106da6c01d88a6786b3248fb4d7a940d071f6f488488898ad5d354b25ed015  fastapi-0.115.7.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index 9f275ad8a8..43bc9b3a50 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FASTAPI_VERSION = 0.115.6
+PYTHON_FASTAPI_VERSION = 0.115.7
 PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
-PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/93/72/d83b98cd106541e8f5e5bfab8ef2974ab45a62e8a6c5b5e6940f26d2ed4b
+PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/a2/f5/3f921e59f189e513adb9aef826e2841672d50a399fead4e69afdeb808ff4
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
