Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BAB5CA9EBD
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:01:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65D6A40581;
	Sun, 11 Oct 2026 13:01:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JzUVYMkVn9bZ; Sun, 11 Oct 2026 13:01:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6C92C40586
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791723706;
	b=mk5ld+e+5ydYIhpWHSt93GXj41t2a/gCB1NFumfNCNXw2rk4VJALfLMrqgFwnkWCBtxS
	 XI2DQ9e9PRbGoJWqseQPNlROOZJq6R3TiEhVYMCKqArktRafEff7/Q4oWsW3EznzuJwZH
	 ioAEBDGA7sAZj2pGmWNnyyr7J+BthHycy7JS+4mVYCpCWivIND+t59o85N/5QZvRQrDtr
	 1CaqtM33oFdcuRC0i4Y5sH8azIIlVPMzwu3Irbd3cZ9c4kOYNJADLg0ERMetjWnNH6DhQ
	 Uv4xhL7OLvdvJrZtxfljVsJ4UEY3/AtcWtGEjMZn3dZUHiFZ1rMmRUdN4f6Jdo1rQFQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791723706;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Z+PY0lasn/HdfHIl/gYXikBOCQn96h7AzWqxe5ctlh4=;
	b=WrdiVhGBcVPbXuc1824EqseoVHomXgKaK6I7Ey1fpvqvhZ0jlPCtakIUlONpzt3jihSD
	 DzDqf//DzG70drVFdXlW+Uf9/f02BofzZHjlymFyx1hFuyR/xmpbzNvjqtv68g8hR/WcL
	 /imFgL9aYdvxatByR0zMKPucVWIxMvS7YkesYcCbSAzFXXnGIz2zdfNTurAvzwIzsPvKB
	 GxmP/l24eT89IS21Mq8deV8s8mvsM5Y0I1lbBxBJQyCAHoSX8OcTkru/OBAQS3nXHIJ56
	 Mwrpd+tlfNEwoHfqYnvu3F14eWQ9QNvwYZMOWfdZsTkUh6L0yF07OK6WPBKgZR/8Xfw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791723706;
	bh=Z+PY0lasn/HdfHIl/gYXikBOCQn96h7AzWqxe5ctlh4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=krSLrfsuWGSDKnZqKCUIyE2/6bb/B/vvbSs9h4K/vG/XGib8mSZb0BfE0D2+52Fhb
	 gDApndO4wssJiAuKgTAXGfXRA/D8Surii3jlP+iqeM5lBPibP61E5gFHTS1XTUIQ//
	 UDFY7Yjkua45QDiOWGxskzCUtGdjitEzPbVEfmHF7tC4B8t/lAqZB8hm/WUvXCDxyf
	 1Ywb02IVPyQQXjMXjF6BgPIh15nZWDJSoKLcS7iXH/90grLQ6nqRNju0RnigHcUqjo
	 itDm/VOa7NeB+1b70aDNk5Y/nd2bhFk50yW/3NWDYt2toSIU7mxAeqgVMOaxX0Vwrl
	 F3giOIRInDwIQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C92C40586;
	Sun, 11 Oct 2026 13:01:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 09A3F194
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:01:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E27234008B
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:01:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yd2JrWeST2WJ for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:01:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 3C27A40071
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791723704;
 b=eycZX1Cf+lnSR+JlGq9SnkKVKa9G00F7wYaYBmKd8OHwowdaNqzVNrbPGkmkRT5CCeqN
 MdZ66oWyW8nl3ydBJuYU2L8iHLMIPC/bYU0+MDboH/AFPjSL2RCRdHO//xuaNXR5qv35u
 7MGgsRt9aUzpBLEnfz84wuyUR2Otvw0Lj0trw3gNok263N0MILHZWwMmBeSTZY02+84nA
 dcZhwaIurJpShmKDp9D7OF+VAS9r+RqhYYW8HnZ1qJgMssGcJgL4Xrd7PcC45pn2niN0Y
 6EeOiSI5cz5VdXC7x6P2/7U2N2Vuy20ek2vZO36UyWudeHKPgK3o2Vso0KHYs/jn6hQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791723704;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=qSOFRRC8bK8koLqu4nu/P6TsVoa3yKAzgfIb667HLsU=;
 b=JG7Qako3/wMAHRFCNUpBcD4uNfehynnL/rLX2utkbfaU4SwrP/YTsBqEbOdd1Zp37Ffq
 aPHx2woMe41aFa+0TeOy9nuPVD7XuCTDXF/CtRJV1j7gYfjfE+WZVvZV+r7NQoViofe2y
 5wl/hcUd9OjvDSHKcGzn3qLuxR3iNKDl7wzvScFwYMPCAJdBf6+TQBm9LgVphbLvcVDuj
 VUwm0qdXTx7FzIjy5lSG8veM0yVnnERJTgYrTlx0D8Vbq49kjKkt0xxubygXyG6/jA2ze
 XcjlTXp6fCvluaykAnoJtLcz6vcLriGbUPhUGBHLpiA8TdGo8Qx3mJUORGtStbGHeCw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=LCFt+kbN; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=LCFt+kbN
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3C27A40071
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791723660;
 bh=qSOFRRC8bK8koLqu4nu/P6TsVoa3yKAzgfIb667HLsU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=LCFt+kbNmw6qm5Fzs08TFwODkN/YkvkbR/YJuiuAw8SPIcRpnaD3HRX26GZaoNCzW
 WWMo1uJhznLKGi1GalxRo7z0z81bHDPspd08I4HUx1qDgfPky3k8UweZdLHWaUSTgF
 D+taWr9tPCYlfhZ6YfEwncle7k4ptJ8ZENZPe3nIpZ4TNGhVVAh6zd+3ZnYGKlDndo
 bdnQhgVkCQLV+QMzBPLgpoQQy0EAAS83FMdkLEAtLGUT0ecrSW8jNiMNim4UEIAZdi
 sSqVEUfjSxNP4XxLckNPK/KtGN6EHdqB34djC889663qQp+E8FT96L+v3lwXvz7m3x
 JR2tUl3cYA4qw==
X-KAS-Sym: v3:f51bdf72230551df:Ox5mmHqwgIvMyI1QgKEa7Ro2UqoiVPYwa1ib8hnsjjQqD
 25s8M2vwFrIHsd3K5yBRCNR9KcmhbTBGk0Z/UIeFpf8wsnVNojbXdjCN1xVotleGBWWjjzHBgEE
 74kL4L+STMwD/l3tPdkNjVc2aEcTg5E+9kq3JIuVVgKZUkyGnD/Kyv1FD6YSp7FcFjV40N/5gBQ
 c1a8pSNeJlBzzKSDlvrm7tStdZZURMMjpShUwTVAm3ujJrgLAxVichT90dl6Ye+LoRN+5NYuoCq
 FrxKp8YCAl4Fk1rds2RrRz+55Ma6FGhELkZkdxRcDOeNbj/YZtgaek8wOz/3DQCuSXG5FAKA==:
 ROnJ6v0W/dJjwS0dzu36hewkdCpAo8bumRp+aPI8pbXBiWaYVKQwvX++r7RJw67RSX8CcaU4Zr9
 IjKOe0VovdFLegOXd97E1cGinJ2odQRcQV0PFv+rnOzRbkC4tf5OB0Wb+/q9du2pdpUl+aO4peh
 DfJqJyc6+rYY3+3hdyd4puRwlNbKKB+YrjGP+pRRCyQxgbu5vjd6uRyCd7bSk9eopRQrJeKCEdq
 8mWKRmSx1FJrtnQh0jKKEJufqFWDgwCDNFuGN0+Ah8izhXIGampxz+BWKvO262x0yvogqiukR6a
 jritDtnm55txCybbh4FMIXn2gLq+Ovn68IW3lyJSBzHqR1WRpEmIOB1qlp+x8fGJP4dQmpNrdbN
 rsb6aRpdWMCgjg+UKl1ZnfxOrMjgXirlC15MgJqpSgZdOMqbbksF3TN4LoTOKSUCMqqZc8Dpvj3
 /oiAVUlqxQU/OnydNPhKEeG+mYnI2tfPhKIVPHJqEGLJMH0jx1QbzLRQr/Bq5VZPsmG4PkP+D84
 k6a9LLiPPvVYIR+Bf/R3BYUByU4QcpN00jh0AVYLV0GYSvOq6M4nrgNyAxroC1CFKjEMckteFiE
 Sq9JGg==
Received: from fli4l.lan.fli4l (p5b3a0ea9.dip0.t-ipconnect.de [91.58.14.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 71E78A4C5848;
 Sun, 11 Oct 2026 15:01:00 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52426)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xFtAi-000000007Fz-1EpD;
 Sun, 11 Oct 2026 13:01:00 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 15:00:08 +0200
Message-ID: <20261011130058.3443432-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011130058.3443432-1-bernd@kuhls.net>
References: <20261011130058.3443432-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v9 03/52] package/qt6/qt6opcua: remove package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Build is broken with the upcoming bump of OpenSSL to 4.0.3.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Andreas Naumann <dev@andin.de>
---
 Config.in.legacy                   |  7 ++++++
 DEVELOPERS                         |  1 -
 package/qt6/Config.in              |  1 -
 package/qt6/qt6opcua/Config.in     | 14 -----------
 package/qt6/qt6opcua/qt6opcua.hash | 10 --------
 package/qt6/qt6opcua/qt6opcua.mk   | 40 ------------------------------
 6 files changed, 7 insertions(+), 66 deletions(-)
 delete mode 100644 package/qt6/qt6opcua/Config.in
 delete mode 100644 package/qt6/qt6opcua/qt6opcua.hash
 delete mode 100644 package/qt6/qt6opcua/qt6opcua.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index c15a397043..f3ed49bd57 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.11"
 
+config BR2_PACKAGE_QT6OPCUA
+	bool "qt6opcua has been removed"
+	select BR2_LEGACY
+	help
+	  The qt6opcua package has been removed because it is
+	  incompatible with OpenSSL >= 4.x and mbed TLS 3.x
+
 config BR2_PACKAGE_QT5OPCUA
 	bool "qt5opcua has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 0d52d34d4e..f8a032d055 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -203,7 +203,6 @@ N:	Andreas Naumann <dev@andin.de>
 F:	package/evemu/
 F:	package/libevdev/
 F:	package/pkg-qmake.mk
-F:	package/qt6/qt6opcua/
 
 N:	Andreas Ziegler <br025@umbiko.net>
 F:	package/mpd/
diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index d6ee9f3ea3..31fa4582d2 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -52,7 +52,6 @@ source "package/qt6/qt6grpc/Config.in"
 source "package/qt6/qt6languageserver/Config.in"
 source "package/qt6/qt6mqtt/Config.in"
 source "package/qt6/qt6multimedia/Config.in"
-source "package/qt6/qt6opcua/Config.in"
 source "package/qt6/qt6positioning/Config.in"
 source "package/qt6/qt6quick3d/Config.in"
 source "package/qt6/qt6quicktimeline/Config.in"
diff --git a/package/qt6/qt6opcua/Config.in b/package/qt6/qt6opcua/Config.in
deleted file mode 100644
index 9b5359dd4c..0000000000
--- a/package/qt6/qt6opcua/Config.in
+++ /dev/null
@@ -1,14 +0,0 @@
-config BR2_PACKAGE_QT6OPCUA
-	bool "qt6opcua"
-	select BR2_PACKAGE_QT6BASE_NETWORK
-	# qt6opcua needs host-qt6opcua, and host-qt6opcua needs
-	# network support in qt6base.
-	select BR2_PACKAGE_HOST_QT6BASE_NETWORK
-
-	help
-	  Qt is a cross-platform application and UI framework for
-	  developers using C++.
-
-	  This package corresponds to the qt6opcua module.
-
-	  https://doc.qt.io/qt-6/qtopcua-index.html
diff --git a/package/qt6/qt6opcua/qt6opcua.hash b/package/qt6/qt6opcua/qt6opcua.hash
deleted file mode 100644
index e05212eaa8..0000000000
--- a/package/qt6/qt6opcua/qt6opcua.hash
+++ /dev/null
@@ -1,10 +0,0 @@
-# Locally computed
-sha256  41982d99b93bfde68f9ee5997376cd64f62d0e7cdca1a08e582a034840528ca1  qt6opcua-6.11.2-git4.tar.gz
-
-# Hashes for license files
-sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
-sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
-sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
-sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
-sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6opcua/qt6opcua.mk b/package/qt6/qt6opcua/qt6opcua.mk
deleted file mode 100644
index 28771ba8a5..0000000000
--- a/package/qt6/qt6opcua/qt6opcua.mk
+++ /dev/null
@@ -1,40 +0,0 @@
-################################################################################
-#
-# qt6opcua
-#
-################################################################################
-
-QT6OPCUA_VERSION = $(QT6_VERSION)
-QT6OPCUA_SITE = $(QT6_GIT)/qt/qtopcua.git
-QT6OPCUA_SITE_METHOD = git
-QT6OPCUA_INSTALL_STAGING = YES
-QT6OPCUA_SUPPORTS_IN_SOURCE_BUILD = NO
-
-QT6OPCUA_CMAKE_BACKEND = ninja
-
-QT6OPCUA_LICENSE = \
-	GPL-2.0 or GPL-3.0 or LGPL-3.0, \
-	GFDL-1.3 no invariants (docs), \
-	BSD-3-Clause (examples + buildsystem)
-
-QT6OPCUA_LICENSE_FILES = \
-	LICENSES/BSD-3-Clause.txt \
-	LICENSES/GFDL-1.3-no-invariants-only.txt \
-	LICENSES/GPL-2.0-only.txt \
-	LICENSES/GPL-3.0-only.txt \
-	LICENSES/LGPL-3.0-only.txt
-
-QT6OPCUA_CONF_OPTS = \
-	-DQT_HOST_PATH=$(HOST_DIR) \
-	-DBUILD_WITH_PCH=OFF
-
-QT6OPCUA_DEPENDENCIES = \
-	qt6base \
-	host-qt6opcua
-
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-QT6OPCUA_DEPENDENCIES += openssl
-endif
-
-$(eval $(cmake-package))
-$(eval $(host-cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
