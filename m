Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A723EC43334
	for <buildroot@archiver.kernel.org>; Tue, 19 Jul 2022 19:02:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31BEA61153;
	Tue, 19 Jul 2022 19:02:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31BEA61153
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cF92aI6A6cDX; Tue, 19 Jul 2022 19:02:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46C9360C06;
	Tue, 19 Jul 2022 19:02:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46C9360C06
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C73A81BF580
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 19:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A050C4154F
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 19:02:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A050C4154F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ycdd-Fryvb_C for <buildroot@lists.busybox.net>;
 Tue, 19 Jul 2022 19:02:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54A144154A
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 54A144154A
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 19:02:22 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id sz17so28938983ejc.9
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 12:02:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZUVrW2bdfBmIoDKm5WvpvOJOQfi4xm6ylpGlQaYbX8Y=;
 b=KrgctHKb+Hvu+x+w64hBn2CMzmiCOxiIV+V5zL2P0ckKdSxuHeviHpeskFReVFD4Fp
 W69djfq80oV0VdMyxUbP1UTTkbbFqARes+ncGeOZOrWzD6JAOIcBmiXTElQkRUgtZnJq
 +Y71hRTSV0bGhwJrFn5QOiVnc8v2arsA+yDJ10CKi1xlOCMq1J9yCLGrliUHEH+cX4E4
 T9CC2ShwYEVC2WdWl1a0jsX5N3/ARSAm5/Paf3MZGLCROUacxGkpZkhJy4wpamwOGshX
 gKlfrScb82qAiAiV0aJPEjjhXUKzXo7prhMXcqybopfYJDd7ODO7dv2ou/96VbMstDTc
 9Dpg==
X-Gm-Message-State: AJIora/iiH9NfFmHF34xOOb7nNgvngc/hO6WqgbDVT9Y/fg0Pr+lm3vi
 GldiPhf32gayMDwKlovxT8QcPBt+cmc=
X-Google-Smtp-Source: AGRyM1sSUCX2I7q+mhAtxOAOpp6rUDtkXiVlosH697TGLSHcq8sax/aJeb7KWkYLomkqJIXPd861HQ==
X-Received: by 2002:a17:906:7308:b0:72f:3294:8002 with SMTP id
 di8-20020a170906730800b0072f32948002mr10800742ejc.311.1658257339504; 
 Tue, 19 Jul 2022 12:02:19 -0700 (PDT)
Received: from hthiery.fritz.box ([2a02:810b:5a40:2a43:8e16:45ff:fe22:ad85])
 by smtp.gmail.com with ESMTPSA id
 kb1-20020a170907924100b0072b1bc9b37fsm6967010ejb.22.2022.07.19.12.02.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 12:02:18 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 19 Jul 2022 21:00:54 +0200
Message-Id: <20220719190051.555180-3-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220719190051.555180-1-heiko.thiery@gmail.com>
References: <20220719190051.555180-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZUVrW2bdfBmIoDKm5WvpvOJOQfi4xm6ylpGlQaYbX8Y=;
 b=ifekcrpKbdw+bC0JopQXzqKeWjQPxefJIFs3xqYzp++3qfqsLnloW6Htxn6Quf/8HD
 pxBhcSjGjDdZcXP9LoOX1BsRT19pgPKnVDuwD5Q1ifAmHerdVLzNoT7LJneu5zW6Z2FP
 YNhAPXsRrPAUekQLsLDNgU9C5f5RCy1neDiXpjEftAt/L8CshReVTxLsi7zJzsMnNfmU
 gX/ZN43GUyZmS6LcvSRSGk+Zsi3nBJIfzCxm/EYBkc/SqDVzzFmGS+W6NM7awkK8ExwG
 1XHZPibVXB8OqgNZ3V31VC7agBKehutPhlAbpaMt1f3VjVRPwPSTCakqXgU/sjSbIfH8
 dWhA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ifekcrpK
Subject: [Buildroot] [PATCH 3/3] board/kontron/pitx-imx8m: add U-Boot
 2022.04 patch
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Heiko Thiery <heiko.thiery@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch is required to fix an issue in U-Boot for linking
the mkeficapsule tool against -luuid and -lgnutls.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/2720001065

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 ...le-use-pkg-config-to-get-luuid-and-l.patch | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 board/kontron/pitx-imx8m/patches/uboot/2022.04/0001-tools-mkeficapsule-use-pkg-config-to-get-luuid-and-l.patch

diff --git a/board/kontron/pitx-imx8m/patches/uboot/2022.04/0001-tools-mkeficapsule-use-pkg-config-to-get-luuid-and-l.patch b/board/kontron/pitx-imx8m/patches/uboot/2022.04/0001-tools-mkeficapsule-use-pkg-config-to-get-luuid-and-l.patch
new file mode 100644
index 0000000000..9530a45efe
--- /dev/null
+++ b/board/kontron/pitx-imx8m/patches/uboot/2022.04/0001-tools-mkeficapsule-use-pkg-config-to-get-luuid-and-l.patch
@@ -0,0 +1,33 @@
+From f3523977e8f5f6b2173708777001332431ebc609 Mon Sep 17 00:00:00 2001
+From: Heiko Thiery <heiko.thiery@gmail.com>
+Date: Tue, 19 Jul 2022 16:17:09 +0200
+Subject: [PATCH 1/2] tools: mkeficapsule: use pkg-config to get -luuid and -lgnutls
+
+Instead of hardcoding -luuid -lgnutls as the flags needed to build
+mkeficapsule, use pkg-config when available.
+
+We gracefully fallback on the previous behavior of hardcoding -luuid
+-lgnutls if pkg-config is not available or fails with an error.
+
+Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
+---
+ tools/Makefile | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/tools/Makefile b/tools/Makefile
+index 9f2339666a..9f6b282ad8 100644
+--- a/tools/Makefile
++++ b/tools/Makefile
+@@ -242,7 +242,8 @@ hostprogs-$(CONFIG_MIPS) += mips-relocs
+ hostprogs-$(CONFIG_ASN1_COMPILER)	+= asn1_compiler
+ HOSTCFLAGS_asn1_compiler.o = -idirafter $(srctree)/include
+ 
+-HOSTLDLIBS_mkeficapsule += -lgnutls -luuid
++HOSTLDLIBS_mkeficapsule += \
++	$(shell pkg-config --libs gnutls uuid 2> /dev/null || echo "-lgnutls -luuid")
+ hostprogs-$(CONFIG_TOOLS_MKEFICAPSULE) += mkeficapsule
+ 
+ # We build some files with extra pedantic flags to try to minimize things
+-- 
+2.30.2
+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
