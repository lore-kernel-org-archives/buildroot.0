Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63026EA71A1
	for <buildroot@archiver.kernel.org>; Sun, 19 Apr 2026 17:10:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11A9F81819;
	Sun, 19 Apr 2026 17:10:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KIL6LWOSd4BU; Sun, 19 Apr 2026 17:10:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CBE681826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776618636;
	bh=tmUMygJTSn+wx2LdbjfaMmqGZzuI78du62V/AgDjGP8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NS7yFCqVZJrjjbv28euhpvn68pyZIzmDQjG5DWKwUauzW2WEfLmckRqo7jUMJ6tEO
	 cBn4rgs7cXbSUKieBy93xtIV8zQDYEp1Lj3DNWwm6mU6CCRLHXNDeJhy80B0ICABho
	 sAP/4NUHOwG6aoYwPzbtYJH/UxLd7vwQ+FjgCB4fBhrt+i9Ho7ZMwxYmwKlSBDQzq0
	 +kxP/+V8n6m5/lGfElReEUbexQH+a2vbJIcDSVv4rW6CotaCIBoaGHdcTzosT32BxO
	 ryeDPrKa8+bt35kazcw38Cr2ZRe9zv1Ud3crU3wHIkzb073zcKqnkrvC8BLOO+mXQY
	 I8HIQbOsXGM0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CBE681826;
	Sun, 19 Apr 2026 17:10:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D21624D
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 17:10:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E78F160FDD
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 17:10:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TKC1I0U5CDLa for <buildroot@buildroot.org>;
 Sun, 19 Apr 2026 17:10:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9476560A85
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9476560A85
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9476560A85
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 17:10:31 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc94.dip0.t-ipconnect.de [79.214.204.148])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C3695A4C3402
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 19:10:28 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45182)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wEVfA-000000000aL-1vU8
 for buildroot@buildroot.org; Sun, 19 Apr 2026 17:10:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 19 Apr 2026 19:10:28 +0200
Message-ID: <20260419171028.1659761-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776618628;
 bh=zDypI/adzEOFAlX2yAbbndL8ngQs94cAwMM39kHoowY=;
 h=From:To:Subject:Date:From;
 b=Zre6sKpddG10RILNqrxJuBAxe+QH5vDDXsK3GWUuLBTnLa3shPdyOc/QoStx9LS/c
 DPOZZJCr6WT255yoQvZWKzT2XepqOtRcGW1R/2i6bLdmmpPVhNl1HlSu2yHjXLft1A
 Od3G7RgzA8XPRCvPY6Z4Z2Obt6Daig9SeSukJR0adA8MvtvYtMLfM0YIF815fiZtH4
 eFKSiZjzLkOEmSvHE8UjlkX6yosreo7M0yguIMsD1zwfzBiB7mhlfitC2S6FNl407C
 JjfmNPGjDnXWrotfe7LjIQ2mXk2yyxEM9wU32cO+qw7Dg0qmG7f79HOJPC7oNe7pJ0
 +uqFE/Cd15deg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=Zre6sKpd
Subject: [Buildroot] [PATCH v2 1/1] package/openvpn: bump version to 2.7.1
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

https://github.com/OpenVPN/openvpn/blob/v2.7.1/Changes.rst

Added static_assert fix for older uClibc needed due to upstream commit:
https://github.com/OpenVPN/openvpn/commit/6768ef1dab5cb6c1dbc210c20cf92820a64dace3

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: Added static_assert fix for older uClibc (Julien)

 package/openvpn/openvpn.hash | 2 +-
 package/openvpn/openvpn.mk   | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index d172689685..d01cb73c98 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking signature
-sha256  13702526f687c18b2540c1a3f2e189187baaa65211edcf7ff6772fa69f0536cf  openvpn-2.6.19.tar.gz
+sha256  9858477ec2894a8a672974d8650dcb1af2eeffb468981a2b619f0fa387081167  openvpn-2.7.1.tar.gz
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYRIGHT.GPL
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 9dc4ef4714..3bc42f2db1 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.6.19
+OPENVPN_VERSION = 2.7.1
 OPENVPN_SITE = https://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf libcap-ng
 OPENVPN_LICENSE = GPL-2.0
@@ -16,6 +16,9 @@ OPENVPN_CONF_OPTS = \
 	$(if $(BR2_STATIC_LIBS),--disable-plugins)
 OPENVPN_CONF_ENV = NETSTAT=/bin/netstat
 
+# workaround for static_assert on uclibc-ng < 1.0.42
+OPENVPN_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -Dstatic_assert=_Static_assert"
+
 ifeq ($(BR2_PACKAGE_LIBNL)$(BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_16),yy)
 OPENVPN_CONF_OPTS += --enable-dco
 OPENVPN_DEPENDENCIES += libnl
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
