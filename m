Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B028C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 15:44:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4115160F42
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 15:44:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4115160F42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFB3C827FB;
	Sun, 25 Jul 2021 15:44:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hJbCGpwzTost; Sun, 25 Jul 2021 15:44:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55F24825C6;
	Sun, 25 Jul 2021 15:44:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 809631BF41F
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 15:44:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 703794011D
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 15:44:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gm2RgTDbX8XO for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 15:44:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9A551400EE
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 15:44:01 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id b128so3760013wmb.4
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 08:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O5ytTsftwttnGumZijN6lYJmCj/TrC7Fi7L2XrbLAug=;
 b=sVT35NM5c/ntQCrjQJa64ZcQqtYJROi3xDsbL1nkyw73Jjl8BtfQgw7SVM88eNMu3F
 7pI06LlCzFfegv8TTP8sfRVsxld3lpYTarK4ytUfEwJKXgWTr2rnWMLqX10KzMYEeUyd
 mBJHG5NBbSGDemGvgpUJpSLbOTRH//UPR3qXtDvyvtxOmQ5KOeg0xMa68Ougtu6Zvu8V
 A3AIJ1O37zCsX1yuXPQaBDBHJhvSZnl+GGlmlhxkx4LM+yMnyjicTULDsFXs6lfI+2Oe
 SENQe85RyOrzpuyCsm18BEZ+SUz8nJgXr4C/B3uncxt7hNdiGpt3mDvtbUdzVjFHhUmQ
 PcGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O5ytTsftwttnGumZijN6lYJmCj/TrC7Fi7L2XrbLAug=;
 b=g/wRdZW6L/gQEynvr2ZNaI8V0uZ7y49klNqQYpNXU7YbeQR9zvErCBAAnKzcG+H/s0
 /yWH38UdnpPLdjcz6XQJOauxn1fdMHde9L6wJ0cjSuSkb0rP8dcALHsEsw9yC9565CWS
 5ZJ4WAfzwaJgtoK1EkYTJwwbP2tcdUEyqbSeDdjjCAJLlh9Wz5uAAA4DTKFmVBe6HBDi
 RDvFE1Yp1Yv0P/7k6PmdEjPgV9YNCJqbOTx0aVT5uIrrZ/t0ctxaC8HfV56DLgOKrrdi
 r7+s3npGJN0Vmz5T6OGvPKtnbbSvb39SF64jy4rhMmq0lVJzJ/xRbKl3MUia+445wRbC
 8mPQ==
X-Gm-Message-State: AOAM532eaiqj3KQMRK2/Ar9Z14HI1PXhr3JpHXMsqFt2sWpowS3bR1mU
 aX6f3r8dUzT5aqevqQ0CVCjHV96rzMhNSg==
X-Google-Smtp-Source: ABdhPJyPTqQWE1ijCw8U2zVxlt7bcNtPrN0L86cUClVAlHdb8eV5MZoN1MVqp/47sT1VqUdS1eWJRw==
X-Received: by 2002:a1c:804a:: with SMTP id b71mr5593954wmd.141.1627227839633; 
 Sun, 25 Jul 2021 08:43:59 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id l14sm37461647wrs.22.2021.07.25.08.43.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 08:43:59 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 17:43:28 +0200
Message-Id: <20210725154328.902087-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/cups: add SELinux module
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
Cc: Olivier Schonken <olivier.schonken@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Support for cups is added by the services/cups module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cups/cups.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 8490fe109a..80aecdba5e 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -10,6 +10,7 @@ CUPS_SITE = https://github.com/OpenPrinting/cups/releases/download/v$(CUPS_VERSI
 CUPS_LICENSE = Apache-2.0 with GPL-2.0/LGPL-2.0 exception
 CUPS_LICENSE_FILES = LICENSE NOTICE
 CUPS_CPE_ID_VENDOR = cups
+CUPS_SELINUX_MODULES = cups
 CUPS_INSTALL_STAGING = YES
 
 # Using autoconf, not autoheader, so we cannot use AUTORECONF = YES.
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
