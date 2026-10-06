Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC9ECA6001
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:25:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7047180D96;
	Tue,  6 Oct 2026 16:25:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QLpff5tl3aBS; Tue,  6 Oct 2026 16:25:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 5A05D80D8C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791303911;
	b=EdW/BXSCBeWUy8DpXSFV8dwzdWW+E6B6BR3skDO6AwzR3WwlViBxDC1jqn1WurRa1b/1
	 AAy+ZSlFDKJKlM6cfj7fRNi1kXG1DEBNNP/2FiG8zXQg+wxtNR2FhS+hVNK4VFbXPENyP
	 5xUicONCFz2HaSoJ4Q/U7FjuPUPZZimg0ZtBm0+bEE6jVT0SkaEcZ7NuMBskl4p3jPYca
	 WUXL6oarc5eDa/t/JYxJFsc1811tBjbYiDoosDpXDCD13SWdII78kNeqC594IPAoC+4Mf
	 NDNZEBYOdOoNUcpVWSPSM4vwK6glWwRFNtC4VIKi9yjer/Z8kWIXnsUYI8xRV4PQO+Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791303911;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=dfxAgHGhI1SG1ywfQvmkaldgxJVXbbFKTYrUrCesM9E=;
	b=P+Ov6pDsXnOM3W2dcE3GK3k2a05iUEnh0WlqDMwpr4k7ghH+4NrxZFIrQeddsBQ2M0W2
	 ZbXUIcIiYnC+YkTplqpyoziqv+3G7f7PQe41V5FHH5Y5/qwWpWvPW+MRzQ/DKJMlbsIpT
	 5Ek0/HLjquYCuu/ou8Wi7R4hWZ+KHITgucamOP5ERqEqSBYK/HoCEA/GBwyII4YY0V9nw
	 FGhXLlS4J2dJb9IDSZhkuVD/jEuNcf+YqLtmUl+NgkNFSrCkTfOwIOH66WYIRzJxjckpd
	 38950VYVHf9UPE8x+QeEsjQulzK7t5dmOA4+T/obcY52I7aIj1R82CGosPTxEbpPPOQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b="fsT/aNI0";
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791303911;
	bh=dfxAgHGhI1SG1ywfQvmkaldgxJVXbbFKTYrUrCesM9E=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EBVET42LtJ2JMaGiWU8M5lacwVYnzh+UxLZW/mVERgIl01RUYYRSk1AXpvpu5Om7B
	 6ZoIlzyHramqiwpx2jsHk+muGZOaeWJV/9rkTIJOrMY3eDHbnqHaoR1wZhzTMVjNxQ
	 fUSvIGzq1RkcwND5V9c5KYVq/WACm5N8bqqY9g6f9YQKWpfEuoX1n79TqgugWgrI3m
	 RI6jrREwICd3UzqBdYVDhj5Jfyf3iZCo2tChI2uRmWafWvH0ULy/8kEe5zmAZHrh7V
	 wGX0ZtyxGzPhYwmkAKAhM59ew1AhnYJcTomoYyCIy6fOteVg7qbRoBEHUDR+ynzhT+
	 uUX9AYS+151lQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A05D80D8C;
	Tue,  6 Oct 2026 16:25:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E7D6634E
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E587380D8C
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:21:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g6RsLt2wXCsh for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:21:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 763F680D8A
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791303686;
 b=lxgF9cbiycKVurtw6i0z0DbqVEKp/y0J31+O3PZFi7wLYKQMOonEnfhf6PtLxv7lk2bf
 L7wZuyPSO7DO1rdjBQ+WHsSi+Myc2hADSU1An3oTUigftVinSkSlAdk/m6E7fQYNDSbq6
 izpLhzYG6TZvbxfiTayhRz70ek86uOxPgNoMuHmK+rXumM+ifU31qFTOinJCGimlIZKiD
 KIggOYRP7k8A33olFXTrKS1E6avbVjsWtrkWQl2kgNaTYuzeGN1Sjn6HarKwKGP81aiF8
 zWB9xZ9HjbN3ss7RXPkwX004PX9qbtWUKgQZLp5HvJ6pPLXjBnKNp2WzOhxCMJglRGQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791303686;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=r2LXhc5zUCOdm03b5ZLjk2md5sZpmz3eQS137/y0OQ8=;
 b=ayxRCF3nL148vqJH6hTareCITrjAtHcZ92uOz6/c6/qZmi0IvXpOjLsHnb23A/xX6yls
 C2c7GqDO39+UcorqQY4xmCjz/99yZ2LN3ceYpyC/Cof2ijh5J6No6Yubm3UCmmtW7g5U9
 C3gLhraPMdrrR60WoX9rCc+YlH4Cj6e0wdpYrh+uEGRH/4UtDlm3ADW614Dwsc8YDs9Yg
 1JJO+veAr9jayg6+cth/EF2rdXtHHVXIXnZhsr5F1OFET0YLItBlIPPRco9aFfSKWGnJO
 LBFHCt5/FwOjQgCFMfZUtMEyaAngbqnuxco47AGOzGZEMfuVv6bgmnyeERoDToDz9lQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="fsT/aNI0"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=fsT/aNI0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 763F680D8A
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303670;
 bh=r2LXhc5zUCOdm03b5ZLjk2md5sZpmz3eQS137/y0OQ8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=fsT/aNI0RRQ2SUKFUGpAbzO27Gm60uyaiz0o4QItl0i72Syb17tt0GqJm4KdC+GPx
 pA1bECt0XOHF3RYx+gO3BXm5ABzD6lA6O1JqLRzj5TO9OPRssfaJ4VlgExwmnpf2pg
 sRPqhz+BQ986EWyIGFV1PTDvS2HJ8bkgEYSs7y6ZIjY9x8hhsJG2GA9UwJ/Ctum+B6
 tF2e8Jnt8VR58rRnSmGBXK/LnXmUHhgxmxZVqj072w7jT637snvwQ+fA5Exgy9RMU8
 /IDfBP1cl8oXGei+HCW9fMW1+gIUbEYPce5lNrnPwxsNuz6PGtEd2rQFKd+Pt4/B2I
 M/FQNEQK6iMAQ==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 Ykp8EVy9GiRNdggW/ZXfBxce905l0l8JmAkWV2Iv+tnqr+2cf0Mj+jxbmwsjXxTpOHKhbqoBCkl
 mFVijJPR/rWdCc6h0zyRwdwdEoJLMHIpadGMJAt8Q8pidd4oc4LX3HOMbn2DRtOLstPlsR+hvrO
 v6/6hCObJKdPbLX5ThNL3JBKGOjZLMOmGyl0VznU1W/OeZAsQeuHgommfkGHSNVKSZmqb59X0s5
 F5oSthCFoRFOu66zd3F1b1gliL1luh1Qlu1xWoQkm6MYjNrFg4Oy+gS0cmPMIFaAHxO25opR87/
 ywZq8vy1T6th2hZPc1W63Y9MmopjKKhXpCnsHkbmK6W6rc+dZIcroQ+K+K64q7hWMJT7UwxKHyU
 LWGW5R6GfgGC6Kyk7cAv/d677FnQObJcQWY/pyfdhmQJXnEAhCSDnPA6ZTs4mnXb7sHgjoFyvmG
 xPi+ZU+8yPjEOC0ZBjky+3lR0bO5YRrTphZaLzZW1qAfie6JYkQoKI+hfSnSsUDagXVgee8Wtc1
 nez1wNOoDM7bzDqnYKAtreCV0aeKHfuPf//6RQqqwZbdKj813V0DzoxFTHkFqV1REWIlBZrYwOU
 gFnrf1w/WxklbgahwO/9TYs0LpX3TGeeNH8k8luQ4qUE1gUUbzV04MizCLBENfjORR7cDVWqcYr
 xh7X4/XCyigLoLFy6gVCO8AERiG4=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0C481A4C3F9E;
 Tue,  6 Oct 2026 18:21:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7uf-000000000ir-3yAE;
 Tue, 06 Oct 2026 16:21:09 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue,  6 Oct 2026 18:19:42 +0200
Message-ID: <20261006162106.3439373-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v8 01/84] package/qt5/qt5knx: remove package
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

Build is broken with the upcoming bump of OpenSSL to 4.0.3:

ssl/qsslsocket_openssl_symbols.cpp: In function 'QDateTime QKnxPrivate::q_getTimeFromASN1(const ASN1_TIME*)':
ssl/qsslsocket_openssl_symbols.cpp:1352:31: error: invalid use of incomplete type 'const ASN1_TIME' {aka 'const struct asn1_string_st'}
 1352 |     size_t lTimeLength = aTime->length;

ssl/qsslsocket_openssl_symbols.cpp:1353:35: error: invalid use of incomplete type 'const ASN1_TIME' {aka 'const struct asn1_string_st'}
 1353 |     char *pString = (char *) aTime->data;

ssl/qsslsocket_openssl_symbols.cpp:1355:14: error: invalid use of incomplete type 'const ASN1_TIME' {aka 'const struct asn1_string_st'}
 1355 |     if (aTime->type == V_ASN1_UTCTIME) {

ssl/qsslsocket_openssl_symbols.cpp:1415:21: error: invalid use of incomplete type 'const ASN1_TIME' {aka 'const struct asn1_string_st'}
 1415 |     } else if (aTime->type == V_ASN1_GENERALIZEDTIME) {

Last update of the package dates back to 2020:
https://github.com/qt/qtknx/branches/all

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 Config.in.legacy               |  7 +++++++
 DEVELOPERS                     |  1 -
 package/qt5/Config.in          |  1 -
 package/qt5/qt5knx/Config.in   | 12 ------------
 package/qt5/qt5knx/qt5knx.hash |  6 ------
 package/qt5/qt5knx/qt5knx.mk   | 15 ---------------
 6 files changed, 7 insertions(+), 35 deletions(-)
 delete mode 100644 package/qt5/qt5knx/Config.in
 delete mode 100644 package/qt5/qt5knx/qt5knx.hash
 delete mode 100644 package/qt5/qt5knx/qt5knx.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 9ba6ab243e..0c248095e5 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.11"
 
+config BR2_PACKAGE_QT5KNX
+	bool "qt5knx has been removed"
+	select BR2_LEGACY
+	help
+	  The qt5knx package has been removed because it is
+	  incompatible with OpenSSL >= 4.x
+
 config BR2_PACKAGE_PYTHON3_2TO3
 	bool "python module 2to3 has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 32ac338dc8..47cda03a86 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -254,7 +254,6 @@ F:	package/python-spidev/
 F:	package/python-web2py/
 F:	package/qpdf/
 F:	package/qt5/qt5coap/
-F:	package/qt5/qt5knx/
 F:	package/qt5/qt5mqtt/
 F:	package/rtl8723ds/
 F:	package/rtl8723ds-bt/
diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index f1b16ff39b..b837601dc6 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -44,7 +44,6 @@ source "package/qt5/qt5doc/Config.in"
 source "package/qt5/qt5enginio/Config.in"
 source "package/qt5/qt5graphicaleffects/Config.in"
 source "package/qt5/qt5imageformats/Config.in"
-source "package/qt5/qt5knx/Config.in"
 source "package/qt5/qt5location/Config.in"
 source "package/qt5/qt5lottie/Config.in"
 source "package/qt5/qt5mqtt/Config.in"
diff --git a/package/qt5/qt5knx/Config.in b/package/qt5/qt5knx/Config.in
deleted file mode 100644
index 991e93c8cb..0000000000
--- a/package/qt5/qt5knx/Config.in
+++ /dev/null
@@ -1,12 +0,0 @@
-config BR2_PACKAGE_QT5KNX
-	bool "qt5knx"
-	help
-	  Qt is a cross-platform application and UI framework for
-	  developers using C++.
-
-	  The Qt KNX module implements the client side of a connection
-	  between a client and a KNXnet/IP server. This connection
-	  can be used to send messages to the KNX bus and to control
-	  the functionalities of the KNX devices.
-
-	  https://doc.qt.io/QtKNX/index.html
diff --git a/package/qt5/qt5knx/qt5knx.hash b/package/qt5/qt5knx/qt5knx.hash
deleted file mode 100644
index 2600a739bc..0000000000
--- a/package/qt5/qt5knx/qt5knx.hash
+++ /dev/null
@@ -1,6 +0,0 @@
-# Hash locally calculated
-sha256  1648bd6d7e5d8fc91aaa6db1bf9d2744d0385a087ba78a00080f99f1d5027c8b  qt5knx-5.15.2-git4.tar.gz
-
-# Hashes for license files:
-sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
-sha256  0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652  LICENSE.GPL3-EXCEPT
diff --git a/package/qt5/qt5knx/qt5knx.mk b/package/qt5/qt5knx/qt5knx.mk
deleted file mode 100644
index 91b99aaa87..0000000000
--- a/package/qt5/qt5knx/qt5knx.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# qt5knx
-#
-################################################################################
-
-QT5KNX_VERSION = 5.15.2
-QT5KNX_SITE = https://code.qt.io/qt/qtknx.git
-QT5KNX_SITE_METHOD = git
-QT5KNX_INSTALL_STAGING = YES
-QT5KNX_LICENSE = GPL-3.0 with exception
-QT5KNX_LICENSE_FILES = LICENSE.GPL3 LICENSE.GPL3-EXCEPT
-QT5KNX_SYNC_QT_HEADERS = YES
-
-$(eval $(qmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
