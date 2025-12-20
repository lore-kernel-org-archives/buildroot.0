Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 387D2E668B7
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 21:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F71160E38;
	Sat, 20 Dec 2025 21:46:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1i9KW-8AgtyE; Sat, 20 Dec 2025 21:46:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31EAF60E49
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766267205;
	bh=gRCA9/IO3aTfL+aQIr/HEZNxpAQDpvFhaHuPpSwsnc0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=F86RujMmw1z7YQZqpa3VwTgIu8dmN0W+AoHwQ7VgCxLJlWPDpqOEHvFMi3O/LpPoq
	 fj554YDhcxjFG7bDP3srI5uzkX9lx2R4MNjSaHBm2NaNnxP1DgNTf1sI81nDVaaatV
	 PqG/JIqOwuSZnF7DOt73Clnj7wMr4iabwQPZe0aQ/YsXO4SHhkuS8IJ9KPANiHMm+W
	 Oa3JwufskFhLA7gi226fC51NamngE/9D26rWUkC6fMgyJjEi+cdxkKM6jal6BTBIkI
	 49nnLcufNuoqlf3UEdvejpIwW6GSiOMir3vdu9qDQ+fYU8HnWPFVccrS7z0VobYoMb
	 OJK7iXcjxE97g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31EAF60E49;
	Sat, 20 Dec 2025 21:46:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 37716119
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DC0F80A86
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:46:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dlSviLz_ncNe for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 21:46:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0991E809CD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0991E809CD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0991E809CD
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:46:42 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c714.dip0.t-ipconnect.de [79.214.199.20])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4E1A2A4C4B96;
 Sat, 20 Dec 2025 22:43:41 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54444)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vX4jl-000000002VC-0sGZ;
 Sat, 20 Dec 2025 21:43:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 22:43:40 +0100
Message-ID: <20251220214340.1089315-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251220214340.1089315-1-bernd@kuhls.net>
References: <20251220214340.1089315-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766267021;
 bh=0hSsRjG3IyLXSQgB15t4aNVJVPpah5xhAyfZkbFlvIw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=vs/lBwDAiTePA373qP4qwRz97uh3cYEL/I8qWp8PQECBCLtUE5Sy6QpWL76nDUfnb
 8LZaEtBs+euGHRVOKS0pDQerIsNcpYwAf38J0kuq5zOxD3wf20Wjx9gjN2ONjM9rNp
 EIJbqUWjCwRa3jeXM57HSLL0jXnUsjfIslpdsAobKw5FLKAoEKkZvdaMapUqVnICe9
 5ZPX8jSRUGteBreHgdlnWLa0Y4IMzFM8gwwPYK7EtX/dkHvqjUtXg5xNkJIxTo/C0z
 TGJZBHc5c+SLGyZkoxqnVuOG0atgeZFK2PmX+o3UoySHZnhxQ/RUUZ1fL/KFos8Tf1
 ATJwtma8AUIOA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=vs/lBwDA
Subject: [Buildroot] [PATCH 2/2] package/python-mypy: bump version to 1.19.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/python/mypy/blob/v1.19.1/CHANGELOG.md
"Mypy now has an extra dependency on the librt PyPI package"

Updated _LICENSE and license hash due to upstream commit:
https://github.com/python/mypy/commit/8f922b3d879f31e4c52c1c643de70e27b5720654

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-mypy/Config.in        | 1 +
 package/python-mypy/python-mypy.hash | 6 +++---
 package/python-mypy/python-mypy.mk   | 8 +++++---
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/package/python-mypy/Config.in b/package/python-mypy/Config.in
index 6c58bc4fc1..2ac5bd7c76 100644
--- a/package/python-mypy/Config.in
+++ b/package/python-mypy/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_MYPY
 	bool "python-mypy"
+	select BR2_PACKAGE_PYTHON_LIBRT # runtime
 	select BR2_PACKAGE_PYTHON_MYPY_EXTENSIONS # runtime
 	select BR2_PACKAGE_PYTHON_PATHSPEC # runtime
 	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
diff --git a/package/python-mypy/python-mypy.hash b/package/python-mypy/python-mypy.hash
index 9f1656ddce..a31cb5dba6 100644
--- a/package/python-mypy/python-mypy.hash
+++ b/package/python-mypy/python-mypy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mypy/json
-md5  9ea329f0a99bb98554683680b988c5ea  mypy-1.18.2.tar.gz
-sha256  06a398102a5f203d7477b2923dda3634c36727fa5c237d8f859ef90c42a9924b  mypy-1.18.2.tar.gz
+md5  a23b930a86aa298a97b72da06ee84084  mypy-1.19.1.tar.gz
+sha256  19d88bb05303fe63f71dd2c6270daca27cb9401c4ca8255fe50d1d920e0eb9ba  mypy-1.19.1.tar.gz
 # Locally computed sha256 checksums
-sha256  de341f6e031d021aab9eb27bdf713cc6fb844dee832ef3bcd4688bff5517220b  LICENSE
+sha256  fdf1cd17f50e1305ed8cfd37467312d27a984648dba622cef70573b5512e4e1b  LICENSE
diff --git a/package/python-mypy/python-mypy.mk b/package/python-mypy/python-mypy.mk
index ba07ef5b9c..3b19ce57cb 100644
--- a/package/python-mypy/python-mypy.mk
+++ b/package/python-mypy/python-mypy.mk
@@ -4,19 +4,21 @@
 #
 ################################################################################
 
-PYTHON_MYPY_VERSION = 1.18.2
+PYTHON_MYPY_VERSION = 1.19.1
 PYTHON_MYPY_SOURCE = mypy-$(PYTHON_MYPY_VERSION).tar.gz
-PYTHON_MYPY_SITE = https://files.pythonhosted.org/packages/c0/77/8f0d0001ffad290cef2f7f216f96c814866248a0b92a722365ed54648e7e
+PYTHON_MYPY_SITE = https://files.pythonhosted.org/packages/f5/db/4efed9504bc01309ab9c2da7e352cc223569f05478012b5d9ece38fd44d2
 PYTHON_MYPY_SETUP_TYPE = setuptools
-PYTHON_MYPY_LICENSE = Apache-2.0, Python-2.0.1
+PYTHON_MYPY_LICENSE = Apache-2.0, MIT (lib-rt), Python-2.0.1
 PYTHON_MYPY_LICENSE_FILES = LICENSE
 PYTHON_MYPY_DEPENDENCIES = \
+	host-python-librt \
 	host-python-mypy-extensions \
 	host-python-pathspec \
 	host-python-types-psutil \
 	host-python-types-setuptools \
 	host-python-typing-extensions
 HOST_PYTHON_MYPY_DEPENDENCIES = \
+	host-python-librt \
 	host-python-mypy-extensions \
 	host-python-pathspec \
 	host-python-types-psutil \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
