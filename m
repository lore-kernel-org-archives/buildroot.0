Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6063D5B864
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 19:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74F3F40A30;
	Mon, 15 Dec 2025 19:15:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qf2XuGHNgAJ4; Mon, 15 Dec 2025 19:15:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1E4B40A3D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765826153;
	bh=is7gbqW3Gb3awsBpcUwpgtnfN9NNhxncT4wG4EZMsjc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ifnpFDTzimOxoF02uqzyNhQW/7dkkWZztHCyGsyzhe4p4o1sj3g4ntT4gz1xloH61
	 8GGZAGfuggCLizbxSmHKlAhYP2cHj4BqYPH/y4Fv5BO9u6Md3NicmoL8ED9UACp2Hh
	 0ss6xrdOEdNifqnCuiMIalxl67qpjU74JUeijDaXso3GcJB8Q+YzXjqUHQ4cxOSmNe
	 njoWqJugj7XUpRM+Nb0JEJw3+VOGzvG9PjLSp61xljkkUZjOdEXAFDhKsQnFkNmnop
	 5JMkSGleyFZc/hLacYJVMtz8L7wOh/yEl39h912p4wuzAOnErhv7s4+QyS5qdY1Wz8
	 M0pxhFr9RxtJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1E4B40A3D;
	Mon, 15 Dec 2025 19:15:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A789151
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:15:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 519BE807D0
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:15:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ezu8EfCiq8wv for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 19:15:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4C7EB807DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C7EB807DE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4C7EB807DE
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:15:51 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 12258A4C4286;
 Mon, 15 Dec 2025 20:14:27 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40828)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVE1Q-000000005ED-2JYT;
 Mon, 15 Dec 2025 19:14:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 20:13:53 +0100
Message-ID: <20251215191416.421755-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251215191416.421755-1-bernd@kuhls.net>
References: <20251215191416.421755-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765826067;
 bh=afmc0+0FWuqtECNNt/dLe9Bu/qYcx9jfoqTSzxenE3c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=WN1g/qNzobHlRoBX9xRPv8Ykk8RJauibPGwBjG75ZVaT4nzg9It97dHj1k/qtMQ27
 Ocets5MZsdeyobkqoHYTy9Zm+6T/LA9JgrGZApWcFOMDeIghggSvRFsptMVvMIAxLx
 xn4zUbboSTmBZGxawZfjoBtlq/N0SbUx4WVeYdkU7vEGNaOprlLdYGXsHri9zdlpaW
 OYhcglD1Eq5dVEx4/OaHAhgg43PykyO8b62uLbBlTu6YtQ5S3xtsxMsUPfDXjxtw00
 uBHwmrFjvp0HDvYLGfEbY1vbK+VjPDyRvW9LJnQjAC7ehSEvZ8Tbn/OrbpTPpF+d6X
 CNOTHq+GKDDaQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=WN1g/qNz
Subject: [Buildroot] [PATCH 04/27] package/python-psygnal: bump version to
 0.15.0
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
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Grzegorz Blach <grzegorz@blach.pl>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Witold Lipieta <witold.lipieta@thaumatec.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Falco Hyfing <hyfinglists@gmail.com>, Mauro Condarelli <mc5686@mclink.it>,
 Steve Calfee <stevecalfee@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/pyapp-kit/psygnal/blob/v0.15.0/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-psygnal/python-psygnal.hash | 4 ++--
 package/python-psygnal/python-psygnal.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-psygnal/python-psygnal.hash b/package/python-psygnal/python-psygnal.hash
index f378861063..7903fcff26 100644
--- a/package/python-psygnal/python-psygnal.hash
+++ b/package/python-psygnal/python-psygnal.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/psygnal/json
-md5  13955249103622604d4022e7d5ef94e0  psygnal-0.11.1.tar.gz
-sha256  f9b02ca246ab0adb108c4010b4a486e464f940543201074591e50370cd7b0cc0  psygnal-0.11.1.tar.gz
+md5  9d1939a916e54ddd9324a623fb360bc8  psygnal-0.15.0.tar.gz
+sha256  5534f18e2d1536675e181c6f81cf04f4177b25a9e60fdcf724a25ce5cc195765  psygnal-0.15.0.tar.gz
 # Locally computed sha256 checksums
 sha256  50169b145e35e6ae11a1e05cebdaa7052a58a8a2325dd5c394f8a68199c78415  LICENSE
diff --git a/package/python-psygnal/python-psygnal.mk b/package/python-psygnal/python-psygnal.mk
index 5bfa1e6742..2708931f1e 100644
--- a/package/python-psygnal/python-psygnal.mk
+++ b/package/python-psygnal/python-psygnal.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PSYGNAL_VERSION = 0.11.1
+PYTHON_PSYGNAL_VERSION = 0.15.0
 PYTHON_PSYGNAL_SOURCE = psygnal-$(PYTHON_PSYGNAL_VERSION).tar.gz
-PYTHON_PSYGNAL_SITE = https://files.pythonhosted.org/packages/bc/b0/194cfbcb76dbf9c4a1c4271ccc825b38406d20fb7f95fd18320c28708800
+PYTHON_PSYGNAL_SITE = https://files.pythonhosted.org/packages/5a/20/70430999aa609adb0601ec0f72bd23790a6e51a80ae6e7dc6621e6c5ee2a
 PYTHON_PSYGNAL_SETUP_TYPE = hatch
 PYTHON_PSYGNAL_LICENSE = BSD-3-Clause
 PYTHON_PSYGNAL_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
