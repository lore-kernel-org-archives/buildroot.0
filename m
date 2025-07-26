Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F56C83F17
	for <buildroot@archiver.kernel.org>; Sat, 26 Jul 2025 05:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6DFD83CFB;
	Sat, 26 Jul 2025 05:59:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4z2GvKiiNF7X; Sat, 26 Jul 2025 05:59:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FCF983D58
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FCF983D58;
	Sat, 26 Jul 2025 05:59:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CC73FDA
 for <buildroot@buildroot.org>; Sat, 26 Jul 2025 05:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B314F60DEC
 for <buildroot@buildroot.org>; Sat, 26 Jul 2025 05:59:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nILutknYyIa9 for <buildroot@buildroot.org>;
 Sat, 26 Jul 2025 05:59:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7657160AA0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7657160AA0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7657160AA0
 for <buildroot@buildroot.org>; Sat, 26 Jul 2025 05:59:12 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0a17.dip0.t-ipconnect.de [91.58.10.23])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DCB66A4C1132;
 Sat, 26 Jul 2025 07:59:08 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57580)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1ufXw4-000000000No-1J3b;
 Sat, 26 Jul 2025 05:59:08 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 26 Jul 2025 07:59:07 +0200
Message-Id: <20250726055908.3395125-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250726055908.3395125-1-bernd@kuhls.net>
References: <20250726055908.3395125-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1753509548;
 bh=+IVlZmipqYWLKbINFXEKO5zNJDVojugHRLrCy35vay8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=QzAZxCLWRBgxU5lPU9ilHkVxLQUGQeGersOpWxmAuBKJC1+aY2gw1mhFvxu00gH9r
 sAPnOitYuyVeUc8lE22Y+9/i+Pl8ZeLIk9t79F+IDa3SHME+Firq1HxSIBfKtnskDI
 F5JSOnl1gNDt35W/7q74rtkka1PkMLcfqk6WzCk+p4ja017pNwnkrboo5TkS3Tbc+W
 Qt+xp//mI1KbL+9ofb8C+az8TQDnajeliNacivGGkDAP9ViIZlJLA6EnjG0oxWuioO
 uUYEM1/4xOP87YaBKn/rnE4H489n4pmJmAutfPFl3evpQFFtUC2aF5RcWh6bzBk1rr
 thFmNnp6qsWgA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=QzAZxCLW
Subject: [Buildroot] [PATCH 2/3] package/libcurl: remove configure option
 --with-random
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

Upstream removed this configure option in version 8.10.0:
https://github.com/curl/curl/commit/269fdd4c6ed5d837d57448ac977f6f300968df15
which was added to buildroot with commit
d68b999787a0e0838c3bb2d5966f11d8a349a49b.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libcurl/libcurl.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 114ff3d70b..51716cd45b 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -20,7 +20,6 @@ LIBCURL_INSTALL_STAGING = YES
 LIBCURL_CONF_OPTS = \
 	--disable-manual \
 	--disable-ntlm \
-	--with-random=/dev/urandom \
 	--disable-curldebug \
 	--disable-libcurl-option \
 	--disable-ldap \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
