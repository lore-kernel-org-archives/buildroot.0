Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D3FFC982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 17:15:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7C754052B;
	Sun, 20 Sep 2026 17:15:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GmIuQQAnLdZd; Sun, 20 Sep 2026 17:15:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E3B6D40DF2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789924542;
	b=mfixtQjY7ItKV0n3qy+dDwaSVXqhW6TKGw7fjZHmpSgr5vDqRL4vySerZbl8Qk7m3zkM
	 2GCY40mQBbH4Tplx0TJDNkFgQ10B6mLlLT/HafxpnP16nZoJ20N1gSGZmjT09hAd9OtBM
	 q3EXSSfBu7B8pt6Ttn1f1czlJPlaBSaXK9MgbaiSQSdo9Nnm0ym+2bGnitUbdsmbgwnEl
	 a46JAqEmwR7I89kE/YuWKga9wAWAsJFOlmtx6jBBTO1unLzUQU8YWJ6fHHh/7pD4vwl4q
	 iZt5ytQ3lBDIJBBcLjrX6CyENn39w2SBsIybO2B60Cx/EOoZ3Tr1pWLsAecTktoUVxw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789924542;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=RwouC8oetP7vsvfURG7Q1NwSRKlwU0GH7QujeKkejDM=;
	b=oDJXZd4xP1TVTwQPTDA1+lATWQi66aGYX2H1DWb0Sxr9IEIlFhXsc/aj77QjrAn8GeLT
	 4NgJSsf1gfcOifMhi0zIDTcn0TA+pn9lBCqEggw/xk+/zL7u17/ybOCe+YVX5FD3LZlBE
	 zm7N8P4+WVzrMm3qRnLzvpb3nrIJZG/p9auV61tw8ZCfNNTodxDqNza9pVuY9GioZZLcm
	 k2VZj0TsVdUBXw3LyYEZiBFTX5M2wpe0Zaw1ThE9QTsBQHtwQIGRGvOrFf6D61pr8ddTB
	 zj+dIJ5dit17JhbFeX8Ra07NjkEVeBpJ/a/+LxrnE+6b/JGqOGeWXJgx4WaGbrs6KxQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789924542;
	bh=RwouC8oetP7vsvfURG7Q1NwSRKlwU0GH7QujeKkejDM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=D1h7W6Dxfox2/w9yFLMhbam43Eh+9rlPfHBMPrHKoOWWP37Wdvo3xdH6vKIBTcPkt
	 wXcedVOkJMtg/hk1Oexa7km/Ck5W9ReEoOs9ebuRHuV8Lfc86vmzQCwFXHaH9Z1tjy
	 SsOPTcAwJCicsd6+x6fJvSLvU/jNUhDepFNmp2HdFsYwzlLCVOeTyKd+wG/Ml8M5dk
	 xKqLtsPeXWA11maM7jwDu3cQdq0EuT/+2DAU1XOBkAXodTEx9Y/6JZX6VaC1kD3WIs
	 IIYES/bH/L64NjnVJr7NPl4T662xcw3Y9UBe84+dAZe6GPZ6+YQ02a/GBCGjn/RFlb
	 QRrHySgo+jhEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3B6D40DF2;
	Sun, 20 Sep 2026 17:15:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C5943FA
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:15:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 02C09606FA
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:15:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bey-Zk6D6AE4 for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 17:15:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org BA0FD60601
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789924540;
 b=BYtEkXaCO7Xw1CrdvtekJQz6ujRBBmyF6IT2u0xcJxYsY37nRRgQ1nLylF+q/nnFBbvP
 koFTRXGBBepbCohg3DnCCF09y1pwt+9tTYZwz5xiiLs0fcyJP2PgweuknLoIJQcPC1MAA
 v8vs0aH8Py0batFqvHh6x/Qr/QgSZKddTQrYuI15PHyOpI3WiOYtVeRM3IVOlwVEmxZQ0
 FUUWu6q31elHdHYrIfD1PGX1OMif7lNLnGyOAtqlvk42C9X2CH1x4HPRorDIjaWbEX5q2
 N6yru8mst88D8K4qqwBua/pDp3EHR8LfT/kIg4kXVswKeO8OxwE+gZKmL54flKyc+Vg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789924540;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=eH2IWQspC2urCpSVYKEIOozONoNs/5C6Y7ly464zTBY=;
 b=fRYwmjD0V3qxbHI8p+beWY5l64h50Wzfp1ybzOLiFGll+Y1+UK5QaTcfsSXwVcbFrv82
 r9p5GMs5YCsGwj3Do+wNCywAS5TKotJdHtWH1kFBQpat4CDkMB3JvKjq1rqd+72aHH2vF
 AdePz1vFIgKzTiOwVb88wL8E6gdTd/f1HELPh97rausknh3N/zqHHI1rCC4TfF3K0HFTs
 cfPfOri7U97qaVTU/aDH4g86wQxRFJtwOYtms/RfmSj1DSfJVHHRZ/G//brC0rPWjfy6s
 PRwqW7NhFJ2n2PRPkRM1/cNM1jGQcaB4fyBAacZ2vNbklp3wrj4Xek3h1PLY7jbEBpQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=V15Fv6sR; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=V15Fv6sR
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BA0FD60601
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789924154;
 bh=eH2IWQspC2urCpSVYKEIOozONoNs/5C6Y7ly464zTBY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=V15Fv6sRXOR1BtDZacntotyZyZ4KtAjSJG5h/Z6kdtdr7cuNJFjWjFPzUAd4EU/5v
 D+AGxznl278OMtUNcL8Q73U/ORvIQakldNwx92Y1B3BqtKEkEEJhRf61L3ouZry62p
 8zXs2WsJP7P95TW3rA2T0H9D+ehFCViKslSEGJRPPXAWFikC4d2eRT/tyvMk6ZoMke
 30l7ZiBbrFpAdM8ZsmBfh8UHexLSvZIWDUxUH1LSuJgpcPhwTShdFmtZ3ma3LUFhqE
 LuR81eR53HiqjMyEaz0I168tUDvd7i07vsYwxibVnhwaYJMNrhF3isBfWQ8oWECGhW
 z3tBwfd5h1uLQ==
X-KAS-Sym: v3:f51bdf72230551df:lHdkWXAlOH3mFYa7MPhN/Q5mZRaSllnUONUXNce4VNqCbu40d29sJoTMWL/UgPpKmiu+oFAK+SGKiz0pvNPHzzdK8865J0NZZhjD1YGG6aDHJWSqGt9pmYaVeClFza2NY+i+npE0hJgg/gHxSjO6xcwlUb6QQuNPO0hdPziIw4dhYYf4DJSWrRRzANCMomoD/RZTgi346Zz0eW33G9Vcp3B7DR+EaybhZMrqLCjEqGCkGFXPOjSjpT0/ayWciGjXWUz3QuiXUZXlIr+lNW1V5S5HyBJCR/w6EnvHAsYJhPTQhQAx4gJVctdz4XTCaIimRq6ACwja3Rp9OR6uCM1UuQ==:+R1soAaY1QJky1O4S/1SyEUiF5B8HDdgj75L53lKWzEup1pelJj/uBLcrl6V17HoC3wiBDFvTA2fj5vH9CG+KECSTdkL2CEojgf99GpO1s1WvDwKe1sDUuyZ4tBBwFFuksKASYp9DVLquBemeFUDiiidxe7G648RTROzX07gPqXCgQEemWhXakEOlUhq2RfjTclCgrNvI9T3FVo1IWLInr+yGNinU2RloablqTCf8ZKXFAHcvUZbmAWigwhFmjHyA6Mzud0F5N2YJBx/Q028AAjakZWmznkaHVd9FpN3LKhy1zaionefVlCHZNIrkWYZ4NWWaXBfNrQ+TARL/0ml+ruOkFa8/rWXcK44apgYJlD3IA2CjA8Uyh8Lp5RVQWrmDo4FCrOS2f4gQoiuoYA3OM121E7SkzMsJFcz8ulFN+aoQzP78BvKHzqJUdJAREStpMBMrZd9Bd0nUni65Ig9ZUtbuT47IohHD/NdHPoU9R5syVel24AbRPA3bQG7E7w04iVNJAq1t2ihCsICJdJCYvsHlPAkYYXmNpjEnGhF0YQm1dl7cVS31FrHJrzCMbprmGGJm60Y+L7i3kyvLfXT8574+Sh/LuE4Myshfh2mRWs2Wt
 hn3mSgUbdR3rNK7C7lu/SJdZNBe7T8sSQBs5q40vO61eGLlYEz4UM9dIDlKaJx1Re+LLwP3vKlVYsGws51VLbzDGMGJ3OJMU22LzdalOo8srQjBgUwiw==
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2F543A4C4887;
 Sun, 20 Sep 2026 19:09:14 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57728)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8L1Z-000000000o7-3OYw;
 Sun, 20 Sep 2026 17:08:21 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 19:07:30 +0200
Message-ID: <20260920170815.240247-24-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920170815.240247-1-bernd@kuhls.net>
References: <20260920170815.240247-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v5 23/67] package/xtables-addons: bump version
 to 3.31
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
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
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

https://codeberg.org/jengelh/xtables-addons/src/tag/v3.31/doc/changelog.rst

Upstream switched tarball format to zst.

Enabled CONFIG_NETFILTER_XT_MATCH_STRING in kernel config to provide the
new upstream dependency CONFIG_TEXTSEARCH_BM:
https://codeberg.org/jengelh/xtables-addons/commit/6b7c62d83ea1b589c3115d959867e0fcbfcf74ea

Enabled CONFIG_XFRM_USER to fix build errors detected by the Gitlab
pipelines:

  ERROR: modpost: "crypto_alloc_shash" [pknock/xt_pknock.ko] undefined!
  ERROR: modpost: "crypto_shash_setkey" [pknock/xt_pknock.ko] undefined!
  ERROR: modpost: "crypto_shash_init" [pknock/xt_pknock.ko] undefined!
  ERROR: modpost: "crypto_shash_finup" [pknock/xt_pknock.ko] undefined!
  ERROR: modpost: "crypto_destroy_tfm" [pknock/xt_pknock.ko] undefined!

Upstream uses these functions for > 10 years so recent changes in the
Linux kernel dependency handling are responsible for the build errors.

Enabled CONFIG_{INET, NET} to fix a build error detected by the Gitlab
pipelines for bootlin-powerpc-e500mc-uclibc:

In file included from pknock/xt_pknock.c:31:
./pknock/../compat_xtables.h:19:9: warning: #warning You need
 CONFIG_NF_CONNTRACK. [-Wcpp]
   19 | #       warning You need CONFIG_NF_CONNTRACK.

ACCOUNT/xt_ACCOUNT.c:1179:10: error: 'struct nf_sockopt_ops' has no
 member named 'set_optmin'
 1179 |         .set_optmin = IPT_SO_SET_ACCOUNT_HANDLE_FREE,

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/xtables-addons/xtables-addons.hash | 2 +-
 package/xtables-addons/xtables-addons.mk   | 8 ++++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/xtables-addons/xtables-addons.hash b/package/xtables-addons/xtables-addons.hash
index 7bdbbb8578..a77ac1a230 100644
--- a/package/xtables-addons/xtables-addons.hash
+++ b/package/xtables-addons/xtables-addons.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3e823f71720519ced31c4c7d2bfaf7120d9c01c59a0843dfcbe93c95c64d81c1  xtables-addons-3.24.tar.xz
+sha256  e22efc25b7bbb3436d1b7cdc309b1857ea933f7e5c7d88fbe6951a1e3e582a80  xtables-addons-3.31.tar.zst
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE
diff --git a/package/xtables-addons/xtables-addons.mk b/package/xtables-addons/xtables-addons.mk
index a3174725d0..9f70518fed 100644
--- a/package/xtables-addons/xtables-addons.mk
+++ b/package/xtables-addons/xtables-addons.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XTABLES_ADDONS_VERSION = 3.24
-XTABLES_ADDONS_SOURCE = xtables-addons-$(XTABLES_ADDONS_VERSION).tar.xz
+XTABLES_ADDONS_VERSION = 3.31
+XTABLES_ADDONS_SOURCE = xtables-addons-$(XTABLES_ADDONS_VERSION).tar.zst
 XTABLES_ADDONS_SITE = https://inai.de/files/xtables-addons
 XTABLES_ADDONS_DEPENDENCIES = iptables linux host-pkgconf
 XTABLES_ADDONS_LICENSE = GPL-2.0+
@@ -33,10 +33,14 @@ endef
 XTABLES_ADDONS_POST_INSTALL_TARGET_HOOKS += XTABLES_ADDONS_REMOVE_GEOIP_HELPERS
 
 define XTABLES_ADDONS_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_INET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_ADVANCED)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XT_MATCH_STRING)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_MARK)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_XFRM_USER)
 endef
 
 $(eval $(kernel-module))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
