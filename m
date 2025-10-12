Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA4CCCCD187
	for <buildroot@archiver.kernel.org>; Sun, 12 Oct 2025 18:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90A3D80DBA;
	Sun, 12 Oct 2025 18:23:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6nZxWikFXjiu; Sun, 12 Oct 2025 18:23:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0CA6812CD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0CA6812CD;
	Sun, 12 Oct 2025 18:23:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B5BC12B
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 18:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D9254008B
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 18:23:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TJvTnbPlPCcn for <buildroot@buildroot.org>;
 Sun, 12 Oct 2025 18:23:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F210F40082
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F210F40082
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F210F40082
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 18:23:38 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 56D8CA4C6714;
 Sun, 12 Oct 2025 20:20:19 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45202)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v80g6-000000000yp-2dXP;
 Sun, 12 Oct 2025 18:20:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 12 Oct 2025 20:20:12 +0200
Message-ID: <20251012182016.2711834-17-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251012182016.2711834-1-bernd@kuhls.net>
References: <20251012182016.2711834-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760293219;
 bh=md+zhG3Gs8RnYi580O2R22BulOQmdFBAUpvWIH9xnyE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=G71WpB2YNiHRTVqwEAYdm9NuscOGIYR6wFghQw7iSftlteGCySOIK6+tKcY8aUuMW
 li0s4HpUe+K4YjHDBoSO2BVACHOlMrIC6Nvo5JUNwBzCudGBeCbifgMEpYsSOvguUX
 Qr7LvWUsgSuaqpnpc2tKREwN+UGFpOrVL44e3jA0LGDYKrnR0jN2zHXikYjWwsFZkH
 7aV1tOaxhD5sDN0Glmghiv6Sj104k9isRz4+UKjWnnimZv+RvWnNsKwlZ6x3k0NlWT
 kQc2Jv1xoHu3NlCq+/DYJMbZdVMYygfIUQQ8/xcFdrv8bc/3ohAYiWwcGANATHhENF
 WYBXIlAZSeJog==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=G71WpB2Y
Subject: [Buildroot] [PATCH 17/21] package/python-daphne: bump version to
 4.2.1
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
Cc: Attila Wagner <attila.wagner@onyxinsight.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Grzegorz Blach <grzegorz@blach.pl>,
 James Hilliard <james.hilliard1@gmail.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-daphne/python-daphne.hash | 4 ++--
 package/python-daphne/python-daphne.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-daphne/python-daphne.hash b/package/python-daphne/python-daphne.hash
index 194b73a0e4..e0619c6463 100644
--- a/package/python-daphne/python-daphne.hash
+++ b/package/python-daphne/python-daphne.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/daphne/json
-md5  6a00ce30210105fcd0f756d4dc5505f9  daphne-4.1.2.tar.gz
-sha256  fcbcace38eb86624ae247c7ffdc8ac12f155d7d19eafac4247381896d6f33761  daphne-4.1.2.tar.gz
+md5  10ce77cd61e3b048bac7fe4539800f37  daphne-4.2.1.tar.gz
+sha256  5f898e700a1fda7addf1541d7c328606415e96a7bd768405f0463c312fcb31b3  daphne-4.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-daphne/python-daphne.mk b/package/python-daphne/python-daphne.mk
index 097a195821..69f5a9f466 100644
--- a/package/python-daphne/python-daphne.mk
+++ b/package/python-daphne/python-daphne.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DAPHNE_VERSION = 4.1.2
+PYTHON_DAPHNE_VERSION = 4.2.1
 PYTHON_DAPHNE_SOURCE = daphne-$(PYTHON_DAPHNE_VERSION).tar.gz
-PYTHON_DAPHNE_SITE = https://files.pythonhosted.org/packages/1a/c1/aedf180beb12395835cba791ce7239b8880009d9d37564d72b7590cde605
+PYTHON_DAPHNE_SITE = https://files.pythonhosted.org/packages/cd/9d/322b605fdc03b963cf2d33943321c8f4405e8d82e698bf49d1eed1ca40c4
 PYTHON_DAPHNE_SETUP_TYPE = setuptools
 # https://github.com/django/daphne/blob/master/LICENSE
 PYTHON_DAPHNE_LICENSE = BSD-3-Clause
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
