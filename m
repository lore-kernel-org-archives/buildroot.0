Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED48D277D9
	for <buildroot@archiver.kernel.org>; Sat, 10 Jan 2026 11:01:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B299B404EC;
	Sat, 10 Jan 2026 11:01:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lhJG2WqJqE2s; Sat, 10 Jan 2026 11:00:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA2A740337
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768042858;
	bh=c1KUChRS+uW1JxzEWLpXttEIIXyK5H6UxJzzgibfm5w=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VOSXxaF0TOgKSXjGd0iS9bOmTlUm/W3witcZolgN6byFq3M+pUnnlexYmyOfLuQEq
	 8goeDopmdSbar1+KpRthwppgOG2MMBgG3j64+jRLpklAHJkcuO4FUUHraw32+rXh5E
	 JodZHtltsKtQiuPnQatfRZv6lQeFPFc55qa9li7qRh7yhnuUsDtRggz5IMQJBorPmi
	 lyuEKq43iRFVnSWXvoaiN2Vuwfj8XvC2stv2eok9xXLubTZwEzc/MpaPcrVP7BFBgg
	 QvAb3znpicbKq7bRzyDOb6hbwbAkrka0LrGYC4AzPHHZvG0ETLEebVR83tDmudSEIW
	 nqIB6Z6m8rLqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA2A740337;
	Sat, 10 Jan 2026 11:00:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 93AA1131
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 11:00:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 91E174032A
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 11:00:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1V3-EEUdr79r for <buildroot@buildroot.org>;
 Sat, 10 Jan 2026 11:00:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E15784030B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E15784030B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E15784030B
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 11:00:55 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b915.dip0.t-ipconnect.de [84.161.185.21])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2019DA4C310F
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 12:00:52 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52646)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1veWiB-000000004JD-0gt8
 for buildroot@buildroot.org; Sat, 10 Jan 2026 11:00:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 10 Jan 2026 12:00:51 +0100
Message-ID: <20260110110051.4158329-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768042852;
 bh=01f2BqI1RFziiGptjfnHslsJ5Bl8zz3KajwwTKnnmEI=;
 h=From:To:Subject:Date:From;
 b=plpkC5FmI9huuU+9E4CDF/zyEKHKChibqgR487+RUbLKRHmAPJHnxGvYa0s/ne+6L
 LbBrp16XpWKR4KA/kGFaPGcl/QTD8xKlcFBe2DVmAfpk7qJb2JdXb2KZhIaAiCKNKT
 +1yVOea0dTZ3BjTorLKMJLJnDZg1AV/iBtnyT97MlRkZ1nsmbfV2yiSHO3m+7KlFmu
 PaKLxG3NbXQRRBxdYGPF4g9szI6ZIAqS7RdJdirPfFtlHhEIFsW3QdM/dnvLNLNV6/
 oM/IUzVYSXdAwn3mTog38k6nOQdzo9Covv0QQcW8aE8+nhpD18oLZo/rfXEN/GrdtL
 3oTvI6uYjAMpg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=plpkC5Fm
Subject: [Buildroot] [PATCH 1/1] package/ustream-ssl: needs OpenSSL ssl-trace
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

Buildroot commit e1050a3a50886c72d3ff2416dd8db2fe3c389973 bumped the
package which includes upstream commit
https://git.openwrt.org/?p=project/ustream-ssl.git;a=commit;h=956fba242ac0a4bcfe3db103d4d1f41545c924fb
that adds the usage of SSL_trace causing a build error when OpenSSL was
built without ssl-trace support:

/home/autobuild/autobuild/instance-10/output-1/build/ustream-ssl-5a81c108d20e24724ed847cc4be033f2a74e6635/ustream-openssl.c:
 In function '__ustream_ssl_set_debug':
/home/autobuild/autobuild/instance-10/output-1/build/ustream-ssl-5a81c108d20e24724ed847cc4be033f2a74e6635/ustream-openssl.c:490:44:
 error: 'SSL_trace' undeclared (first use in this function); did you mean 'SSL_write'?
  490 |         SSL_CTX_set_msg_callback(ctx->ssl, SSL_trace);

Fixes:
https://autobuild.buildroot.net/results/17c/17c88282c32f2edfa0991e0e10cb45013c947be9/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ustream-ssl/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ustream-ssl/Config.in b/package/ustream-ssl/Config.in
index c328a6ea12..6fc54f3bef 100644
--- a/package/ustream-ssl/Config.in
+++ b/package/ustream-ssl/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_USTREAM_SSL
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libubox -> json-c
 	select BR2_PACKAGE_LIBUBOX
 	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_MBEDTLS
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL_TRACE if BR2_PACKAGE_LIBOPENSSL
 	help
 	  ustream SSL wrapper
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
