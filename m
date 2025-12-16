Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23133D637A1
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 19:46:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EEB9E605E8;
	Tue, 16 Dec 2025 19:46:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KWmcf3Op8ll4; Tue, 16 Dec 2025 19:46:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E8E360681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765914362;
	bh=D+ExF1xjPnpTWH200ip1XssGvKsC7+GGeUDLF4rdYkE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=I6aL6u3Enu24WQTumaXpVENRZisFlh+4nndS+747SAWq4F5hqW+lcTrrczRzKWz9a
	 xhSZmBEpW1fb5yMz8N3Yon6wjbcqz1SSFDOqG1QGzB6ZjKfjVJUzML8BpoRP3yJ9+r
	 0OXcdnrqpDAGJUnLEa585f3LF2KRBEVRtWbqI1pjwXA8nMP0QqGkZh/5R2L9PybW0L
	 jG3bskxdPm1fmAvYW2OtKtCkIFJk8DwUOzVh+AifZNJ9ZX5hNmS5bWSXxsfVnMBt7k
	 F5K+FiKROK+9XJIiyy0m7DEWSMFz73ojenKJhs5AhNlBQS16OJkqRvG670J6FynAG9
	 ZWeh5kKspfKlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E8E360681;
	Tue, 16 Dec 2025 19:46:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E308E364
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D5B1C4055A
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:46:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b65LPCaHF9CO for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 19:46:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BCEB94054F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCEB94054F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BCEB94054F
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:45:59 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5A180A4C4603;
 Tue, 16 Dec 2025 20:41:32 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47366)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVavA-000000000Bj-2npc;
 Tue, 16 Dec 2025 19:41:21 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 16 Dec 2025 20:41:17 +0100
Message-ID: <20251216194119.3020421-24-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251216194119.3020421-1-bernd@kuhls.net>
References: <20251216194119.3020421-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765914092;
 bh=fvV/CZ++3dx15nKsL3vB2CB6d0Y4o1djz5y+Li6WN5w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=qBYqbWSm6Df/ArcPFY4/FCgRIuhiTu6HwG092CcwJSHPDD8PNXbTByikKbx+RddZg
 xzjHL877vp4M1hgZ4IVKhJuRig5L0DUPimdKzxLNgH5SdiX4U7o7RxyUWH3OpfMF/B
 5B2OAiudn+RDG/X5D8bQcbuSf0l4Yvd9tAkI7tv90JKvid/fc5YsHkZQwDuAT+xkOO
 9B/SbxdcAkBF6dsQEBmeFfyDbAandp3PQ2yLaXea5O7cnPWMoKPjaYzRbyZ3YO5GHo
 GPrTOsOFuc9oCURWwg9OmJl8K/6dnpH6SE11wmt4bLW9vn78AY3e/asyBVCIQPDCQ2
 +nYzJNgwXJDhQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=qBYqbWSm
Subject: [Buildroot] [PATCH 24/26] package/python-zeroconf: bump version to
 0.148.0
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

https://github.com/python-zeroconf/python-zeroconf/releases/tag/0.148.0
https://github.com/python-zeroconf/python-zeroconf/blob/0.148.0/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-zeroconf/python-zeroconf.hash | 4 ++--
 package/python-zeroconf/python-zeroconf.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-zeroconf/python-zeroconf.hash b/package/python-zeroconf/python-zeroconf.hash
index cf49e6f21e..3e9a2c06ec 100644
--- a/package/python-zeroconf/python-zeroconf.hash
+++ b/package/python-zeroconf/python-zeroconf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/zeroconf/json
-md5  13003da434beff520db50460d8d603bd  zeroconf-0.141.0.tar.gz
-sha256  c0c41cfe1331cf885f132dd2400e4091f59ae0a571cae14f3db66919a055489b  zeroconf-0.141.0.tar.gz
+md5  adda1c72099e20b2968ff7f22d9f6f36  zeroconf-0.148.0.tar.gz
+sha256  03fcca123df3652e23d945112d683d2f605f313637611b7d4adf31056f681702  zeroconf-0.148.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4d1d974999ae8655ee47afb47ac3b327cd1baeea3509aecb35341ba1a1a53c94  COPYING
diff --git a/package/python-zeroconf/python-zeroconf.mk b/package/python-zeroconf/python-zeroconf.mk
index 7f14651b86..fe7676e2ee 100644
--- a/package/python-zeroconf/python-zeroconf.mk
+++ b/package/python-zeroconf/python-zeroconf.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ZEROCONF_VERSION = 0.141.0
+PYTHON_ZEROCONF_VERSION = 0.148.0
 PYTHON_ZEROCONF_SOURCE = zeroconf-$(PYTHON_ZEROCONF_VERSION).tar.gz
-PYTHON_ZEROCONF_SITE = https://files.pythonhosted.org/packages/d1/36/78f2cc563958d55b079c977ad2d4ae5d8b182f2dab9f1224d89c9b1311d3
+PYTHON_ZEROCONF_SITE = https://files.pythonhosted.org/packages/67/46/10db987799629d01930176ae523f70879b63577060d63e05ebf9214aba4b
 PYTHON_ZEROCONF_SETUP_TYPE = poetry
 PYTHON_ZEROCONF_LICENSE = LGPL-2.1+
 PYTHON_ZEROCONF_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
