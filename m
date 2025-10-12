Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD84CCD187
	for <buildroot@archiver.kernel.org>; Sun, 12 Oct 2025 20:24:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51ADF60DAA;
	Sun, 12 Oct 2025 20:24:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j3vHeJlQkp-S; Sun, 12 Oct 2025 20:24:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7949560B69
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7949560B69;
	Sun, 12 Oct 2025 20:24:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BE05DBC
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 20:24:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD70060B69
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 20:24:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w8hecuhvbxTQ for <buildroot@buildroot.org>;
 Sun, 12 Oct 2025 20:24:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AEC4B60A83
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEC4B60A83
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AEC4B60A83
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 20:24:10 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 397CBA4C6724;
 Sun, 12 Oct 2025 22:20:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39868)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v82Y0-000000004zD-2KFs;
 Sun, 12 Oct 2025 20:20:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 12 Oct 2025 22:20:01 +0200
Message-ID: <20251012202002.178080-22-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251012202002.178080-1-bernd@kuhls.net>
References: <20251012202002.178080-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760300405;
 bh=5X8IpW88bKIwGHnkiljSSnhSVhuDSXIVBaJNfSoFHls=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=C6JiFUt7Cn7/5IpWVJhBLEVHdEUi4dH+uCu9HPIONXi3mD/EuAyjgJ0C4+eGKzNT2
 htwGLbBgpoc1YqbUrxyTX2Z6ODGnYOhIYWMYuOs57yRGpA3iGh124KPk72pZINFCnw
 Bv5dDzEjvN5rSpQHremYs5znRE+09VDc+r31d/+kAjaPKlh8ffM89i5L+cfjrW4qvM
 A8+QP3ILr3B1f7b+Wpz8UXlT3wP6fVXerWvhRQ1/vdITI26Q+BL01Cd7KmgDYBZGKd
 XCQXMa/I4unugPON4PlyVA1iO4idvpBBQYzhdjLdOixmzgfRFZmuO53Qre7+L0Kft+
 54RuEiePTYu7A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=C6JiFUt7
Subject: [Buildroot] [PATCH 22/23] package/python-mypy: bump version to
 1.18.2
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
Cc: Grzegorz Blach <grzegorz@blach.pl>,
 James Hilliard <james.hilliard1@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-mypy/python-mypy.hash | 4 ++--
 package/python-mypy/python-mypy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-mypy/python-mypy.hash b/package/python-mypy/python-mypy.hash
index ff49a92b18..9f1656ddce 100644
--- a/package/python-mypy/python-mypy.hash
+++ b/package/python-mypy/python-mypy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mypy/json
-md5  fb9ff268550456e6d100a21e02fc6574  mypy-1.18.1.tar.gz
-sha256  9e988c64ad3ac5987f43f5154f884747faf62141b7f842e87465b45299eea5a9  mypy-1.18.1.tar.gz
+md5  9ea329f0a99bb98554683680b988c5ea  mypy-1.18.2.tar.gz
+sha256  06a398102a5f203d7477b2923dda3634c36727fa5c237d8f859ef90c42a9924b  mypy-1.18.2.tar.gz
 # Locally computed sha256 checksums
 sha256  de341f6e031d021aab9eb27bdf713cc6fb844dee832ef3bcd4688bff5517220b  LICENSE
diff --git a/package/python-mypy/python-mypy.mk b/package/python-mypy/python-mypy.mk
index 6127975756..ba07ef5b9c 100644
--- a/package/python-mypy/python-mypy.mk
+++ b/package/python-mypy/python-mypy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MYPY_VERSION = 1.18.1
+PYTHON_MYPY_VERSION = 1.18.2
 PYTHON_MYPY_SOURCE = mypy-$(PYTHON_MYPY_VERSION).tar.gz
-PYTHON_MYPY_SITE = https://files.pythonhosted.org/packages/14/a3/931e09fc02d7ba96da65266884da4e4a8806adcdb8a57faaacc6edf1d538
+PYTHON_MYPY_SITE = https://files.pythonhosted.org/packages/c0/77/8f0d0001ffad290cef2f7f216f96c814866248a0b92a722365ed54648e7e
 PYTHON_MYPY_SETUP_TYPE = setuptools
 PYTHON_MYPY_LICENSE = Apache-2.0, Python-2.0.1
 PYTHON_MYPY_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
