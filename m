Return-Path: <SRS0=O81Z=N4=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58159C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 15:26:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FC8060F13
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 15:26:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1FC8060F13
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE2B382430;
	Mon,  6 Sep 2021 15:26:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m0k0TAX9j3w4; Mon,  6 Sep 2021 15:26:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 487F981BCF;
	Mon,  6 Sep 2021 15:26:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 63DA11BF3E0
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 15:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5432A82430
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 15:25:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vUyi4e6Djlpw for <buildroot@lists.busybox.net>;
 Mon,  6 Sep 2021 15:25:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7186980EEB
 for <buildroot@busybox.net>; Mon,  6 Sep 2021 15:25:49 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id n5so10353431wro.12
 for <buildroot@busybox.net>; Mon, 06 Sep 2021 08:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eXwGPVR6oFFtw50+88ZZD4e6CVXIOUoKT28jBsty0U8=;
 b=EaY8ITMLmL3SHUsnfsB1UAXVcqXbFf0p6fY/MhplPYGTnRtSGQmIjB+njDDFOgfDGB
 hGIMVOZo0jTqy1u1MjONCCij7gP9VWaw7Fz2kTv77bJ3SMsDaBrRlCdgNEvCliN7/b6A
 8SoKklPVBesC6eDnblUMKdob92oNMUiFuj3bIYpDPWSvDuw1gfWHjg2UeJPW3MV/vdmF
 Ve+iPfaDMsc0P0p5y8rFg56vO57mnKa16NaFMb40Q07OHKwkJeFNqK0pVO3Toksvail/
 UCKHUeaFh57mJVbATFJJkG0kzUa4JFM2hbWpTm0hxpTXDmKwlsq6baS9MTY6JdgNgNg2
 oJDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eXwGPVR6oFFtw50+88ZZD4e6CVXIOUoKT28jBsty0U8=;
 b=SI29PYaetxmeUgFMotZ9VUGbkZ3LNd84ExfSqguwXl567AYAVDnaUKIbuW44nPErG4
 J3dt9zZBXQ5srUWNFUH1SqekBou/0mgZA69EFOTgh8e8FINpiWOSpT4iRHaRS4RqeTAk
 fcwVEFygESaeWdBgzOQ9BNZKRKL8FGp5WVU407SGVGfaJzZJpRxaGgusZ2vugkrzXuc4
 lheaEaxyUUU+GpcNyN1B1rSsaSOEJtfdg163gmIa9Sb4W8PZtjANbYW/IWAgPOoHaPDF
 D2ueXZZVrjnotM3kDyn92JJZRk/e8nTkl1EzGlg+ibtrZzZv6RDOZJvT5b8iAxLarqRD
 CTdA==
X-Gm-Message-State: AOAM5309Q+plidTKnGDCV6UiMT1KOhGi0fm/zeYIhfsVimh429DezhhZ
 KhRXWpfcWxiZvpwScdcrkiRR+yuoVg0=
X-Google-Smtp-Source: ABdhPJwg1bRqjpYHBGCIzQZMvSz4eKqBrrQFVc3RrVRBVE/CzhWnTDOnvx1fnRpCket9umM/qZUDGQ==
X-Received: by 2002:adf:f490:: with SMTP id l16mr13964684wro.136.1630941947810; 
 Mon, 06 Sep 2021 08:25:47 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id o2sm8644351wrh.13.2021.09.06.08.25.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 08:25:47 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  6 Sep 2021 17:25:40 +0200
Message-Id: <20210906152540.1831522-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libressl: bump to version 3.3.4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/libressl/libressl.hash | 2 +-
 package/libressl/libressl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libressl/libressl.hash b/package/libressl/libressl.hash
index 5f6b22aed..45afd04dc 100644
--- a/package/libressl/libressl.hash
+++ b/package/libressl/libressl.hash
@@ -1,4 +1,4 @@
 # From https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/SHA256
-sha256  a471565b36ccd1a70d0bd7d37c6e95c43a26a62829b487d9d2cdebfe58be3066  libressl-3.3.3.tar.gz
+sha256  bcce767a3fed252bfd1210f8a7e3505a2b54d3008f66e43d9b95e3f30c072931  libressl-3.3.4.tar.gz
 # Locally computed
 sha256  5c63613f008f16a9c0025c096bbd736cecf720494d121b5c5203e0ec6e5955b1  COPYING
diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
index f1f5e1974..f1847b18d 100644
--- a/package/libressl/libressl.mk
+++ b/package/libressl/libressl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRESSL_VERSION = 3.3.3
+LIBRESSL_VERSION = 3.3.4
 LIBRESSL_SITE = https://ftp.openbsd.org/pub/OpenBSD/LibreSSL
 LIBRESSL_LICENSE = ISC (new additions), OpenSSL or SSLeay (original OpenSSL code)
 LIBRESSL_LICENSE_FILES = COPYING
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
