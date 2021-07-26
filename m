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
	by smtp.lore.kernel.org (Postfix) with ESMTP id F101CC4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 08:24:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D6BF60F5C
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 08:24:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9D6BF60F5C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E8898379C;
	Mon, 26 Jul 2021 08:24:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X0Lk2Hkbgw7Q; Mon, 26 Jul 2021 08:24:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A71B83396;
	Mon, 26 Jul 2021 08:24:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EAAB11BF293
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 08:24:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9B4083396
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 08:24:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hl09L8bdp67U for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 08:24:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CBBDF83196
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 08:24:01 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id n12so6461560wrr.2
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 01:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sRinJ0ihXcwDC5Z9GaQgAAjQtmzDNg9ort/XgHGR5sA=;
 b=j2BCC0qDGb6TiKuqETKxF9l/Yk1y5yN5ctNTHbAoKP2Cs6+2q+bOGxN3Z8I+mPB6pK
 ZG6NvPBzeKA3iVFrkxApjZxK6p3VkCIj3d0Wlw2Ez2jxUng+5HZ/fhD3xfKwl11DZMHr
 R6DbGTwhPI775xsj6j1jCdcObTHmJpovdm3tbiWMiQhvwLDXNAvGPhm8pbhiim4Lhu0J
 aNoniNDtPY8CRSRz/1ADU8pGEDGb5ycQpzGZjK94Pm/Vq/JNCPVclJqg2WaRJlUXPkd4
 UcfiRtBRgQyF1eZVijeOEY8fxbEopP0yOfq20jbbmMv6QqKJgQUYOW3ogoNgOsUWeZOW
 32oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sRinJ0ihXcwDC5Z9GaQgAAjQtmzDNg9ort/XgHGR5sA=;
 b=lwjeLHN1R2WwXw6+aoIFUCTleGeGGMJg4xD6A9He8Ydy6bd5Mxmp9+h7e7xyyRi23Q
 J+SmVJzhICaohVHj+TfNhUTbnMRh/dCTgBEzOBUvB0XrsSsS8M6FyZ2x/5iY9cHuMtHO
 Q3rVkye6QA70+COHFpc/YYd1gSIYt800I32baKp8v7e5p2wabE3/g64YVo7xaAzxoaDn
 4eWZ4Eg5QR4xDCJAhVi90C2pm300vzFc8HOY72DOqFps7pTua7L2m98mSNIvgpN574Vi
 KSXA39bU54BmrLUC06a/b9jhIQ7Cqg5aF63cgiWsMsvqCsbv21lmQKEzkGl9P7HjjWga
 26jQ==
X-Gm-Message-State: AOAM530FuavEA6jsLLAxsTRLPCkwVjmwP+P+zJMM0tx0+8JBpZQIKb9v
 ZUT1HJbcs0yuyB+M1klbXPlbREizeEL8cg==
X-Google-Smtp-Source: ABdhPJy3RtMBZIjHMcjzQwVAWWTrpu10NHohZ3o8iQuPPOdIENb32UCvWRAigJ270Qhx9ILOBiimvA==
X-Received: by 2002:adf:ef4b:: with SMTP id c11mr3008049wrp.35.1627287839687; 
 Mon, 26 Jul 2021 01:23:59 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id o28sm43780645wra.71.2021.07.26.01.23.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 01:23:59 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 10:23:46 +0200
Message-Id: <20210726082346.1706206-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/exim: add SELinux module
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>,
 Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Support for exim is added by the services/exim module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/exim/exim.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index dd39208469..bfb14dcb23 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -10,6 +10,7 @@ EXIM_SITE = https://ftp.exim.org/pub/exim/exim4
 EXIM_LICENSE = GPL-2.0+
 EXIM_LICENSE_FILES = LICENCE
 EXIM_CPE_ID_VENDOR = exim
+EXIM_SELINUX_MODULES = exim
 EXIM_DEPENDENCIES = host-berkeleydb host-pcre pcre berkeleydb host-pkgconf
 
 # Modify a variable value. It must already exist in the file, either
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
