Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD20BD20698
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 13:48:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3108605AD;
	Thu,  4 Dec 2025 13:48:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OhWDOYn2ptIP; Thu,  4 Dec 2025 13:48:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0D81607DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764856085;
	bh=iXHC7vDN939FwlcrKWuDMsjKqojD41uAnllTdl/Yu+0=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c62T0tFo4t7a9/wSqMNVVX2mr/zDpzL0fAsBDSkLifrRHL2BnAsGO2gJ0ZYa7UF8U
	 SdefaZA1HmdN2wWk9J+Zg6a6Bq5SmZAnIpXrye6u7jR/mM0gGJd3fqmc4AG2pcaPxI
	 piQjOyN95WA0/ao5ES2AkI5mnjNiEO4hZgPPZC+KrVO2GdBAaw71SmG/H1XRDNn74X
	 xDBXPMDmaAYXAFHZAZdfVs5tQu48PXTrANYaCdsBrGUvPr1iUrljxH25Qawtgb4155
	 aKl04kTdEVFNHXPWupnNGQEyLFLna/YyckKxLrHVRjPQMowuFrG5E3bdLmDcF8bTOf
	 WI0Hh0zUMaIuA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0D81607DF;
	Thu,  4 Dec 2025 13:48:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CDD03D3
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 13:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C01AA40C72
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 13:48:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e_upY_Im63bs for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 13:48:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E0A1D40082
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0A1D40082
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E0A1D40082
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 13:48:02 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4779adb38d3so8732355e9.2
 for <buildroot@buildroot.org>; Thu, 04 Dec 2025 05:48:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764856081; x=1765460881;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MCiasujti4BpcWwukK2LEPgHSbMxtPYJ3Hr2iIYEJAE=;
 b=Zbo4G0sSq9i0dPLje/yYJMDkB0/vNwXIS05fzf5kgsB/AJ5EUMNIdUVz3dGCk0fF76
 Yd/BuUvgNgwnmDqKP5Ws0ZQprChatqEli5a1o2YI9zkOs8MGpdcEPZO+X36SmYwLVacX
 ROi+lVz81HulHhgpv8H4T+20aBqIQOjwpVhR/NbdL/Dc3oX6LgA7MKAtkIcuv8/FpHvD
 pBnVDC9urgg0OIztKHe/JyAk7cBQDpgIXDwvddrEtmaXcQ3nQCMONWfGf5+mc0fHgkJZ
 II9pbBQehUiGa2WiLyLwHsEakmpwEl5H9I4H74JWxbSl/UsEeVgG8STOudV5ITX9VQbd
 TFsA==
X-Gm-Message-State: AOJu0Yztfe2ldQuzeYB+VeQVeSEI1leBvj3qiCLRoCLtcabUCaV0BUA7
 0Tu82f1v3Ptj9IKHMVpD+S6emfh5ux2TnatB3ByhnyXvhMlOCACE+Dgly2dNLA==
X-Gm-Gg: ASbGncs8fIsH48JJTsZ9kR1chMVpWBm4KhgGTqvRpzEyt9RSAt+kYsJX0fk/uuLW3tu
 1j2E/cuXQ9SJW+VpPUWkAPL5JoMFjdoLXtXKMAxYjFlk9QMFb7ps4aXT1K5r6JMWcuaY3/Qzbzo
 Wc+C80JKNrLtMKTOjjwfFjTahb2twlQvpPLAvj8zcSOUkzsK2X1PAgy7LRkz3sC8FVX9Lj5drLU
 peHEasJJlth4gtYrcfqItyEPZNK+kuoUY8lPx21YmXEfgmP0XkrMcqBB0lSoUki6Bkcnnyc5pe/
 snFp21NxlM+9YDJsqH04yfYL1zyBfNH0L6Crv7VO98RshSQWn5tmFL8c3jom3RYdioZSBBOuruG
 Itdm7J1HXV/k99CHkPi6l7W5VqA9fghrmSvmzSgfnlAk7DtA3MFyCAzrhMlTmYlCDBpp1U8j6SF
 2VVbzPpP9T43ZrPQ==
X-Google-Smtp-Source: AGHT+IEsnNRhKJrV6U5KqCXlql94JwBg5ABlgw1Sxi0jOzSmYPP+6y4EvnBXnj/Pbx1Wu21PvmUvTQ==
X-Received: by 2002:a05:600c:1c27:b0:475:de68:3c30 with SMTP id
 5b1f17b1804b1-4792f38614fmr37862075e9.16.1764856080715; 
 Thu, 04 Dec 2025 05:48:00 -0800 (PST)
Received: from freepad.proxad.net ([213.228.1.188])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-479311fbaf4sm28817255e9.15.2025.12.04.05.47.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Dec 2025 05:48:00 -0800 (PST)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: Maxime Leroy <maxime@leroys.fr>, Vincent Jardin <vjardin@free.fr>,
 Julien Olivain <ju.o@free.fr>
Date: Thu,  4 Dec 2025 14:47:37 +0100
Message-ID: <20251204134742.406507-3-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251204134742.406507-1-maxime@leroys.fr>
References: <20251204134742.406507-1-maxime@leroys.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764856081; x=1765460881; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MCiasujti4BpcWwukK2LEPgHSbMxtPYJ3Hr2iIYEJAE=;
 b=i8g8ytrh+D/T0Y9o/lFDu20r1PolGrdL18tcvYdyqKeGB0ngc5CGYBkNSLHdNfo5+7
 D78yDehTk518NxpC+5MNMYmGIFj5WHwXZso/C/h7bGnqj7NsiHsStx+bBp8YJasUujZj
 BPA8O0CDIj0hyOl/fC71TeAkqazWEaIBl9Q8641uH1UU/KGMvHi5u6Lej21tbdEoFHHe
 wWfNt3orxRCvAgZorRByE29vgc8pyJ5TXWd/ghTDYfvcmM/g7JzEQqPRzapW3X/Lc/cc
 WqmoB5zhPYp3m2eQpEV5Q4LddeDAt2lnGjEJJqe1xACbWZRf1iFg3KfjcfimGnxyYcim
 aTIw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=i8g8ytrh
Subject: [Buildroot] [PATCH 2/7] package/dpdk: make drivers selectable
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

Add BR2_PACKAGE_DPDK_DRIVERS_LIST to control which DPDK applications are
built:
  - empty : use DPDK defaults
  - none  : disable all drivers (-Ddisable_drivers='*/*')
  - list  : pass to -Denable_drivers= (comma-separated)

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dpdk/Config.in | 21 +++++++++++++++++++++
 package/dpdk/dpdk.mk   |  9 +++++++++
 2 files changed, 30 insertions(+)

diff --git a/package/dpdk/Config.in b/package/dpdk/Config.in
index 7d4a002002..9b6b367ee8 100644
--- a/package/dpdk/Config.in
+++ b/package/dpdk/Config.in
@@ -43,6 +43,27 @@ config BR2_PACKAGE_DPDK_EXAMPLES
 config BR2_PACKAGE_DPDK_TESTS
 	bool "Install tests"
 
+config BR2_PACKAGE_DPDK_DRIVERS_LIST
+	string "List of enabled drivers"
+	help
+	  Controls which DPDK drivers are built.
+
+	  Values:
+	   (empty): use DPDK defaults
+	   none   : build no drivers
+	   list   : e.g. "net/virtio,net/ixgbe"
+
+	  To list all drivers found in the DPDK source tree:
+	    find drivers -mindepth 2 -maxdepth 2 -type d \
+	    ! -printf '%P\n' | sort
+
+	  Note: providing manually a list of dpdk drivers to enable
+	  does not automatically enable its dependencies (internal or
+	  external). It is the user responsiblity to add internal dpdk
+	  dependencies in this list, and/or select the relevant
+	  Buildroot packages for external dependencies. DPDK
+	  configuration will fail in case of missing dependencies.
+
 endif
 
 comment "dpdk needs a glibc toolchain w/ threads, gcc >= 4.9, headers >= 4.19"
diff --git a/package/dpdk/dpdk.mk b/package/dpdk/dpdk.mk
index 4843ba2667..829b0cc640 100644
--- a/package/dpdk/dpdk.mk
+++ b/package/dpdk/dpdk.mk
@@ -47,6 +47,15 @@ else
 DPDK_CONF_OPTS += -Dexamples=
 endif
 
+DPDK_DRIVERS := $(call qstrip,$(BR2_PACKAGE_DPDK_DRIVERS_LIST))
+ifneq ($(DPDK_DRIVERS),)
+  ifeq ($(DPDK_DRIVERS),none)
+    DPDK_CONF_OPTS += -Ddisable_drivers='*/*'
+  else
+    DPDK_CONF_OPTS += -Denable_drivers='$(DPDK_DRIVERS)'
+  endif
+endif
+
 ifeq ($(BR2_PACKAGE_DPDK_TESTS),y)
 DPDK_CONF_OPTS += -Dtests=true
 else
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
