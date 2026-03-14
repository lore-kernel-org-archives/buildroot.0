Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BEDD10706DB
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:08:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60DC64102B;
	Sat, 14 Mar 2026 14:08:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ru7euEO5DYQ1; Sat, 14 Mar 2026 14:08:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C3C641089
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773497318;
	bh=YwIle7AnmXN0x/PMZ9gVTimsje2qWC7q9ayPYQh7WyI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=VYtQ+LZnyFs9pHXRLGfPcy4Um+Kz9/GMgzH+4c4u7BaqJ9ko2sGd0hwx0QFwj4d4d
	 SFRcBP8wdt/5ye06RAtbDDOnbMlJgkGN9V1vHvPf5eKEeiDkqYt2QpYq6yOxeymQgH
	 rADd9FDyZtNLnzBV6qa+B3Iu0+P40gPoEySlQC5IweaKECxsWg9mUOyB5GI+MzK7pm
	 g0uEE24Iw1a2HVWWKq8OQD/a0XeBfYn9atx12fCENMYxBhLnQh6Kowdb6gcmGKKHq0
	 R10H1Yft9yMI84g3m9NDHeCetLD1QrrvSCLBYJLFrUq/MwHVmCHbexDsr+Kwzz60/t
	 NeCIG6a2SNNbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C3C641089;
	Sat, 14 Mar 2026 14:08:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3ED5F201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:08:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72D4C41089
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:08:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ex1BFs7UTm6u for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:08:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6BE3B4102B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BE3B4102B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6BE3B4102B
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:08:35 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8B480A4C1403;
 Sat, 14 Mar 2026 15:06:45 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdW-000000003UM-1O0f;
 Sat, 14 Mar 2026 14:06:38 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:05:56 +0100
Message-ID: <20260314140633.2967249-60-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497205;
 bh=pTnU/YPaBZdULm5S22H6O7o+uKGZDZySm1Tb7PqNVkc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=EhiCg51lLh1A1aYr+e+/6V2d3AKH/ldiDmlOex5Aa5EKKT5BCaOW7W88wu0KGu0Ms
 UpFMUzYSyOk+hWfpYWnKOnGZzb6A90NfEvSHk8jz/+NopYoLrK7Nz1nmSlJk3jOpA6
 hxKoF3TjPDhc43oy6EQWZNDbz5bM1RvXI5i02oS5JprrjU+iW/Y3Udk4uPcOxbtpXr
 DufeAdFpaBdBLWrkY9A9HflrPoRsCAYuyTnXxWn6CtLkTfTmR6oTBzcP9E8F/HYvZe
 tg/CYuAz4aU44+VkcXL9m/4S4yYMLjX0zamcfyGjDG96HganujT9IbqyfY9eNMecCU
 GJuW9U/fGRFpw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=EhiCg51l
Subject: [Buildroot] [PATCH 60/96] package/python-pyqt5-sip: bump version to
 12.18.0
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 Ralf Dragon <hypnotoad@lindra.de>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Mauro Condarelli <mc5686@mclink.it>, Heiko Thiery <heiko.thiery@gmail.com>,
 Marcus Hoffmann <bubu@bubu1.eu>, Joseph Kogut <joseph.kogut@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Grzegorz Blach <grzegorz@blach.pl>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Lionel Flandrin <lionel@svkt.org>, Fiona Klute <fiona.klute@gmx.de>,
 Colin Foster <colin.foster@in-advantage.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Falco Hyfing <hyfinglists@gmail.com>, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Package was updated using an updated version of scanpypi:
https://patchwork.ozlabs.org/project/buildroot/patch/20251001002004.3178942-1-james.hilliard1@gmail.com/

Updated license hash due to copyright year bump:
https://github.com/Python-SIP/sip/commit/394e97272bc7d0b7a350e722ad2b748e07556fb1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-pyqt5-sip/python-pyqt5-sip.hash | 11 +++++------
 package/python-pyqt5-sip/python-pyqt5-sip.mk   |  6 +++---
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/package/python-pyqt5-sip/python-pyqt5-sip.hash b/package/python-pyqt5-sip/python-pyqt5-sip.hash
index 909ee2ef33..bf5560dab1 100644
--- a/package/python-pyqt5-sip/python-pyqt5-sip.hash
+++ b/package/python-pyqt5-sip/python-pyqt5-sip.hash
@@ -1,6 +1,5 @@
-# From https://pypi.org/pypi/PyQt5-sip/json
-md5  9e0909e79f40619b0f2d3d3c33b4d4f7  PyQt5_sip-12.15.0.tar.gz
-sha256  d23fdfcf363b5cedd9d39f8a9c5710e7d52804f5b08a58e91c638b36eafcb702  PyQt5_sip-12.15.0.tar.gz
-
-# Locally calculated
-sha256  3859cfca971e429d6b79bdfeb1dc9e43aa9592f7295bf28fdd62824097909383  LICENSE
+# md5, sha256 from https://pypi.org/pypi/pyqt5-sip/json
+md5  739bb540472188851f15aac80bf8e715  pyqt5_sip-12.18.0.tar.gz
+sha256  71c37db75a0664325de149f43e2a712ec5fa1f90429a21dafbca005cb6767f94  pyqt5_sip-12.18.0.tar.gz
+# Locally computed sha256 checksums
+sha256  3e6f5b427c36f94ecf86bc01698af7030a1ed6eb3748110d5dbb8d142d804611  LICENSE
diff --git a/package/python-pyqt5-sip/python-pyqt5-sip.mk b/package/python-pyqt5-sip/python-pyqt5-sip.mk
index 49762ec58c..7360e6dd48 100644
--- a/package/python-pyqt5-sip/python-pyqt5-sip.mk
+++ b/package/python-pyqt5-sip/python-pyqt5-sip.mk
@@ -14,9 +14,9 @@
 # recorded in the PyPI source file "sip.h", in the SIP_VERSION_STR
 # macro. For example, PyQt5-sip 12.15.0 was generated with Python-SIP
 # 6.8.6.
-PYTHON_PYQT5_SIP_VERSION = 12.15.0
-PYTHON_PYQT5_SIP_SITE = https://files.pythonhosted.org/packages/1b/15/78318d50f10062c428e97e7ce387e772616a4673c356018b905f247a6a85
-PYTHON_PYQT5_SIP_SOURCE = PyQt5_sip-$(PYTHON_PYQT5_SIP_VERSION).tar.gz
+PYTHON_PYQT5_SIP_VERSION = 12.18.0
+PYTHON_PYQT5_SIP_SITE = https://files.pythonhosted.org/packages/f3/31/5ef342de9faee0f3801088946ae103db9b9eaeba3d6a64fefd5ce74df244
+PYTHON_PYQT5_SIP_SOURCE = pyqt5_sip-$(PYTHON_PYQT5_SIP_VERSION).tar.gz
 PYTHON_PYQT5_SIP_LICENSE = BSD-2-Clause
 PYTHON_PYQT5_SIP_LICENSE_FILES = LICENSE
 PYTHON_PYQT5_SIP_SETUP_TYPE = setuptools
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
