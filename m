Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B58DC3DA4A
	for <buildroot@archiver.kernel.org>; Sat, 17 Aug 2024 00:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE70B40B8F;
	Sat, 17 Aug 2024 00:00:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XWNsrdpONJ1x; Sat, 17 Aug 2024 00:00:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63ECE40C97
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63ECE40C97;
	Sat, 17 Aug 2024 00:00:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8756A1BF426
 for <buildroot@lists.busybox.net>; Sat, 17 Aug 2024 00:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 811AF40C97
 for <buildroot@lists.busybox.net>; Sat, 17 Aug 2024 00:00:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U-c0tjTxZwz0 for <buildroot@lists.busybox.net>;
 Sat, 17 Aug 2024 00:00:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::f29; helo=mail-qv1-xf29.google.com;
 envelope-from=markus.mayer@broadcom.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C901540B8F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C901540B8F
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C901540B8F
 for <buildroot@buildroot.org>; Sat, 17 Aug 2024 00:00:32 +0000 (UTC)
Received: by mail-qv1-xf29.google.com with SMTP id
 6a1803df08f44-6bf76858652so2134036d6.2
 for <buildroot@buildroot.org>; Fri, 16 Aug 2024 17:00:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723852831; x=1724457631;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Rj0lzCiQgy37DpALjSvn1YWlwxTdnXSxczwRcQcVtyY=;
 b=l9nj5pT3+Osh/omBipzrdqGuQW1BEAb68H45CyFfr4eHKhVyNoZxckyT1XnAW69ode
 TYVULGGir6+mFkRaESph8Wdup6iK2FyjYm1edC1nyteBNc0G4o5K2ChBywSFm8GiUWj2
 1EaINN0DnXfKZyYOBsRkI8fKjztQUnHODgLwKIg2s2mCT2gon1ECdwzH9wb1u0Oc/WU4
 hsfdPvR7LnmkKdtHagTJvkVTC4ZETxTp9JcJVj9muIAn4mG+VbN9WsHLsi0INsr9wGQ9
 aEyPV/8785lnZWRstdUi/ri0wPLduYAJxMIYvK++JO4TBzkypgpnEtmzqXsKgQzh+Q3h
 NOKA==
X-Gm-Message-State: AOJu0YypsteGAOGDtXZBjJp7hXFxmx5Q0zc6Iy9b+69rLlVKVRSJ28W1
 6WjiTx0WKKaMpMA/bpYUn0SPblMOa0OHqJUsXlnRuxPEg2784UHHLnvOD16HTg==
X-Google-Smtp-Source: AGHT+IE6C0UGAljmDOrcmOpG8t35MrWjZAMiC8FqUDvODAy/Se0WtuCz2Xcnf+4M61CTMt4xf3V7tQ==
X-Received: by 2002:a05:6214:2a83:b0:6bf:6ef5:4160 with SMTP id
 6a1803df08f44-6bf7cc8e5e0mr28494326d6.0.1723852830913; 
 Fri, 16 Aug 2024 17:00:30 -0700 (PDT)
Received: from lbrmn-mmayer.ric.broadcom.net ([192.19.161.248])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bf6fe4eefbsm22917056d6.70.2024.08.16.17.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2024 17:00:30 -0700 (PDT)
Received: by lbrmn-mmayer.ric.broadcom.net (Postfix, from userid 1000)
 id 97D5CE04; Fri, 16 Aug 2024 17:00:28 -0700 (PDT)
To: Buildroot Mailing List <buildroot@buildroot.org>
Date: Fri, 16 Aug 2024 17:00:26 -0700
Message-ID: <20240817000027.654079-1-mmayer@broadcom.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1723852831; x=1724457631; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Rj0lzCiQgy37DpALjSvn1YWlwxTdnXSxczwRcQcVtyY=;
 b=cpVD1pVfBmMrgnAXWWgf4IURsX+Zb4xyfJWihrcjtbhB0DHQ5v5KCaJ7oZNZBfwr0i
 4bE+TqbPLs5cDcAOCWxD5lGhmGUbKYbP30pwqghBDgnkbxVXIHjaMVt7Cr+4ZvSvhTD2
 Gz3bolJ3gMlSRyDmu99fjxGzGD/tBheyLcA44=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=broadcom.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=cpVD1pVf
Subject: [Buildroot] [PATCH] package/dropbear: provide config option to turn
 off SHA1 for RSA
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
From: Markus Mayer via buildroot <buildroot@buildroot.org>
Reply-To: Markus Mayer <mmayer@broadcom.com>
Cc: Markus Mayer <mmayer@broadcom.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since SHA1 hashing is considered insecure, users may wish to disable
support for it. This will reduce compatibility with older systems but
provide a more secure setup.

SHA1 support for RSA is slated to be removed from dropbear at some
point. This new option also gives users the ability to disable support
early and evaluate what consequences this upcoming change might bring.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
---
 package/dropbear/Config.in   | 6 ++++++
 package/dropbear/dropbear.mk | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/package/dropbear/Config.in b/package/dropbear/Config.in
index 207c1f561700..099f61535aa2 100644
--- a/package/dropbear/Config.in
+++ b/package/dropbear/Config.in
@@ -67,6 +67,12 @@ config BR2_PACKAGE_DROPBEAR_LEGACY_CRYPTO
 	    DSA public keys
 	    Diffie-Hellman Group1 key exchange
 
+config BR2_PACKAGE_DROPBEAR_DISABLE_RSA_SHA1
+	bool "disable SHA1 hashing for RSA"
+	help
+	  SHA1 is no longer considered secure. Users may want to disable
+	  it. However, this may preclude older clients from connecting.
+
 config BR2_PACKAGE_DROPBEAR_LOCALOPTIONS_FILE
 	string "path to custom localoptions.h definitions file"
 	help
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index 9423d891c8d3..56a0b9d910b4 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -77,6 +77,13 @@ endef
 DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_ENABLE_LEGACY_CRYPTO
 endif
 
+ifeq ($(BR2_PACKAGE_DROPBEAR_DISABLE_RSA_SHA1),y)
+define DROPBEAR_DISABLE_RSA_SHA1
+	echo '#define DROPBEAR_RSA_SHA1 0'              >> $(@D)/localoptions.h
+endef
+DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_DISABLE_RSA_SHA1
+endif
+
 ifeq ($(BR2_PACKAGE_DROPBEAR_DISABLE_REVERSEDNS),)
 define DROPBEAR_ENABLE_REVERSE_DNS
 	echo '#define DO_HOST_LOOKUP 1'                 >> $(@D)/localoptions.h
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
