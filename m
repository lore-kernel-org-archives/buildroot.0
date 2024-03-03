Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53179C48BF6
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 10:30:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E766C40707;
	Sun,  3 Mar 2024 10:30:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S4Nni8JzA3e8; Sun,  3 Mar 2024 10:30:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 122AC40715
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 122AC40715;
	Sun,  3 Mar 2024 10:30:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C5C261BF5AE
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 10:30:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE7D540715
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 10:30:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Idvwwp4qMA9L for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 10:30:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8AD1C40707
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AD1C40707
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8AD1C40707
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 10:30:05 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-33d754746c3so2016484f8f.1
 for <buildroot@buildroot.org>; Sun, 03 Mar 2024 02:30:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709461802; x=1710066602;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fletzRZAzCytDYqUPyP0XEFVZ6Sqi8QP2JZg4UfMM14=;
 b=bhgPwaOPHNeJQ9eP/tT2T5waOwd3VowI1SH2SzUBpbTxh4HENy3pot7Wg9pwTorY5S
 cVws/CKj8AKSfMFBjAeg1T+g5tGap2ApUK53vZACRli899fHMrGkv1wZUMBE4Agdo4/k
 I2BWYweFgIPfJvh0HW2+n+Qx5jHhEjZNXKOxE2jPGMsxS22PQuGflLejd1Pl0MhmhHnS
 HOIAFx3cJE4fJfGPc3YAG/tvLJe2rinke5dT9Dmqt4neWG9WzL7ZqnRkS35JjoYGyTzu
 x/xk9d1nX4tk17WSBfmPHAddBBexzboAHdgElSje++h/n5fZZacok7brneFBlnFCiPxv
 DQIw==
X-Gm-Message-State: AOJu0Yx3yNQPn2IW9kexuo+pLI/8VHviGkdUFACdKKWpw9Til2+EHMbT
 CkVp+AzsP5OlrtlrN5RfErcnuqsvEUFXJ8WzuEm5dWSSMnCgrloVeZ51EOcA
X-Google-Smtp-Source: AGHT+IFTYuB02xW+JU/TGIlquUECLk2pIoyim2f/lzjwXII6hYmawNrCyQ4MP0aGIjHpgVr7UP4jyQ==
X-Received: by 2002:a5d:6986:0:b0:33c:ec8f:7b51 with SMTP id
 g6-20020a5d6986000000b0033cec8f7b51mr4673059wru.16.1709461802347; 
 Sun, 03 Mar 2024 02:30:02 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 co17-20020a0560000a1100b0033e3ca55a4esm6129wrb.21.2024.03.03.02.30.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Mar 2024 02:30:02 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Mar 2024 11:30:00 +0100
Message-ID: <20240303103000.454697-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709461802; x=1710066602; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fletzRZAzCytDYqUPyP0XEFVZ6Sqi8QP2JZg4UfMM14=;
 b=nlgs/UxVQcm1xhygD4Ubx37K/XrBWS2KIrLFiI/WiEtdJe7TZYGETtL8Ex8gHERxSD
 Z1c9r4wYi5rZcV/xcODvENpjnwA7fYAsU1D+GOlPOjhP95Eh1phZhvvT5aPpdTx/rl3l
 UrDSXogDYr0gXrElC4GQZg7jSaGW4BjsKQIB9cdlMaR5YxeLNAB9RH1uGZtUrO20LB+J
 GD+c0BFb4gdS6oVj7rxKdzQ9uJlkiEmq8FbCXCYvGQj8J+ZcrSe0guooGIE34K9iWCo4
 wDJJp1YsCN2MUN4hxdL5gpqYXQfbGTGktGvLGSqmEPjD7nB7hSOu7sh49keQmnvrVVqp
 Zzrw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nlgs/UxV
Subject: [Buildroot] [PATCH 1/1] package/luvi: fix build with aarch64_be
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

Fix the following build failure with aarch64_be raised since the
addition of aarch64_be support to luajit in commit
28e5c2f2bdd147dbb9aefbc040fc618f46ee0663:

luajit: unknown architecture

Fixes: 28e5c2f2bdd147dbb9aefbc040fc618f46ee0663
 - http://autobuild.buildroot.org/results/9b89eff7d90173b8c74b8f676650709cc4418e65

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/luvi/luvi.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/luvi/luvi.mk b/package/luvi/luvi.mk
index a8e645fab3..ebd1066c5c 100644
--- a/package/luvi/luvi.mk
+++ b/package/luvi/luvi.mk
@@ -22,6 +22,8 @@ else ifeq ($(BR2_arm)$(BR2_armeb),y)
 LUVI_TARGET_ARCH = arm
 else ifeq ($(BR2_aarch64),y)
 LUVI_TARGET_ARCH = arm64
+else ifeq ($(BR2_aarch64_be),y)
+LUVI_TARGET_ARCH = arm64be
 else ifeq ($(BR2_mips),y)
 LUVI_TARGET_ARCH = mips
 else ifeq ($(BR2_mipsel),y)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
