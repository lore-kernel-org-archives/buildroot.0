Return-Path: <SRS0=R6N7=NW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6D0FC432BE
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 16:53:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A05161053
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 16:53:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5A05161053
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26DEA81A58;
	Tue, 31 Aug 2021 16:53:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v4kNGcn7Qvzx; Tue, 31 Aug 2021 16:53:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 256878257D;
	Tue, 31 Aug 2021 16:53:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D4C1B1BF4D7
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 16:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D01408257D
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 16:53:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gKCvya-G__B4 for <buildroot@lists.busybox.net>;
 Tue, 31 Aug 2021 16:53:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CA39481A58
 for <buildroot@buildroot.org>; Tue, 31 Aug 2021 16:53:17 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 d22-20020a1c1d16000000b002e7777970f0so2684203wmd.3
 for <buildroot@buildroot.org>; Tue, 31 Aug 2021 09:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8nFucyZcvDNQWyaIJWZHOq879P4xa7w4wJfLBWkUcOw=;
 b=a2gDTZVrtj2z+Lz4AU2OcxWS44k49nbjXPO6RXErWHeAqd2vnZZc6tG4heqpZDsBU9
 qR0m/LuS8Zt3isi240DYN2pxkWwaoSXNY4QUx2JXACLOjTOJLCcYto7OyC4xfhxqNX5e
 XflG4I44sNBuDaGZGIA6VuqPCsXk3XlyyxOiN6AvMvDppQ9X1ZxHFOk3p7TQ2PrheOms
 VDpXBDiXEXoJzireR0ODuIpVOxo8yHx9pLiqwqCEpIrER8E+Gy8oRIB66vLXXEI9XUf4
 NedHNLouJH1UP1HGCM4RM6/X0SRtEeSSI0a+mPTVTkPHC+idQUKeJ+q/O4Q5KGQrg1W3
 jX9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8nFucyZcvDNQWyaIJWZHOq879P4xa7w4wJfLBWkUcOw=;
 b=q1EZr+cHlXWLZlYdbmx+Mw7t88Ek38A48qQ2r4nyBswVzWZOU2QnCAq2fz9AQGwJMf
 Kq64m9kSIf9pDlMMEh9zTuTeA8HkJV9KM9GXfYVimCCjW64c9Zyy/Csj8rcH2X3oYWSs
 dWYrtv20FxKvdy+sOhcLwzfZWH10PwfuyKgvFvzj6ks8BinZtmIAE1O49iRXiymOWWl7
 73fhg+wiY1KSGtZAyh4shxdVcJzImgXlEDffVadcyuETcNQ4p6ITTxjlMMWWq5L62kKi
 5NZ4RHvWCDRxf6alUCyYPefm+8E3jfSvFXHnczZ3nWiMsx94HIzg9fpRdzQXUD4DhQlM
 p8dw==
X-Gm-Message-State: AOAM530ikw1hHItmIrjn5wHfiMmb3zicdaWncSv/SM8E//dtwTpgzcY+
 gOFU695jKbf9Vj9cFO6UwgpE9ssDSIwFXw==
X-Google-Smtp-Source: ABdhPJz1zxwck4VfKquefoT0SKKdcv8+sL4HD6tsImIy7k/d8hp+3b1tuz0lPnEGTR3FK0N6/ZfVOQ==
X-Received: by 2002:a05:600c:1c16:: with SMTP id
 j22mr5134483wms.167.1630428795897; 
 Tue, 31 Aug 2021 09:53:15 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id o2sm13855581wrh.13.2021.08.31.09.53.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 09:53:15 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 31 Aug 2021 18:53:04 +0200
Message-Id: <20210831165304.873525-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/openmpi: fix fortran build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fix the following build failure with fortran raised since bump to
version 4.0.0 in commit 366e7f1ecb4343ef8b18aef2a11c49055cc89abe and
https://github.com/open-mpi/ompi/commit/99730f798b7aef4c87d282aa24b98916fea45bb6:

checking size of Fortran type(test_mpi_handle)... (cached) 4
checking alignment of Fortran type(test_mpi_handle)... configure: error: Can not determine alignment of type(test_mpi_handle) when cross-compiling

Fixes:
 - http://autobuild.buildroot.org/results/86ffde2f67ffc0bfaeebe72fe742a5c241bc580b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/openmpi/openmpi-mips32-fortran.cache | 1 +
 package/openmpi/openmpi-mips64-fortran.cache | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/openmpi/openmpi-mips32-fortran.cache b/package/openmpi/openmpi-mips32-fortran.cache
index 473f73a22e..36f9f02bb8 100644
--- a/package/openmpi/openmpi-mips32-fortran.cache
+++ b/package/openmpi/openmpi-mips32-fortran.cache
@@ -49,3 +49,4 @@ ompi_cv_fortran_kind_value_C_DOUBLE=8
 ompi_cv_fortran_kind_value_C_DOUBLE_COMPLEX=8
 ompi_cv_fortran_true_value=1
 ompi_cv_fortran_sizeof_type_test_mpi_handle_=4
+ompi_cv_fortran_alignment_type_test_mpi_handle_=4
diff --git a/package/openmpi/openmpi-mips64-fortran.cache b/package/openmpi/openmpi-mips64-fortran.cache
index 7f0209971a..dea2ce9cda 100644
--- a/package/openmpi/openmpi-mips64-fortran.cache
+++ b/package/openmpi/openmpi-mips64-fortran.cache
@@ -58,3 +58,4 @@ ompi_cv_fortran_kind_value_0=0
 ompi_cv_real16_c_equiv=yes
 ompi_cv_fortran_true_value=1
 ompi_cv_fortran_sizeof_type_test_mpi_handle_=4
+ompi_cv_fortran_alignment_type_test_mpi_handle_=4
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
