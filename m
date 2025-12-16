Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C456FD637A1
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 19:44:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DD0B404A5;
	Tue, 16 Dec 2025 19:44:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hOgOAyR7oIIN; Tue, 16 Dec 2025 19:44:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1E8A40597
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765914266;
	bh=TFeMJaMgBytQ9J0Z+pkYyPHYoJ8LUFVJQ+fgLA6fPYc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=hfOX6UNAqH+z6volIPT0Y1PHgpF1dyqAfuj7/6lb44i3ArR3Q61d1SNMmn0HHAqXk
	 0yBIoBnbDZGpVOOaO/qs9JZbvDuT5fbaP2aqu7XQM/IUm6QHpjdkBPHt+4RwKL3Qaq
	 kKZOtGiTZRzZ7pO/0g6TvH1H6Tbp++Nbi8nrdDfMOnTinvrBBQq239UGjAsT+j6ZE3
	 kAADOvqM3C9EPZqi8aBcOV0YxH+us41Iv5GYxGVCNlYZcmSZx9W4YGWq0a7Lxwy4aj
	 CHUSYzx4DUNzXwb1qr76ciVZHJlsBiKiBtdcffahaL6KVOWe4BajI6x+GCBuLE2V2F
	 vldrqLLj6s2cQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1E8A40597;
	Tue, 16 Dec 2025 19:44:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 28550364
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B081404A5
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:44:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5gnei7mS95yV for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 19:44:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1192840511
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1192840511
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1192840511
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:44:24 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 092A7A4C45CB;
 Tue, 16 Dec 2025 20:41:31 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47366)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVavA-000000000Bj-0Iem;
 Tue, 16 Dec 2025 19:41:20 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 16 Dec 2025 20:41:09 +0100
Message-ID: <20251216194119.3020421-16-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251216194119.3020421-1-bernd@kuhls.net>
References: <20251216194119.3020421-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765914091;
 bh=v04EhpuuG4mjxPfNO32M7J7T4eNmVKTbVLHdBkKx498=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=FLaNUf/jrQNumTe+t9hQkT9gJkpNqtSxTr7MWcS4JH5C4B8RNIHLg6JBysYQzLY2e
 GjpoMKyJRs2H6ssnIYCqoMAouW0zHHtjGT/6s1TvNzMVyArkWhCPX+tg4SlFCddEdr
 xriRVJI12BvoJP7lZwWPToAqlLZF6QtoCQTmQYhCyzw8m48OKjj23lW4WtSlSz9McA
 xP5n3tOl9RVHbEZA6zV2c1UpxaxCqORhjrbDTie8dU0gwGecEVrsnOFq7uEqOtc2Kn
 2pMQyvlozkZGVDKK9Ivq1lqk1lmlT3AekqjEkKIlktt5KsfUIA6Z11EFoZkomzD2sv
 X6THWl6vFcL+g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=FLaNUf/j
Subject: [Buildroot] [PATCH 16/26] package/python-types-setuptools: bump
 version to 80.9.0.20250822
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
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 James Hilliard <james.hilliard1@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/typeshed-internal/stub_uploader/blob/main/data/changelogs/setuptools.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-types-setuptools/python-types-setuptools.hash | 4 ++--
 package/python-types-setuptools/python-types-setuptools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-types-setuptools/python-types-setuptools.hash b/package/python-types-setuptools/python-types-setuptools.hash
index de273aa77e..45b229ece6 100644
--- a/package/python-types-setuptools/python-types-setuptools.hash
+++ b/package/python-types-setuptools/python-types-setuptools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/types-setuptools/json
-md5  8df05b03cbdda63e797f38543483138e  types_setuptools-75.6.0.20241223.tar.gz
-sha256  d9478a985057ed48a994c707f548e55aababa85fe1c9b212f43ab5a1fffd3211  types_setuptools-75.6.0.20241223.tar.gz
+md5  c9a6190884fc8a12c93963333f205f72  types_setuptools-80.9.0.20250822.tar.gz
+sha256  070ea7716968ec67a84c7f7768d9952ff24d28b65b6594797a464f1b3066f965  types_setuptools-80.9.0.20250822.tar.gz
 # Locally computed sha256 checksums
 sha256  295f8538c94ae5c3043301cf7cff1c852dab6a786a8ddee471e061b40d5ecabe  LICENSE
diff --git a/package/python-types-setuptools/python-types-setuptools.mk b/package/python-types-setuptools/python-types-setuptools.mk
index 4c7df27139..463cc3b6b5 100644
--- a/package/python-types-setuptools/python-types-setuptools.mk
+++ b/package/python-types-setuptools/python-types-setuptools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPES_SETUPTOOLS_VERSION = 75.6.0.20241223
+PYTHON_TYPES_SETUPTOOLS_VERSION = 80.9.0.20250822
 PYTHON_TYPES_SETUPTOOLS_SOURCE = types_setuptools-$(PYTHON_TYPES_SETUPTOOLS_VERSION).tar.gz
-PYTHON_TYPES_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/53/48/a89068ef20e3bbb559457faf0fd3c18df6df5df73b4b48ebf466974e1f54
+PYTHON_TYPES_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/19/bd/1e5f949b7cb740c9f0feaac430e301b8f1c5f11a81e26324299ea671a237
 PYTHON_TYPES_SETUPTOOLS_SETUP_TYPE = setuptools
 PYTHON_TYPES_SETUPTOOLS_LICENSE = Apache-2.0
 PYTHON_TYPES_SETUPTOOLS_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
