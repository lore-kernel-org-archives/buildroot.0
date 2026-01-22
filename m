Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03081D6CFA1
	for <buildroot@archiver.kernel.org>; Thu, 22 Jan 2026 18:53:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A734F821F2;
	Thu, 22 Jan 2026 18:53:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tyo6EgfLspbl; Thu, 22 Jan 2026 18:52:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84C0E821EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769107979;
	bh=0mLmjJEKksV+5yl85Y/AdB7ZqXUBNhXHlAa25U4yucA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mN0ZZOn7ff+WW/Sw/cfFBEsmAH80zmERHEhTvS28Ka9uRK27z+d0exMYgs9BY9ro5
	 XRzdQ6rBQwKKt+NABC6eqkMCu4nxYf9iFC7c1bx+zktzR14B2ZKkRKnCLQzqdUgRY5
	 +o7WMtivs/cZuTjnrzUhJvDVVHn30JIiHqF5vHIAvXK/MWaEMh/LK/oC2w1yWiP+fu
	 Fc5+XZapz9FpTWoCEJV2NoHe0TK+e+WHyyeuhLX8T0VB1/jqt7uRYybCSAJ9xB0p+v
	 kodQ6ZFgXpY5QJRESmT9O5WqLV/Tt5HOcL4AFeVyf4mRHT/l6roFw8h9UTiDCEwpef
	 nrHVCXSPVG9cg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84C0E821EE;
	Thu, 22 Jan 2026 18:52:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A5E84122
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 18:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 974656069A
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 18:52:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hG0gIpJ6X37U for <buildroot@buildroot.org>;
 Thu, 22 Jan 2026 18:52:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B86AD60699
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B86AD60699
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B86AD60699
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 18:52:57 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c7cb.dip0.t-ipconnect.de [79.214.199.203])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3C02EA4C4735;
 Thu, 22 Jan 2026 19:52:55 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59158)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vizna-000000005Mo-1jdp;
 Thu, 22 Jan 2026 18:52:54 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 22 Jan 2026 19:52:54 +0100
Message-ID: <20260122185254.1054937-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1769107975;
 bh=0PGWwilQLlaZdvge8HJKLvxG5oF+LdG9GbhLvmLLfQE=;
 h=From:To:Cc:Subject:Date:From;
 b=WQWb4i0gFt9fIjOzFt81tnIe28mkuZ8ShTYOutUzVY/XwJCrf+1GfbI5W81PASDSr
 JxIAnB0UtyF/5TPyaplvesRAvm5/Fqcwi4yn45sSPAyEAhYk5dhSzFkUo1sUtzEJLC
 ggdugkpyZLzn+MEpYO5IXa8tBnjUYtgBIkc18HFCuTbVN3lZuYAejwLw2WeVpeEknw
 PKKSqdrn+bf5dsaMB7se18k0g4icfHnkv4wqjgq59HQb1sbf963pVIYm2JvoM9/fwD
 HKd5pEezn0mtHuIfk9BMba+xDPu86YYHAhR81xobci0epiqDEr1raEVRuwJPXrxO+v
 ze4dbdJXVsjCA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=WQWb4i0g
Subject: [Buildroot] [PATCH 1/1] package/uftp: needs libopenssl, not libressl
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

Buildroot commit bumped libressl from version 3.8.4 to 3.9.2.

Libressl 3.9.0 contains a breaking change:
https://github.com/libressl/portable/releases/tag/v3.9.0
"EVP_add_{cipher,digest}() were removed."

Upstream was notified by Yegor but did not add any fixes:
https://sourceforge.net/p/uftp-multicast/discussion/general/thread/c02c950dff/
so we force the usage of libopenssl to fix a build error:

encrypt_openssl.c: In function 'crypto_init':
encrypt_openssl.c:77:5: error: implicit declaration of function
 'EVP_add_cipher'; did you mean 'EVP_Cipher'?
 [-Wimplicit-function-declaration]
   77 |     EVP_add_cipher(EVP_aes_128_ccm());

first caught by the autobuilders on 2024-08-09:
https://autobuild.buildroot.net/results/7da/7dadc662e0a6642e40831a93b788e959498d8923/

Fixes:
https://autobuild.buildroot.net/results/a74/a74526181dfc90aff7f56457c430c1aa1d006e54/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/uftp/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/uftp/Config.in b/package/uftp/Config.in
index b88fb03ae2..a9296e595c 100644
--- a/package/uftp/Config.in
+++ b/package/uftp/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_UFTP
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL if BR2_PACKAGE_OPENSSL
 	help
 	  Encrypted UDP based FTP with multicast.
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
