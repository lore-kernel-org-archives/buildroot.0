Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C97E66886
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 22:30:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58E00807FC;
	Sun, 21 Dec 2025 22:30:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MSbQ-7X-phJl; Sun, 21 Dec 2025 22:30:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 768018080B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766356256;
	bh=GRbAdsM0PGr9fr1fpGUEdi3Grv39HhJHPZL8nCX7Qpc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=pO0G09k3w8pDnmcihBJOlThh/Enp2LjueVwOX4X6pk1cyIAblgYAWiBIgDzvi8LJ4
	 14RQZbwKAqmHGy2g9QxwB7ZpV4uggq6A3imwuDvnyB7Ksr/T7QAo4++hZ3Ygmc/Wvq
	 FnThKffsST5aC19/K/T9vNOq3cyyqpZ1ee4Mh3TUnh9sW7Q9GG7ulBXjKxhZVHvkdD
	 fmoj7MY9fwrziCzk3rxf6yWLrcKwMQ0IoYHb1TE1Aymxaz/MYP88WWlg93znZgY938
	 5HBJBZ2z2//0jsQL4F8QYWvbl/QsdVlbPV82IIvvUFNS/Vl5MBxEkQwDQVCb0UIrpj
	 eknJ07DhDIsxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 768018080B;
	Sun, 21 Dec 2025 22:30:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1184A119
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:30:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 03D68402A4
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:30:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PYZLXnXfkb6J for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 22:30:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C1C744026A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1C744026A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C1C744026A
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:30:53 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c75a.dip0.t-ipconnect.de [79.214.199.90])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 26F08A4C4E0D;
 Sun, 21 Dec 2025 23:30:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46252)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vXRw9-000000004xC-0CQc;
 Sun, 21 Dec 2025 22:30:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 21 Dec 2025 23:29:58 +0100
Message-ID: <20251221223000.184312-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251221223000.184312-1-bernd@kuhls.net>
References: <20251221223000.184312-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766356202;
 bh=7Ln1cx4OhkwTY7evLuTwCogZYCKp6mCFCVRXomB7vQ4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=hvVZLHFTPvNQiUnDO0v4eyabbvD35rDn+LgBkCnobaXrv539KUxr/lcoCzA/6ySVM
 Hc30ICFv7zFJNTqAkdYm9hW7LYrq2ezun4OGYUTi9tztZSgiz8vCDDGZyFvpGbO1NX
 3m0LDSyeXpBFlfCCKdqj1C+2/E3sKLXMgNEx1ALXNvb+Kw9ws4CHgXjVSRL0dGvY4t
 MvikQfLdtvij4tIM6vi16+SjQgHBm56JhjJXgBdlDMvZ2AWAr4wnWowGmTP/Z7JiH/
 R3GoWTkTk6A4srQIp19TfcKY+mFcXg3fagGhfIvyIDi1IwDik4WccrN5AGei1rAKIh
 vMyyGlEjELncg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=hvVZLHFT
Subject: [Buildroot] [PATCH 5/7] package/python-pylibfdt: bump version to
 1.7.2.post1
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-pylibfdt/python-pylibfdt.hash | 4 ++--
 package/python-pylibfdt/python-pylibfdt.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pylibfdt/python-pylibfdt.hash b/package/python-pylibfdt/python-pylibfdt.hash
index 456fe41005..80459b3e28 100644
--- a/package/python-pylibfdt/python-pylibfdt.hash
+++ b/package/python-pylibfdt/python-pylibfdt.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pylibfdt/json
-md5  78859f23154da8c951770f2c5287804e  pylibfdt-1.7.2.tar.gz
-sha256  b18c6c40400ed4374d0a142dcdb07e5402574ff1304454019a1fd92735b54756  pylibfdt-1.7.2.tar.gz
+md5  206a0504f3d0f5895c00f572bc367e54  pylibfdt-1.7.2.post1.tar.gz
+sha256  08ec69755f7565dc25e4e640e0315795888d4caeb7f146de4e05bf12b03c94c8  pylibfdt-1.7.2.post1.tar.gz
 # Locally computed sha256 checksums
 sha256  6313108c23efffa36948f8b2cff1560a5935373b527b0e1a837cc77e6ed1bacd  BSD-2-Clause
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  GPL
diff --git a/package/python-pylibfdt/python-pylibfdt.mk b/package/python-pylibfdt/python-pylibfdt.mk
index 7d7398a995..483ac773c4 100644
--- a/package/python-pylibfdt/python-pylibfdt.mk
+++ b/package/python-pylibfdt/python-pylibfdt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYLIBFDT_VERSION = 1.7.2
+PYTHON_PYLIBFDT_VERSION = 1.7.2.post1
 PYTHON_PYLIBFDT_SOURCE = pylibfdt-$(PYTHON_PYLIBFDT_VERSION).tar.gz
-PYTHON_PYLIBFDT_SITE = https://files.pythonhosted.org/packages/b1/cc/54fc80135b3eb7fcbfded65eee7c71b2b970b5124e3066a158421222f191
+PYTHON_PYLIBFDT_SITE = https://files.pythonhosted.org/packages/a2/b8/ef881f0e76af7727ca9c5e27a121db69667c69e4e91eceaafe97f3666a6c
 PYTHON_PYLIBFDT_SETUP_TYPE = pep517
 PYTHON_PYLIBFDT_LICENSE = BSD-2-Clause or GPL-2.0+
 PYTHON_PYLIBFDT_LICENSE_FILES = BSD-2-Clause GPL
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
