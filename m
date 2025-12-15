Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 914FED5B864
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 19:17:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5AE9A8084D;
	Mon, 15 Dec 2025 19:17:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WmTIUqdKk0PB; Mon, 15 Dec 2025 19:17:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7EB1680870
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765826238;
	bh=YVBxQKCMnf9Xf8RZWjndY9UG9EWYLCV9Sx5iZG+RXnY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=MKkbLOfIsmgYGR6I/8fEn+QMxP/B4mZuFi9l3GPvIDjjrXxEnWYDQvAnD6hb5yw+Y
	 ylPf6XrK7E6FFmQlo96LXMD8KIVo2/bskdvQK5R1crdqix+ukKMGuOSOyFXmV+HiGP
	 45QhP/Fme6+oM8wzdNk2iWAHyx2iWCjjPd8HnzxTs3cX2P/me0aBI+rVGsZaepp7ch
	 lyilA+SnpQYd9dphQAZoA9M0QZc0oy0RLMW7n/9qJZUVkw4rRAcuekwMQVDHJmmmdZ
	 SEySSvT3FYQBpVQyyzc7gGV1d+V4S6160fvj9UeIK1lqyfPDTPD117ZGCH4tdXfHYf
	 vBb62lrnUf2lg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EB1680870;
	Mon, 15 Dec 2025 19:17:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F3747255
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8FFB407FE
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:17:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tfNRsU5rhbJr for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 19:17:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C78B54046A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C78B54046A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C78B54046A
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:17:15 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CEBB4A4C4341;
 Mon, 15 Dec 2025 20:14:28 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40828)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVE1R-000000005ED-1NEv;
 Mon, 15 Dec 2025 19:14:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 20:14:03 +0100
Message-ID: <20251215191416.421755-14-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251215191416.421755-1-bernd@kuhls.net>
References: <20251215191416.421755-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765826068;
 bh=mXy0IMLQkoGsEqx+d7B1AfLcwngRMY0g8SDmtoYnkZ4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=fTNQukhUxdkJBIhnyeCWIj4IsLduStGWO12SC7jng9tk/LqJhP7LGmFUwG3yEuuMd
 eIThfYQfkXI3uZcfuxjbiOiXWCQizmSs8KSlD3tLhcLvFhiwSMPghV9hioJoqs3U+J
 UuQWrd0ps4WJxxH065XGdfB37UW2G8AmwM8U0EPhotWa7KShFUKgOC0+X6cl2b+GhG
 8JXYKizCvwwnCAGJwtIMuLbTMUx5oJpWb1OH8miGN40SgLI84jG3dT1u4aqJmxuWAW
 eUu9q+89dZnAsHKbO/LcfDFNJZ1VX/HlYbJl17CTqwV0KVWxqWFKf+cFILuQCRkhx2
 JMFgDG/x9xsIg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=fTNQukhU
Subject: [Buildroot] [PATCH 14/27] package/python-pyproject-metadata: bump
 version to 0.10.0
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Grzegorz Blach <grzegorz@blach.pl>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Witold Lipieta <witold.lipieta@thaumatec.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Falco Hyfing <hyfinglists@gmail.com>, Mauro Condarelli <mc5686@mclink.it>,
 Steve Calfee <stevecalfee@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/pypa/pyproject-metadata/blob/0.10.0/docs/changelog.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../python-pyproject-metadata/python-pyproject-metadata.hash  | 4 ++--
 .../python-pyproject-metadata/python-pyproject-metadata.mk    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyproject-metadata/python-pyproject-metadata.hash b/package/python-pyproject-metadata/python-pyproject-metadata.hash
index b29e00e6c7..d226c06c2c 100644
--- a/package/python-pyproject-metadata/python-pyproject-metadata.hash
+++ b/package/python-pyproject-metadata/python-pyproject-metadata.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyproject-metadata/json
-md5  d897e16dca18204e421f912487730668  pyproject_metadata-0.9.1.tar.gz
-sha256  b8b2253dd1b7062b78cf949a115f02ba7fa4114aabe63fa10528e9e1a954a816  pyproject_metadata-0.9.1.tar.gz
+md5  748ebfaeb5c1ca2390450e48d95c20d6  pyproject_metadata-0.10.0.tar.gz
+sha256  7f5bd0ef398b60169556cb17ea261d715caf7f8561238151f51b2305084ba8d4  pyproject_metadata-0.10.0.tar.gz
 # Locally computed sha256 checksums
 sha256  aaf9a29ca5907971ccf07de025375db34539a8d5eeebce20b46099805722106f  LICENSE
diff --git a/package/python-pyproject-metadata/python-pyproject-metadata.mk b/package/python-pyproject-metadata/python-pyproject-metadata.mk
index 6cac09c376..3fa1d55460 100644
--- a/package/python-pyproject-metadata/python-pyproject-metadata.mk
+++ b/package/python-pyproject-metadata/python-pyproject-metadata.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPROJECT_METADATA_VERSION = 0.9.1
+PYTHON_PYPROJECT_METADATA_VERSION = 0.10.0
 PYTHON_PYPROJECT_METADATA_SOURCE = pyproject_metadata-$(PYTHON_PYPROJECT_METADATA_VERSION).tar.gz
-PYTHON_PYPROJECT_METADATA_SITE = https://files.pythonhosted.org/packages/64/ae/5fa065b049e97f96880de0611dbba513f0ee313b6edd0a64664c7b46a8e8
+PYTHON_PYPROJECT_METADATA_SITE = https://files.pythonhosted.org/packages/75/bd/74706b3671c443944f487a42a0148a507b733c60600df1d34cde41e6d10b
 PYTHON_PYPROJECT_METADATA_SETUP_TYPE = flit
 PYTHON_PYPROJECT_METADATA_LICENSE = MIT
 PYTHON_PYPROJECT_METADATA_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
