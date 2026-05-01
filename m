Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB545CD3424
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 12:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7AED6F792;
	Fri,  1 May 2026 12:39:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pggVWaPsLCbG; Fri,  1 May 2026 12:39:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD9476F773
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777639177;
	bh=RZUvG1yLepN+S0hQ2+W4ovuBWttT4z7qxJNmW1X4tPg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=IyddqXBECseLXTiHn7JuzqXuf2PVBwgRbvJJbaFG50CFc5CsFXv1QjKgPSeqgGhU/
	 a8kiWnigR3Q73+ENj0pA7tNMGBh+LSQOeT25yDB8qTL+2riHZDJyW/Vd2TuHsua0z8
	 M9bt8yobJrcOCfvBrN2aFsqvw+9YbJUL7hJoLKPViL1kZKRdubOtVFC1AwGdXi2GYO
	 J/+bpokVR5YWQJ3M4JF+no7NpsM2UB5jym35uzfxSFHS88PxJhSwTSFYiPdLU8c+7V
	 dogzYxWBwd238LiIzHjSNqdeoRkQVRHfN4l/IyF7En9mjWeUFmIaUw7s/eyWpFC0J9
	 BS3L8ot7rXudg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD9476F773;
	Fri,  1 May 2026 12:39:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F665127
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:39:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 707BB6F773
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:39:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i_KibFIKSnlu for <buildroot@buildroot.org>;
 Fri,  1 May 2026 12:39:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 52A376F753
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52A376F753
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 52A376F753
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:39:35 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E1A9CA4C2EE6;
 Fri,  1 May 2026 14:31:07 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45080)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIn1M-000000008NC-2AwD;
 Fri, 01 May 2026 12:31:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 14:30:29 +0200
Message-ID: <20260501123100.1918951-44-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501123100.1918951-1-bernd@kuhls.net>
References: <20260501123100.1918951-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777638667;
 bh=Tz3gxyWy2zMvWFYLh1evu+uElnkyfon7G7z1DwKHjLY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=mpZutwa19b0oZDr63E1VQz9L0mTixm8lXhokvDajLv2X1U57zmr8t8Iv3Pg22+ICh
 FbPeRHA0aMXgPibf+4mMeQvFo5RHBJmRlPWVgoKd12YGjxuaPgWarLQq5FdBXi6DYK
 qsQJxbli74Bw2Djfh/EpOKWpEWCTPeAsm+l0qDPour+QokzIAdz+Z7GtEst4V7B6FM
 ECGVglVnKGHse5dIWWpkcaYwzYweN7tJfw/LKDEgWBwuevgwAV19OkhgQOLy/v5AzN
 x0Li5AmR506a0bu48u5AplaHN9Kwosz+tT+VaPWPfl3QNfRJPJC6ckSXfiJytA9UnZ
 4x1PPGpW8C1SA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=mpZutwa1
Subject: [Buildroot] [PATCH 44/75] package/python-pymodbus: bump version to
 3.13.0
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
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Grzegorz Blach <grzegorz@blach.pl>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Falco Hyfing <hyfinglists@gmail.com>, Mauro Condarelli <mc5686@mclink.it>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/pymodbus-dev/pymodbus/blob/v3.13.0/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-pymodbus/python-pymodbus.hash | 4 ++--
 package/python-pymodbus/python-pymodbus.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pymodbus/python-pymodbus.hash b/package/python-pymodbus/python-pymodbus.hash
index ddeeb6afb6..7da0adf9da 100644
--- a/package/python-pymodbus/python-pymodbus.hash
+++ b/package/python-pymodbus/python-pymodbus.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pymodbus/json
-md5  d706a1227df2b0efa613ebbf3996ed40  pymodbus-3.12.1.tar.gz
-sha256  bcb483381747b3e3aec2c8e01d5df885e5ea43f85b7145dc1907af06aca93a2c  pymodbus-3.12.1.tar.gz
+md5  d2db6a8e9ae1688a6ddf227a4c9e5ccd  pymodbus-3.13.0.tar.gz
+sha256  da4c87afe772787620594c564cd8aa8a4c58ff9786382aba9550fe0ce8879f32  pymodbus-3.13.0.tar.gz
 # Locally computed sha256 checksums
 sha256  572a4d6fa7541553f70cc6d494fbcbee7eb7d3f2fbd16080d39b20cccda26f0b  LICENSE
diff --git a/package/python-pymodbus/python-pymodbus.mk b/package/python-pymodbus/python-pymodbus.mk
index db12e2943d..2d969b0f65 100644
--- a/package/python-pymodbus/python-pymodbus.mk
+++ b/package/python-pymodbus/python-pymodbus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYMODBUS_VERSION = 3.12.1
+PYTHON_PYMODBUS_VERSION = 3.13.0
 PYTHON_PYMODBUS_SOURCE = pymodbus-$(PYTHON_PYMODBUS_VERSION).tar.gz
-PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/c8/cf/9ace571421e4ed8bc870e79caca7fe04b7e2529764494f1fb406053640ef
+PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/3d/55/eee0782c2ca9fa8e7c3218caca22fe30e850cd6c0c0d475c10b8c19e5a36
 PYTHON_PYMODBUS_SETUP_TYPE = setuptools
 PYTHON_PYMODBUS_LICENSE = BSD-3-Clause
 PYTHON_PYMODBUS_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
