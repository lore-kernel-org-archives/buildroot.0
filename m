Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52272CCD187
	for <buildroot@archiver.kernel.org>; Sun, 12 Oct 2025 18:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29136812E6;
	Sun, 12 Oct 2025 18:23:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w2NLVoH2nWl7; Sun, 12 Oct 2025 18:23:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44918812F6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44918812F6;
	Sun, 12 Oct 2025 18:23:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B1C4512B
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 18:23:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A434940D36
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 18:23:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1UxAd05UFDl1 for <buildroot@buildroot.org>;
 Sun, 12 Oct 2025 18:23:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AA26040D2A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA26040D2A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AA26040D2A
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 18:23:02 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CFCE1A4C6710;
 Sun, 12 Oct 2025 20:20:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45202)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v80g6-000000000yp-16QA;
 Sun, 12 Oct 2025 18:20:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 12 Oct 2025 20:20:09 +0200
Message-ID: <20251012182016.2711834-14-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251012182016.2711834-1-bernd@kuhls.net>
References: <20251012182016.2711834-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760293218;
 bh=DbJVjdpns+MEFuyBTmh54AnQcxuWNyRA2X7uqZrroTg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=qjaE1lXqJDFhH1xfBXt8S7zDwFcoqGe7kBMul9qXYFkXUz5+EaNw3dVGJinabwLKC
 vpcDVD9NgUus4Il2QG7iSKQ/1zSJzGKUHIjcdbIDV2JRUy7wopabWUEu6qL9RpHNHs
 41Z+jVwG7LdxSizkqsAMg/nhyrXP7etDsfJx2btma6WTW3U92oKaIxLSBFELav2Pa2
 UFv/pKJ+pusS2A+Dd3Y5Ajsmc9Ro0n/t5eKSmws6EtQB2nWsqgH2O+tyqaH+GODMQJ
 LStU4KVS2Py2gT8JinDyArqpC32sw099oKGk4aouD6YQVKtmhyCDZTPr27xyjlgLUC
 V7OSChVKE1hrQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=qjaE1lXq
Subject: [Buildroot] [PATCH 14/21] package/python-channels: bump version to
 4.3.1
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
 package/python-channels/python-channels.hash | 4 ++--
 package/python-channels/python-channels.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-channels/python-channels.hash b/package/python-channels/python-channels.hash
index 0d849f9a57..8b402cdcd2 100644
--- a/package/python-channels/python-channels.hash
+++ b/package/python-channels/python-channels.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/channels/json
-md5  172a3c580efc46ff3cbfacd59084356a  channels-4.2.0.tar.gz
-sha256  d9e707487431ba5dbce9af982970dab3b0efd786580fadb99e45dca5e39fdd59  channels-4.2.0.tar.gz
+md5  f1c7e533a0afa026b61dd3cf228dbd18  channels-4.3.1.tar.gz
+sha256  97413ffd674542db08e16a9ef09cd86ec0113e5f8125fbd33cf0854adcf27cdb  channels-4.3.1.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-channels/python-channels.mk b/package/python-channels/python-channels.mk
index 83584b469b..cafabf2676 100644
--- a/package/python-channels/python-channels.mk
+++ b/package/python-channels/python-channels.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CHANNELS_VERSION = 4.2.0
+PYTHON_CHANNELS_VERSION = 4.3.1
 PYTHON_CHANNELS_SOURCE = channels-$(PYTHON_CHANNELS_VERSION).tar.gz
-PYTHON_CHANNELS_SITE = https://files.pythonhosted.org/packages/96/e2/10d949dca9eb8a85c5735efefe3309033419e7d4f4193a70f6ede58b2951
+PYTHON_CHANNELS_SITE = https://files.pythonhosted.org/packages/12/a0/46450fcf9e56af18a6b0440ba49db6635419bb7bc84142c35f4143b1a66c
 PYTHON_CHANNELS_SETUP_TYPE = setuptools
 PYTHON_CHANNELS_LICENSE = BSD-3-Clause
 PYTHON_CHANNELS_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
