Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2165CCD184
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 18:53:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98901415D6;
	Tue, 14 Oct 2025 18:53:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e0GvZ4qat43N; Tue, 14 Oct 2025 18:53:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA5FD40F63
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA5FD40F63;
	Tue, 14 Oct 2025 18:53:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6AB59BC
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:53:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 68142415D6
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:53:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OVJUaUjx8p9K for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 18:53:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5F1CC40F63
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F1CC40F63
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5F1CC40F63
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:53:44 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DA9CAA4C6C3E;
 Tue, 14 Oct 2025 20:51:14 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49012)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v8k77-000000003qG-3HJj;
 Tue, 14 Oct 2025 18:51:14 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 14 Oct 2025 20:51:12 +0200
Message-ID: <20251014185113.3583315-13-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251014185113.3583315-1-bernd@kuhls.net>
References: <20251014185113.3583315-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760467874;
 bh=GLzYFAnYeiGNOL8DUcOWgmHHovvLGcViHM37iXNg6H8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=bfr+j+f5MN1qTYQFQX877aL03cgIS7BU9Juc5UjKjo6i8HFCW8uC7xtu0H0x9OzXG
 2DB0hhi/iru4vxM5RGTaCn0OKkGtOBY+CtnGvleWyk9YNaYe1iGQGggOSO25khVlTI
 DsZqhClSI4/Idb35kioHTgnKDDTftur0dSgww0uYSPZ7g3VaatXJO5v+yBOzE5ZGEC
 NjumSC7FWdexCgNTn3Wf7rrVQXXwzVtmO1zCqJMazKwtFvz29RnKuoNcAamOzIXgTF
 BNun3yQqzenzaJmYl7ydLbCf5f8y/XxsXzrgrx6aL0HKVA1Yea3bo8erD6zH0WgfHW
 EolyuhTN0oktQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=bfr+j+f5
Subject: [Buildroot] [PATCH 13/14] package/python-pyasn1-modules: bump
 version to 0.4.2
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
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 James Hilliard <james.hilliard1@gmail.com>,
 Vinicius Tinti <viniciustinti@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-pyasn1-modules/python-pyasn1-modules.hash | 4 ++--
 package/python-pyasn1-modules/python-pyasn1-modules.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyasn1-modules/python-pyasn1-modules.hash b/package/python-pyasn1-modules/python-pyasn1-modules.hash
index fd7b732791..7d45c7c9af 100644
--- a/package/python-pyasn1-modules/python-pyasn1-modules.hash
+++ b/package/python-pyasn1-modules/python-pyasn1-modules.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyasn1-modules/json
-md5  2cb6c7001ac5caa2ead3ad2d28c9a43e  pyasn1_modules-0.4.1.tar.gz
-sha256  c28e2dbf9c06ad61c71a075c7e0f9fd0f1b0bb2d2ad4377f240d33ac2ab60a7c  pyasn1_modules-0.4.1.tar.gz
+md5  799696cd892940f63904dcd9b0fa96bf  pyasn1_modules-0.4.2.tar.gz
+sha256  677091de870a80aae844b1ca6134f54652fa2c8c5a52aa396440ac3106e941e6  pyasn1_modules-0.4.2.tar.gz
 # Locally computed sha256 checksums
 sha256  2aad5fc00f705c4a1addb83eed10a6a75d286a3779f0cf8519d87e62bc4735fd  LICENSE.txt
diff --git a/package/python-pyasn1-modules/python-pyasn1-modules.mk b/package/python-pyasn1-modules/python-pyasn1-modules.mk
index 7087d5c44d..4398e1350e 100644
--- a/package/python-pyasn1-modules/python-pyasn1-modules.mk
+++ b/package/python-pyasn1-modules/python-pyasn1-modules.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYASN1_MODULES_VERSION = 0.4.1
+PYTHON_PYASN1_MODULES_VERSION = 0.4.2
 PYTHON_PYASN1_MODULES_SOURCE = pyasn1_modules-$(PYTHON_PYASN1_MODULES_VERSION).tar.gz
-PYTHON_PYASN1_MODULES_SITE = https://files.pythonhosted.org/packages/1d/67/6afbf0d507f73c32d21084a79946bfcfca5fbc62a72057e9c23797a737c9
+PYTHON_PYASN1_MODULES_SITE = https://files.pythonhosted.org/packages/e9/e6/78ebbb10a8c8e4b61a59249394a4a594c1a7af95593dc933a349c8d00964
 PYTHON_PYASN1_MODULES_SETUP_TYPE = setuptools
 PYTHON_PYASN1_MODULES_LICENSE = BSD-2-Clause
 PYTHON_PYASN1_MODULES_LICENSE_FILES = LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
