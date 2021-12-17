Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1318AC433EF
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 19:13:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEABA41D44;
	Fri, 17 Dec 2021 19:13:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ooQiuhWYLzEi; Fri, 17 Dec 2021 19:13:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3134341C41;
	Fri, 17 Dec 2021 19:13:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C2BBF1BF35E
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 19:13:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B090384C4C
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 19:13:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mC7EQn55e-uI for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 19:13:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B4D1E84BE7
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 19:13:19 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id e5so5909469wrc.5
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 11:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cc4bQpGpweAImwuPq9/qO6P15L6FH/Rs79zKtqGBXW0=;
 b=o6ULEb1TagxYZV4a0AcVId4aXtlmDYGX4hCJY+NXWJyt9LEOUu89+cRLO1go0GfwTT
 obxj//nfhkqhsKz2djukbdojTEh4jXPskx1+WiMJdy8xYZkWqMTX/J5gAujGf4Mupo1h
 /8N9MS2XuI3Vwak7QShWpKXb4m/eS+4GgWjAyn6uSoNEpJyPASVCQkcRPWGno0zCBKzn
 7Ij7kBAJSj0FisR/b7Jb09ObCJxiTlLQWPBQ9FBsH2Guz74gqPvti2L3rlHAl3X5QRch
 QlDf/C3HyW1UKJ+u7Cv81AxwL4fMgnKNNa2VJVLtnuSUCKDwAT09TUk5WMESN6N0R4EU
 bJCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cc4bQpGpweAImwuPq9/qO6P15L6FH/Rs79zKtqGBXW0=;
 b=MgSsuJTxtoRcdPIrAUa4VqaBgrPbPjBLOQa0CrmUoTs4QiNaE+6vej3snbjzY3eglq
 U9zrnAMvvdSKzutXRZUuONRM8HTeXFSQjVGquAL8oyTQNB13Y1dZ/5/qY4uOkOOMTlTT
 G+Ih0DpxYMdaU/ULjNuZAFYkC6I4kISjHCx8cd0XU69GS0QrsTJCO4F8i/2u+c65nDHZ
 92EEQ6VRWTDdAajtu9gWDZW/RIcZM+K5v66+3bfUjKtIx7AhLwSk97vRDCxuM/v/qfnM
 RZok83m2uiiRbYxURRYwYgYaJofhPmP6mkROQOPeWK4Zi00wBMJPENzkZohm7/T1ZFBM
 malw==
X-Gm-Message-State: AOAM531knAJ42vZuWNNAvu8MbayWPhNZ0Ou91NurQnRPg++83tne5oBr
 5DAhnb2HQXRfR8jcHJ8MYS4Eb8hywGbjgA==
X-Google-Smtp-Source: ABdhPJygGGr1s7egwoXPDcH0FSwHCBPIhSE20Gal6ArGxvaFLoHqhQu42aLg0rA8peBaxiEWGbhE+A==
X-Received: by 2002:a05:6000:144d:: with SMTP id
 v13mr3634617wrx.411.1639768397609; 
 Fri, 17 Dec 2021 11:13:17 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id q206sm4262256wme.8.2021.12.17.11.13.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 11:13:17 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 17 Dec 2021 20:12:52 +0100
Message-Id: <20211217191252.30122-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mbedtls: security bump to version
 2.16.12
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

https://tls.mbed.org/tech-updates/security-advisories/mbedtls-security-advisory-2021-12
https://github.com/ARMmbed/mbedtls/releases/tag/v2.16.12

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mbedtls/mbedtls.hash | 4 ++--
 package/mbedtls/mbedtls.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
index b93da164f9..8247748afd 100644
--- a/package/mbedtls/mbedtls.hash
+++ b/package/mbedtls/mbedtls.hash
@@ -1,4 +1,4 @@
-# From https://github.com/ARMmbed/mbedtls/releases/tag/v2.16.11:
-sha256  c18e7e9abf95e69e425260493720470021384a1728417042060a35d0b7b18b41  mbedtls-2.16.11.tar.gz
+# From https://github.com/ARMmbed/mbedtls/releases/tag/v2.16.12:
+sha256  294871ab1864a65d0b74325e9219d5bcd6e91c34a3c59270c357bb9ae4d5c393  mbedtls-2.16.12.tar.gz
 # Locally calculated
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache-2.0.txt
diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index 9207daf186..93ac1bb163 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MBEDTLS_VERSION = 2.16.11
+MBEDTLS_VERSION = 2.16.12
 MBEDTLS_SITE = $(call github,ARMmbed,mbedtls,v$(MBEDTLS_VERSION))
 MBEDTLS_CONF_OPTS = \
 	-DENABLE_PROGRAMS=$(if $(BR2_PACKAGE_MBEDTLS_PROGRAMS),ON,OFF) \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
