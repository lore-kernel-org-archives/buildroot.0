Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3A78C4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 07:02:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A934C60F23
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 07:02:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A934C60F23
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A7D9831CB;
	Mon, 26 Jul 2021 07:02:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qDnoWsOQpTmF; Mon, 26 Jul 2021 07:02:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB6D782C35;
	Mon, 26 Jul 2021 07:02:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3B4931BF3A8
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 07:02:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 37F8282C35
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 07:02:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rf4OSDP3Zjxj for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 07:02:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4F454829DB
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 07:02:34 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id l4so9774382wrs.4
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 00:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=reAxQ3/eWO4guipShKrO2HxWS/XAPLKbxhQz9l3jyoI=;
 b=PrECpqMlxU2yfcyBAZquWrF/3EvQ6fbZvbdJD37i1fZO5pRxhGIV+IGgsdq7CQ5Pwt
 Nb6ojXj+cO3x2+uYFZagllFxHnb4RVB8G4jO3o7G4Dth0frPPSvGDEl0CeNrCYC/noR9
 UQezKfzjTxQZYpXi8/OsBRTZCphrQTUn7zWeK051DD+ND9iryGvdIYtCL+CNQZvLn/WO
 dEluwApuEUoy3nzRgnF2f3lAqsXVgHhOp6gi0XyWTK2RDZHtobCOE07QxSdIgWINJWRa
 bi6UWUN2wEdxTKbdTbkncwshOl7RcdT0y03phs/DF5zga+AtlVnsmX34nMYThl6DVBPa
 DVfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=reAxQ3/eWO4guipShKrO2HxWS/XAPLKbxhQz9l3jyoI=;
 b=oVs41lJJoZMW91wGIYWFWqv942f13U75Q/DH8LCLylNOW3fD4m8PSovryH5ihzQ6oR
 7FK7OlpfRcSpyML2wZBHzUqgj82YG501FCbKBbX223oxBFpMvv2uqC33ghv4/Ydr2RkP
 Ss+qowuBCM2LoKij/6/sWULltrr2+W8IO3SZstqBq5oaIEtwoohj0lm62uq2mPYKBPy/
 s4WSfE8AFFdtC5IeTHr/jqHeXJvdGwALS/pH+SyYRkUP4QEyPyf/C+G4+fvmIrS8HHQG
 7w1FyoEwqAHZ+5VAwHrhcP5pawB0A7pgFLEnLQ8FVTuMAF4XjeacLQFh/dN/4Icg8/oP
 Ms4Q==
X-Gm-Message-State: AOAM5329ggbvPMrb5bEafUd3SpiB6+rMnfPZCS/qG079NFOHmr8wkeyj
 QSK76Aq+x34Dz3gylLhNsTenmTcpocCA7g==
X-Google-Smtp-Source: ABdhPJwy6N649iYpSsOAxx4mS+F/P2vdvo4QWDtXPX3HapxNLkEOoQdYYl4LvjiH0YxRZGM4w8iGvw==
X-Received: by 2002:a5d:528d:: with SMTP id c13mr17789032wrv.343.1627282952380; 
 Mon, 26 Jul 2021 00:02:32 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id p22sm10951278wmq.44.2021.07.26.00.02.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 00:02:32 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 09:02:10 +0200
Message-Id: <20210726070210.1703761-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/p7zip: needs __sync_*_4 intrisics
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
Cc: =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

p7zip needs __sync_*_4 intrisics since its bump to version 17.04 in
commit 9332ab86f8953a8710b9377d3fba46c986610254 and
https://github.com/jinfeihan57/p7zip/commit/b0bf49e3e14ef291281b6c318c75db96c03910bc
https://github.com/jinfeihan57/p7zip/commit/6175cdaf3e762cc9e03c8af00e76ffe60d3e0844

Fixes:
 - http://autobuild.buildroot.org/results/4e1a920d09528b87803cc2e7245a470c85548946

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/p7zip/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/p7zip/Config.in b/package/p7zip/Config.in
index a3adab5b3d..badfb9b9e8 100644
--- a/package/p7zip/Config.in
+++ b/package/p7zip/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_P7ZIP
 	bool "p7zip"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # __sync_*_4 intrisics
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR
@@ -12,4 +13,5 @@ config BR2_PACKAGE_P7ZIP
 	  http://sourceforge.net/projects/p7zip
 
 comment "p7zip needs a toolchain w/ threads, wchar, C++"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
