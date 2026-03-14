Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 422D510706DC
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:07:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 179DD41061;
	Sat, 14 Mar 2026 14:07:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Ieu4ZxF9tV6; Sat, 14 Mar 2026 14:07:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8805D41057
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773497269;
	bh=ZlgG8StWPPQeiQvbSyVvqYdlnE6XiIbzUT1GXeKg8D0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=FSVp5B+JfeC5BBK9StsTNzCn41DRXonmS5bNao9ryJhEycpYvv/kKAHHxiMaBID4R
	 bwbf5WSerphUJj0ryw1vH2smTvQHQm5SHruTjzeO1DRAbdojs7F3zB9/gmVEPIZQon
	 YI62KQ6rXWfFhn1NME08RXBPqrvYjjm91GQCe7b9LhF0XBzg82mV90N4VZMfG4v9GJ
	 /MqLHqz1kjpjU5YJOV+YpCARYX5nz7Oq4WWI3vQ4lmZH6YvBfanREqwzYQcHj903Ye
	 Iffl53+IaAnc4WuyeDiIME2wtuYQ36NTxWfos4kaoEb4DZ0QXPnyehsPxUojXZT2y/
	 uNA5pgOj3BP6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8805D41057;
	Sat, 14 Mar 2026 14:07:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DAB653C6
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:07:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC0C76066F
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:07:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rSx6WWTGM0rR for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:07:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C0A9060640
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0A9060640
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C0A9060640
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:07:46 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2B446A4C13F7;
 Sat, 14 Mar 2026 15:06:44 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdV-000000003UM-44Po;
 Sat, 14 Mar 2026 14:06:38 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:05:52 +0100
Message-ID: <20260314140633.2967249-56-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497204;
 bh=6u3t8Oejs4oJxt0uYGzpuJjoMCO3tuFOH2f+nYtLbeM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=PupxB6Gzdh+lwYS6i/xzDZjXPpKSrqr0szyt9L6QabYL9As6gyQszkWEW3WcX6Uc4
 VACGi0R2Eq2JjVbJt5AByZnL8rfr9Cx83zrBHpGUz8uzUoGE2CtWK3eFqKIhCTrK23
 phORmFsd3kVgPzlk2NHXWHcVIAk/y9xAXIXurVQ9NtgWqjR9NVKVJY4zmH6WF2YI8j
 0wSJh5bWBh7MIXYr/cUYQXcOcdVhQynhhqDyPToSyC+ZHU5qY/+Wer6hQwePCFgXR1
 zBvKzgc+Es7k4vQir+z5QKAkrTvO5cQ9z/303JsJbEV2g+ixQSkti8aD+wZpdGYHw7
 IXob5XrvxxE+Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=PupxB6Gz
Subject: [Buildroot] [PATCH 56/96] package/python-pymodbus: bump version to
 3.12.1
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

https://github.com/pymodbus-dev/pymodbus/blob/v3.12.1/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-pymodbus/python-pymodbus.hash | 4 ++--
 package/python-pymodbus/python-pymodbus.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pymodbus/python-pymodbus.hash b/package/python-pymodbus/python-pymodbus.hash
index b1183fba1e..ddeeb6afb6 100644
--- a/package/python-pymodbus/python-pymodbus.hash
+++ b/package/python-pymodbus/python-pymodbus.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pymodbus/json
-md5  c120f359fa9a0bba0c450efcb93941e9  pymodbus-3.12.0.tar.gz
-sha256  3fafe85e5d82bb9bcbda14b97a0e69a47dc46be55631e9f988adfaf95140c44b  pymodbus-3.12.0.tar.gz
+md5  d706a1227df2b0efa613ebbf3996ed40  pymodbus-3.12.1.tar.gz
+sha256  bcb483381747b3e3aec2c8e01d5df885e5ea43f85b7145dc1907af06aca93a2c  pymodbus-3.12.1.tar.gz
 # Locally computed sha256 checksums
 sha256  572a4d6fa7541553f70cc6d494fbcbee7eb7d3f2fbd16080d39b20cccda26f0b  LICENSE
diff --git a/package/python-pymodbus/python-pymodbus.mk b/package/python-pymodbus/python-pymodbus.mk
index 75c0bdc35a..db12e2943d 100644
--- a/package/python-pymodbus/python-pymodbus.mk
+++ b/package/python-pymodbus/python-pymodbus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYMODBUS_VERSION = 3.12.0
+PYTHON_PYMODBUS_VERSION = 3.12.1
 PYTHON_PYMODBUS_SOURCE = pymodbus-$(PYTHON_PYMODBUS_VERSION).tar.gz
-PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/41/dc/8db192f3a66032e1bd900eb87b5bbcb539d5118f520372af0cb92ba42499
+PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/c8/cf/9ace571421e4ed8bc870e79caca7fe04b7e2529764494f1fb406053640ef
 PYTHON_PYMODBUS_SETUP_TYPE = setuptools
 PYTHON_PYMODBUS_LICENSE = BSD-3-Clause
 PYTHON_PYMODBUS_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
