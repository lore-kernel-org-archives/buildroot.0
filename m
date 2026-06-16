Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B74CD98DA
	for <buildroot@archiver.kernel.org>; Tue, 16 Jun 2026 07:21:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69D56851AB;
	Tue, 16 Jun 2026 07:21:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QMvMK7RwgATk; Tue, 16 Jun 2026 07:21:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E968A851A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781594471;
	bh=pOTH5NnIah1M7o/qtQxV8X/WEFW3PiN/TeLkf44cU+Q=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=R9zyU3jGMwsSZ4m/77niTAvfi5j8hp/4HhyO6YYSAV0vP7bdjchHf1jMQ/XzzwmEw
	 UWXHnWeo2dmEcdlPWgqkv3HXEHHXlwj+aI0QukNhhhl8jVNebffP1Pzc1lTNUXJi/a
	 wSX/PuS+ceH2ps/srbCF9jIFfwBVJnVpI+G3lm3envxF91ZjAF6tkzAK0oszZ5Q++N
	 T6uFxThFmQDv6xnZO/dWYcOhHBkaqAjzXry9h78tZjgkdO0WWZw2iCfoIe5GrLTu7+
	 HXG0ATb4GDypA/lhd8qiXSq80l5eo+i+UU/L0+OaQLVMaihXsUExwvnCw2TRpRPut9
	 GqPe2YbiN3o3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E968A851A6;
	Tue, 16 Jun 2026 07:21:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B85532B8
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 07:21:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9FFA4013E
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 07:21:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SdNxtiy7Nk8A for <buildroot@buildroot.org>;
 Tue, 16 Jun 2026 07:21:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C1A8440136
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1A8440136
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C1A8440136
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 07:21:08 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b12b.dip0.t-ipconnect.de [84.161.177.43])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 83359A4C00F5;
 Tue, 16 Jun 2026 09:21:06 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47452)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wZO6c-000000005we-2ZwN;
 Tue, 16 Jun 2026 07:21:06 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 16 Jun 2026 09:21:05 +0200
Message-ID: <20260616072106.1202605-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1781594466;
 bh=mHwqZgr9WYp516lRoGyW4pLRiK11pDm3i9+m8iJt+NM=;
 h=From:To:Cc:Subject:Date:From;
 b=EUCMLBvHbLEYjX4fQObFMQZwj84e0rv2AbiC0fVsHy/Nbe0traGzIQzhd1oWATAp1
 RTNHgwyOK0/gDBiHAmYcAH7+7HgW4f9wIe20PNS8qYSMJmCf6pBEvAl3fAyQ0UtrBa
 5nKO40NoWMUt2tI5pmfGewPUAKhPVsiwjrDkrEOtL97B5oqNPSWPJHwNw4EWXul9dn
 sTs2O3Ml4THsYuFh6Dk8hXSIqgm0R7zpNUTg6SL9qru3UuuPLmbTguMqetC4OpcKX5
 BcAzli01SsXpmDVubW6t51XMG41LGlRbbiI8YAoeCR9rvLOP7SeiD/GqY3MHVlr/yh
 2ncJBQlCZjhEQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=EUCMLBvH
Subject: [Buildroot] [PATCH 1/2] package/strace: needs headers >= 5.1
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

Buildroot commit aa5e3eec6384cb73d902a4de3fffc279683ea5a5 bumped the
package to version 7.0 which includes commit
https://github.com/strace/strace/commit/33b950714a966bde816a1f1e75c127c3d3ae53cd
that adds an include of linux/time_types.h.

This header file was added in linux kernel version 5.1:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=ca5e9aba753ed15d173c7a7b88e4d402b7ca8121

Fixes build errors:

In file included from ../bundled/linux/include/uapi/linux/cgroupstats.h:20:0,
                 from netlink_nlctrl.c:11:
../bundled/linux/include/uapi/linux/taskstats.h:21:30: fatal error:
 linux/time_types.h: No such file or directory

detected by the Gitlab pipelines with the following defconfigs:
- br-arm-full-static
- bootlin-aarch64-glibc-old

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/41eb71afe06e68c5ff27edd9fe3acb1772a871d3

 package/strace/Config.in | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/package/strace/Config.in b/package/strace/Config.in
index ff7d271c0c..e3e7018c65 100644
--- a/package/strace/Config.in
+++ b/package/strace/Config.in
@@ -1,11 +1,6 @@
 config BR2_PACKAGE_STRACE
 	bool "strace"
-	# needs at least kernel headers 5.0 on xtensa
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0 || !BR2_xtensa
-	# needs at least kernel headers 5.0 on musl aarch64
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0 || \
-		!(BR2_aarch64 || BR2_aarch64_be) || \
-		!BR2_TOOLCHAIN_USES_MUSL
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1 # time_types.h
 	depends on !BR2_RISCV_32
 	help
 	  A useful diagnostic, instructional, and debugging tool.
@@ -17,11 +12,5 @@ config BR2_PACKAGE_STRACE
 
 	  https://strace.io
 
-comment "strace needs a toolchain w/ headers >= 5.0 on xtensa"
-	depends on BR2_xtensa
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
-
-comment "strace needs a musl toolchain w/ headers >= 5.0 on aarch64"
-	depends on BR2_aarch64 || BR2_aarch64_be
-	depends on BR2_TOOLCHAIN_USES_MUSL
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
+comment "strace needs a toolchain w/ headers >= 5.1"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
