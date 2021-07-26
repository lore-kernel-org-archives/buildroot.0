Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4102DC4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 08:13:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C72F60F37
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 08:13:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0C72F60F37
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB70840293;
	Mon, 26 Jul 2021 08:13:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XgOkwBljy_te; Mon, 26 Jul 2021 08:13:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27CFC402A1;
	Mon, 26 Jul 2021 08:13:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4E7281BF293
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 08:13:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3DA98607B0
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 08:13:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mqMEnpmSj7as for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 08:13:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4400E607AF
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 08:13:37 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id q3so10054341wrx.0
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 01:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tzz1woyNjxCLMvRdwL7YYDIOTXZQG2bgG6hVW1lf430=;
 b=l7aGKTqVGftqQqiInwrZ06tgd46hSRWgTYv/XL3YUEtAPrU/xmeCsZxY2r1IPKcqHO
 IqZ2swleuIZ+PGqIeZCH4dqVmx4u8crPcpE6dr4GEkAp25Ac6w+J0GVEW+2GstTfhuF3
 wb0UXTLmXBCGjGVCZYqRk40RPqmk3JeinBErWPFrzjlcKvCymWLp7Yc0+EVV9xN97MaF
 sd54PrkZYyU7Fr5MVXNiU7HsM7Y6zgzCVdtOXUPIR/sdn5Kph6xli6F6ykrLeGlaRgvo
 DBgh4TDC3LcSOiOa1pgT4r4wMZsHsF8BTeU++azXGa5cs7VRUn8DugfNOHL9FZI8KnoN
 DfvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tzz1woyNjxCLMvRdwL7YYDIOTXZQG2bgG6hVW1lf430=;
 b=hfSAVL7ikNJvsNPY8Cegvyb24kX/hMT779ikBTtmVdhsS3LZVnMvQ/G+Wt102wlRxA
 KF6VYQ7rDsKit33HqDqZvXSHcLTrm9SvY025rLSJ8z0Y/Adx3fiVvmXPd8peKb9H6Tnn
 cJ6gRN1XP4JgCo3EUz/kaSQbGjbCcFgWeYvqoCH4DJPSidNs7aW+qeyw8zzS93dTMUny
 tWHCslMWtr+V5fKPy7PVJiyxehOoezUd+HUrtNwf3r2hy+KWrcNI2oYoTywwVeeuLkzk
 3d+5KlGWLPYJoLtbor4xeB4z3+Vovjb7CTe6Lp4TZ75zfMnIJmHaTIKHqv/aLY6PWtO/
 KGNg==
X-Gm-Message-State: AOAM533cEBL+IckVyDBNtS2vcT0iIhecrl+dYAlNaNmxffbaiGiZVxqY
 3mOVv0oCA/uvHzeh7qM9FD0OyGEfdKhzmQ==
X-Google-Smtp-Source: ABdhPJwcbS7HCHHnIWbL2qiRY40v5hmw6MVnClDxRDfU2swds4w4exKMOs5KFNEWOHhlNuluCg3A4A==
X-Received: by 2002:a5d:6991:: with SMTP id g17mr7039516wru.253.1627287215332; 
 Mon, 26 Jul 2021 01:13:35 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id p5sm33786109wme.2.2021.07.26.01.13.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 01:13:34 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 10:13:24 +0200
Message-Id: <20210726081324.1704969-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/dante: add SELinux module
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Support for dante is added by the services/dante module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dante/dante.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dante/dante.mk b/package/dante/dante.mk
index 6e950b119e..2c6ddad7ad 100644
--- a/package/dante/dante.mk
+++ b/package/dante/dante.mk
@@ -8,6 +8,7 @@ DANTE_VERSION = 1.4.2
 DANTE_SITE = http://www.inet.no/dante/files
 DANTE_LICENSE = BSD-3-Clause
 DANTE_LICENSE_FILES = LICENSE
+DANTE_SELINUX_MODULES = dante
 
 # Needed so that our libtool patch applies properly
 DANTE_AUTORECONF = YES
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
