Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA5D3CA5FA7
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 18:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D94F3607D5;
	Tue, 29 Sep 2026 18:36:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G1I1-FAVtvuO; Tue, 29 Sep 2026 18:36:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 3E9E3607D6
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790706997;
	b=ZjWm4mShuZ44p6I507LA+jhbJj6SXHxEZtQc8Ww67YXSIhPtKMVCf7xB0l/EWsyG/LcQ
	 UaGoe2VbXT8qLRWrAGU0CS4E6VbocgAfOQYqoa+QfHXVNtXCFdiErnf4LZrD4OqIBLqnU
	 hhjUPRonJf13aw3QWuSyKpWZCzhVeIxpwozx7XioxisVfMTvuJ6lU6BV7tNYy81UHL9kI
	 Fckmf1J+WW9LdbFB73HbAl+wUNAkXcEhmyJj4ykSO66KIUFyV1f63SxQpuIQxSuuM9yie
	 tIxMN9xs7Q8otCrkvud4oXkM4rPTC4cRg8P6Q+N7PFd1eDUomHu2YPfQWRQ+Ia/kSDw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790706997;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=7uoABzqZ/x/3MENje9HttGjERYRVqyel/vP0Wvu4PB0=;
	b=mpsw2cBsfTMowZwovXrAZ51QL+XfVoCfyV9iEwSYdt2hnxEzHyWQdOemyTgRDAvFRJiU
	 UUYq6WVpmMtN5HkjXoHBRrTu9NFGHLMr0926lj/7OSCtsPl9+Ssdz1v4KDjzvAVwhKhP1
	 UQisINdProiv+6EGaeg6LruAuabXcw00miTHDxqQuVC/glwagrlxZt1IL4sY85TdkmSeA
	 AiPMjEyPg8956JgkrgyZ2bxFl84iLJU/gJpqRBDvQaEljRGiuoXMtGL5X8oDena5xryej
	 yrAD3kMWsyH2tTwkV/B3qrdwT0yK8YnOSPsGzlF24yEI6V8uB+HhsYYK8Fr/pgQF9Ww==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=OMDA2Nh3;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790706997;
	bh=7uoABzqZ/x/3MENje9HttGjERYRVqyel/vP0Wvu4PB0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ls3p5OuMywr99UzX23PexrLq5rFHimQ8Qpv2P40Z6IQM7XANCBojkfzgw4dA44BWJ
	 uSGfNAT/euB93QfAb0CUQM3IRPshOCvmwmxDi480wQcQxDPi9OAZRjPMORWZ3+3lwH
	 BpNUuGOQNY2ogGw5uRksAolAnvZYcdhOr8XH1kXaW2iSRpNVzf/Xb2wN8Km7dsNP3K
	 q2NRYYIoo+2kvWQyCboPce0lweyUqbNkbi1htH9UG26yInJo66Su9m8WlO6vrWSs5z
	 eKHkYCuh/CJOODLhWUtFzp/0KL26YySh5Pr8lIeKYk62GO70XMYiPT7OfWVLF28Zqe
	 XdH0pBg/c0spg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E9E3607D6;
	Tue, 29 Sep 2026 18:36:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D9B414C
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 130C4605AD
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:36:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ofTkyfEf2-hU for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 18:36:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1237C607D5
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790706995;
 b=pjyQx/bQ3zkbf6cLbjidzhwoqUCbN+bNk7MfFVmVZhnWZCN/wqphWQjXUnsnMEGry4aa
 xo0Qps6Kmj6JJmFAmRHkcQTzO5yXOt4wiREUfku2myWgZzLNPtkzQ1zXlTrgRo0kOTlrv
 8nHk7+Tm2526nW7XjNqjh5L1BgrRIsdJrYgYt5e+CC7lzO5lHlQo9Mbs7x8DlC+lKtIqQ
 RuKHLnuomjy8frXPKisCOCmvoB11wdIPnNlvID9eIGtPWvBP4tPf2+rAkKLJP2Ho4d5KY
 MKrnUVrK5xif7xyCyMgP4lDlux1rvIUq+EFrARsgOImOOBbd2fsiXBedRZEWJsVNuyA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790706995;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=tPvxnqq/1u9cvc03ifEHbh8qgGtsotRaVb4HDbtu94k=;
 b=nWeWKWdxdDEWljNUbEgwjRUH2K8pGELjP7/iCmYWSzuctVV+vI5Z2CrpnuCwGoub/OQl
 5ImL/+8ayA640kp/J1NwXVkhg3ClK3ntC0ebygEMUZ81tPPhm6KRtZr9t+3Wz0K7EIHge
 oE/0rbBTBS2NLAkzievEVOyfz/QO/68q2bHJWIR8k+UKoAROkJofmRZKAV0jVdE/4lqjQ
 QSg+Lb/7IM1nPjypEESBv+8Ys8rKV2y++VVbvmQp/+VH3SXvHKMMteitZNqkzVaH+BqeY
 HFxu39ePEl2mb68dtKe6X3rNDRBPIqj+yXS5jQ7vm7t4Ut909oua6hMS4MDoBv6YB7g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=OMDA2Nh3; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=OMDA2Nh3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1237C607D5
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790706980;
 bh=tPvxnqq/1u9cvc03ifEHbh8qgGtsotRaVb4HDbtu94k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=OMDA2Nh3t4ZkR3vDAbrkDQBrv7HlNLZ6ry1fF+Sy/nokmAT3ASkQZN8XiqRZFyKpN
 nITP4aDZqao2LfIiWM52sCjdHX9aWN4lyAA8uSqwlnpKr5a6L7WdvNh6Zp6EeHuVgf
 1Zu09hvy4b3dJTcH3MXkjyGqCdq+/MTbgMVjdCcLALNOdMAJYDkabyEYzLknMHiMXp
 LBiPLuP+RImLy42whFstV68tSz+LGvrJfNMxSqSiIU8bHXqE/EMxJjzFanp4rHQL/M
 tf7vVVz66PPIA+VESbJjcQWxTRjwJZbY/0tPkxZWcAJW+El9eZii9OLDHcl1WCeEwk
 Caw55V3cX2CAA==
X-KAS-Sym: v3:f51bdf72230551df:KZDLWOub/TH/AK5rtQNnIZeKpqyWm80A2mWGMYTni0A+L
 HjNTkDkCtyQ4DkCAOMhviGUSy/4TxS7mKIVloV7no54wcHC9RI8b/l10/RLTgbKt+Z6X7PZ3W7E
 9fBoZebHygSJzn/FzCAnQhp5IR94ZsDr6y1D7NBXoRWeUDKW8CBH8dLcTDoptoZUrp9hW/iT4GK
 GYAwJkuB2ZB3gwjXQAhV2mwQgd7HdQHIbq50xQ6Tw4m0yNf6pOvygHgCUrCR0dMMYmRoNXzAz6t
 sLKjYK2O8Qy4vTaIbbYZkiyIa5c4PRU4l5CzgcHpDX92flFRqFNwW10OcwTfm3hMxD9YF0Xg==:
 008xbwXAD2kadLiNd80Fm8wWj4u9xCognM/YfG4Qjx5qGKlXrspTxcAFKITeK3aoOY5VAwl0TyZ
 Uy7CRoUGpAZvV3QrCxEggf94K9kNvbjO6XVSTVfx5UoXeoFVtHdK7ccRYKi2nKEaB+TCcSaNby2
 der3k8fGmnlNSMSR+oRmB0C0yOtknW4OjXVz1x7JMkq/ZfuwZQoC3JA2Zt8bNBVIX2isofmFc5I
 m8p5VlVkx/biHfLxHCTBrIqDeNj3lhcSc5LhA2ug103MLGkQOM3wplLd5msPEiYvQ4qqxzVg4GF
 Uw5ZNCrcQ7mITNqJsxMPcOnOgRQiNChngPrDygO0YLO69/3ZpGL+XN6+qt/O/KB1NFgyhp5HvgW
 uelmeAppE+xIZU9pKRit38+mlrpQjKTvIOpozLRFrHO2FbsTXj3Kg1Lv7+pKjC5P8FMe/9Rn5GR
 4Ps/byAvuAhuzUWCEddMeDwkkZUDbQXSM8b6Zx30dy8sgKkx4ZffX8ge9tR6AX2L2L7hFA3Vn/S
 K04CmYcy+VWtm2VzuIBtZ8MeS75ktn0BwK+tZgcoV4FjBfQj7p82TmMg2MP++Aa2RS58M1DC3iM
 c2oHLw==
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 40737A4C4FD9;
 Tue, 29 Sep 2026 20:36:20 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54806)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xBcgd-000000006Jn-2PIu;
 Tue, 29 Sep 2026 18:36:20 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 29 Sep 2026 20:35:01 +0200
Message-ID: <20260929183607.1849293-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929183607.1849293-1-bernd@kuhls.net>
References: <20260929183607.1849293-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v7 02/66] package/qt5/qt5opcua: remove package
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

x509/openssl_symbols.cpp: In function 'QDateTime q_getTimeFromASN1(const ASN1_TIME*)':
x509/openssl_symbols.cpp:1244:31: error: invalid use of incomplete type 'const ASN1_TIME' {aka 'const struct asn1_string_st'}
 1244 |     size_t lTimeLength = aTime->length;

x509/openssl_symbols.cpp:1245:35: error: invalid use of incomplete type 'const ASN1_TIME' {aka 'const struct asn1_string_st'}
 1245 |     char *pString = (char *) aTime->data;

x509/openssl_symbols.cpp:1247:14: error: invalid use of incomplete type 'const ASN1_TIME' {aka 'const struct asn1_string_st'}
 1247 |     if (aTime->type == V_ASN1_UTCTIME) {

x509/openssl_symbols.cpp:1307:21: error: invalid use of incomplete type 'const ASN1_TIME' {aka 'const struct asn1_string_st'}
 1307 |     } else if (aTime->type == V_ASN1_GENERALIZEDTIME) {

and mbed TLS since it was bumped from 2.28.10 to 3.6.3.1 with buildroot
commit 3481a9643fc7223e400ed877f08ade34d44e6b78 as seen by the
autobuilders.

The last release of the 5.x series dates back to 2020:
https://github.com/qt/qtopcua/releases/tag/v5.15.2

Fixes:
https://autobuild.buildroot.net/results/1f0/1f06b1efdde65fcd99ff79a63ed01b749788dec8/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Andreas Naumann <dev@andin.de>
---
 Config.in.legacy                   |  7 +++++++
 DEVELOPERS                         |  1 -
 package/qt5/Config.in              |  1 -
 package/qt5/qt5opcua/Config.in     |  9 ---------
 package/qt5/qt5opcua/qt5opcua.hash | 10 ----------
 package/qt5/qt5opcua/qt5opcua.mk   | 19 -------------------
 6 files changed, 7 insertions(+), 40 deletions(-)
 delete mode 100644 package/qt5/qt5opcua/Config.in
 delete mode 100644 package/qt5/qt5opcua/qt5opcua.hash
 delete mode 100644 package/qt5/qt5opcua/qt5opcua.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 5bbe332112..1cceec25d2 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.11"
 
+config BR2_PACKAGE_QT5OPCUA
+	bool "qt5opcua has been removed"
+	select BR2_LEGACY
+	help
+	  The qt5opcua package has been removed because it is
+	  incompatible with OpenSSL >= 4.x and mbed TLS 3.x
+
 config BR2_PACKAGE_QT5KNX
 	bool "qt5knx has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 0211f53e4b..76c99ed311 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -203,7 +203,6 @@ N:	Andreas Naumann <dev@andin.de>
 F:	package/evemu/
 F:	package/libevdev/
 F:	package/pkg-qmake.mk
-F:	package/qt5/qt5opcua/
 F:	package/qt6/qt6opcua/
 
 N:	Andreas Ziegler <br025@umbiko.net>
diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index b837601dc6..8b4903a5ab 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -48,7 +48,6 @@ source "package/qt5/qt5location/Config.in"
 source "package/qt5/qt5lottie/Config.in"
 source "package/qt5/qt5mqtt/Config.in"
 source "package/qt5/qt5multimedia/Config.in"
-source "package/qt5/qt5opcua/Config.in"
 source "package/qt5/qt5quickcontrols/Config.in"
 source "package/qt5/qt5quickcontrols2/Config.in"
 source "package/qt5/qt5quicktimeline/Config.in"
diff --git a/package/qt5/qt5opcua/Config.in b/package/qt5/qt5opcua/Config.in
deleted file mode 100644
index 2b0ba37af3..0000000000
--- a/package/qt5/qt5opcua/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_PACKAGE_QT5OPCUA
-	bool "qt5opcua"
-	depends on BR2_PACKAGE_QT5
-	help
-	  Qt is a cross-platform application and UI framework for
-	  developers using C++.
-
-	  The Qt OPC UA module implements a Qt API to interact with
-	  OPC UA on top of a 3rd party OPC UA stack.
diff --git a/package/qt5/qt5opcua/qt5opcua.hash b/package/qt5/qt5opcua/qt5opcua.hash
deleted file mode 100644
index a325653f80..0000000000
--- a/package/qt5/qt5opcua/qt5opcua.hash
+++ /dev/null
@@ -1,10 +0,0 @@
-# Hash locally calculated
-sha256  fa8e0e87aae6f321aecac2605e6ac1b858ba1ed4db3c4a78a193eb7b547ab224  qt5opcua-5.15.2-git4.tar.gz
-
-# Hashes for license files:
-sha256  d93cc415382f0013088fa276d9cf82373badf244c78220a926f15ee46f0fe3c4  LICENSE-CC0
-sha256  f827ad079686ba92cc94811e35492d0e8966f704008b6da9eeda0b659fb58a8d  LICENSE.FDL
-sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
-sha256  0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652  LICENSE.GPL3-EXCEPT
-sha256  6c3f3c31b93985f1b93bfbb35fb609d37281697d0efc220c9f91cf4b59eaabde  LICENSE.GPLv2
-sha256  75d800e60c8d58c2e7f0338e8552ea6123a9ce7e5dd8e1cdf2095e013b737488  LICENSE.LGPLv3
diff --git a/package/qt5/qt5opcua/qt5opcua.mk b/package/qt5/qt5opcua/qt5opcua.mk
deleted file mode 100644
index ef51abddf8..0000000000
--- a/package/qt5/qt5opcua/qt5opcua.mk
+++ /dev/null
@@ -1,19 +0,0 @@
-################################################################################
-#
-# qt5opcua
-#
-################################################################################
-
-QT5OPCUA_VERSION = 5.15.2
-QT5OPCUA_SITE = https://code.qt.io/qt/qtopcua.git
-QT5OPCUA_SITE_METHOD = git
-QT5OPCUA_INSTALL_STAGING = YES
-QT5OPCUA_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs) CC0-1.0
-QT5OPCUA_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL LICENSE-CC0
-QT5OPCUA_SYNC_QT_HEADERS = YES
-
-ifeq ($(BR2_PACKAGE_MBEDTLS),y)
-QT5OPCUA_DEPENDENCIES += mbedtls
-endif
-
-$(eval $(qmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
