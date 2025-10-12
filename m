Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC78CCD184
	for <buildroot@archiver.kernel.org>; Sun, 12 Oct 2025 18:22:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E66AB8125E;
	Sun, 12 Oct 2025 18:22:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HvUftku1gzkq; Sun, 12 Oct 2025 18:22:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0481E8126E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0481E8126E;
	Sun, 12 Oct 2025 18:22:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A5EA912B
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 18:22:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C2EE4008B
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 18:22:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L3eAID5BA3t2 for <buildroot@buildroot.org>;
 Sun, 12 Oct 2025 18:22:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 88AA040082
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88AA040082
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 88AA040082
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 18:22:02 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7A152A4C670C;
 Sun, 12 Oct 2025 20:20:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45202)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v80g5-000000000yp-1rPH;
 Sun, 12 Oct 2025 18:20:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 12 Oct 2025 20:20:02 +0200
Message-ID: <20251012182016.2711834-7-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251012182016.2711834-1-bernd@kuhls.net>
References: <20251012182016.2711834-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760293218;
 bh=eVKbs7j5zG5+WGhck3+wRX0IVGC6txuEHoLtTqYMFFk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Z03OT1tspXf5iQucHISERQ6+OhfqtiSL5Wdhtc6wo49gZYcxr3qDoonls/GWwBQsT
 YqQAzlTcu5SyROJL992cVtQz1e9ErDGKXA30VgmdVm1Eq1f4YqWhCbu1MOMIgnmtvm
 v73qtGt/sxo+y8lFlKD+IFmcysIZnfM4NGvLvJ2n8SOz9wEe8k+kJfIGykzFoBxPUr
 lt1Ybapmew3n7ZyKnVObHuYeLCpzXZ+hgWShM5pNfLcOMw+lY089FEsUmnb/hsoICD
 3o1u13MmbQ/5dkaxsFGtGlqAz9Ee/gBtbdRqd9sZZThTrDBe0gB+i6P19GCAxChMoc
 eM8SNz6fHAO1Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=Z03OT1ts
Subject: [Buildroot] [PATCH 07/21] package/python-bluezero: bump version to
 0.9.1
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

Release notes:
https://github.com/ukBaz/python-bluezero/commit/a4b2731affa3806fa74509e6c0049dfc6474359f

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-bluezero/python-bluezero.hash | 4 ++--
 package/python-bluezero/python-bluezero.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-bluezero/python-bluezero.hash b/package/python-bluezero/python-bluezero.hash
index 150a384223..6cf334b08c 100644
--- a/package/python-bluezero/python-bluezero.hash
+++ b/package/python-bluezero/python-bluezero.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bluezero/json
-md5  8bace06486618fceca632aedc2733027  bluezero-0.9.0.tar.gz
-sha256  2512935e094e3afd21ca9d4cb1b9aaa88a524e9538ae81305b2086f09f0eee17  bluezero-0.9.0.tar.gz
+md5  2c567d4a6bf2bf03c9131b69695700ac  bluezero-0.9.1.tar.gz
+sha256  82488a9dc264f6114bb9727cc7e8939fa3a8d08fd71384cdab31419a80d25f97  bluezero-0.9.1.tar.gz
 # Locally computed sha256 checksums
 sha256  59319e80b4caa94ace4817c9f84aa16abc9d4d2b5f7866251b5fda92e87ccdef  LICENSE
diff --git a/package/python-bluezero/python-bluezero.mk b/package/python-bluezero/python-bluezero.mk
index 81e7363fc7..071085c644 100644
--- a/package/python-bluezero/python-bluezero.mk
+++ b/package/python-bluezero/python-bluezero.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BLUEZERO_VERSION = 0.9.0
+PYTHON_BLUEZERO_VERSION = 0.9.1
 PYTHON_BLUEZERO_SOURCE = bluezero-$(PYTHON_BLUEZERO_VERSION).tar.gz
-PYTHON_BLUEZERO_SITE = https://files.pythonhosted.org/packages/7b/9c/bfb3e1f92dd39bf3de8fc483a102bfae763fbf156177b77ed96b8a38bbb1
+PYTHON_BLUEZERO_SITE = https://files.pythonhosted.org/packages/ca/09/2aec91949397d15acb794648d65646e27f0e9f999a0da962e73023198663
 PYTHON_BLUEZERO_SETUP_TYPE = setuptools
 PYTHON_BLUEZERO_LICENSE = MIT
 PYTHON_BLUEZERO_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
