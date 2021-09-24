Return-Path: <SRS0=OK8R=OO=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A7EDC433EF
	for <buildroot@archiver.kernel.org>; Fri, 24 Sep 2021 16:29:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A73AF61242
	for <buildroot@archiver.kernel.org>; Fri, 24 Sep 2021 16:29:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A73AF61242
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D0ED6074E;
	Fri, 24 Sep 2021 16:29:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QOnsnU-3U6np; Fri, 24 Sep 2021 16:29:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5DD060613;
	Fri, 24 Sep 2021 16:29:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 040911BF295
 for <buildroot@lists.busybox.net>; Fri, 24 Sep 2021 16:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E856780EAB
 for <buildroot@lists.busybox.net>; Fri, 24 Sep 2021 16:29:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b1bKQITrmlKO for <buildroot@lists.busybox.net>;
 Fri, 24 Sep 2021 16:29:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F313780E99
 for <buildroot@buildroot.org>; Fri, 24 Sep 2021 16:29:14 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id g16so29194875wrb.3
 for <buildroot@buildroot.org>; Fri, 24 Sep 2021 09:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V/GSLQsPp+JDg4mpvdFWLX5I+oNExSG2QRB7QlF8vmU=;
 b=OZfC9WDcXaeBSmURTrkK3Zgwdlpwxb9khJblSvRwcJFVIYE71hUlVgyVpgmWbMw/PZ
 bMnWOLMlhIJ0lHzALZ4tkHj/uYayooW+mSdXFbMuodZcnp7CSabrWBZe8GYLTDfyURNz
 lAEuN/u4JS7d7QjFb/udgj5/qsTtt+479Eio5EtG/Zm8x5zxjZHT4kKa/PhhYg69WZZx
 CE8RBXjD/kv7h/faEQ+y0EtBP+x9hMNoA08xTMtJUW3r9sfebAaMDddtlY+XzpbsNURV
 +WkoX0ZpBLJkwBgY8BENyUb5EmEaAOjoqOV03wi41kNU9iERaeNTYGn2oh3D2RjSmlEQ
 ogsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V/GSLQsPp+JDg4mpvdFWLX5I+oNExSG2QRB7QlF8vmU=;
 b=aGERpwKW1tEy/gGAtPd5CGc8EvOk7SOofPQx3/jZpIwq0S/qTCKiIS7vjVVolHa01C
 Z0FTDk3Skual42HXhWGaVuLS5sCfJB2Lu/TyC4lclL69OmWOJW2NLE4SKehhBo8lhYNY
 KptYkMB0TOeJdUeC+yHKw0VGSMaMDc/g62xRx+mSaXMYEsAhh2VRv2q+kesGLQEMkf4k
 jA5fOyCW0ekUZilxP8xPhJ3OD1gKE9H1WQVrOVjYHDFkTB8RffApo/9T8XNpczCwxoDw
 TDjOVNwpMamxk88QK76eQcl1n5nhKA6EtmFuRxFB0v5o1wAgQxsbbwhs3qnSUCNyt3ek
 /NRA==
X-Gm-Message-State: AOAM530PC2R3zOJ700nKOlqiwFW/PO73nPh8Y9YNBDU86KlLmCtGQFEF
 Vsvotfgx698f4YJyV7Vd7uNR9zQmTKc=
X-Google-Smtp-Source: ABdhPJxktSB2pWAusZEKfcfST/Uc715C1UsD0Yp3Qs7n2PvsbCaXz3082pGlByqbBRMNZUY1y3ucWw==
X-Received: by 2002:a5d:6d8e:: with SMTP id l14mr12504204wrs.26.1632500953003; 
 Fri, 24 Sep 2021 09:29:13 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id j4sm8967999wrt.67.2021.09.24.09.29.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 09:29:12 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Sep 2021 18:28:44 +0200
Message-Id: <20210924162844.2192755-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/cryptopp: security bump to version
 8.6.0
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Julian Scheel <julian@jusst.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

This release clears CVE-2021-40530 and fixes a problem with ChaCha20
AVX2 implementation. The CVE was due to ElGamal encryption using a work
estimate to size encryption exponents instead subgroup order. The
ChaCha20 issue was due to mishandling a carry in the AVX2 code path. The
ChaCha20 issue was difficult to duplicate, so most users should not
experience it.

https://github.com/weidai11/cryptopp/releases/tag/CRYPTOPP_8_6_0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cryptopp/cryptopp.hash | 4 ++--
 package/cryptopp/cryptopp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cryptopp/cryptopp.hash b/package/cryptopp/cryptopp.hash
index 404d8a41ae..9a113b8f04 100644
--- a/package/cryptopp/cryptopp.hash
+++ b/package/cryptopp/cryptopp.hash
@@ -1,5 +1,5 @@
-# Hash from: https://www.cryptopp.com/release850.html:
-sha512  090472545c74bbf0579b56b09e8b5dcd777b38f29f7199a2e68f45d4a8c687acc82f105ba8b2a38f9aa65e5997a3d846aaf2341ab74d58b4bbfd1f5f03823b93  cryptopp850.zip
+# Hash from: https://www.cryptopp.com/release860.html:
+sha512  e7773f5e4a7dc7e8e735b1702524bee56ba38e5211544c9c9778bc51ed8dc7b376c17f2e406410043b636312336f26f76dc963f298872f8c13933e88c232fc03  cryptopp860.zip
 
 # Hash for license file:
 sha256  e668af8c73a38a66a1e8951d14ec24e7582fee5254dd6c3dae488a416d105d5f  License.txt
diff --git a/package/cryptopp/cryptopp.mk b/package/cryptopp/cryptopp.mk
index 1d303a67a0..6711a37fbc 100644
--- a/package/cryptopp/cryptopp.mk
+++ b/package/cryptopp/cryptopp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CRYPTOPP_VERSION = 8.5.0
+CRYPTOPP_VERSION = 8.6.0
 CRYPTOPP_SOURCE = cryptopp$(subst .,,$(CRYPTOPP_VERSION)).zip
 CRYPTOPP_SITE = https://cryptopp.com
 CRYPTOPP_LICENSE = BSL-1.0, BSD-3-Clause (CRYPTOGAMS), Public domain (ChaCha SSE2 and AVX)
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
