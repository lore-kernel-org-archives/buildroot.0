Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC91FC617E
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 13:26:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8181A80BEE;
	Sat,  3 Jan 2026 13:26:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4STgkwX3BDfM; Sat,  3 Jan 2026 13:26:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA7D880B90
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767446772;
	bh=49bx/5TRxbmSsi+7fjJ3LJV5h4B8ZcdWVBrNvtBjxlY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LEus31fGHaXTTULVsef4T/H62Iuki17/O3XnDAbnboB8g+jGsAzq/P+FB/lh5tmZr
	 xkkEONQ7gVGkOG4YVVakPsrfgpf+cdKQcjRfhgdufovPIcMf+gCM5GHdxVPMH899dS
	 7RNSwyYA8bHMCwF6iR3ixYMPc9HnJ5ftbWn543SkrgYoPgXAua8DaoZl/rV+24ZUWE
	 bOVbXgubeKlDiyP1ZFuul+yiV8Vmbm/upjKwdSJ1cD6NruV4ttCgiyWu53NF1HUl2Q
	 xr2T4aQ21l1hpxJ5koYj9otpgpmaGoEHTtRq5QI9KqBwNKighqFFzLME7qTB6s3dca
	 i3v73aou32BDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA7D880B90;
	Sat,  3 Jan 2026 13:26:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 559FB351
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 13:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2ED1F4049D
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 13:26:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uHKLYwzmBLH5 for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 13:26:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CC7D1404A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC7D1404A8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CC7D1404A8
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 13:26:08 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 11E06A4C321E;
 Sat,  3 Jan 2026 14:25:54 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51748)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vc1dh-000000000rJ-2pbw;
 Sat, 03 Jan 2026 13:25:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jarkko Sakkinen <jarkko@kernel.org>, Petr Vorel <petr.vorel@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  3 Jan 2026 14:25:48 +0100
Message-ID: <20260103132552.3979708-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260103132552.3979708-1-bernd@kuhls.net>
References: <20260103132552.3979708-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767446754;
 bh=ceWo/LmixV3kJCVtG5gw0bEEnKFDmhKkcxQSIwiBTDQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=EHIPh9Bgp+SeSdBDtGHJuXEoCF1aU1MS1BB0QUAy97QogasdQI6Fse/Oz+PHHlm+C
 2siGAOXoGNLbP5c5WWAJREuMy/lIxWSd+2jKkEhEPo2TTpayGArrRl+/KEtVzmHE2F
 wJ1NfVi9xxGomoOp7TvmPjMmlyHa667H13GCwjn5BbL1BCLU2LykcTv3lgsIjYbLuz
 Vzg6Pnicmigr1F+UjDlz+g8xLYbj3xDqGR7LGlhOPCQlDT4pXpLyfpBGQGrZrY0nst
 0AGywTBWO2iypguzaJIQJYLJ/hIYuruCOc0n4wtHiud1jPG7WiOIrw1/pLJbGGMfn8
 zHW/xVr7c7ppQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=EHIPh9Bg
Subject: [Buildroot] [PATCH v4 1/5] package/libtirpc: introduce
 BR2_PACKAGE_LIBTIRPC_RPCDB
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

From: Giulio Benetti <giulio.benetti@benettiengineering.com>

Package libtirpc with commit[1] exposes --enable-rpcdb so make it
selectable to allow packages that use rpcdb functions to enable it
and build correctly.

[1]:
https://git.linux-nfs.org/?p=steved/libtirpc.git;a=commit;h=7cea8ad66aecc21e6caae330b5d31075af399193

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
[Bernd: move gss comment into if-block]
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libtirpc/Config.in   | 17 ++++++++++++-----
 package/libtirpc/libtirpc.mk |  7 +++++++
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/package/libtirpc/Config.in b/package/libtirpc/Config.in
index 31f1636ef5..371f7c46c1 100644
--- a/package/libtirpc/Config.in
+++ b/package/libtirpc/Config.in
@@ -7,19 +7,26 @@ config BR2_PACKAGE_LIBTIRPC
 
 	  http://sourceforge.net/projects/libtirpc/
 
+if BR2_PACKAGE_LIBTIRPC
+
 config BR2_PACKAGE_LIBTIRPC_GSS
 	bool "gss"
 	depends on BR2_USE_MMU # libkrb5
 	depends on !BR2_STATIC_LIBS # libkrb5
-	depends on BR2_PACKAGE_LIBTIRPC
 	select BR2_PACKAGE_LIBKRB5
 	help
 	  Enable GSSAPI support
 
-comment "libtirpc needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
-
 comment "libtirpc gss support needs a toolchain w/ dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS
-	depends on BR2_PACKAGE_LIBTIRPC
+
+config BR2_PACKAGE_LIBTIRPC_RPCDB
+	bool "rpcdb"
+	help
+	  Enable RPCDB support
+
+endif
+
+comment "libtirpc needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libtirpc/libtirpc.mk b/package/libtirpc/libtirpc.mk
index ab15954561..eadacedfcf 100644
--- a/package/libtirpc/libtirpc.mk
+++ b/package/libtirpc/libtirpc.mk
@@ -25,5 +25,12 @@ LIBTIRPC_CONF_OPTS += --disable-gssapi
 endif
 HOST_LIBTIRPC_CONF_OPTS = --disable-gssapi
 
+ifeq ($(BR2_PACKAGE_LIBTIRPC_RPCDB),y)
+LIBTIRPC_CONF_OPTS += --enable-rpcdb
+else
+LIBTIRPC_CONF_OPTS += --disable-rpcdb
+endif
+HOST_LIBTIRPC_CONF_OPTS += --disable-rpcdb
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
