Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF6EACCD195
	for <buildroot@archiver.kernel.org>; Fri, 17 Oct 2025 21:49:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BFFE8230B;
	Fri, 17 Oct 2025 21:49:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9c8qNBsEy9-J; Fri, 17 Oct 2025 21:49:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 098C8822F8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 098C8822F8;
	Fri, 17 Oct 2025 21:49:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D6F4D8
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 21:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3448C406D7
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 21:49:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id td4pMRfaKo_N for <buildroot@buildroot.org>;
 Fri, 17 Oct 2025 21:49:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D38FE400AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D38FE400AB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D38FE400AB
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 21:49:52 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0643.dip0.t-ipconnect.de [91.58.6.67])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3FF5AA4C0F8D;
 Fri, 17 Oct 2025 23:49:50 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59078)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v9sKb-000000002NE-3Xeb;
 Fri, 17 Oct 2025 21:49:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: David GOUARIN <dgouarin@gmail.com>
Date: Fri, 17 Oct 2025 23:49:49 +0200
Message-ID: <20251017214949.3857613-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760737790;
 bh=7TlmizNXNj/aKdN4/b5BQYu8gcVQS4ah9moEpArPG6k=;
 h=From:To:Cc:Subject:Date:From;
 b=a2nr2g4W+zlt2bd+nx2VJfhyPBMSwWEs89HA4KAUo0p9QEzVIyMq1Xp4tAWGhcyk7
 NU+pRlI7tMexBR3i3NOn7RDpJ4w8ww60+D2RBJSh1oZF7I0usMLdqe4reOlckJ2BTZ
 rOqGLPCfb3+Y13Ihy0ecwsdb4IgZs8BKKV5MKhkkJMlxHOKWLr5b/33EYqK3UOYl2A
 XGeSSly6AGfib8LnDeMSrvneSvqiFjd6Yhmp1SgwNBsZuelNa1O1b2s6iaRkovhiKV
 EvTWdSrrqENiMr6qkfkL93rTx2IX3aJSyKlKajO6l6UfhDgglHq9YqRjGq5fsOKkDy
 VftMzZ3Rpw5mw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=a2nr2g4W
Subject: [Buildroot] [PATCH 1/1] package/freeradius-server: requires RC4
 support in openssl
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

Fixes:
https://autobuild.buildroot.net/results/5a5/5a57a82800fb7a47731198effc15bd7044133c4d/

    src/modules/rlm_mschap/rlm_mschap.c:1016:54: error: implicit
    declaration of function 'EVP_rc4'; did you mean 'EVP_md4'?

The oldest build error found with a quick search appeared back in July
2024 with freeradius-server 3.2.3 so a backport should be considered:
https://autobuild.buildroot.net/results/e2d/e2d77a52f81b0fea1081417c5c80f7991e27810a/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/freeradius-server/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/freeradius-server/Config.in b/package/freeradius-server/Config.in
index e99778ea49..40401f57c7 100644
--- a/package/freeradius-server/Config.in
+++ b/package/freeradius-server/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_FREERADIUS_SERVER
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4 if BR2_PACKAGE_LIBOPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4 if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_LIBTALLOC
 	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
