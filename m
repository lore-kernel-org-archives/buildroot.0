Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE605C43602
	for <buildroot@archiver.kernel.org>; Tue,  7 Jul 2026 04:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6782140547;
	Tue,  7 Jul 2026 04:08:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vQ4NlwBPnE_2; Tue,  7 Jul 2026 04:08:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97372406F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783397326;
	bh=+TSCZtKaVn54gNJpk4a7futKxng2KRvuUhEX1QWaN4s=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iXYYP7/DuNKa40StH0N8HnSZX+cmyspVie4ICKtGQ/HO7NOx7i9rRjLODWKN/82m6
	 Z3L651ZHi9TghSZWdoRL2RCrRdihk0PkP+TocUDQyjku2n7bgQHMM5a/UsF+xHEbmd
	 AIGL0JWgtPFC1pdY5lmXqJnvfQrxTF7lhGlyXgkTlp2J5lkS2h0SZ63K+SwwjNcueL
	 B+dzJuALoslnekv2EK53+cFU7QGC4UNqHXQG69JnLt4CmlF+aqTMwnEH/DlTMQvyma
	 kxq94P45PWT0fA8S5HBeJq46O/aLqiKnVsd5DpOiDaBRGCEE0F1UfnPAv4smL3brs0
	 vCigyMij3r0hQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97372406F7;
	Tue,  7 Jul 2026 04:08:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6061833A
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 04:08:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 510A640694
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 04:08:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9ug29A8Djj8c for <buildroot@buildroot.org>;
 Tue,  7 Jul 2026 04:08:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B0BB9406F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0BB9406F7
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B0BB9406F7
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 04:08:44 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2cc7e86e7aeso22308675ad.2
 for <buildroot@buildroot.org>; Mon, 06 Jul 2026 21:08:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783397324; x=1784002124;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=U89XGxOdeUhwSQEbMWeV2pz5VxaakDECbLZPzZcfOic=;
 b=Z6c483NAgS2k/x/UetYa9VB3Mtjs+JPmwYn9d6RQ+gdUKhLbAhu3VYgJGBaPARiJe3
 /EQWWRcs94flLqhXpW8uFfdWlEuEA/R9PZ3s56rp/YTzTi1fWXWjU6y2h9PpeVtGcYBx
 hfFgfqVQDLC1BuSjHRVrpyrqGCVx0TZBKwIL/FOPDHEc8us4DISKsJ7m+TzlgbTTPMsg
 Kh446VSPpDOLY4NP/cdZz70DwY6EJ8bqI4tqKnYMLCsjj25bJvMQCwa4ke2pla0chWDw
 XkNBo54cZrgU25CV8lqdMBNLekj14/YaWK8Hf/slW8rrjAABdhQ446ivkWhNF9bgcr4s
 PSbg==
X-Gm-Message-State: AOJu0YzcXKUWDU8lnrf1PyGE1FCrHSW6Lhetk+9LOzY5BBu6YKgAXKZm
 sFVBf/nYoARI0o8v8OC/I0SJXXO4ERpLrjg4moe3MSZz7GWSlOPUFVq7PhqSHrcJ
X-Gm-Gg: AfdE7ckFfDHurdXsrdAC7gepaSFVLgsBQ97OkBHROy9IIBg+hJ6SH2GYy2NrkUqLBMM
 F/TzBcSrC3/NfW0SB3ZOR+AFaZdBXkyqa77Wbc85I/pMnc89GzIqsAxJDiI18lVSLU+oo0uVEYp
 fLLHbZk+LNTV5jKmqiFaVAwvAoLi6yCq2ZclnH0i2R4fya3CFTlqS6137Jgy+Qbf/CmNGNHPI62
 RdwJ/ID9wGbyWNz8kY47VhX+S0vnlpsg6uxsMMZqID2oteXl6tp6Vy7KVwgY3NEkFryhPYTpsjD
 KVwOaA+j3eoWcMqk9ABLP89xoCEsOTv0y6tj5s3JuREBpzrwThKG2OjzoeDOZnE6UMBcCx9P6M8
 yRi3+dBN3OjR2C7xVHSgvmg5gSbdfMbEuVLG8hpRi1MPa9H1rAY7SySm4t73GEoOeXTWCPaDVSC
 gwIR7VUmcp5i3A7p4CmfmF6TVNzsuOoiddyZmLavjs+Sc4rtGl9cGBBnC5og+LYFoe8QoRrAsVn
 pVzMf9774r4
X-Received: by 2002:a17:90b:58c6:b0:387:e0db:bc22 with SMTP id
 98e67ed59e1d1-387e0dbbe09mr981451a91.34.1783397323780; 
 Mon, 06 Jul 2026 21:08:43 -0700 (PDT)
Received: from kadvm.. (ip72-203-121-181.oc.oc.cox.net. [72.203.121.181])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-311747f598dsm3372636eec.6.2026.07.06.21.08.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 21:08:43 -0700 (PDT)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Vladimir Oltean <olteanv@gmail.com>
Date: Mon,  6 Jul 2026 21:05:38 -0700
Message-Id: <20260707040544.108052-3-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260707040544.108052-1-nemaakhilesh@gmail.com>
References: <20260707040544.108052-1-nemaakhilesh@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783397324; x=1784002124; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=U89XGxOdeUhwSQEbMWeV2pz5VxaakDECbLZPzZcfOic=;
 b=mkFoAfl6jiTmVzYdtYflc0KkpNkz7N2DrO4anXi+11+fgpTnbMuXtaOXLs8Ed+Wuao
 /HtxK1n6tygxWEd/gYhplMasI+ckgpZEHsq9b8SpDvNmReQNRPDZJFRFFYtIztQ8Q4R1
 8RNfnATKsMYd92CE9+iMlq5yspv5+/j7mfT/8Op1O0yL2Fdu15LLeWWLe3bLgYI8vICp
 Zfru9cAgxzQOhkZhtYHXC1CLKeQgWZYY5x0Irp03dURhVkbqx9vbBgXuxDZWghJ/HN4G
 t62NjCwvtM/dHPXZ4Ri2cpeIrNI5+6o8T/wPa2H8Au7s2vSTtTXBmnQmMhsuYhKVPoKz
 gLrg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=mkFoAfl6
Subject: [Buildroot] [PATCH 3/9] package/qoriq-fm-ucode: bump version to
 lf-6.18.20-2.0.0
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

No change.

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/qoriq-fm-ucode/qoriq-fm-ucode.hash | 2 +-
 package/qoriq-fm-ucode/qoriq-fm-ucode.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qoriq-fm-ucode/qoriq-fm-ucode.hash b/package/qoriq-fm-ucode/qoriq-fm-ucode.hash
index 1f6bd01b64..9b4546dfc6 100644
--- a/package/qoriq-fm-ucode/qoriq-fm-ucode.hash
+++ b/package/qoriq-fm-ucode/qoriq-fm-ucode.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a3ee2bd375c90de1249ff49e6185874583edd92aa2e2bfb4ccf25b7d8a563205  qoriq-fm-ucode-lf-6.12.34-2.1.0.tar.gz
+sha256  771cee1fa5fc947af2ffe6e5ff565d76d0df32b9c2554252f24e67bac0f63040  qoriq-fm-ucode-lf-6.18.20-2.0.0.tar.gz
 sha256  7a223031d76339df0e4e5a94d193a270fb9963d42b577aa42fe130a4657f3e17  LICENSE
diff --git a/package/qoriq-fm-ucode/qoriq-fm-ucode.mk b/package/qoriq-fm-ucode/qoriq-fm-ucode.mk
index 3c197346ca..86d0679214 100644
--- a/package/qoriq-fm-ucode/qoriq-fm-ucode.mk
+++ b/package/qoriq-fm-ucode/qoriq-fm-ucode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QORIQ_FM_UCODE_VERSION = lf-6.12.34-2.1.0
+QORIQ_FM_UCODE_VERSION = lf-6.18.20-2.0.0
 QORIQ_FM_UCODE_SITE = $(call github,nxp-qoriq,qoriq-fm-ucode,$(QORIQ_FM_UCODE_VERSION))
 QORIQ_FM_UCODE_LICENSE = NXP Binary EULA
 QORIQ_FM_UCODE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
