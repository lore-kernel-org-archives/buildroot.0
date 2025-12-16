Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD01BD637A4
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 19:44:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 824E460DA1;
	Tue, 16 Dec 2025 19:44:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D5vhHAgND76h; Tue, 16 Dec 2025 19:44:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B162360F83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765914242;
	bh=MRTidsjKR5zj7TlkSMSw2zXxWYwQ4jpZWyBHO2PXyIE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=JjABEZiHmVfIC1XtiShTarFf1zbPCDUN2FV9lSEsoa9yB/sHHbNliPKVJG+keLp7r
	 nhWA9NofDaAjee+xC7dlSycZHxU5KVVnR3V/JnVhryyyKOza2qxwGfRaqScmzcrsX2
	 /YdsKneNoeS96Jo1qdJe0JvRkpe+e1jXokPPcGF1aOg5SUCZaYvm0BfkKZtrqsUcxc
	 UXG8VJozqcy0cpujIvYh1O+6fa8RUVNpaZkhKkxkkXn9EupgLZzP+Ov0hvcOsxfOg0
	 WKTwALaRtO/oOKAgQpOVRfl8L0/0e0MjFYWmKvdQ/y9sPxGVkMULG1cmo84lbhka5o
	 CiLgHHXvPo9yw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B162360F83;
	Tue, 16 Dec 2025 19:44:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B1B35372
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:44:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A05CA60F83
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:44:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iACfyt9s6HTa for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 19:44:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 56EBE60DA1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56EBE60DA1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 56EBE60DA1
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:44:00 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A16EAA4C45BE;
 Tue, 16 Dec 2025 20:41:30 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47366)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVav9-000000000Bj-3r4e;
 Tue, 16 Dec 2025 19:41:20 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 16 Dec 2025 20:41:07 +0100
Message-ID: <20251216194119.3020421-14-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251216194119.3020421-1-bernd@kuhls.net>
References: <20251216194119.3020421-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765914090;
 bh=vCCo4sZuQFW1i54RnZpAK4ZVUCqi2WsuWzDSU0uXwT8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=TAnaptPoSl3pHDAhTgiimDaI8Se347eeQZLumMLVmhczTGmM0QnRolLLJ8wtPrJxY
 WvuFAPC/q+GmT4MjvOXAD34plU/qKxy4s4UWOn5Bhl82u9t/iOEPJppnVOWjsvEG+w
 /owa3q2wXQE1CWOaadhASh/UD2zTRo/qXEs5Swr+8XweWBI7/dit5EtXMeUf8Kd2+y
 1OqyP+VbjUAHOLKt218izO29JXiVhbAPsDqF8cZtxIGwlRdIMk1TtGpyTaNmlb2EAM
 bMZVMzroFvuO4fIUqkzsqOhyrYAH+QbZR7J6Rstk1TtHM+VvjNa83ZddhsLvVBuwmA
 rTSpWPSGOk4tA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=TAnaptPo
Subject: [Buildroot] [PATCH 14/26] package/python-types-psutil: bump version
 to 7.1.3.20251211
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

https://github.com/typeshed-internal/stub_uploader/blob/main/data/changelogs/psutil.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-types-psutil/python-types-psutil.hash | 4 ++--
 package/python-types-psutil/python-types-psutil.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-types-psutil/python-types-psutil.hash b/package/python-types-psutil/python-types-psutil.hash
index a1d673f2b1..b301237599 100644
--- a/package/python-types-psutil/python-types-psutil.hash
+++ b/package/python-types-psutil/python-types-psutil.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/types-psutil/json
-md5  411972eff624e78ca26706d297cde546  types_psutil-6.1.0.20241221.tar.gz
-sha256  600f5a36bd5e0eb8887f0e3f3ff2cf154d90690ad8123c8a707bba4ab94d3185  types_psutil-6.1.0.20241221.tar.gz
+md5  4a65c910d089e87ab722151b4ff11792  types_psutil-7.1.3.20251211.tar.gz
+sha256  2c25f8fd3a1a4aebdffb861b97755c9a2d5d8019dd6ec1a2f2a77ec796652c89  types_psutil-7.1.3.20251211.tar.gz
 # Locally computed sha256 checksums
 sha256  295f8538c94ae5c3043301cf7cff1c852dab6a786a8ddee471e061b40d5ecabe  LICENSE
diff --git a/package/python-types-psutil/python-types-psutil.mk b/package/python-types-psutil/python-types-psutil.mk
index 50ae884c85..8c0d681c72 100644
--- a/package/python-types-psutil/python-types-psutil.mk
+++ b/package/python-types-psutil/python-types-psutil.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPES_PSUTIL_VERSION = 6.1.0.20241221
+PYTHON_TYPES_PSUTIL_VERSION = 7.1.3.20251211
 PYTHON_TYPES_PSUTIL_SOURCE = types_psutil-$(PYTHON_TYPES_PSUTIL_VERSION).tar.gz
-PYTHON_TYPES_PSUTIL_SITE = https://files.pythonhosted.org/packages/44/8c/5f82cd554cc5bb79d137f082e4c9f8d22e85c8c08dabee4971d422a9abdd
+PYTHON_TYPES_PSUTIL_SITE = https://files.pythonhosted.org/packages/d2/d5/85165865b060fed80b5991574c2ae0ddfd4786398dc8bceddfe0a8960b74
 PYTHON_TYPES_PSUTIL_SETUP_TYPE = setuptools
 PYTHON_TYPES_PSUTIL_LICENSE = Apache-2.0
 PYTHON_TYPES_PSUTIL_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
