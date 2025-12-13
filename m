Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6075AD59F76
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 14:08:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34D1F40339;
	Sat, 13 Dec 2025 14:08:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dsRB4B8cykN9; Sat, 13 Dec 2025 14:08:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C0DF4047A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765634881;
	bh=0K134YLYNEXPBW1FflCgFbiIVbnXlRhnjPt5pINTEP8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Rg8PIHpy7UgLk0oWVYXjSePKLp6d3Xd+buUYc1ZgnKbHUF7fLItyXT92eun0zNp16
	 SO36TOA2lYoUwWmwBHVJhJLecT6B+go+K4/SGebpLoE5Ye4Q04AsrLGXT//Bp4T2ty
	 uMXK8r+siuG+Fu1utHhS9KaGJS/oUkDeLaFGCYjirH/QVuslzNz4SAfrvo34yPVcpO
	 liVPeH0NPStvA/MF8PXlLXhUWJWPAPMHhN277tw0YL/EptvriLBQuma9IQqjyAAEns
	 z2oZDD5eorWc8W3M7uo72vzvT1DtVOy113EnSjrblyp3ByQ17JvPTDj+xXdKyuVaqV
	 14f3gw10NhC1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C0DF4047A;
	Sat, 13 Dec 2025 14:08:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 836342C1
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 14:08:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C38F36059B
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 14:07:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c5pb5-paanCd for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 14:07:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9268A6087E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9268A6087E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9268A6087E
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 14:07:58 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc21.dip0.t-ipconnect.de [79.214.204.33])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 15C78A4C4097;
 Sat, 13 Dec 2025 15:05:30 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49778)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vUQFO-000000004dt-2Slw;
 Sat, 13 Dec 2025 14:05:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 13 Dec 2025 15:05:12 +0100
Message-ID: <20251213140522.1322763-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251213140522.1322763-1-bernd@kuhls.net>
References: <20251213140522.1322763-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765634730;
 bh=sKbv0W4Kd+dGY7JCyWucuRw7sMRMC/exDR9odma/djw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=FNy1bOth5NPM17NL6RVSGspR0288Ks/g9nZVAjTYh7+t32/owU5+LkajUu9/g3FNQ
 /8lqMVrEREA79Q7N1/N4dJ4odUh80w1wzcQEpzzs79CODqksBYn1qrqLEbApLCBQOV
 Sh/SL2g6iMi47r/Xad0VN54S7EEvVh64UZhiFIy/hyGBRTLN3kXYNKwzp7pj9RriLW
 31ug0odgBgJbT0NpRgi2XkutkVIwDtGnH13sGek3MPYB73GvkwueTAgcSRL0RchmZS
 9i9X0GWDvlZif8pXMfbbDsOm9LtfQv8KrmzpMUAb2xAOKL0EE4cQ1JslYFvInxG6Hr
 9lfB1ffX3NVtw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=FNy1bOth
Subject: [Buildroot] [PATCH 04/14] package/python-libevdev: bump version to
 0.13.1
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
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Julien Olivain <ju.o@free.fr>, James Hilliard <james.hilliard1@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switched build system to hatch:
https://gitlab.freedesktop.org/libevdev/python-libevdev/-/commit/d3542404761357e335f61530b95af8a7fe196f8b

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-libevdev/python-libevdev.hash | 4 ++--
 package/python-libevdev/python-libevdev.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-libevdev/python-libevdev.hash b/package/python-libevdev/python-libevdev.hash
index c48ddbf716..a6afddbc5b 100644
--- a/package/python-libevdev/python-libevdev.hash
+++ b/package/python-libevdev/python-libevdev.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/libevdev/json
-md5  9bf8acc011c72d1466ae8f0b8f2c5fac  libevdev-0.12.tar.gz
-sha256  02e952632ec6c249cbb9c66f6fa00012ea448b06606c77cd139133bc2fe46b08  libevdev-0.12.tar.gz
+md5  86719624bedf7e9e5d3bc15803d01a49  libevdev-0.13.1.tar.gz
+sha256  dc3369cd1401767b9ecb1117cd6b73faba9038e3bd9e1695a710a9e9d9415e8d  libevdev-0.13.1.tar.gz
 # Locally computed sha256 checksums
 sha256  a547b196da4e5bb9588a6e24f1f36ae9e2349ca5375e2cf9c315186e237d9f6d  COPYING
diff --git a/package/python-libevdev/python-libevdev.mk b/package/python-libevdev/python-libevdev.mk
index cc40adc874..1d2fc74708 100644
--- a/package/python-libevdev/python-libevdev.mk
+++ b/package/python-libevdev/python-libevdev.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_LIBEVDEV_VERSION = 0.12
+PYTHON_LIBEVDEV_VERSION = 0.13.1
 PYTHON_LIBEVDEV_SOURCE = libevdev-$(PYTHON_LIBEVDEV_VERSION).tar.gz
-PYTHON_LIBEVDEV_SITE = https://files.pythonhosted.org/packages/61/6b/e0193f4ba0c3b7d20f8f1b961793d39df5538451c0959abb115020d4ec2d
-PYTHON_LIBEVDEV_SETUP_TYPE = setuptools
+PYTHON_LIBEVDEV_SITE = https://files.pythonhosted.org/packages/86/ff/4f8ab38330965168be742b772bcd151a7a052ea17b2481c43a607875d4ed
+PYTHON_LIBEVDEV_SETUP_TYPE = hatch
 PYTHON_LIBEVDEV_LICENSE = MIT
 PYTHON_LIBEVDEV_LICENSE_FILES = COPYING
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
