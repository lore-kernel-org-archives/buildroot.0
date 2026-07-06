Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60287C43458
	for <buildroot@archiver.kernel.org>; Mon,  6 Jul 2026 14:12:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CE1E60826;
	Mon,  6 Jul 2026 14:12:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qAqAmaGlz1zl; Mon,  6 Jul 2026 14:12:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27380608FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783347126;
	bh=3hYeK9kw09HpA2booyrYxcA9SnDN4brK5sBmBwu1Z9o=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=HPWuVOw03Y66bwuB9IljwnXTWkbWkdCOR8gJ0uATF2ib8IQ8uCiZ5WVqlci9pnYQ+
	 rtV4+2z1Eo5QSw8KEyqLjL6A1MAPe3mNVcAbaa7WofkEcFmNlJx54tG63YGKuFjOT0
	 TwqadE3DPJK6p0DX3CKdNV4EJRCh3aCZIGk1bFdANaBvLGxwn9JB+AwbkW9VqUoZnS
	 uNkanzjtmMhqeYPUzjZT3lPCqY0qjq79S+HOb7iJR7dasRpHJoQ8a7vcx6TKF8Epm0
	 V5w+pWqDXCiAAhue2vXEO8Mqi0+cb/+sMnmmeewLNWTgTu+Ju9MgvmbrdpEGEV6gD4
	 G0cYr8UrDneSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27380608FE;
	Mon,  6 Jul 2026 14:12:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 18066F2
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 14:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0368740AB1
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 14:12:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xSEa1OoiOO_7 for <buildroot@buildroot.org>;
 Mon,  6 Jul 2026 14:12:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DC9BB40AAF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC9BB40AAF
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DC9BB40AAF
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 14:12:03 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-493c2b3dc8bso21466205e9.2
 for <buildroot@buildroot.org>; Mon, 06 Jul 2026 07:12:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783347121; x=1783951921;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ia5ML8T81xQLOY05hzHaHqZvHqlWSeRNB9T2sic3zRs=;
 b=oaOVpunMxkgHohhOjBTNpg8ry9Rf8wEr90vzpC8EHgr4VcAf2zu5XUcLV6GV7iKEoT
 JfebqYJMMRdK7aLsqYOXDjKSuXU4liRjL/80bKeiI7UJGGLNoRd0yK0eAGB4DTYefhyR
 RUkbmIM3VcvD4atET0FULocjehLp72EMz1LgU9TBbik89QVTJJU9Mnt9DtIwVEr9B6XE
 1/m0SYuLBFPA5R64q6CTOUc9nSy9jqEVABQhIASp5c6UWrROlCOBB1EtNiC8bo+w1Um1
 Y2F+qmv+8ZLlisUIMvKwFE0VVx2JG6KnLR+ulgzt4z8zlSmAr2yoisQs4GGpQT5VOe/p
 utbg==
X-Gm-Message-State: AOJu0Yx6bzCP9QHakB6J27VD1vJXb0CUZF6GBFk5K7anErmAfJs6uIg/
 znzERpj0ttes5rHDZJDxSjf3ZY9Q5Rq7xzoYf+QNPbkdfwJhJkjp0tD3T/VQWq5vwoufgFjKmrQ
 SIGeH
X-Gm-Gg: AfdE7cnNujtCIirdhI82MrrdrH7N5QZG0Q9c/zubMaWoKksta2Dwr5vKhT/CpufPgy3
 UzG3ejVzE2AKzhdfw4bholiODfSjmkorLE8SFVZsxRzK+6cuvytHHFBs7wDbevIbsFh0Rx9+78K
 5TZHXKikMJW5f9u0Ezb709x8HBSYO/oB3wbJ/+dsTota6nlC6AHoUEOGWKRhFcuiSwUehREgZMo
 OoMwOcDrJPTSN2RcYJ2vaVNnolxAph6PfengQ2wv+1NfF36yUWr1OjmlFHBYyVU/z4NQ7xDHcNz
 /bhRNTjxO8+QeAKNcWzdtHko9Z5WkrZyy2CmQyh3ZpizJ2pthPLHL+akqaQRYs98rTV22EWmB7k
 w/Ots2BDKkyEzxROO/zC4NzDsOlqSjJDWzaaNRGjJXwlSGIufo602br+EfNKDNJA7kk/7c8zRAg
 7rjiQt/UcIPkYbH9PW3nSw1QZE8g==
X-Received: by 2002:a05:600c:1548:b0:493:b55f:bca2 with SMTP id
 5b1f17b1804b1-493df09fe01mr7792415e9.34.1783347121446; 
 Mon, 06 Jul 2026 07:12:01 -0700 (PDT)
Received: from dragon.home ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493cfb6f199sm263327825e9.3.2026.07.06.07.12.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 07:12:01 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
	thomas.perale@mind.be
Date: Mon,  6 Jul 2026 16:11:51 +0200
Message-ID: <20260706141151.421766-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783347121; x=1783951921; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ia5ML8T81xQLOY05hzHaHqZvHqlWSeRNB9T2sic3zRs=;
 b=axS/GXqyYh1ihSyFoyDHs4KYc6VY+f/kZpWl2p7gEaO5ymZ7PZ5FIc5iYH9T8O+hUo
 kwdl2ds4bk199uOR1Uqn5ILFloQ0qDaOwY/BOBEG+JE1OrdOoQresdbu/NmRUC8J2N02
 X9AUVVdqkXZioTO+szqRimhz5yhdygrWAgDH/Ditpxrzn1eNAecfsA2i/oa/Jl/6+pf8
 IuXNa39qJyUl2yyMKwDcBqjjVeDuUezHBoyAzKXwvcYKeKRWlM4U4xybIQXfbpP+72s3
 uG980v0E8MmCwO8qgsNtUFqewRBUFD9R0/Z2P3FQwi4ME9SErUIzWf9LdT+OilTlQ/WU
 idmA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=axS/GXqy
Subject: [Buildroot] [PATCH for 2025.02.x] package/php: security bump to
 v8.3.32
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See the release notes: https://www.php.net/ChangeLog-8.php#8.3.32

This fixes 2 vulnerabilities:
- CVE-2026-12184: Segfault in file_get_contents w/ a https URL and a proxy set
- CVE-2026-14355: Memory corruption (zend_mm_heap corrupted) in
                  openssl_encrypt with AES-WRAP-PAD

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 978987ee46..11c0b2e6b0 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  66410cee07f4b2baeb0843140bb2a2b52ef930b5cf9b3d6e6d158b33aae8fa37  php-8.3.31.tar.xz
+sha256  8698ec1f9402fa5e5e872ae3d0916b62f5f27503c1fbfc9cc3521e113355ea92  php-8.3.32.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 7d9cd3cb11..9ce3b280ac 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.3.31
+PHP_VERSION = 8.3.32
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
