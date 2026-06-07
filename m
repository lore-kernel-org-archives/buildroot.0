Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED95CD8C93
	for <buildroot@archiver.kernel.org>; Sun,  7 Jun 2026 13:02:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8795D61B3C;
	Sun,  7 Jun 2026 13:02:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pO4wpgE5PUx6; Sun,  7 Jun 2026 13:02:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F71061B5A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780837358;
	bh=f2IhiS14LELqW62ZDsaHIrvBlDw+u0mnt4P++MmEKhM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ALS8cc81Ty495gIAgb6N/z75pVzOJEsFeJcIGFb1739E4KWbi1/kxi3ntNlK/52yj
	 sDwflrndMHsRdN+II9/oDxIn4O6MVCYtJszDeSr9qQUvlOp/Jho6N6QJu8xVGaKfZg
	 5VxD+a+Nsw24BO1qezuYYgs59lMcWX5umclgnPvhGOLnASrgyTLGVMQz2PIxy/wumb
	 xa91VwrnmX/+Nf/DwAXLCB9yyHh3i/zkayaTr2oXVuNaK1QC7Fm9dp11XS6vK465y8
	 fxuwGpFPAekGiE2wFhvIhBbWprHMbL+z/E+DUDc27KYd6IyL4GffqF6UXsVclHFg3c
	 6iR1B2TFRvWBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F71061B5A;
	Sun,  7 Jun 2026 13:02:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B6512C1
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 13:02:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D03B84B8C
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 13:02:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G2JtSsT2Hlto for <buildroot@buildroot.org>;
 Sun,  7 Jun 2026 13:02:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=jeanmichel.hautbois@yoseli.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ECB5284B8A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECB5284B8A
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ECB5284B8A
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 13:02:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 409243EBFD;
 Sun,  7 Jun 2026 13:02:31 +0000 (UTC)
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
To: buildroot@buildroot.org
Date: Sun,  7 Jun 2026 15:02:18 +0200
Message-Id: <20260607130219.1350128-8-jeanmichel.hautbois@yoseli.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260424132326.825570-1-jeanmichel.hautbois@yoseli.org>
References: <20260424132326.825570-1-jeanmichel.hautbois@yoseli.org>
MIME-Version: 1.0
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-Cause: dmFkZTG35MyENKqFS0DuiPYUX9V3WsY3+FAmL+ImKoRLaUV02rcxcXLiKpJX/Kdx6SEqZQz2ekGfQ0jrmsx/WBwMlf2XOn2FbgS96Zs0spRyU989SGI8G7Cvds0Ybat6zfFO9fvNt3BfRCxGFRxtl7iKqavvPfB3yxxy+yQTyKH9MCP58OOla7Z8qUGxxcSWph48W1TPSPeP4XZvMp4ssF1ae/YycEv9NcGgSUbTkqro91isKUoq1wlurkCWxHLQOgIDHETMb0icYN/W5krwkf4adE4uv9Z388Sv+b4Bsdn4FglEHWeVY7X11Rb4h2XSRtTme54CTlFcl3QBQ8n+aBUTAmTYI3um3q4mXdn9g0L6DPuz8ppRt/znBnzyjPToiYljXqMmS1M0TiGFk1d0I8dMH6tcMB78yulI9z9slWyyq2YlGMXh3B4YjGY8dywK0itxraLaWKch+IoLbbRooiHLZ8MeNd7gEpG+wpWdUjfJHgnmcbp2CT6htAcHHSvPtOGogLaC22ndldUVBdIpUTAzT6Rp3hk033s08AGovTEb98p1LZVeJrvh/PJwFVxORiwxi+YAkiWWXAnH/3a6nlVw2ZM46xyGumCvrc1REphy3s9A+HDe4JFhFpCnTOR2EFfi1HAC+OpyMDaH6BRFmJyohEw3mzpVjlqdtyDDdKLKpKdYFw
X-GND-State: clean
X-GND-Score: -100
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yoseli.org; s=gm1; t=1780837352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LWLS/n2hxSvzJ0C7Tv03uZ7UsFbrhNXJ/JbyQtody5M=;
 b=N7YKdUbPVTqwT1ABv5jJraNFCQ3iD9CsSCi9V2Zfrg2GkDhRS1bZMKLc/CW2LPS6y+P0hu
 p9pF5ilUsILCYItLJtQdR9CrqisHrINnXQwB+Nxhp1lqAHwN1+460mjeg1Y0q8vtR08O0F
 aSv/yz6SPVfUTXboz2JPWSwMJxubtpvkQzcViM7db4/Z/OTrqpZ26Jo8aanClp+92bFNDg
 cEf3tDSY6A8NRtLUAeiIEr8uH3BecU+7BPdcOVNL4kQxZqmLcZ7uyqcq2k0CE0r4jQBHHx
 8Jh7Ufs90efTQDttQeNo0ufXEIgLWqDBaICU1da8Ph8ZEPq0XBWiC3Pi/8jeiw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=yoseli.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=yoseli.org header.i=@yoseli.org header.a=rsa-sha256
 header.s=gm1 header.b=N7YKdUbP
Subject: [Buildroot] [PATCH v2 7/8] package/dropbear: disable ML-KEM768 on
 m68k
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ML-KEM768 post-quantum key exchange code (in the vendored header
src/libcrux_mlkem768_sha3.h) triggers a GCC internal compiler error
(ICE) in cselib_record_set during the postreload CSE pass when
compiled at -O2 on m68k. Reproduced with the Buildroot default
GCC 14.3.0 on ColdFire (cselib.cc:2727); GCC 15.2.0 hits the same ICE
(cselib.cc:2869).

The bug is tracked upstream as GCC PR rtl-optimization/125078:
  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=125078

A new BR2_TOOLCHAIN_HAS_GCC_BUG_125078 helper symbol is added in
toolchain/Config.in following the convention used for other
known-broken toolchains, and the dropbear build hook is gated on it so
the workaround is removed automatically once GCC ships a fix. It is
enabled for all m68k, conservatively, as the ICE is present in the
default GCC 14.3.0.

Standard key exchange algorithms remain available.

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
---
Changes since v1:
 - Gate on the new BR2_TOOLCHAIN_HAS_GCC_BUG_125078 (added in
   toolchain/Config.in), as requested by Baruch on v1.

 package/dropbear/dropbear.mk |  7 +++++++
 toolchain/Config.in          | 10 ++++++++++
 2 files changed, 17 insertions(+)

diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index a7de8432af..f40520d4d8 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -62,6 +62,13 @@ endef
 DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_SVR_PASSWORD_AUTH
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_125078),y)
+define DROPBEAR_DISABLE_MLKEM
+	echo '#define DROPBEAR_MLKEM768 0'               >> $(@D)/localoptions.h
+endef
+DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_DISABLE_MLKEM
+endif
+
 ifeq ($(BR2_PACKAGE_DROPBEAR_LEGACY_CRYPTO),y)
 define DROPBEAR_ENABLE_LEGACY_CRYPTO
 	echo '#define DROPBEAR_3DES 1'                  >> $(@D)/localoptions.h
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 910cd103dc..3bb7ab269d 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -246,6 +246,16 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_111001
 		   BR2_OPTIMIZE_2 || \
 		   BR2_OPTIMIZE_3
 
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=125078
+# ICE in cselib_record_set during the postreload CSE pass when
+# compiling ML-KEM code at -O2 on m68k (cselib.cc:2727 with gcc
+# 14.3.0, cselib.cc:2869 with gcc 15.2.0). Reproduced at -O2 with the
+# Buildroot default gcc 14.3.0 on ColdFire. Enabled for all m68k
+# conservatively, as the bug is present in the default gcc 14.3.0.
+config BR2_TOOLCHAIN_HAS_GCC_BUG_125078
+	bool
+	default y if BR2_m68k
+
 config BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	bool
 
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
