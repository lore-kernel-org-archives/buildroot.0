Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E1A6CCD184
	for <buildroot@archiver.kernel.org>; Sun, 12 Oct 2025 20:24:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33332608EB;
	Sun, 12 Oct 2025 20:24:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id URCOG0tMMmCO; Sun, 12 Oct 2025 20:24:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F42F60A83
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F42F60A83;
	Sun, 12 Oct 2025 20:24:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FB5CBC
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 20:24:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E25E60AFD
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 20:23:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nirr2MC8Nh9P for <buildroot@buildroot.org>;
 Sun, 12 Oct 2025 20:23:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 530AC60AFE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 530AC60AFE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 530AC60AFE
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 20:23:58 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 002A7A4C6723;
 Sun, 12 Oct 2025 22:20:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39868)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v82Y0-000000004zD-0wrE;
 Sun, 12 Oct 2025 20:20:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 12 Oct 2025 22:19:57 +0200
Message-ID: <20251012202002.178080-18-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251012202002.178080-1-bernd@kuhls.net>
References: <20251012202002.178080-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760300405;
 bh=qQzkTJhk988KWmHKTflSLT/zKvepCKf/AQBqLPyIu9g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=dEOTcbXrVYV/2N+o90gcC8aDvlfnhDjbtehhwAa54nxpbHL+rghqH9WLbrsgSW8SL
 fknhQ+VyrXU8Ce4swc1izxKy0wk/iQfUxPICorrc5r4+5W1/saTjScRQUxK+A/uLDH
 5VOtx7sdMEuC3Ra3g6ib9nYQa7U7bey4bSc7GDg7Bmzh7dRuExCblFc0jiFYgVo8zN
 Z/pvgxyALqNjCv7vaB21pGJzgXPE4W2//3N36q0+XKnKxQtTpMsCz8MUPOhQhQkEUN
 JfCVeIiWfl4SUb3oQQo9CveXCm3062NaL0h1RDGNbgKndKTOegDRvg0Eh4somxy6y+
 3yPmwgAhkpwmQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=dEOTcbXr
Subject: [Buildroot] [PATCH 18/23] package/python-mako: bump version to
 1.3.10
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

Release notes:
https://github.com/sqlalchemy/mako/releases/tag/rel_1_3_10
https://github.com/sqlalchemy/mako/releases/tag/rel_1_3_9

Update license hash due to copyright year bump:
https://github.com/sqlalchemy/mako/commit/798abe413d936f9741d9091c7c814f2e6faa5a26

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-mako/python-mako.hash | 6 +++---
 package/python-mako/python-mako.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-mako/python-mako.hash b/package/python-mako/python-mako.hash
index 580c90da35..b6706aa1ad 100644
--- a/package/python-mako/python-mako.hash
+++ b/package/python-mako/python-mako.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mako/json
-md5  8e6f349493b5c545795e4f6451e070dd  mako-1.3.8.tar.gz
-sha256  577b97e414580d3e088d47c2dbbe9594aa7a5146ed2875d4dfa9075af2dd3cc8  mako-1.3.8.tar.gz
+md5  c9dfb2bf42827459dd505c60f2262a7c  mako-1.3.10.tar.gz
+sha256  99579a6f39583fa7e5630a28c3c1f440e4e97a414b80372649c0ce338da2ea28  mako-1.3.10.tar.gz
 # Locally computed sha256 checksums
-sha256  15627b36b38d0729cdd686df9abf606503d99d624b2f5ec5cb254a75d5afa891  LICENSE
+sha256  68d7064e53e3ffa8e9f420a9e604bd2e2059d9c330492fa6ebd4eb3d48111689  LICENSE
diff --git a/package/python-mako/python-mako.mk b/package/python-mako/python-mako.mk
index 19cd2fc6f1..1dc59f002c 100644
--- a/package/python-mako/python-mako.mk
+++ b/package/python-mako/python-mako.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MAKO_VERSION = 1.3.8
+PYTHON_MAKO_VERSION = 1.3.10
 PYTHON_MAKO_SOURCE = mako-$(PYTHON_MAKO_VERSION).tar.gz
-PYTHON_MAKO_SITE = https://files.pythonhosted.org/packages/5f/d9/8518279534ed7dace1795d5a47e49d5299dd0994eed1053996402a8902f9
+PYTHON_MAKO_SITE = https://files.pythonhosted.org/packages/9e/38/bd5b78a920a64d708fe6bc8e0a2c075e1389d53bef8413725c63ba041535
 PYTHON_MAKO_SETUP_TYPE = setuptools
 PYTHON_MAKO_LICENSE = MIT
 PYTHON_MAKO_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
