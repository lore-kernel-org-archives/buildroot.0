Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC28CCA5FED
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:44:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A180B80EA4;
	Tue,  6 Oct 2026 16:44:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kovjy5Bdoypk; Tue,  6 Oct 2026 16:44:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6B9E780EA5
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791305061;
	b=p6HXGaDOuQ1sx9lrkwtixDAnMmfnDf8KZzIVkrYoy9EIzw0t9jaza/YRQBQ3Dd/7cArg
	 ggwF5Bkl4gMCXh7T0Jubvxej1w5oFbC+SIOupmsuEQub+pB0iipLHo1ct9aUMqT3NOCoP
	 km2QI20uX7huqXOg3p858tvM0OcDj79HIw59dYYnVLBbDO0smFb6ApTyaMgmi3L+OHt9g
	 sCLc0c2zC0WEMq+9guquakByKgyjFVIv1NExJmy2LCqx1Zm1M4C2ghJ1mhS5OFrECqsPo
	 n8ebS5MuCSVvNBebHT1JqaohbqgSA8/2Tvbb/gBT6PLKfE5zORL4KSEOnhxp3dx3D/Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791305061;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Kas-Delay:X-Spamd-Bar:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=+d6Dm8aKLGLy73tkNK1TcqqMU4dfYOVo+0lM9zA1foA=;
	b=o8dzNuAxCZxyrQx6+dMLuFD3v99MVXyiwDVlmKYDylEHXl4qID2iWvD/Hct3gGhNkDIR
	 UBVlm5k3JKJePmfgMoWkkdBosPy8KXJZwJg70XoOxHlaYuT5SGJ1fTRCVkw37gJdN8NmW
	 ik0DCqipblOib8Xq75ol8yBWKEl43IYTdkuV1bHTa+A1aeVaLJ5KVrf+7Pcar4s0wShUZ
	 49AXLCkVeZhcn6IynDm/ogHFlGPOhy/qDO6q7cYkG9U9PpPKD9fJEBH55s4q6gYigZAKP
	 RqEV5ZN9kI4RliKJiFgKvTZUu3O+7tpZph2cJ54HTaFPc3hxrjU4XsQKCaH8C5JOONQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791305061;
	bh=+d6Dm8aKLGLy73tkNK1TcqqMU4dfYOVo+0lM9zA1foA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lx8AKT8zxoTjzyuFwHfz8qze+Ff88AHcxOAXeBtgGmtsDUla05pzX/cB1oG3xJoPu
	 FvIBF0V9RHkK+hfJ0gXimJMc7NCBOqFAElrA20lZEfZTHkCADnlbGyWu8w5dTuf/MS
	 PYCbF8whRrhBf3GzaXLBqqqKB+ZmUPJV1oGbBZ4Jue9EZh5ufIUdQh/BEHldD5Ou7B
	 i6dYuurHwMeovRFDTswL+XrnebW/9qwdV2wEe9CJx1RTl4nwrwBd1ma1El4nLBHako
	 xfLn5Obcf9BHHP5v1OBSHS1ENH0CfyQmvBoIQVHOiSLfccaAkCnYxrCQSKVfwp1HqE
	 lRirwOSh/+htw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B9E780EA5;
	Tue,  6 Oct 2026 16:44:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 415E734E
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:40:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3322A402C6
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:40:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PPg43VHJzyq0 for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:40:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 248BD402BE
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304805;
 b=H54NkDiIUPS25+Iqjxp4CxN8WhIrpCKekbFvBY8eqH0CILNXQDVE97zfBSE8PR49J+DO
 a5TQc1fbvJaRvQYZkh+3LfH7/EFUYW74FSMVYHTgRgKYPCUpnj3HK+Xd51WYyDJ21uWFI
 st/ARk6d5fnNtcr7ro8TD59cAUFbuXKpxGbuc0UhQQ0RPfyqgpoqyUq3U8brUNIWXMjyk
 tHvTZhLP+45HUPQq5fRIi9J2g3P8DwBu0m0MgE/5Nr31xYR8UQISFfyh8BZchB3CQJo6Y
 CBQfeArnH5u+g1zMatFqOtI3np4LrTLAn9ac6nz3E25+ZbgwnDJ5aa/abKOc8CzeAxQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304805;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Kas-Delay:X-Spamd-Bar;
 bh=lqxQ1isYPHla7/ze6dNNsQ03dGsGHoVK2Q1mf0V6kxQ=;
 b=egd50OpF+fqkHZB+L7H/nFgzNMCsXMvpw4UF3oxanq5w2Y0HP7x0BQO15wijK1mw7o53
 I6XS0mzY9dB//wyEqg9BmvpQTjt/gg1gHSKM4Izxxe1h5CT8dE2RkvAATn+XGGQJBWWRF
 O5XZVGhW0+9IXOfLUfjDv6yPEl4hWMy5YLo++D3f3LLTg1e8kv2ZyY1NHynWxq1DOxUbp
 zkz35x+BX7fpa7RX2HWMVZMUXZO69xTwAsXMWofImcunoBpBzCWdQ3qwRVtCC8tCQfjg7
 FUAVvbEVDcT50zdcukfcmHn3jIGf3TKDCR5ZOoKQYnLhaPq8WwSkRxFYG6ubRQjGFgg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=iY2iZPlB; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=iY2iZPlB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 248BD402BE
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303706;
 bh=lqxQ1isYPHla7/ze6dNNsQ03dGsGHoVK2Q1mf0V6kxQ=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=iY2iZPlB+BdfKbAv4sE/sE6RiRaEsU6oYVtahgkFK3kcx9kRWETsSMw0XRk1s8ly3
 Qy3TdEz3CrCXih65RxDm20d9KfHYrQUJWhts2bgSNtTwkF6l+bgF/S2lmO0yKoMx+u
 BqDXmvIcGPMYNwKCjV2Wuj6HtMtyIPYAFV/EfD2eus0Bze+aDF25nSqUVSI9pQgnw1
 cC1cSOSxQ5KgvH844HKNiAJ5iiEdmQoqwoTsLqLBL0/eu97SpvniTe8nsqkkRQ9Djw
 lJpOuktdzRzBY/mey3oJfYACa8ziXP81MTFBnlewgvZrAt4uZXNge/KplCIORp7jD8
 5RwLvbNcripnQ==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 bTpyg+SFEOVrYCqdNY3f8sIK7soJ5K4DUdi9lWMd7kTqx9lL2y/ZgwNw3/z6XYFMAcr4fMoIUTm
 FFq3EkRNsoYJPyrx8KTVndE6D6rDOS7FUocA4VXzWg8tnAywkJwToNYnOAfqybSNP56ZXFRwfYs
 6KhD6npDGGabEDtXED3d/XH6MEj/KBMvPOi/R8C5alClmR42wA1HlqjEYNFyMA9gDTOSRFb8yEJ
 a4UNXJJFe8CF9klqJpdXfVyQZUTzfSqQkDimdzFwIZJuWm23bawNpJGgW50KfUbE8VukbL1sdTC
 y/Kcm/RiVMmlmvoh3InACSvnDMAk+bI5yfSNn47X1w+3MZfyRhbbmUCoRARzllGfQGWybjiY6Uo
 5KIxvC9a2GsOIzNY3XQWjzDcesDSIr+eDNsH50fqWOwuapzRKr8wOHOBcd+55ER0hObUT+sL55f
 ePncG2G6WAekIKxs/QKX1uCCpf7BrqwjTs+dZNHDZhB2e79I79c9B8ynVf8cIPS2nrRBDqqpZZe
 AoEckKKTONY7c2VKDyaesPMkdPYKuJZ+EMfjLOTJxXONuci10qrqfjs0GVkoaC6PSPs3Qxg8IBb
 2habiBM=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 65D47A4C5372
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 18:21:46 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7ut-000000000ir-3l1K
 for buildroot@buildroot.org; Tue, 06 Oct 2026 16:21:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  6 Oct 2026 18:21:05 +0200
Message-ID: <20261006162106.3439373-85-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Kas-Delay: 1791304306
X-Spamd-Bar: +++++++
Subject: [Buildroot] [PATCH v8 84/84] package/kodi-visualisation-*: mass
 version bump to Piers
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash  | 2 +-
 .../kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk    | 2 +-
 package/kodi-visualisation-goom/kodi-visualisation-goom.hash    | 2 +-
 package/kodi-visualisation-goom/kodi-visualisation-goom.mk      | 2 +-
 .../kodi-visualisation-matrix/kodi-visualisation-matrix.hash    | 2 +-
 package/kodi-visualisation-matrix/kodi-visualisation-matrix.mk  | 2 +-
 .../kodi-visualisation-shadertoy.hash                           | 2 +-
 .../kodi-visualisation-shadertoy.mk                             | 2 +-
 .../kodi-visualisation-spectrum.hash                            | 2 +-
 .../kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk  | 2 +-
 .../kodi-visualisation-starburst.hash                           | 2 +-
 .../kodi-visualisation-starburst.mk                             | 2 +-
 .../kodi-visualisation-waveform.hash                            | 2 +-
 .../kodi-visualisation-waveform/kodi-visualisation-waveform.mk  | 2 +-
 14 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash
index 3f5f761968..7224b062aa 100644
--- a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash
+++ b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d7433e4e88e29f1dd3524d2d0b660ce529852561f14f479f4b83a9c5ac436ffc  kodi-visualisation-fishbmc-21.0.2-Omega.tar.gz
+sha256  e0ec1dd6832cd916a0ec8a2baa8be55c65670bb618c9be8747c7cadaf22c1535  kodi-visualisation-fishbmc-22.1.2-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
index b1eb305620..393cf19700 100644
--- a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
+++ b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_FISHBMC_VERSION = 21.0.2-Omega
+KODI_VISUALISATION_FISHBMC_VERSION = 22.1.2-Piers
 KODI_VISUALISATION_FISHBMC_SITE = $(call github,xbmc,visualization.fishbmc,$(KODI_VISUALISATION_FISHBMC_VERSION))
 KODI_VISUALISATION_FISHBMC_LICENSE = GPL-2.0+
 KODI_VISUALISATION_FISHBMC_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-visualisation-goom/kodi-visualisation-goom.hash b/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
index 71ce1c657e..72fd7ed709 100644
--- a/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
+++ b/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f87356122f91ea40d096d559d1180571e701e39867448768d14d6c2ba3b2e264  kodi-visualisation-goom-21.0.2-Omega.tar.gz
+sha256  3bb77b47d26aaf1e6cca451bbb9c22f162101f3a43b014a1bfa3583329e08f44  kodi-visualisation-goom-22.1.2-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-goom/kodi-visualisation-goom.mk b/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
index 6b35c64a87..a4b7285589 100644
--- a/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
+++ b/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_GOOM_VERSION = 21.0.2-Omega
+KODI_VISUALISATION_GOOM_VERSION = 22.1.2-Piers
 KODI_VISUALISATION_GOOM_SITE = $(call github,xbmc,visualization.goom,$(KODI_VISUALISATION_GOOM_VERSION))
 KODI_VISUALISATION_GOOM_LICENSE = GPL-2.0+
 KODI_VISUALISATION_GOOM_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-visualisation-matrix/kodi-visualisation-matrix.hash b/package/kodi-visualisation-matrix/kodi-visualisation-matrix.hash
index a924eaa6f8..aad763fadb 100644
--- a/package/kodi-visualisation-matrix/kodi-visualisation-matrix.hash
+++ b/package/kodi-visualisation-matrix/kodi-visualisation-matrix.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b1d1f3da5470d657e70c4b914a77445fe1d0a0ba35007fc402982a8b1b4cf9b0  kodi-visualisation-matrix-21.0.2-Omega.tar.gz
+sha256  a0060d82a8a9e9cdf2fb30451116271d5ab1dd9196c27cda1f6ae7eb1f787b02  kodi-visualisation-matrix-22.1.1-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-matrix/kodi-visualisation-matrix.mk b/package/kodi-visualisation-matrix/kodi-visualisation-matrix.mk
index fd885712ad..05e4889c84 100644
--- a/package/kodi-visualisation-matrix/kodi-visualisation-matrix.mk
+++ b/package/kodi-visualisation-matrix/kodi-visualisation-matrix.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_MATRIX_VERSION = 21.0.2-Omega
+KODI_VISUALISATION_MATRIX_VERSION = 22.1.1-Piers
 KODI_VISUALISATION_MATRIX_SITE = $(call github,xbmc,visualization.matrix,$(KODI_VISUALISATION_MATRIX_VERSION))
 KODI_VISUALISATION_MATRIX_LICENSE = GPL-2.0+
 KODI_VISUALISATION_MATRIX_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
index 508820876d..6de80abd30 100644
--- a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
+++ b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  30a5081365cea1dbdf49ccbb059076d4c7abc28604a58749fcd0d025e2faa760  kodi-visualisation-shadertoy-21.0.2-Omega.tar.gz
+sha256  ec4881e0a71ef4a01ff33a0704bb0e53acb573d49cdeb5bd67a4948b85659e1a  kodi-visualisation-shadertoy-22.1.1-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
index 32d6d6f056..d095247c2a 100644
--- a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
+++ b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_SHADERTOY_VERSION = 21.0.2-Omega
+KODI_VISUALISATION_SHADERTOY_VERSION = 22.1.1-Piers
 KODI_VISUALISATION_SHADERTOY_SITE = $(call github,xbmc,visualization.shadertoy,$(KODI_VISUALISATION_SHADERTOY_VERSION))
 KODI_VISUALISATION_SHADERTOY_LICENSE = GPL-2.0+
 KODI_VISUALISATION_SHADERTOY_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash
index 6bbd7b8c9a..244d7f9881 100644
--- a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash
+++ b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7b6635789d226ee4cd4e17d54d57e880731d0762835802835d0d5ac4f0084b99  kodi-visualisation-spectrum-21.0.2-Omega.tar.gz
+sha256  dac63ce17984d48c8e20be136a840d2543cda184d12cf31c7839c8e810bcc537  kodi-visualisation-spectrum-22.1.1-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
index 1946cf598a..646917697a 100644
--- a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
+++ b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_SPECTRUM_VERSION = 21.0.2-Omega
+KODI_VISUALISATION_SPECTRUM_VERSION = 22.1.1-Piers
 KODI_VISUALISATION_SPECTRUM_SITE = $(call github,xbmc,visualization.spectrum,$(KODI_VISUALISATION_SPECTRUM_VERSION))
 KODI_VISUALISATION_SPECTRUM_LICENSE = GPL-2.0+
 KODI_VISUALISATION_SPECTRUM_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-visualisation-starburst/kodi-visualisation-starburst.hash b/package/kodi-visualisation-starburst/kodi-visualisation-starburst.hash
index a362fbd23d..591c3883b5 100644
--- a/package/kodi-visualisation-starburst/kodi-visualisation-starburst.hash
+++ b/package/kodi-visualisation-starburst/kodi-visualisation-starburst.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a3f70985fee6b1014e7e7599431e646f36bd3870ead78bbc8936151b805e4241  kodi-visualisation-starburst-21.0.2-Omega.tar.gz
+sha256  35456e13ab3d82177dde6568b0ab6c09dd09a31acf851f4e141ab4062d787e94  kodi-visualisation-starburst-22.1.1-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-starburst/kodi-visualisation-starburst.mk b/package/kodi-visualisation-starburst/kodi-visualisation-starburst.mk
index 6adb21687e..ec922016f0 100644
--- a/package/kodi-visualisation-starburst/kodi-visualisation-starburst.mk
+++ b/package/kodi-visualisation-starburst/kodi-visualisation-starburst.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_STARBURST_VERSION = 21.0.2-Omega
+KODI_VISUALISATION_STARBURST_VERSION = 22.1.1-Piers
 KODI_VISUALISATION_STARBURST_SITE = $(call github,xbmc,visualization.starburst,$(KODI_VISUALISATION_STARBURST_VERSION))
 KODI_VISUALISATION_STARBURST_LICENSE = GPL-2.0+
 KODI_VISUALISATION_STARBURST_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash
index 1041fd5287..683f468cc3 100644
--- a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash
+++ b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  fe6d2f3990ea5f2ea2d4a0a905f451b1c2c7f1300529d8957b5d93a97421f415  kodi-visualisation-waveform-21.0.2-Omega.tar.gz
+sha256  050a184a37c1cef8f87fcf05d5dd90c6d11f33008164bc5a86e370aac1d866fb  kodi-visualisation-waveform-22.1.1-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
index 819b064789..9a61a4d159 100644
--- a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
+++ b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_WAVEFORM_VERSION = 21.0.2-Omega
+KODI_VISUALISATION_WAVEFORM_VERSION = 22.1.1-Piers
 KODI_VISUALISATION_WAVEFORM_SITE = $(call github,xbmc,visualization.waveform,$(KODI_VISUALISATION_WAVEFORM_VERSION))
 KODI_VISUALISATION_WAVEFORM_LICENSE = GPL-2.0+
 KODI_VISUALISATION_WAVEFORM_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
