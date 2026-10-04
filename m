Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A90CA5FF0
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 18:02:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC33660705;
	Sun,  4 Oct 2026 18:02:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wDEEJM0zg1B3; Sun,  4 Oct 2026 18:02:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 690AC606A3
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791136953;
	b=tFR/TiFgAqYLp4WYaluVQdCz0OG2z7PWhwNo3BbT3Z6qtk8f8kywAYVgBdx8zl2apXEz
	 QeAVkH/jtjAftvFItH/dgOuqvceVLm/sDHz/va9yLPUL6ShQw7bA7/IZ41TAdUF7ZbIVq
	 FnFWNVk3AykBHzIYrXg5Q39oSbQu9DYPBSNoKh3JWTeLJDwcp7XmiZ7t51mZ526DKuLcM
	 r7Ag/N9+5bo6kW0I8TeOKcbx25x851oh1QcdZCjFC+QqaFIvecc5Ebgv413GndA3r81/w
	 4tNfWnxna00aZezbxGUcFSRw5OtoRDMneZqHIHjPXlgNA+vLrpBHkbArjiBut9uT6Xg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791136953;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Asy4ZiE4GwOyA5MERRnPxt1UbHyeaSD/dYTVTIJFcGw=;
	b=dmgJAUnAjlxs5HllL5uSlDtdbmyPjGuGk9Mh12TsLT1M5rI7qMB2MAKvjz2z7yWbUL8u
	 ONYZhEqhJF36igQXaK0wmb0sACP1itBtCVu63eCPXNdyTJo+cnrqYS6GGTozR4o0IG7yl
	 x5DV6+vygUuDkp0/0rP/lCMsxyWsoFHubYuDfs5Wp4nRQLqhjF9Yr96CixMq3XdY3kpO5
	 Ai2D8SnvNtmdWb/Aq9ZItzL7Rz+bHCVxHlXWvK9+ZmOBHI68FGkLmZE/8xahn7bQQzcvn
	 5nu3d941zHrq+OspVCcfqTchJhZKZhBJP/lnj0wl0B2ZWX6uOwVxHBP+Ne+glN+jNJQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791136953;
	bh=Asy4ZiE4GwOyA5MERRnPxt1UbHyeaSD/dYTVTIJFcGw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=edqgOfsQWlTyaDMk4el7cH2hxjAofS99c7Md91Oqs5FPdADQBu6HwW7Hi6u/mJSHh
	 Qu+lKB7Ays6exZNxYNfqqNKSWVacZB5shSikRH5CY+TiRiMx4IijjR13QEMYVWD+a1
	 RCzG91ULWGiXB1uQ91Jy8ZFJ1aKwZoC+AzUkFR++ttX+oixvgQJpMbgUqw94IHdAC5
	 AubyVohy/YAufYQWTndfYhO2yTnmKZ4ozd/vRD/OykG9z8o6zR5jUL35vie1iqrj7H
	 FxgvatRnEbQx09N7BoC2sZiM3cxRRxqjmDob/Fvrg51A+NaUJDm5f+0KShCha6d6v+
	 pVeJDGDS6LSkw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 690AC606A3;
	Sun,  4 Oct 2026 18:02:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D77334E
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 18:02:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 11E0940049
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 18:02:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DmyAO8-fe8tS for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 18:02:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 959664002B
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791136950;
 b=KAtIrDuThDBLwa3Rz7KigR0zerBSfrzyJDKZU3uhHrcFb/+9/brKG4n+cAM2JYRJOW8c
 sKZj1/1CZoBvc7tYaIuOal3PYnifVSq6ze/43omOUT9wtvZVe4kx2dJ5vso/MiinZOvtU
 THHh4YSnwbndGOPJVwevm6A2pC2574R3czxg9Vdog75tp7OnsT+8Al67J9u3kGAnYRlBR
 Y36q7oRrPJ7vAUAj19ZLH8fMs94o6Y8G7GIMjmJWKtfK+SnQcPshhhu0ctACEkeZDUgT1
 LMo6ipveRpbM6O+IsU2bCxd1HioJ728evRmRjcZxLPq+q0AcbGJ7n1GQQFYt9amJoUQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791136950;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=5145auhB7z3ARtANOW4eqFSkb9hUi8BfAmFAF+yaAbM=;
 b=KoK5ULmU9Gyhg/WI4dI5rHlbyoj4ZMta9a/mKOkPCYkXuvJlAkL1L6qsu4RiGptlJVWd
 Zi80RlJkCuNo1sIMVM7D/lGqI7FayjKNS8C/70/ne9g8cb/RaxbsXh8xQ8MeDFjqhibiL
 NRgi/0jMxRlmC6mKy4yERd9s13awSQcA3WmSEkQ2BHr83edI5yuAlwrzjC8Y1w0S5CfcV
 TkotdMX+aU6nbpUy9E/dOQhPsNO6MzNNr+NoVRfOnktB0Sd5dwc9RvQ+PuHp2YlLrC06e
 TU+iAecuvmagMC80ryYgJ/xwH0Lnz1whPBsgtDa4iyImVbKowULMevjwEmuB1Y04G0w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=kBMk+mR3; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=kBMk+mR3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 959664002B
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 18:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791136944;
 bh=5145auhB7z3ARtANOW4eqFSkb9hUi8BfAmFAF+yaAbM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=kBMk+mR3uPEbVkuZZdJPdU3dLcJoIioGV4LauAOa17ObHruRMCVaToPeJNYMt1v9A
 0jjXT2oKKQVl9B0rUesUK1D6SlZM7GmF7kjhHgmn9FP9tcdSxDz5XW6fp0ID+C20ew
 gTuBk50Dbic70LFuWe3ieW1IaEsQ7D+6AzBiiNxOig0BdmJB+veI3L4k3tga9gIwvZ
 xY0FlCSO+MwDhDAOhgIjf2/8HjlqwVgCgNwed71vCNG4WAgnvgHUi8HFp5CloFF72P
 QWKeMAlorOtp/ABcu9E4sYcGpycokxXdW3NUiPeA89RN8gWKtwszF/pq1/nDko/rgm
 YGzrA4QoQz5lA==
X-KAS-Sym: v3:f51bdf72230551df:Tfke6Kq/acD75bqIhHJKold3T4nAmaQjisR0eJNXGMOl6
 q3m2m1jGknByZdySAoc0VRGwVlOCg4rdVV5fVOLCyoAQk49lPMsMW9TssWCOuEDF/v92hcgiZFA
 +REAhO2D43A3M9NRDR3ULg9inj3PTHOxDRLPnG+DllTxEdd3tIEawnrwO7mtBHa1XwKZEmeyqS5
 72HTfvDx+HtlxCI7yg8uWsJdldoJ0La+5aSWeCgHC5G272NQmflzsJ1PLLf9KhYqIxTIbg1XCpS
 If26LQtz7YPWZp2X+0w+KjciYHTaZx7Tcmlk0KlGXQP/jU9g80F8dIGo7jyKtLbYD7/33DpA==:
 yrIrf2HNttLA7ljOdLV5GTqE/bXMoLQHWJddj4VFRlwVhByjwboo3EYB8VfQcoP+1nYdGr8dCL/
 Y3OqsK5xcqc0L5p+UF1wqQGavOI2CiREUxtxz/XTBVdLH4MgGuETXGstHfhGYdV5D28jQ6huqRH
 YgNiNpFUGgIB0wKz5Ti1Ozc7tulXWZv03SQQZJ1OxPYqz2VR99GMR/ldu0/WnvJ9WEfts0KdyF3
 NkmxY27EccM4o9h2J6ivoIiGtNeGGY3KXeD6AQXFFtk4+U9iBDj2aX91BY2UBJvDdjTuWXfpUAy
 +WzOjn4ip7gdRPNqMHzxgNmGcsZ58VNMnvdpROJO91+ckTn7qUzQTpkQMGy/g17UIbICPEPNojc
 7HtEJsUjmVQHGJA+e0XTr30Lxg+Jhic3tUQjJO8tFdtxmTqTNCpecQcVMc40xAT91X1RidKY8uP
 zNJKebQeldrolNAS61zZ250Zr/uI9qYTMW0iHUsslrnvFLrq8kXgRFRVB5TROdBJT/xV0to0VlX
 HoteaMUGOJmxOTbhliehIpiuMeYkwMTxtGy7hqgKUwsDnlO5gXZH0CWe5aRHRz+8pkopxNDcYAf
 CDOajFSLvnxy4xhzqTj23eeao/mXr1jqpn+tARCXKWMx0DxvaNnWRsDEMyoY4B3V+s5XOzpbPd0
 Ov93HxNa1MW7jWRMY
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8C5D7A4C1EAE;
 Sun,  4 Oct 2026 20:02:24 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52896)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xDQXY-000000000CC-1cWB;
 Sun, 04 Oct 2026 18:02:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  4 Oct 2026 20:02:24 +0200
Message-ID: <20261004180224.1782750-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261004180224.1782750-1-bernd@kuhls.net>
References: <20261004180224.1782750-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 2/2] package/python3: remove 2to3
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Upstream release 3.13.0 first included commit
https://github.com/python/cpython/commit/ae00b810d1d3ad7f1f7e226b02ece37c986330e7
which removed the 2to3 program and the lib2to3 module.

Buildroot commit d63e207eb869063f82c867658676c2903beb08cb bumped the
package from 3.13.9 to 3.13.2 but forgot to remove its handling.

Current versions of Kodi do not need lib2to3.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 Config.in.legacy           | 6 ++++++
 package/kodi/Config.in     | 1 -
 package/python3/Config.in  | 5 -----
 package/python3/python3.mk | 6 ------
 4 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index bb6257f532..9ba6ab243e 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2026.11"
 
+config BR2_PACKAGE_PYTHON3_2TO3
+	bool "python module 2to3 has been removed"
+	select BR2_LEGACY
+	help
+	  The python module 2to3 has been removed upstream
+
 config BR2_PACKAGE_LIBCPPRESTSDK
 	bool "libcpprestsdk has been removed"
 	select BR2_LEGACY
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index d64a6fee7e..16b86f3fe5 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -95,7 +95,6 @@ menuconfig BR2_PACKAGE_KODI
 	select BR2_PACKAGE_LZO
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_PCRE2
-	select BR2_PACKAGE_PYTHON3_2TO3
 	select BR2_PACKAGE_PYTHON3_PYEXPAT
 	select BR2_PACKAGE_PYTHON3_SQLITE
 	select BR2_PACKAGE_PYTHON3_SSL
diff --git a/package/python3/Config.in b/package/python3/Config.in
index f9d3d3aaa2..c362c52ab3 100644
--- a/package/python3/Config.in
+++ b/package/python3/Config.in
@@ -41,11 +41,6 @@ menu "core python3 modules"
 
 comment "The following modules are unusual or require extra libraries"
 
-config BR2_PACKAGE_PYTHON3_2TO3
-	bool "2to3 module"
-	help
-	  code translation from python 2 to 3
-
 config BR2_PACKAGE_PYTHON3_BERKELEYDB
 	bool "berkeleydb"
 	select BR2_PACKAGE_BERKELEYDB
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index a75af82ce4..6c9fe2178a 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -75,12 +75,6 @@ endif
 
 PYTHON3_INSTALL_STAGING = YES
 
-ifeq ($(BR2_PACKAGE_PYTHON3_2TO3),y)
-PYTHON3_CONF_OPTS += --enable-lib2to3
-else
-PYTHON3_CONF_OPTS += --disable-lib2to3
-endif
-
 ifeq ($(BR2_PACKAGE_PYTHON3_BERKELEYDB),y)
 PYTHON3_DEPENDENCIES += berkeleydb
 else
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
