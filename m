Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78404CA5FED
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52BB16076D;
	Tue,  6 Oct 2026 16:25:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9OQ9c7wrY3Yq; Tue,  6 Oct 2026 16:25:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 46C80606DB
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791303916;
	b=Gegu5Bo8VSyDJ99jSiZlCOpNA8PJeoeh1VbMJimmDdIkNMn67FNsCcutZWOH8okYKgjc
	 18MOEw/gGqNzARu3zBuLd8VOsNuZqd8MJKgjWFTQtKhoyLzXD0HVp5Qdp4H3FBoU1u4FD
	 qHRfclfL1z1ThNGDoVg4hKUufan1GVKiUUaT83iXP0xvIUr4BHbLhs8coSK3mykTvS9L9
	 o8crzX6m4S2mzQn0Cs3VxYWDl2QVMTbMaVLIhTI4HyK3PMg4tmB+bAySVhfwnMH4QCc+U
	 82LN/6oU+xgoZHIepocORfddIj0YxLgqRUHzrCmklNTKuh4dIONRVe2pq41Fi6FcP9Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791303916;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=PCu2RVPRiR28GGWKIboVOgMGmlsCWVLg0M33ud+8UFw=;
	b=J7CV2SDgBpwI+dGVfk0dxCQPeSC3Jumshj8nF7/sEgURmKVj5dBxtQ+gfFvHTFDQljIt
	 C5hPw+DeUUpCTvTEHDrxrd3AdbieeifC65htJ5zbHWX+o847nI+VzZpCP1GShDGjuQyMe
	 ZCZqCDDmL2fEgYhu0ta3KRFPftH9/BUsIYowwYbFkHE9grz1+dKdAEuyHKwvAmDMYrqtC
	 9TnJnTL1YBvTY2XW/yPguswtQ0FLnsm4J2merpx3IaD5J0VjV7McCTWXJK8zm41UDEZHn
	 aW/GZAao93XAlZ5jhJyVlOVyUDWU94hHYX6XbqyLBTrlrJZhq/NnSgWM050UheMMpHw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791303916;
	bh=PCu2RVPRiR28GGWKIboVOgMGmlsCWVLg0M33ud+8UFw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QZZoTT2m6BmFRyuCOk7B0qBWWqF5uzLBwr+8eFDoEOdErT9s6E6oZN64WTM6zHS6j
	 ld0JpRZD41pLDjRt5FogZ8bwlyudHzqfvVoVKlXs8cr0/Nv+nNwPzGBHQuYAr6h7Vq
	 4gE8HSUfgXbd8QAI7Nwc+qsxrUKJVpQnBCQIsCDWpUAHsSRHFQVvnTkphFU13XsCMz
	 EL6p2z0sV87g1d+xyF8J+Mo9jfUi+24hEWzdkYdRnXCaltIuaAQc6fhQ1eOiWi2dNA
	 IQNTh/4+fkX0U17cI5H7wo4bI10r3R6orhy5nFnCnAnGET1+mdYbSM5fXGjvf69iL2
	 fgIRc1EX3xnPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46C80606DB;
	Tue,  6 Oct 2026 16:25:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E3E4434E
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:21:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D5E2B405AB
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:21:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TNJzDT4IQ433 for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:21:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D567B405A7
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791303712;
 b=BqdVyKNOps1tSAtSF2bccqyHrv2BSSaO2+Up3/oQYMfIxM6u7GWAbg9Q5SDpZc8tKRC6
 nt6um9ZmnXRJKLr+UfdjCVltKc3f2zzgRzZ3qNDPCBRoPsnkHz0WcezhQQEwQYOC4EDbY
 LfjI1IXkhoLhHB41gNtJ8gyLpybOvDJNXF7tE65KjxwPtD+dWWYA2E5Txf8GEuITRUZcI
 u51oOXZZhQSAbENXQlE6UXgVFwrmXcj3vNw8yrzfGlk8sLJm+PivRLlASkvJg5PMw0L5i
 U9kSmKkJZzMR/oOgp1viasJrrNO7hjQkUE3+CgARPyrldR4gCjUwDosxYyqRh4c0QdQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791303712;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=EHexV8UHY5+1H0nARDcoDRBE3obixpnujm9tHXjwLro=;
 b=MuOAieAmgxazigGtiq+mNcNARwFKLCxtd7J8c0kf7FACaZa3j3BkrsktObetLEQ2IZcn
 v8P0E0XMBWOs4pLyINprgeAeN6XMHry9VgQMMRUTtygNdOn1FLFzkxQbilnFxBxpU+mLH
 QcDhQyqSmUHtEJNb3jR3xU+1zUMdTi977m8D5wxPdE4JBxksLoJ2ZXn2UILXpVffI789y
 vu+R/4tFnoR4tQimMndjxc3bu7dW/jmv1K5eHI3EUliKsGJYS5frT4czAjJ3DNk//SvCs
 wyGLm9uad0GrYhMRE800kiDurEgbn4RdVwZQAwmbwhGtjeVeJ7VZJhLImwoGAgaiQJw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=GqYb7lNA; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=GqYb7lNA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D567B405A7
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303670;
 bh=EHexV8UHY5+1H0nARDcoDRBE3obixpnujm9tHXjwLro=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=GqYb7lNAkGwfHWwI+R5Ly6TH0pfx1F+Xm0uL38hOKWK4K/FdTd6ssoZ6uIKNv2JRR
 mAb5jW3PpRkWrRIxFKM2KPmLnCQ7V+48A2Ja+2DO0DDco4VfjcDWSO6F1mXXSn0Hy2
 htC/tUt4UEGPRMNXrYtLAGFF4qyvoCloammarYGJXtPKnTkANbbCMUvejJ/z2hrRJo
 X2KgZ5JzFIduXmth3c16W33yngJWAPGyf2gATlC3VVa4XS/iJ4WbRqPlKODWfp2aFV
 KF/tM/8xlsdU/tif+UsICL/2UepkYWGbcjwV6K2uJt97BeWNPiL9hcMIQh5HtmOl3a
 A18LJG/z3/oKw==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 D4dMN/UTWv45LyXPkcWeBX+ef9d31FfNoYTZEIsxhfxdsLG9emipa+Fs2Xc03ZB+ygkiqdvE3gH
 stN9EZuA/Difw4I5e6IkjdhUfA8/NUOHXOnLrL2jUtrCOEZL3ZT6q5hUHfC5BgDqPRv+HDDyh1H
 EO7ZNQr/HpKeaVTZ18OWfxcVRf8AZfZhzaUHANayrVNx764kvAkV/C2JpfkQbIlt9jW6vl0Jy5A
 WH04cqa+gN+TzvAtZLbsdxTUxf7k+JZ+Sof0tNkgXNq+BAwehHWUj+KoEb0vUVzweyVxuEAFztQ
 uCpKEuHBNyfd88dYKFkqcmVQg03j6lKfdky+J37lN58VUNEAKZY8BkyRtnAzf+gOA3pFGx1ZQOs
 HkpkQl93QLK8utKQ6DI5vIvh5NmD7/IJ3NtUGdXIVJgZC2IcSIWn1w/5CLkd9Y+uF2S5BnT51bK
 rmOPz6umMwU8pT3prRivBo/8qT4dmHT7xEaVdX4DwP+L8RtDQxgTqr2+h5z9WGMmdtm9S5C9ll6
 nfAcmx9wzgGi0vkPjojeQIaiUDCeQUaNN0Ac+NwpFquRLL6Sc8O/knLniEsfDYlSmfbqtzaAZ5/
 6o9+uA==
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4C9DAA4C43CF;
 Tue,  6 Oct 2026 18:21:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7ug-000000000ir-0sC8;
 Tue, 06 Oct 2026 16:21:10 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  6 Oct 2026 18:19:44 +0200
Message-ID: <20261006162106.3439373-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v8 03/84] package/qt6/qt6opcua: remove package
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
index dd40ff4357..0493087ae6 100644
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
index 8b29542988..9f5cc3819a 100644
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
