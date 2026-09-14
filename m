Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4CF7C88E72
	for <buildroot@archiver.kernel.org>; Mon, 14 Sep 2026 21:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 987E48096D;
	Mon, 14 Sep 2026 21:39:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AhIWS25TrZVi; Mon, 14 Sep 2026 21:39:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 47D8080984
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789421976;
	b=orVs9ghiKtTYF0pLGOgOzCOMWjySjFCHYGh2RV/DGKG2wLddQKmsHiqKF7Fh4LgFrcPD
	 7Yca3x3Rvw+jsCUlIreAgy8D202usm2gZn6gU7L0TorTAWzQHjeL0FNanv+m7M/ZMjj7N
	 NXl3Hd9ePUpgDHU8OFr8HAJ/875l2Vdg+niXmN6ADP6kBM8IYHSrQw7ibyS67cvj5k6eq
	 DX4TMfQp5rjI7l5motlrWlqeJBqH6rX4QmAz6r6gsLZ7p0gzrEw668lxDNoKN8dmnNpqf
	 sLNuqCZ+3rr6xhsTncnJD6hmoQwEi1s/VIpYcyLv7sAUbR4o0OHG3z4fq/WFG/RFNdw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789421976;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=+TYI4s8gMAEonNcgwijsipCKD2wZaikm8Qn61SsG9Ls=;
	b=Jn+kmHkLmO6B4rXosRUHqPJCLqDRMmqr8gLBZijpUW1ui9aKogUd9hTt2AA6BGtWv4s5
	 ss0oZYSSlvftcKDYBeSKGVsjV3d0jyN/czyKheMuNTJ2pBfW52ga0OzMU3fRKUlcWDTBa
	 pPP3RZDoQiOcSNA1/HDbKVuep6053u4cFZLzuL2u/ZHrKpmouz39la1J8lllnYJYQUM1m
	 qNZdZ7pqYNQX8KmAcywqqHesW6Bm/ex9EKMvd+gBxEZonLMw9nZAlX8elbmh/qk2OTwIi
	 SfXBtSWYRZokxZrTgYa81EZFxshOEhTCRn8Vp2vwh/WFFqnLlz1C2T4k3O35wPxcAmw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789421976;
	bh=+TYI4s8gMAEonNcgwijsipCKD2wZaikm8Qn61SsG9Ls=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=E0YiF7a+oZEYXu+lAsLgFzrlQLTDf3sKQT8NN2eXxxSalrxduYWBFV+6o5qISyFC6
	 92ImrG27aZXOcF2sJPJouhHoRyvW2mtisFX+FgpiRDLMERKUAJrKeqP8XHx7EUhpjc
	 28yFhLhSMeBgZ+1zCByTLHlrVjtyGBvvU2IHtw0oQ3Ix2sY1zZSB1Ai/MxVWwcU40X
	 e0aE/Gkh/w3feWPOA7SlDEbpx+v1/bEnWdB6MpEwofdKa/BCF174xkJlWguu4/FD9V
	 ykabBcRpxXL6iCbvLwUJszp7aJ3LaxceNGD8X0dJN/xVXkLuAyjXQvr8slzaRwssJW
	 GWMpfiqWi8MGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47D8080984;
	Mon, 14 Sep 2026 21:39:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 83092465
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 21:39:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A14D40076
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 21:39:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ajgwWQBpnUa4 for <buildroot@buildroot.org>;
 Mon, 14 Sep 2026 21:39:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org E546A400E5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789421973;
 b=Q4Mve5FW1GSudlWv1UkxCs9hOfhN6wb50+AJw5VAkVxS4aOj0ibLuEvHK9y2iBezin6L
 U0TxctYjIo+YO6gWC8e3XkWYkqaZgH8fCGSQ6ENQdYTZSowXrheN32E5pwhM5mP6V3qLQ
 bH8cSLbv3Ud2E87sc8uXxYX8tc/b6SnEpGyLldAsSmWrlWm/P5pqjc1dxgcXziUY5XnX+
 v1V9ix+eNrqi6WkjgKtzOTyCgpsmR0l1VnVgBVhIKSDXD0iHkhoq2St2vEDQIPSMZaLNU
 mhne08n1htkBcNopUHskS2W3a216sfO8zlsIU3COjIj0x/8l+UvPugIFdcITFger0lA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789421973;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=4RiqXULfbxX89nunXvGJYWQuneImUJUPj/KDAufmiCk=;
 b=k3jOmkJJnJfJleAUn+LOiZOC98B+/ByPSTWaHA/J/DjccWO+NifUq2mbPpS9mLegeiV3
 qnW/a0stC2tPNTPd+UpDho2XImAmPSR+u5MxYL6OqbCXFrfLz5rLyovXZv16dUTMjYhPF
 R+BDAR0C/zWKFf2yhE4RwUyOEXoaz3IYgHcxev6v18SV61Q7WrlFFNbMhdEnhVaTyhiMu
 iXRo9JPMY7hiAx9bLVvOfUH/g7MPuunNZeDcS85TxMCCGcoIzI5GEu0ERrprsfQq40Gqs
 AHZ5k44T8qeEvBcjChkivGWlBp4YwludxnBrER3XDLeAWHtIioVgLpZuMMX2+QltjMQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=jbFaEjvG; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E546A400E5
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 21:39:31 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 8894A4E405E8
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 21:39:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5896D60323;
 Mon, 14 Sep 2026 21:39:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7546211C7AFC3; 
 Mon, 14 Sep 2026 23:39:24 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Adrian Perez de Castro <aperez@igalia.com>
Date: Mon, 14 Sep 2026 23:39:21 +0200
Message-ID: <20260914213922.1847792-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/sysprof: propagate ucontext-related
 dependency from libdex
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

BR2_PACKAGE_SYSPROF selects BR2_PACKAGE_LIBDEX but did not propagate:

	depends on BR2_TOOLCHAIN_HAS_UCONTEXT || \
		BR2_PACKAGE_LIBUCONTEXT_ARCH_SUPPORTS

from libdex. This commit fixes this missing dependency. In terms of
Config.in comment, we do the same as what libdex is doing: handle it
as a toolchain dependency (rather than an architecture dependency).

This was missed in commit a73ef093f7b40297d69c6813c44fd4626883632e,
which added the ucontext related dependency to libdex, without
propagating it to sysprof.

Fixes: a73ef093f7b40297d69c6813c44fd4626883632e ("package/libdex: needs ucontext")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sysprof/Config.in | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/sysprof/Config.in b/package/sysprof/Config.in
index e89a0e539e..258f549152 100644
--- a/package/sysprof/Config.in
+++ b/package/sysprof/Config.in
@@ -9,6 +9,8 @@ config BR2_PACKAGE_SYSPROF
 	depends on !BR2_OPTIMIZE_FAST # polkit
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_12
+	depends on BR2_TOOLCHAIN_HAS_UCONTEXT || \
+		BR2_PACKAGE_LIBUCONTEXT_ARCH_SUPPORTS # libdex
 	select BR2_PACKAGE_ELFUTILS
 	select BR2_PACKAGE_JSON_GLIB
 	select BR2_PACKAGE_LIBDEX
@@ -21,13 +23,15 @@ config BR2_PACKAGE_SYSPROF
 
 	  http://sysprof.com
 
-comment "sysprof needs a toolchain w/ dynamic library, wchar, threads, C++, gcc >= 7, headers >= 5.12"
+comment "sysprof needs a toolchain w/ dynamic library, wchar, threads, C++, gcc >= 7, headers >= 5.12, ucontext"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
 		BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_12
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_12 || \
+		!(BR2_TOOLCHAIN_HAS_UCONTEXT || \
+			BR2_PACKAGE_LIBUCONTEXT_ARCH_SUPPORTS)
 
 comment "sysprof can't be built with Optimize for fast"
 	depends on BR2_OPTIMIZE_FAST
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
