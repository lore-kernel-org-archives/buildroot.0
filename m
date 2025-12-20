Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC68E668B7
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 21:45:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3995809C3;
	Sat, 20 Dec 2025 21:45:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F7FetVMp4un5; Sat, 20 Dec 2025 21:45:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0012380968
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766267147;
	bh=zZmla605p3bp2NfqyCjqwqHlN2Ah+LLb0t9Mrh0LQu0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=NCBxBiOuL9O8121dMZdLkNdZPzmcHhs/rsenBIx5d8C8DPr0B7c8Ipxj5LJL1YXTz
	 RmkgkRNp3iAW2wv5zdMnqTY5O76HLn75tXnUEOc0HxioOczYDYE8z2woOb0Y8GOSTu
	 sWDQspCj6mN53f8bkETpXwPQIJTVnFIizDmkhxdv0I4aI0nH2E+qFmSVjo3qYl7WaP
	 5CfJe8AlpP8oQ/kzr1zejuwj3AVflqy9yWD6JMFhAOdUrsXaC5Yy1Yld2eyAgCl4SI
	 XOtiBoMZ1wn1UCsFJsh/aANiGpBD9spE3+7u9R0C0xRfr51YnZcXI1wWQM393B7C6C
	 6YvWOjoJ4uxQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0012380968;
	Sat, 20 Dec 2025 21:45:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 85AFA293
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:45:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37B1F4027C
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:45:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2GtdG8Rfxf-e for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 21:45:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 328654032D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 328654032D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 328654032D
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:45:43 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c714.dip0.t-ipconnect.de [79.214.199.20])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AB0E0A4C501C;
 Sat, 20 Dec 2025 22:42:11 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39116)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vX4iF-000000002DO-3Nav;
 Sat, 20 Dec 2025 21:42:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 22:42:03 +0100
Message-ID: <20251220214206.1089100-15-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251220214206.1089100-1-bernd@kuhls.net>
References: <20251220214206.1089100-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766266931;
 bh=zzBnpIRECXjdOy/NlWnu96M07e37YRmBYIsFQIe+ftU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=p7C5PgkIFPoVxurJV/j94nzWFeknwq3T90Rb4zjqgdAJHdiufUBPgFspwB+oLkb6F
 GnoxoXBbqdPtNzhMix9M8XngEM4GawB8ADGCPY3VHJCLYoTpgg7lP/9x7EGEs4R85y
 Wu8nnTxuz+JmvRyF7I8wqOOrcuQzOHox1N1jN54KCAkDS2a+3HAiKMxZCRjv2Vue0B
 76vRbTN4w3dreUk+KDmtqPqY0hpoZ77h4Xlyo3Izi4NYRJBEv0PQfUZsmP8QePv9j0
 THYiSBUaBOFNCB0d7q0FzUyRBreeUsGTZed8wCOQKbUUsEDwPxhZEX6Ga0gDR/3xsB
 q65jYgkpHrwzg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=p7C5PgkI
Subject: [Buildroot] [PATCH 15/18] package/python-iwlib: bump version to
 1.7.0
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
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Grzegorz Blach <grzegorz@blach.pl>, Joris Offouga <offougajoris@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/nhoad/python-iwlib/blob/1.7.0/README.rst
"1.6: Added support for Python 3 (via migration to CFFI)"

Switched SITE to pypi.

Added dependency to python-cffi:
https://github.com/nhoad/python-iwlib/commit/a7c14aff76a28004afb45e08bcf83be5948cb7c1

Updated package as computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-iwlib/Config.in         | 1 +
 package/python-iwlib/python-iwlib.hash | 6 ++++--
 package/python-iwlib/python-iwlib.mk   | 7 ++++---
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/package/python-iwlib/Config.in b/package/python-iwlib/Config.in
index eb28d674d9..e15ae38025 100644
--- a/package/python-iwlib/Config.in
+++ b/package/python-iwlib/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_IWLIB
 	bool "python-iwlib"
 	depends on BR2_PACKAGE_WIRELESS_TOOLS_LIB
+	select BR2_PACKAGE_PYTHON_CFFI # runtime
 	help
 	  python-iwlib is a package for interfacing with iwlib,
 	  providing an implementation to the wireless tools in Linux.
diff --git a/package/python-iwlib/python-iwlib.hash b/package/python-iwlib/python-iwlib.hash
index 4d71a3fea6..d1848e0bd7 100644
--- a/package/python-iwlib/python-iwlib.hash
+++ b/package/python-iwlib/python-iwlib.hash
@@ -1,3 +1,5 @@
-# Locally calculated
-sha256  7f1ad4354284a452388e178b5d9b191fa5a68a9183423a90a1d261ba2ebd1cac  python-iwlib-1.5.tar.gz
+# md5, sha256 from https://pypi.org/pypi/iwlib/json
+md5  66016f4f7f53128525d1f9d9de7a6fed  iwlib-1.7.0.tar.gz
+sha256  a805f6597a70ee3001aba8f039fb7b2dcb75dc15c4e7852f5594fd6379196da1  iwlib-1.7.0.tar.gz
+# Locally computed sha256 checksums
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/python-iwlib/python-iwlib.mk b/package/python-iwlib/python-iwlib.mk
index 9d0985567d..7a4fee7fc9 100644
--- a/package/python-iwlib/python-iwlib.mk
+++ b/package/python-iwlib/python-iwlib.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_IWLIB_VERSION = 1.5
-PYTHON_IWLIB_SITE = $(call github,nhoad,python-iwlib,$(PYTHON_IWLIB_VERSION))
+PYTHON_IWLIB_VERSION = 1.7.0
+PYTHON_IWLIB_SOURCE = iwlib-$(PYTHON_IWLIB_VERSION).tar.gz
+PYTHON_IWLIB_SITE = https://files.pythonhosted.org/packages/59/44/fd72c0a7094baeb448dc9e87b3d579da98e2b8593c3fe05c5f9dd20dc6bc
 PYTHON_IWLIB_LICENSE = GPL-2.0
 PYTHON_IWLIB_LICENSE_FILES = COPYING
 PYTHON_IWLIB_SETUP_TYPE = setuptools
-PYTHON_IWLIB_DEPENDENCIES = wireless_tools
+PYTHON_IWLIB_DEPENDENCIES = host-python-cffi wireless_tools
 
 $(eval $(python-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
