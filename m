Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83464C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 20:42:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48FD2612E2;
	Thu,  9 May 2024 20:42:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hNgl5QILebO4; Thu,  9 May 2024 20:42:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F84C612E6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F84C612E6;
	Thu,  9 May 2024 20:42:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2FD361BF31C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:42:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28B9E41484
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:42:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id znEaFoXA2wN5 for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 20:42:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E8A224139E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8A224139E
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E8A224139E
 for <buildroot@buildroot.org>; Thu,  9 May 2024 20:42:26 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-34f52fc2191so729694f8f.1
 for <buildroot@buildroot.org>; Thu, 09 May 2024 13:42:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715287344; x=1715892144;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jxOwSEuDvp+1I5xKtPc6866BSjJPkuZnLvE0uRM0LZg=;
 b=SKnKpjNmU3IDcJHFtsB+HKuWzoofICMn4VEKIR0KAXQjgjAQDBeksEebm7VbpRJowF
 GIB8RdV0ASJ41bQ80JTo0kFLcQ1rBxdw2hedbykn2i5nmZVUdUt6neC+uvFFfjyO8YH/
 HQov50EOUKmcTK29cCTnCI/qxWZVck1buVjrxZOVAiPMO2PwP1KHvKbCSqk51mjTq7aE
 5uNGV0nK1exak95SEiMzBRuMNwnLk0566GMeApE/DAhOxdtr86HLwtrFkx27+cxfQWpj
 AuZIrRSey7Pgwl4w14Gn6Tk9kQAw3STMT8Wt4Ek3vUvucirrRG8Zr01CzX0C5BKTPPMz
 pzGA==
X-Gm-Message-State: AOJu0YzIS2VNsLlsTOtexpW6H4JhALFLMyTt5OUnJr+AtHH5+FQHBJTN
 L84iu2u2cPL7xuMV0elcLMCFS2KYlwFCtF7W56KW2UjvAsL2ZmXx7AsJ/g==
X-Google-Smtp-Source: AGHT+IGtBk92to4oHv71S3Wksr8c1VapFjKP2S4atp26jcHvKAFu3nDzaN6z4QkjbP8XZfe1+u/eGw==
X-Received: by 2002:a5d:4b0f:0:b0:346:bc1b:4efa with SMTP id
 ffacd0b85a97d-3504a73bc7dmr489515f8f.32.1715287343978; 
 Thu, 09 May 2024 13:42:23 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502bbbbff7sm2576024f8f.101.2024.05.09.13.42.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 13:42:23 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  9 May 2024 22:42:18 +0200
Message-ID: <20240509204218.77779-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715287344; x=1715892144; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jxOwSEuDvp+1I5xKtPc6866BSjJPkuZnLvE0uRM0LZg=;
 b=GcJNxuMrWoo6YBhxMUDh3MX8OnLWdWEgNjs01hem5Y8Rflo3dsvuA74H58GgU6j/4I
 ezVyH+6gD8Y3zn2ELiWXsZCLA22fIaTPtVsYQWRYqsKUoTQKN9Hg1iLUUl+cWGlNeQD8
 ylz5ALKWxi0VDmbnDMCUaOO5lWY+MjbvRY+rvk9mWcWrSuM3Ze5xyGlyEiqKo0YlCK/D
 MztXEPOoO/7tVWthRx2mDtQT0Y6Ho2hTLOaDmedsk8G++wojt/vOu2GHLKofS+3ubIhR
 xsUKs8yQYw61KbhRb+eBfo7Gru2LHmmPXn6GG0YY/BtYC1Fyg6MBmf5HFUsQ+aS9qY+2
 zBcQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GcJNxuMr
Subject: [Buildroot] [PATCH 1/1] package/libp11: fix enginesdir
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

pkg-config doesn't return a libcrypto enginesdir prefixed with the
sysroot so drop unneeded call to xargs, readlink and sed

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libp11/libp11.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/libp11/libp11.mk b/package/libp11/libp11.mk
index cd4ed34297..dc489758aa 100644
--- a/package/libp11/libp11.mk
+++ b/package/libp11/libp11.mk
@@ -11,10 +11,8 @@ LIBP11_INSTALL_STAGING = YES
 LIBP11_LICENSE = LGPL-2.1+
 LIBP11_LICENSE_FILES = COPYING
 
-# pkg-config returns a libcrypto enginesdir prefixed with the sysroot,
-# so let's rip it out.
 LIBP11_CONF_OPTS = \
-	--with-enginesdir=`$(PKG_CONFIG_HOST_BINARY) --variable enginesdir libcrypto | xargs readlink -f | sed 's%^$(STAGING_DIR)%%'`
+	--with-enginesdir=`$(PKG_CONFIG_HOST_BINARY) --variable enginesdir libcrypto`
 
 ifeq ($(BR2_PACKAGE_P11_KIT),y)
 LIBP11_CONF_OPTS += --with-pkcs11-module=/usr/lib/p11-kit-proxy.so
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
