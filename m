Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98DC2D637A1
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 19:42:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D6DA6108D;
	Tue, 16 Dec 2025 19:42:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U40NBOJ3Kpdc; Tue, 16 Dec 2025 19:42:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3258861032
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765914170;
	bh=9Z4qBiX3vChZzxjvf+eCPqI4iLdDn/4dlAnThDFaRKI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ciFKefYtaLD3W3YmejdjlTsOrzCFqUtnRbjZqZugcieGKlL0I16NPjcMHdY23fP3u
	 ennvf9BEU1p/CtjD1xaFE4SKzxKDBMwta01T7shW/uBaoDzzTUWBJIhSSIt4XENf4W
	 6PAuy4h1MBlZ18LEit8kiDQFov6lGHntdL4uDD0824L5NnS06YtYIKeVBAb+bBwnT0
	 UgpWcW/I+D1jBLLeg0+6GL4o7CDQm2SLnhsxvJmm9xLxLl9UD+oEd/xqX5ZD57KaSc
	 5XndGK8APVkrP8h2x/9W57wc39c4KftE8+/Go5sF3NY+5PbRg2gSl9+npyBRgnbT81
	 07wrhiCrAarHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3258861032;
	Tue, 16 Dec 2025 19:42:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EF107364
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E115161032
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:42:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KK9Af4wlkuPn for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 19:42:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CBB38607C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBB38607C4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CBB38607C4
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:42:47 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 676B0A4C45A6;
 Tue, 16 Dec 2025 20:41:29 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47366)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVav9-000000000Bj-2KAB;
 Tue, 16 Dec 2025 19:41:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 16 Dec 2025 20:41:02 +0100
Message-ID: <20251216194119.3020421-9-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251216194119.3020421-1-bernd@kuhls.net>
References: <20251216194119.3020421-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765914089;
 bh=p1b4vn5SMVfsblbHUIVzBTTmTwQmKulWdH61YR/8ZqY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=SX0fSxQytDG/hi6fxBpD+JqPG2IO3WIMepxjigTH1VYc54Zl8fmHhts92PRpUEwtz
 8tIONybOrqJ46Q4LODWiAhjz2gP7UKyl6UY6QG221F20k5zbp6bzv3AmYO8G0RCPF/
 Q0KUW9j5mtGztB4wIKPzRDF966kCzgQH/XVU7RVSTTFCEBX7+A0vgIyjt9w6lRukMv
 KkUtPB4MiQ2k1az3YXUrb4TTDHykJN9D3dK6Fw5phllF/vHcdOa2k2+/jKrn00TE1i
 RpBo5SfEmxxo9RInx60I4k3bMi6hgvda6UjkDlUdZiGNAD/GUcSZpsL3PIE7wKfQIi
 zCvnhFdHeOTTg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=SX0fSxQy
Subject: [Buildroot] [PATCH 09/26] package/python-treq: bump version to
 25.5.0
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

https://github.com/twisted/treq/blob/treq-25.5.0/CHANGELOG.rst

Switched build system to hatch:
https://github.com/twisted/treq/commit/88ba8110f82cc721c37da1ce96fbaa83a0e6807b

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-treq/python-treq.hash | 4 ++--
 package/python-treq/python-treq.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-treq/python-treq.hash b/package/python-treq/python-treq.hash
index b44aba35d3..0c2582b4ba 100644
--- a/package/python-treq/python-treq.hash
+++ b/package/python-treq/python-treq.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/treq/json
-md5  a48996ff540651deded304b638ba54ea  treq-24.9.1.tar.gz
-sha256  15da7fc404f3e4ed59d0abe5f8eef4966fabbe618039a2a23bc7c15305cefea8  treq-24.9.1.tar.gz
+md5  b0a3c2e315375388e820019afc59919d  treq-25.5.0.tar.gz
+sha256  25dde3a55ae85ec2f2c56332c99aef255ab14f997d0d00552ebff13538a9804a  treq-25.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  7cc1b65e1937b1cc07052bb864ec96d8e5fd413400c0842e5b89a8201a600293  LICENSE
diff --git a/package/python-treq/python-treq.mk b/package/python-treq/python-treq.mk
index 65179246f5..a8e451731f 100644
--- a/package/python-treq/python-treq.mk
+++ b/package/python-treq/python-treq.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-PYTHON_TREQ_VERSION = 24.9.1
+PYTHON_TREQ_VERSION = 25.5.0
 PYTHON_TREQ_SOURCE = treq-$(PYTHON_TREQ_VERSION).tar.gz
-PYTHON_TREQ_SITE = https://files.pythonhosted.org/packages/08/94/424f3bb11eaf464880d076cca2e9d0ee21a1be805fe9761b87eccba5b3ae
+PYTHON_TREQ_SITE = https://files.pythonhosted.org/packages/ed/7b/b9dba8d947584481aad7e29b01f2ea6bbe794a0352e0cdb68e99ab135c31
 PYTHON_TREQ_LICENSE = MIT
 PYTHON_TREQ_LICENSE_FILES = LICENSE
-PYTHON_TREQ_SETUP_TYPE = setuptools
+PYTHON_TREQ_SETUP_TYPE = hatch
 PYTHON_TREQ_DEPENDENCIES = host-python-incremental
 
 $(eval $(python-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
