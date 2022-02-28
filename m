Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F305C433F5
	for <buildroot@archiver.kernel.org>; Mon, 28 Feb 2022 17:53:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C42B405D8;
	Mon, 28 Feb 2022 17:53:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HecZNYmy7CIR; Mon, 28 Feb 2022 17:53:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 428624022C;
	Mon, 28 Feb 2022 17:53:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 464671BF5A7
 for <buildroot@lists.busybox.net>; Mon, 28 Feb 2022 17:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E47740216
 for <buildroot@lists.busybox.net>; Mon, 28 Feb 2022 17:53:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GJVRfsJDPihM for <buildroot@lists.busybox.net>;
 Mon, 28 Feb 2022 17:53:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 25E61401F5
 for <buildroot@buildroot.org>; Mon, 28 Feb 2022 17:53:11 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id p9so16673209wra.12
 for <buildroot@buildroot.org>; Mon, 28 Feb 2022 09:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s4Jh43E5+GaICP3HFIoRc0XmVeo5GKww99/BXNjaO5A=;
 b=SK3gWQZBApWmpaDPybKPN/2apmL4iqcHYGMqjKF1cESS4XdW+Rg43CnjDL22gk3PK4
 tb1VUxYACUIExJsN6i96YYJfUfrRP12zjWjZRkRlDKlkWLKo8QPWM8mG2uDEL8pEd99J
 DWdMsz7EwnENncOulRFF/pxBsl9tC8Tlg/VZ7ZZrlCfycYUWPnVYby77l4ehSIPPr7AT
 eJaXox9ldVYtfKEll4GFD5cNbOKNXm82GsAe4IsKRlhBEs28FuuHDRhCaXG88KhvROKI
 trIwzkf2AuVsopXATZKv0GU2Z5Nr7FHYmkBZsVzedehHxOz3kgtVXhuuvcLQ26oIC1d+
 he4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s4Jh43E5+GaICP3HFIoRc0XmVeo5GKww99/BXNjaO5A=;
 b=CV/AcnDOKnmPviaxFxPu+NNUGbZZkwDoFFDtHjrsmNTqryOPSpceQNFzAmHmGBT8SL
 C2iyXH2hlqlOGXzmBGrqBZa+Cx348bZODieVUAA907LpgT2loyn2bMa9e0PNLSadL4Eb
 vUUgddRuo/pshZoqUAvJUSwNcLT3bZTvB8c6Nfawd1KLm9CvuICJVH5M/u/po7UhEz/3
 IQ5hHmJT4rTwwdK1uPrH0DcLFmX7/YBLR0fVo2pJNp7Z7WAZBdz/2FZJa9rBtazxfU3Y
 9gRGwsvrBDbSQJXa1pTfc4wjCpoYDWDbS/LLkARoKcyMdS5ulfFbbJui649LQj1H1HPZ
 ulqg==
X-Gm-Message-State: AOAM5318kUNOjXmQ+TXpZlTHUvmf2rw7H3p8/LdNTMZK6EFJf4hhi0ZP
 FVYGrY6Gs7CxMc3kPKf9uTYpAiMxeWo=
X-Google-Smtp-Source: ABdhPJzLbrA1gy6jBnMOZvSupGyAu74LtRlkjg+h++Ly1oSa2X7XpveI+snmOIXfUq4wVO2tINM5iQ==
X-Received: by 2002:adf:f3c8:0:b0:1ed:9cd9:5bf with SMTP id
 g8-20020adff3c8000000b001ed9cd905bfmr16937826wrp.380.1646070789048; 
 Mon, 28 Feb 2022 09:53:09 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 a17-20020a5d5091000000b001edb61b2687sm15838826wrt.63.2022.02.28.09.53.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 09:53:08 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 28 Feb 2022 18:52:45 +0100
Message-Id: <20220228175245.1585-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libxml2: security bump to version
 2.9.13
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following security issues:
- [CVE-2022-23308] Use-after-free of ID and IDREF attributes
- Use-after-free in xmlXIncludeCopyRange
- Fix Null-deref-in-xmlSchemaGetComponentTargetNs
- Fix memory leak in xmlXPathCompNodeTest
- Fix null pointer deref in xmlStringGetNodeList
- Fix several memory leaks found by Coverity

https://gitlab.gnome.org/GNOME/libxml2/-/tags/v2.9.13

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libxml2/libxml2.hash | 4 ++--
 package/libxml2/libxml2.mk   | 7 +++++--
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/libxml2/libxml2.hash b/package/libxml2/libxml2.hash
index ce6c3c4825..81ac3e3f31 100644
--- a/package/libxml2/libxml2.hash
+++ b/package/libxml2/libxml2.hash
@@ -1,4 +1,4 @@
-# Locally calculated after checking pgp signature
-sha256  c8d6681e38c56f172892c85ddc0852e1fd4b53b4209e7f4ebf17f7e2eae71d92  libxml2-2.9.12.tar.gz
+# From http://ftp.acc.umu.se/pub/gnome/sources/libxml2/2.9/libxml2-2.9.13.sha256sum
+sha256  276130602d12fe484ecc03447ee5e759d0465558fbc9d6bd144e3745306ebf0e  libxml2-2.9.13.tar.xz
 # License files, locally calculated
 sha256  c5c63674f8a83c4d2e385d96d1c670a03cb871ba2927755467017317878574bd  COPYING
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 023a461472..5382f28ec4 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -4,8 +4,11 @@
 #
 ################################################################################
 
-LIBXML2_VERSION = 2.9.12
-LIBXML2_SITE = http://xmlsoft.org/sources
+LIBXML2_VERSION_MAJOR = 2.9
+LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).13
+LIBXML2_SOURCE = libxml2-$(LIBXML2_VERSION).tar.xz
+LIBXML2_SITE = \
+	http://ftp.gnome.org/pub/gnome/sources/libxml2/$(LIBXML2_VERSION_MAJOR)
 LIBXML2_INSTALL_STAGING = YES
 LIBXML2_LICENSE = MIT
 LIBXML2_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
