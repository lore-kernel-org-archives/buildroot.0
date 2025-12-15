Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D10D5B866
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 19:16:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76B74819D1;
	Mon, 15 Dec 2025 19:16:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z8ogUjCcXqgJ; Mon, 15 Dec 2025 19:16:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D46580B17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765826177;
	bh=YdfsHrtpgqtleEx0Zegsdu8M0MMYJVZN0YeM2fF6f0w=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=pUE8U0i+Yi7okhOADRHPkqROJobvuzqsBaIDx6Kj3/JbTPpI+FJ18Li7YhfDhxxWS
	 v3wWdWRTwxye+fapkmqzZgwdiUS3TjxQYE6Occ1EooIV217z22Tine0CwwxlEmBFNN
	 R+krNW5QLcZugIisCR0KwOcuxVlaB2NXK0ruhYZnQoYoVDQ2uaAMS0YO2/oV4mmL+J
	 3AaUjoa+MGb36R/dgD3DJlcHMA3/wRWSlH6U65e3qPAT4McvHToJXvDJI1ziwfCNDC
	 wwr3h4WFqKw+e6Dgy3UeklR18TrQdFHm/hDnWX09jovtAtwWZmSADgyoveQpIsHjfv
	 5jVclPLf76ubA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D46580B17;
	Mon, 15 Dec 2025 19:16:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 008CE255
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F20344039E
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:16:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 25x2UiYDGZbK for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 19:16:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CC1ED40435
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC1ED40435
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CC1ED40435
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:16:14 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 89436A4C4289;
 Mon, 15 Dec 2025 20:14:27 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40828)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVE1R-000000005ED-02hx;
 Mon, 15 Dec 2025 19:14:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 20:13:59 +0100
Message-ID: <20251215191416.421755-10-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251215191416.421755-1-bernd@kuhls.net>
References: <20251215191416.421755-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765826067;
 bh=bX7RAhZNwb3rTf7BL06pQwPTUnzmx8ZHqh0JagMaDX4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=KylwG+AX4MXu51Rm2gjEc24iwROFXErIlUrtVGs/gZn6vr1J1GIGPNtLX8hHa2E+v
 laWbSRhmt3ai5WKLewQ1NEYN1LBb1O5THVlXU591YT0wmMKlqPg1jRVnSX6dEax0Ih
 ifJcMGMVi5IK82IzBcmmLPeZ49ggtg6P4A/TqxwunOYIAcfkrU5OyUSlBUE7ln388c
 o0h22aSXSDdjFIy3y293AB2qvNZp8lD/6UR7vheje2+156JsgsHM6PKOlp+D2jT3Vz
 dzEbrZqyxg1sZfFr3t8OtDGJBTJaJv7pvlrM0+Oi9hbGHkbc4H2MQ3/GL5L584KEQe
 S6YtfTcNN6xtA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=KylwG+AX
Subject: [Buildroot] [PATCH 10/27] package/python-pymodbus: bump version to
 3.11.4
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

https://github.com/pymodbus-dev/pymodbus/blob/v3.11.4/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-pymodbus/python-pymodbus.hash | 4 ++--
 package/python-pymodbus/python-pymodbus.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pymodbus/python-pymodbus.hash b/package/python-pymodbus/python-pymodbus.hash
index 7fbcfb0e13..8d990d0d5f 100644
--- a/package/python-pymodbus/python-pymodbus.hash
+++ b/package/python-pymodbus/python-pymodbus.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pymodbus/json
-md5  18a9929a065d545205ee62d8300884a7  pymodbus-3.11.3.tar.gz
-sha256  10c2902838ad5a233baefb64b1c1fb064fa762b22b221bf35191bf39f01449a8  pymodbus-3.11.3.tar.gz
+md5  7485a0f834aafb48273c6adb297dff93  pymodbus-3.11.4.tar.gz
+sha256  6910e385cb6b2f983cd457e9ecee2ff580dbb23cf3d84aefec0845e71edd606a  pymodbus-3.11.4.tar.gz
 # Locally computed sha256 checksums
 sha256  572a4d6fa7541553f70cc6d494fbcbee7eb7d3f2fbd16080d39b20cccda26f0b  LICENSE
diff --git a/package/python-pymodbus/python-pymodbus.mk b/package/python-pymodbus/python-pymodbus.mk
index 16e8323c97..1e7df6892a 100644
--- a/package/python-pymodbus/python-pymodbus.mk
+++ b/package/python-pymodbus/python-pymodbus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYMODBUS_VERSION = 3.11.3
+PYTHON_PYMODBUS_VERSION = 3.11.4
 PYTHON_PYMODBUS_SOURCE = pymodbus-$(PYTHON_PYMODBUS_VERSION).tar.gz
-PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/2e/3b/599f812b03147f1eee357f0eb62f1753ff5bfc099da9aced63ecf6f32560
+PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/2a/af/bbb716301ab9c60f0702c3cdf72cc0e373286a5648fe16bc4431400489dc
 PYTHON_PYMODBUS_SETUP_TYPE = setuptools
 PYTHON_PYMODBUS_LICENSE = BSD-3-Clause
 PYTHON_PYMODBUS_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
