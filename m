Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F9CAE7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 16:12:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0886C6115D;
	Sat, 11 Jan 2025 16:12:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oylyMjJIVPld; Sat, 11 Jan 2025 16:12:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E6266115E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E6266115E;
	Sat, 11 Jan 2025 16:12:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C4FF7942
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:11:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B32AD83033
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:11:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CQLth-CJsdJO for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 16:11:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::135; helo=mail-il1-x135.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A09FC82FD7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A09FC82FD7
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A09FC82FD7
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:11:57 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-3a8aed87a0dso9910845ab.3
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 08:11:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736611916; x=1737216716;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U7qKBbhBdbieIRftcXL7FxkX8OGgoDlffEDf80gO2K0=;
 b=xINcFTr3gvvrcSFrDxa8c3IgCDwIrUZWu5yaYXWILRINm4HoO+xp2xVM/EVSeTPlom
 xvqCXVp62EcZMdJD+WCsWwrIYFY9j8nPcfpA8pBvmYyLW96k8FkUo3LHL49OstMX8F+q
 dKz7/7yBgr2oxs2LB9rtE+S8j7YmRhervF3VQVG/ANLP7P4RWvT/+H6SXdM64WjH4cGp
 ptxG7ovfRFL27vI61q6mZhPZIMU6ib2cqBf6Vi+pIuBr0+2XL7PYtW1vSWspeDOjHCH6
 d+uV5Amvd5md2ZSKKogIW9qdgOO0m1/TugX0JTtiQYV/P0lTdHxHfJP0aOrpaRrQaDZE
 X6qQ==
X-Gm-Message-State: AOJu0YxT4wugLK4CrSI7oWQYhIHn9YaXxAh3xNQBhR6nZXaiORav59Ef
 ++p/kWPmqYXC8zqHNN+iuf6Gu7Yi2kRe0RDspmnE45XZfE8udopqHIflONdOnms=
X-Gm-Gg: ASbGncs8xtn3Bsos05wA6V0XV2bo0NG2Pm7ZpzU3o7xHMGxPD+WnbukVSsniY1c/XJO
 V/Z5GmwfZfojdbVDsKZfPjO/p4C+xz1wqS7Y36uZ2cXALXk/a4vRW6WbJspO/j4e3e1Omm3NW7T
 Lqo5T/wu9N8Sz0vAPgZnppg/Q4kVan/ZS82IjmhzbJljT8ltL1ppr5n5c+g5pwSthxiiSSthVlg
 Jfz/M2xfPYc1ioRUgD1uK4mss/ymZu1KfrE7IdEoReqEA+YbKrIWMvY3pV6wdzPnMKmQ3caIssz
 vHggpULj5jQvdmL98ms4LL++2WpgIKg=
X-Google-Smtp-Source: AGHT+IFOQ4zXQ8iV5KsX7iGcX08IuCgFIrXZuWw9KKU2w6vZHCddkHmVRh+6cozCugCIReG/TTjIfQ==
X-Received: by 2002:a92:c248:0:b0:3a7:e732:4713 with SMTP id
 e9e14a558f8ab-3ce3a9c1aa9mr112594175ab.15.1736611916259; 
 Sat, 11 Jan 2025 08:11:56 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b745799sm1575631173.114.2025.01.11.08.11.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 08:11:55 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 09:11:54 -0700
Message-Id: <20250111161154.2867405-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736611916; x=1737216716; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=U7qKBbhBdbieIRftcXL7FxkX8OGgoDlffEDf80gO2K0=;
 b=E1km638OoB5QMTpvfBquB6Vb54G6ADTFEe/kN75BiRTfMGOXomv4l7u1MWE1TiF+Yk
 KWpqwLuRG8PG21vLUuo6NV9wa6myvhQ8iqngnOGq4rLT+TOJdWk8fRgViFeaXaboCAMX
 1oJjt5yudVW2pYXCmYN24Nh4wqKfGz3WZi5n1fpq4AmczD1Bp8E4oaJipyPbGtYIB5Lu
 O1MCe1yWsn32WwDlURbfjmhCTJuCO6p8/L3gbNeg091sZYMmhGZg8h4Ic7LBKE20+GO2
 TL6l5kSaUT6jCRbGcJ4uw6/6h5ylvvK7a/7ECAdSU+n4Pc0w5H/voXTH5GxkEhETYG9/
 iO7Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=E1km638O
Subject: [Buildroot] [PATCH 1/1] package/python-pyroute2: bump to version
 0.8.1
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
 package/python-pyroute2/python-pyroute2.hash | 4 ++--
 package/python-pyroute2/python-pyroute2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyroute2/python-pyroute2.hash b/package/python-pyroute2/python-pyroute2.hash
index e346ca4f66..3785c9ad7f 100644
--- a/package/python-pyroute2/python-pyroute2.hash
+++ b/package/python-pyroute2/python-pyroute2.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pyroute2/json
-md5  04e3b1a6550840c2eaa75da16b83f62b  pyroute2-0.7.12.tar.gz
-sha256  54d226fc3ff2732f49bac9b26853c50c9d05be05a4d9daf09c7cf6d77301eff3  pyroute2-0.7.12.tar.gz
+md5  6699294168d3051b2897a556ceeaf6c2  pyroute2-0.8.1.tar.gz
+sha256  b91f4a1f7abb9824637b1fe67e6e4a0a071d98d4a1a1b47ef792304ff3adad11  pyroute2-0.8.1.tar.gz
 # Locally computed sha256 checksums
 sha256  4739b32a2478e9c204bf010bad5d565d188e59ff905e3c8f71fe3398098b7093  LICENSE.Apache-2.0
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL-2.0-or-later
diff --git a/package/python-pyroute2/python-pyroute2.mk b/package/python-pyroute2/python-pyroute2.mk
index a4029c7321..fea6e43979 100644
--- a/package/python-pyroute2/python-pyroute2.mk
+++ b/package/python-pyroute2/python-pyroute2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYROUTE2_VERSION = 0.7.12
+PYTHON_PYROUTE2_VERSION = 0.8.1
 PYTHON_PYROUTE2_SOURCE = pyroute2-$(PYTHON_PYROUTE2_VERSION).tar.gz
-PYTHON_PYROUTE2_SITE = https://files.pythonhosted.org/packages/39/16/323b947c34530436658331e2cf393b72ebcbd923a75154a7efb28feefd5d
+PYTHON_PYROUTE2_SITE = https://files.pythonhosted.org/packages/4d/04/c9060b6cb024d05467e17ea93d3ca4bd2f3b05deb2372b7f79321640e8ad
 PYTHON_PYROUTE2_LICENSE = Apache-2.0 or GPL-2.0+
 PYTHON_PYROUTE2_LICENSE_FILES = LICENSE.Apache-2.0 LICENSE.GPL-2.0-or-later README.license.rst
 PYTHON_PYROUTE2_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
