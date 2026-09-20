Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C302C982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:09:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4673D40619;
	Sun, 20 Sep 2026 14:09:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C5zSqouPA2JD; Sun, 20 Sep 2026 14:09:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org ADD6140D7A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789913394;
	b=jzY1P8Vyn8riSsJsWgn5DnydLmmn/c9LV5yCuKNUDTklok9rqWMt4Y2dGmEOSt03vdXq
	 05lmazKTuEGvm0QHvUIbLM/hXR/oDpOAD3goxFQ69OPXHNW0wKF4P+Z/V6HQiRBL4B0kS
	 G/EoTrv/INZVaROc05X13UCeIJtYn4aWb5yEAl4eoz2xVXgqep8IUGWX4AEY9UYzpnmxr
	 rHDS0ovxklo+b+HKYAzJzDcIwi6ZdjPtll7OOcxhkIS3lHTfHP3HB57aCWKDI4whDBscF
	 eNnQ2mGkKIrzwTpPBK/vcJMLgKLEfw/wI/U37Kj1gFs1wfsCsxGVMvdsjUhJOqU5Lig==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789913394;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=XxuHis/C+CUbJ6Or9QulgDiiqDxxzZq9qrywsAOWxIg=;
	b=Q5bRHsXlCqsl+jp1qIttrfKqSgL2OBLtm7nYo5gAKHK3gRqpbBO15SP1SMG1GiJjZVrc
	 UngVwfD9IAhViyCdVdI7pqqAgFu8oHuunOp8OSWnG3UGZqApEYMCL3Cqm1lSbP1TQLUSj
	 FDR/D/6gUz+MpF0vhz4O39+CnuyN4R/LnHwW3fIyCyNXLbPeNvSrMexym5GfefLALEn3k
	 T7g7n9q/xuSZHYNjIlQ3KOMniHpVXAenyiv4ui6mGFvVpjmjU7hD5B+SjdiT05/5brQbs
	 YTp2sPmG6flNSLWcsAtyh9Bq4pmS6njyYB2w14eoQp4rENsJAvWhL62zQNsYgusgPoA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789913394;
	bh=XxuHis/C+CUbJ6Or9QulgDiiqDxxzZq9qrywsAOWxIg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=s7xiQXmAeWMQuz8l//s0eKg76bOf5lEKhjbaxcs4vdiEx9rrfjTJVnG++dywZYFLE
	 tIQs+UNVeUjFBWyy/ovEuIOg+Q/L8Yk6JSRQF00ycjphR4IzQaZNO14BNNgKt7kiDN
	 AZQUg7waVii6HhB5OjZPpyMvfGwc4w/R0JGxVkuO1JL0LROE/usSWdShh4u6wGtCvf
	 dvBGTMIaBYSbQ3Z/7GQRRs9RVasRUtXCa9eXIr3MjlhGRqc9cGAuu06mw82So/AREZ
	 j7hf2TeIaa1fiuka9IYPBqHygGZ0F1LyLTgWj9fgsnI99FVjQQHXH0/sRGk7L9nWEx
	 ikBIhkDUL0F+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADD6140D7A;
	Sun, 20 Sep 2026 14:09:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 424563AF
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3444F60638
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:09:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dgXAg94g8yOY for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:09:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7D08E605FD
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789913391;
 b=WwePV8jUl2urp2vY1rcLarw8h01Duzpr3/RdKRqC6Q4/kSMCMLjaY0Larb9LJqlHmh39
 0+QVxB0T+ytCDdWI6Im5kM7kpYIpRO/RHMYrJcREaM8piuALXE2f0G4XywZVoOPIKSVY9
 wmkYwD08BEyhlq+Fw6i6FGD9/wdbWzFSzxzPiVnr/PYbXFyTWpqq++2htDdj8kckDO8F8
 AkypHTVF0panbCoS1OocsAnFOtT8ClUPkisbnmwApjrs+pCt1jneCuxohtBpSCRl5dGOo
 BLoGX3c6JeQp4rdHW+Km1b5s3Oc9pGzaP8GggT099c/748AgZ/MhlGZG7n+LLvDwU7g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789913391;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=6mKB4zYC0mxcuWdcf/nxGqYWE59FyHJFtFVZAxEZI7s=;
 b=ByKujHLMU6oI7RjCnOmjDVrbVnTTM3htnt+MpFtPhywB82lX2I8HHGrnY2Oc6rMbD39G
 S/2+iByrrEDZrrVZTvP96gqQjxETXWF4DeqP15mYVGzJWaqky6QDOrAJI/zXL7oVDxiIA
 FunOg2GMX6pyGjAj73ybXeGP2PrZbJncLImDNjMbCAqbFHteQe0gu6t7iucPDX1c9E/AZ
 /8HzB56T3jqnc4vHHdKTWs7LjinQKcomExFOBwlTJApTrrH+B+E8FjPpNB1YvHNefBgB0
 ldaBFFnW/QZL4UpY+3HjKekCoNfvJFedPiwPGnR9KWPU4PGK73mO/yo/xHUF9yBP1/w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=OYR3kU5J; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=OYR3kU5J
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7D08E605FD
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789913226;
 bh=6mKB4zYC0mxcuWdcf/nxGqYWE59FyHJFtFVZAxEZI7s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=OYR3kU5J4wzkCQ3Ax0k5WEgYfhWtTaq0X8zWpffGBNsy854djmiRoSchDBxje6WPw
 ds0MFvUkYG94CSQDTCL+KeWUBxeg38jy0TuqUxc2F9T1AkgnPqciDwO2TNNPnRy4Hf
 yYZSDtzlKqU+eqOd8nbLKpbTwHELayHyRB26fGGNageNpHDyqGfEArC0P4tbIugtmk
 m9IFqeQUcyAzgWEzsWihbYxCJZALY8ygS9NHvviJzy0W50ilrZ5Bz796tG8KxKz7k5
 5sAjDaFt5Gj1zw+XqLt/hhdtI6AfBS9a7K6FQyAuDwQJS4bvEYfc4HPNr2zDSRcs4i
 AvAwKGoNF/8GQ==
X-KAS-Sym: v3:f51bdf72230551df:kLsnpyO7xBQrienfp2HUkZLPIhoTWu0/2yOhSoEwU9REifldITt5uV1ZdfMxSIXWRKvTv9N0MZy0diMQpN0glcVgMpe+EHt4b9SSwIYdetNWrA3E4NHKWfeZ/Yj39hsXFoGsOc8DrIkTkE1cC8EDIzHMfql9Fk3+lmPjxillh8Rm13WqHm12wYfkg5zOONe3wQt1e4nql+laa117tthJT7FrH8LMc8sT6Y5hh1ZURpz+CgjkohF28/JMh91Xek4Jjzq7nWhnLLJK+IRHJUgBaWAXDGJyfMy5p24uZes2P0HVy2Hp1VIUhvBjLxL0/3h3AKkiBTMMXv2yTZN4hJ68hw==:i63qt7ZvH5Rh8lKYU29scqDYEo6yNH36wde04/7KY/39nsx5/POqv9uAXLXvxYwej4c1TR4D5S2mbdU1QLxQcODXzare34EmaVGPEpvPDPS+9HQUcfQgE6HJmWZU05OkSUpyG55RQgecFyCmfAjiIPGuu8k/uUvO0+UtcbA9WZC003lyTpNEm9gIt4Co1hKqVyBRCPeqy53fOMtFF5gZT9NHylN/W7Cw+rgbIAjOvUYHDDVpC5+hfVfqUzropybcEitTLkdE/RqQ1k822Nvt99XOdSoXLc/N4LCSBpkBIc7tbEmWQQRUUb/PSyCpOp3sfyuuIfv4KP9zLLtwHEtY/+TLqrPqMIFv9ihW20/1OCNAGOLWL2xz6NWo0X/dgaVP7MwU8Zr7DVU1MvHXj3q1kb48J66LHVo2gN1WxYY3Wrffw8v6+IkgGFYNd4o2gwGvfe9NfT/Vx/7xSJ2tMKfeg8Cfbx+jotCoiNzVPJAFAPV2d4IgEe2w0ayfEA83lypBKK9qfeITv/f+XQgJXwV21MQSrQKffcLxkjNQI5nGh+L5Pz1MM7uARLUYADoodWSnub6ycbgKk/l0H7eOEcvdEqvd2m2EhLbs6aNRqXbJZHDbf3
 EeOjHcmTN6Oy6wjcf9odmGa0oL2UHhW+RMOToX3Zw6FwoxRRSyxb77d9gkJeqHaN2NKT/9Kaf/ZGRewhBz94NuzRbXxb7MdUj1fjeZQiR37qzSoaX8eQ==
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4BCC8A4C4860;
 Sun, 20 Sep 2026 16:07:06 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39216)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8IBP-000000002J9-2LkU;
 Sun, 20 Sep 2026 14:06:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:06:04 +0200
Message-ID: <20260920140605.3005461-67-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920140605.3005461-1-bernd@kuhls.net>
References: <20260920140605.3005461-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v3 66/66] package/libopenssl: bump version to
 4.0.2
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Sen Hastings <sen@hastings.org>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://openssl-library.org/post/2026-04-14-openssl-40-final-release/
https://github.com/openssl/openssl/blob/openssl-4.0.2/CHANGES.md#openssl-40

The following section results in updates to many packages:
" * `ASN1_STRING` has been made opaque.

  * Signatures of numerous API functions, including those that are related
    to X509 processing, are changed to include `const` qualifiers for argument
    and return types, where suitable."

More infos can be found here:
https://openssl-library.org/post/2026-04-13-asn1_string/

The following section resulted in new legacy options and changes to
many packages to maintain bisectability:
" * Removed support for SSLv3.  SSLv3 has been deprecated since 2015,
    and OpenSSL had it disabled by default since version 1.1.0 (2016).

  * Removed support for engines.  The `no-engine` build option
    and the `OPENSSL_NO_ENGINE` macro are always present."

More infos can be found here:
https://openssl-library.org/post/2026-04-07-ssl3/index.html
https://openssl-library.org/post/2025-12-18-remove-engines/index.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 Config.in.legacy                   | 36 ++++++++++++++++++++++++++++++
 package/apr-util/Config.in         |  1 -
 package/dovecot/Config.in          |  1 -
 package/fluent-bit/Config.in       |  1 -
 package/libcoap/Config.in          |  1 -
 package/libks/Config.in            |  1 -
 package/libldns/libldns.mk         |  8 +------
 package/libopenssl/Config.in       | 34 ----------------------------
 package/libopenssl/libopenssl.hash |  4 ++--
 package/libopenssl/libopenssl.mk   | 18 +--------------
 package/libp11/Config.in           |  1 -
 package/libp11/libp11.mk           |  3 +--
 package/librelp/Config.in          |  1 -
 package/libssh/Config.in           |  1 -
 package/luvi/Config.in             |  1 -
 package/mtd/Config.in              |  1 -
 package/openssh/openssh.mk         |  8 +------
 package/rauc/Config.in             |  2 --
 package/rauc/rauc.mk               |  3 ++-
 package/softhsm2/Config.in         |  1 -
 package/unbound/Config.in          |  1 -
 package/unbound/unbound.mk         |  1 +
 22 files changed, 45 insertions(+), 84 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 747683ff5a..b4178fbac2 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,42 @@ endif
 
 comment "Legacy options removed in 2026.11"
 
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL
+	bool "OpenSSL SSL support has been removed"
+	select BR2_LEGACY
+	help
+	  OpenSSL 4.x removed SSL support
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL3
+	bool "OpenSSL SSL3 support has been removed"
+	select BR2_LEGACY
+	help
+	  OpenSSL 4.x removed SSL3 support
+
+config BR2_PACKAGE_LIBOPENSSL_ENGINES
+	bool "OpenSSL additional engines has been removed"
+	select BR2_LEGACY
+	help
+	  OpenSSL 4.x removed engines support
+
+config BR2_PACKAGE_LIBOPENSSL_DYNAMIC_ENGINE
+	bool "OpenSSL dynamic engine has been removed"
+	select BR2_LEGACY
+	help
+	  OpenSSL 4.x removed engines support
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_LOADER_ENGINE
+	bool "OpenSSL 'loader_attic' engine has been removed"
+	select BR2_LEGACY
+	help
+	  OpenSSL 4.x removed engines support
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_PADLOCK_ENGINE
+	bool "OpenSSL padlock engine has been removed"
+	select BR2_LEGACY
+	help
+	  OpenSSL 4.x removed engines support
+
 config BR2_PACKAGE_QT5KNX
 	bool "qt5knx has been removed"
 	select BR2_LEGACY
diff --git a/package/apr-util/Config.in b/package/apr-util/Config.in
index 06b6c2684c..2a28d5f5aa 100644
--- a/package/apr-util/Config.in
+++ b/package/apr-util/Config.in
@@ -6,7 +6,6 @@ config BR2_PACKAGE_APR_UTIL
 	select BR2_PACKAGE_APR
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
-	select BR2_PACKAGE_LIBOPENSSL_ENGINES if BR2_PACKAGE_LIBOPENSSL
 	help
 	  The utility library for the apache runtime project
 
diff --git a/package/dovecot/Config.in b/package/dovecot/Config.in
index 6753160c27..e6c1f92d07 100644
--- a/package/dovecot/Config.in
+++ b/package/dovecot/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_DOVECOT
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
-	select BR2_PACKAGE_LIBOPENSSL_ENGINES if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_PCRE2_32 if BR2_PACKAGE_PCRE2
 	select BR2_PACKAGE_OPENSSL
diff --git a/package/fluent-bit/Config.in b/package/fluent-bit/Config.in
index 2af6279744..51655f9a2f 100644
--- a/package/fluent-bit/Config.in
+++ b/package/fluent-bit/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_FLUENT_BIT
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_STATIC_LIBS # dlfcn.h
 	select BR2_PACKAGE_C_ARES
-	select BR2_PACKAGE_LIBOPENSSL_ENGINES # needed by bundled librdkafka
 	select BR2_PACKAGE_LIBYAML
 	select BR2_PACKAGE_MSGPACK_C
 	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/libcoap/Config.in b/package/libcoap/Config.in
index 2bd6b742e9..7fb6ad8533 100644
--- a/package/libcoap/Config.in
+++ b/package/libcoap/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_LIBCOAP
 	bool "libcoap"
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_PSK if BR2_PACKAGE_LIBOPENSSL
-	select BR2_PACKAGE_LIBOPENSSL_ENGINES if BR2_PACKAGE_LIBOPENSSL
 	help
 	  libcoap is a C implementation of a lightweight
 	  application-protocol for devices that are constrained their
diff --git a/package/libks/Config.in b/package/libks/Config.in
index 17a008d7a0..4781d188bf 100644
--- a/package/libks/Config.in
+++ b/package/libks/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_LIBKS
 	depends on !BR2_STATIC_LIBS # dlfcn.h
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # pthread_setname_np()
 	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_LIBOPENSSL_ENGINES if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
diff --git a/package/libldns/libldns.mk b/package/libldns/libldns.mk
index 13fe854460..49cb44d51c 100644
--- a/package/libldns/libldns.mk
+++ b/package/libldns/libldns.mk
@@ -24,17 +24,11 @@ LIBLDNS_CONF_OPTS = \
 	--without-pyldnsx
 
 ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
-LIBLDNS_CONF_OPTS += --enable-dane-verify
+LIBLDNS_CONF_OPTS += --enable-dane-verify --disable-gost
 else
 LIBLDNS_CONF_OPTS += --disable-dane-verify
 endif
 
-ifeq ($(BR2_PACKAGE_LIBOPENSSL_ENGINES),y)
-LIBLDNS_CONF_OPTS += --enable-gost
-else
-LIBLDNS_CONF_OPTS += --disable-gost
-endif
-
 ifeq ($(BR2_STATIC_LIBS),y)
 LIBLDNS_DEPENDENCIES += host-pkgconf
 # missing -lz breaks configure, add it using pkgconf
diff --git a/package/libopenssl/Config.in b/package/libopenssl/Config.in
index 03d3def802..69ad0b9875 100644
--- a/package/libopenssl/Config.in
+++ b/package/libopenssl/Config.in
@@ -40,11 +40,6 @@ config BR2_PACKAGE_LIBOPENSSL_BIN
 	  to the target file system. This is a command line tool for
 	  doing various cryptographic stuff.
 
-config BR2_PACKAGE_LIBOPENSSL_ENGINES
-	bool "openssl additional engines"
-	help
-	  Install additional encryption engine libraries.
-
 config BR2_PACKAGE_LIBOPENSSL_ENABLE_CHACHA
 	bool "enable CHACHA"
 	default y
@@ -98,14 +93,6 @@ config BR2_PACKAGE_LIBOPENSSL_ENABLE_BLOWFISH
 	bool "enable BLOWFISH"
 	default y
 
-config BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL
-	bool "enable SSL"
-	default y
-
-config BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL3
-	bool "enable SSL3"
-	default y
-
 config BR2_PACKAGE_LIBOPENSSL_ENABLE_WEAK_SSL
 	bool "enable WEAK_SSL"
 	default y
@@ -125,10 +112,6 @@ config BR2_PACKAGE_LIBOPENSSL_UNSECURE
 	  Enable unit-test crypto-mdebug-backtrace
 	  crypto-mdebug autoerrinit mode.
 
-config BR2_PACKAGE_LIBOPENSSL_DYNAMIC_ENGINE
-	bool "enable dynamic engine"
-	default y
-
 config BR2_PACKAGE_LIBOPENSSL_ENABLE_COMP
 	bool "enable compression"
 	default y
@@ -173,23 +156,6 @@ config BR2_PACKAGE_LIBOPENSSL_ENABLE_ECX
 	  Build with ECX support. Disabling this option can be used
 	  to disable support for X25519, X448, and EdDSA.
 
-config BR2_PACKAGE_LIBOPENSSL_ENABLE_LOADER_ENGINE
-	bool "enable 'loader_attic' engine"
-	default y
-	depends on BR2_PACKAGE_LIBOPENSSL_DYNAMIC_ENGINE
-	help
-	  Build with 'loader_attic' engine support, which is meant
-	  just for internal OpenSSL testing purposes and supports
-	  loading keys, parameters, certificates, and CRLs from files.
-	  When this engine is used, files with such credentials are
-	  read via this engine.
-
-config BR2_PACKAGE_LIBOPENSSL_ENABLE_PADLOCK_ENGINE
-	bool "enable padlock engine"
-	default y
-	help
-	  Build the padlock engine.
-
 config BR2_PACKAGE_LIBOPENSSL_ENABLE_MODULE
 	bool "enable modules"
 	default y
diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index 46ac5589dc..68940ebf80 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://github.com/openssl/openssl/releases/download/openssl-3.6.4/openssl-3.6.4.tar.gz.sha256
-sha256  9bffaa1ad1e07b354c21bd3324ec02fa15579f45a7d0494b3e74bc449b7333ef  openssl-3.6.4.tar.gz
+# From https://github.com/openssl/openssl/releases/download/openssl-4.0.2/openssl-4.0.2.tar.gz.sha256
+sha256  736b467530f916737b7031310ccb21d8218c6229e61e8e160cd1d3458cd543a8  openssl-4.0.2.tar.gz
 
 # License files
 sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 9b3eec4baa..bfd6f026fd 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 3.6.4
+LIBOPENSSL_VERSION = 4.0.2
 LIBOPENSSL_SITE = https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = Apache-2.0
@@ -80,16 +80,13 @@ define LIBOPENSSL_CONFIGURE_CMDS
 			--openssldir=/etc/ssl \
 			$(if $(BR2_TOOLCHAIN_HAS_THREADS),threads,no-threads) \
 			$(if $(BR2_STATIC_LIBS),no-shared,shared) \
-			$(if $(BR2_PACKAGE_CRYPTODEV_LINUX),enable-devcryptoeng) \
 			no-rc5 \
 			enable-camellia \
 			no-docs \
 			no-tests \
 			no-fuzz-libfuzzer \
 			no-fuzz-afl \
-			no-afalgeng \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_BIN),,no-apps) \
-			$(if $(BR2_PACKAGE_LIBOPENSSL_ENGINES),,no-engine) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_CHACHA),,no-chacha) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_RC2),,no-rc2) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4),,no-rc4) \
@@ -103,21 +100,16 @@ define LIBOPENSSL_CONFIGURE_CMDS
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160),,no-rmd160) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_WHIRLPOOL),,no-whirlpool) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_BLOWFISH),,no-bf) \
-			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL),,no-ssl) \
-			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL3),,no-ssl3) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_WEAK_SSL),,no-weak-ssl-ciphers) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_PSK),,no-psk) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_CAST),,no-cast) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_UNSECURE),,no-unit-test no-crypto-mdebug no-autoerrinit) \
-			$(if $(BR2_PACKAGE_LIBOPENSSL_DYNAMIC_ENGINE),,no-dynamic-engine ) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_COMP),,no-comp) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_ARGON2),,no-argon2) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_CACHED_FETCH),,no-cached-fetch) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_CMP),,no-cmp) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_THREAD_POOL),,no-thread-pool no-default-thread-pool) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_ECX),,no-ecx) \
-			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_LOADER_ENGINE),,no-loadereng) \
-			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_PADLOCK_ENGINE),,no-padlockeng) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_MODULE),,no-module) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_QUIC),,no-quic) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_SECURE_MEMORY),,no-secure-memory) \
@@ -155,7 +147,6 @@ endef
 define LIBOPENSSL_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
 	$(RM) -rf $(TARGET_DIR)/usr/lib/ssl
-	$(RM) -f $(TARGET_DIR)/usr/bin/c_rehash
 endef
 
 # libdl has no business in a static build
@@ -175,12 +166,5 @@ endef
 LIBOPENSSL_POST_INSTALL_TARGET_HOOKS += LIBOPENSSL_REMOVE_PERL_SCRIPTS
 endif
 
-ifeq ($(BR2_PACKAGE_LIBOPENSSL_ENGINES),)
-define LIBOPENSSL_REMOVE_LIBOPENSSL_ENGINES
-	$(RM) -rf $(TARGET_DIR)/usr/lib/engines-3
-endef
-LIBOPENSSL_POST_INSTALL_TARGET_HOOKS += LIBOPENSSL_REMOVE_LIBOPENSSL_ENGINES
-endif
-
 $(eval $(generic-package))
 $(eval $(host-generic-package))
diff --git a/package/libp11/Config.in b/package/libp11/Config.in
index 3bf13a6051..3c7ccdee27 100644
--- a/package/libp11/Config.in
+++ b/package/libp11/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_LIBP11
 	bool "libp11"
 	depends on !BR2_STATIC_LIBS # dlopen
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_PACKAGE_LIBOPENSSL_ENGINES
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	help
diff --git a/package/libp11/libp11.mk b/package/libp11/libp11.mk
index 38cc1c2e6d..e8c56b9db5 100644
--- a/package/libp11/libp11.mk
+++ b/package/libp11/libp11.mk
@@ -11,10 +11,9 @@ LIBP11_INSTALL_STAGING = YES
 LIBP11_LICENSE = LGPL-2.1+
 LIBP11_LICENSE_FILES = COPYING
 
-# pkg-config returns a libcrypto enginesdir prefixed with the sysroot,
+# pkg-config returns a libcrypto modulesdir prefixed with the sysroot,
 # so let's rip it out.
 LIBP11_CONF_OPTS = \
-	--with-enginesdir=`$(PKG_CONFIG_HOST_BINARY) --variable enginesdir libcrypto | xargs readlink -f | sed 's%^$(STAGING_DIR)%%'` \
 	--with-modulesdir=`$(PKG_CONFIG_HOST_BINARY) --variable modulesdir libcrypto | xargs readlink -f | sed 's%^$(STAGING_DIR)%%'`
 
 ifeq ($(BR2_PACKAGE_P11_KIT),y)
diff --git a/package/librelp/Config.in b/package/librelp/Config.in
index f1744bb60c..c0ae5fbe89 100644
--- a/package/librelp/Config.in
+++ b/package/librelp/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_LIBRELP
 	bool "librelp"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_PACKAGE_LIBOPENSSL_ENGINES if BR2_PACKAGE_LIBOPENSSL
 	help
 	  Reliable Event Logging Protocol library
 
diff --git a/package/libssh/Config.in b/package/libssh/Config.in
index bc9a02d9b0..1f271a692e 100644
--- a/package/libssh/Config.in
+++ b/package/libssh/Config.in
@@ -36,7 +36,6 @@ config BR2_PACKAGE_LIBSSH_LIBGCRYPT
 config BR2_PACKAGE_LIBSSH_OPENSSL
 	bool "openssl"
 	depends on BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_LIBOPENSSL_ENGINES if BR2_PACKAGE_LIBOPENSSL
 
 endchoice
 
diff --git a/package/luvi/Config.in b/package/luvi/Config.in
index 04163141b0..bf366f020d 100644
--- a/package/luvi/Config.in
+++ b/package/luvi/Config.in
@@ -9,7 +9,6 @@ config BR2_PACKAGE_LUVI
 	select BR2_PACKAGE_LIBUV
 	select BR2_PACKAGE_LUV
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
-	select BR2_PACKAGE_LIBOPENSSL_ENGINES if BR2_PACKAGE_LIBOPENSSL
 	help
 	  A project in-between luv and luvit. The goal of this is to
 	  make building luvit and derivatives much easier.
diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index 1054106f81..f8a9badaf6 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -15,7 +15,6 @@ config BR2_PACKAGE_MTD_JFFS_UTILS
 
 config BR2_PACKAGE_MTD_UBIFS_UTILS
 	bool
-	select BR2_PACKAGE_LIBOPENSSL_ENGINES if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index f2e1f235c0..651d6d46ee 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -23,6 +23,7 @@ OPENSSH_CONF_OPTS = \
 	--with-pid-dir=/var/run \
 	--with-default-path=$(BR2_SYSTEM_DEFAULT_PATH) \
 	$(if $(BR2_PACKAGE_OPENSSH_SANDBOX),--with-sandbox,--without-sandbox) \
+	--without-ssl-engine \
 	--disable-lastlog \
 	--disable-utmp \
 	--disable-utmpx \
@@ -55,13 +56,6 @@ ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
 OPENSSH_DEPENDENCIES += libxcrypt
 endif
 
-ifeq ($(BR2_PACKAGE_CRYPTODEV_LINUX),y)
-OPENSSH_DEPENDENCIES += cryptodev-linux
-OPENSSH_CONF_OPTS += --with-ssl-engine
-else
-OPENSSH_CONF_OPTS += --without-ssl-engine
-endif
-
 ifeq ($(BR2_PACKAGE_AUDIT),y)
 OPENSSH_DEPENDENCIES += audit
 OPENSSH_CONF_OPTS += --with-audit=linux
diff --git a/package/rauc/Config.in b/package/rauc/Config.in
index 9a910963a3..76e9e8a651 100644
--- a/package/rauc/Config.in
+++ b/package/rauc/Config.in
@@ -6,8 +6,6 @@ config BR2_PACKAGE_RAUC
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL # uses X509_PURPOSE_get_by_id
-	# uses ENGINE_* API
-	select BR2_PACKAGE_LIBOPENSSL_ENGINES
 	select BR2_PACKAGE_SQUASHFS # run-time dependency
 	help
 	  RAUC is the Robust Auto-Update Controller developed by
diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index 54974abc09..748da90f38 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -11,7 +11,7 @@ RAUC_LICENSE = LGPL-2.1
 RAUC_LICENSE_FILES = COPYING
 RAUC_CPE_ID_VENDOR = pengutronix
 RAUC_DEPENDENCIES = host-pkgconf openssl libglib2
-RAUC_CONF_OPTS += -Dtests=false
+RAUC_CONF_OPTS += -Dtests=false -Dpkcs11_engine=false
 
 ifeq ($(BR2_PACKAGE_RAUC_DBUS),y)
 RAUC_CONF_OPTS += -Dservice=true
@@ -71,6 +71,7 @@ HOST_RAUC_DEPENDENCIES = \
 HOST_RAUC_CONF_OPTS += \
 	-Djson=enabled \
 	-Dnetwork=false \
+	-Dpkcs11_engine=false \
 	-Dstreaming=false \
 	-Dservice=false \
 	-Dtests=false
diff --git a/package/softhsm2/Config.in b/package/softhsm2/Config.in
index c790e7a2b0..c22a371cba 100644
--- a/package/softhsm2/Config.in
+++ b/package/softhsm2/Config.in
@@ -7,7 +7,6 @@ config BR2_PACKAGE_SOFTHSM2
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES
-	select BR2_PACKAGE_LIBOPENSSL_ENGINES
 	help
 	  SoftHSM is an implementation of a cryptographic store
 	  accessible through a PKCS#11 interface. You can use it
diff --git a/package/unbound/Config.in b/package/unbound/Config.in
index c8d697113c..ae2ebfd975 100644
--- a/package/unbound/Config.in
+++ b/package/unbound/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_UNBOUND
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_LIBEVENT
-	select BR2_PACKAGE_LIBOPENSSL_ENGINES if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_OPENSSL
 	help
 	  Unbound is a validating, recursive, and caching DNS resolver.
diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
index d6886d4a5d..938f656e94 100644
--- a/package/unbound/unbound.mk
+++ b/package/unbound/unbound.mk
@@ -12,6 +12,7 @@ UNBOUND_LICENSE = BSD-3-Clause
 UNBOUND_LICENSE_FILES = LICENSE
 UNBOUND_CPE_ID_VENDOR = nlnetlabs
 UNBOUND_CONF_OPTS = \
+	--disable-gost \
 	--disable-rpath \
 	--disable-debug \
 	--with-conf-file=/etc/unbound/unbound.conf \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
