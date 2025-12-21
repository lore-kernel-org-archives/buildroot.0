Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9BB8E66886
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 22:30:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 969D881801;
	Sun, 21 Dec 2025 22:30:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AN7-O4DVQf9y; Sun, 21 Dec 2025 22:30:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37FED81769
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766356220;
	bh=zZmla605p3bp2NfqyCjqwqHlN2Ah+LLb0t9Mrh0LQu0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=DTTKgbFwppsfFe37YGCYEYgXd6iGI0qfEhkDRzyJQ1lNCQsi1uY/qaWLqssrYjelT
	 pc5D7F40WeIkZRx9kbPB1NLuIRHEIdzFSdJ1NGm4hqz1QKuH5fCyi4Iduqo+2cHOxM
	 FMFHEBYqojjui4htb2lpvj0VzwDJGSkSgdYt8gx9Mlw8i5DjWo+2gm6p+cX1XdpkHy
	 aGvWEOwADRvaXnjMSU3V4uCSmc9z1Lc1pdCkpSc4LxNQwszhogD+b2gXpuROX+RVNm
	 RK3te72i5C3Q3yVu23dOJeXO3NAMgIfilB3dl7RpwBZxDvB2lFjeJ65krffhy2r54p
	 Tgoo9OldqN9tA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37FED81769;
	Sun, 21 Dec 2025 22:30:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A585E195
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:30:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C9FF407BA
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:30:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V0nPL_db9lJa for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 22:30:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7729B407A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7729B407A4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7729B407A4
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:30:17 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c75a.dip0.t-ipconnect.de [79.214.199.90])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4CAB6A4C4946;
 Sun, 21 Dec 2025 23:30:01 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46252)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vXRw8-000000004xC-34vz;
 Sun, 21 Dec 2025 22:30:00 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 21 Dec 2025 23:29:54 +0100
Message-ID: <20251221223000.184312-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766356201;
 bh=zzBnpIRECXjdOy/NlWnu96M07e37YRmBYIsFQIe+ftU=;
 h=From:To:Cc:Subject:Date:From;
 b=de3yxc7S8NmY7mQ+5yegm/RuxaFQZ6TJKkkREuVs5l/0tocqwPZyzKK8prypkRSqu
 CTTlrMD/wP9mytwFRExGsBrKvE49ROezZAjYJDWfvYG/zB/1HMnoVTTX8908fzT9dW
 9a9rLAjdL+46ZbJGP8WPzQqRaFwH2JfUAId2iJgQeDOYEfj/Fii1dNwg8qoY8K2KwX
 w1i9ifKF9ppmedU3CURo/kQsa7ZB0KvnFZ3cubZKNWtiG6hSxdBMWJwS/8D/MXXSUk
 zR57FyheMz66gex6cr3daFDv5ygvXLHhqffkPWolBD2KsCTBI4DPPNxyimLI04KAeY
 zWQaS0Ij1BjHQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=de3yxc7S
Subject: [Buildroot] [PATCH 1/7] package/python-iwlib: bump version to 1.7.0
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
 Marcin Niestroj <m.niestroj@grinn-global.com>
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
