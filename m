Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35267D0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:54:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D20980E84;
	Wed,  7 Jan 2026 17:54:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1LIkZt1sKF00; Wed,  7 Jan 2026 17:54:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E43D80EA3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808454;
	bh=Bv70jopcuOUgUyuAcdIZNR0mt5jZ0xzTl/mt2JPobV8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PeRZ4ihAH9oR5lfiuXtDjGKjyU2aPhP4Ydyc6WPg5Bgw3ZBuXSnK4EWDIxzvkP5Dw
	 L5yMNLa8rEknDNYkP52MlQB0vgGFEKqLmQpaOnyeN+ntLLzWubJut/7Nz+Yaem9LQ3
	 HxV3dNR9zasoc8VONIaBSnsITRuQ4uItIJ+tI/NpD67pZANUvH7re+5t8xubgllo6V
	 zJ3cUUQsn3zSPZUTSGWyerm1zJfY2eO9G9y5NXQq2oX8jyNu6bxtS3An+cRG4W6T4B
	 p5t3kilfsgwxzVnTuzAxgaW2ib5I7XBSYJ7ccXByZAGypyWJxLA4XTUf5vgZUno++P
	 T1Kpnj5GOc0bw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E43D80EA3;
	Wed,  7 Jan 2026 17:54:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5098125B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3751B80EA3
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:54:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ePs28BF6b5ay for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:54:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2320280E84
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2320280E84
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2320280E84
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:54:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 11AF6B97A596; Wed,  7 Jan 2026 18:54:08 +0100 (CET)
To: Thomas Perale <thomas.perale@mind.be>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:54:06 +0100
Message-ID: <20260107175406.229241-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251227102300.148605-1-thomas.perale@mind.be>
References: <20251227102300.148605-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808449; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=0Pp9T5l7uO/b4lkvdJbd8og0z57l95svy4h6Vw2C4Fc=;
 b=K2shMsaXgkajZmf/EH65t7Slzl2WsUfUpuX2tz5bc7zulr35La+2bGznegQhuqgKoYmMbp
 r4I6PjcP5TCJpughC622elWQFi3+SFCALnCDDTC4iUEUxV+HvKW0U8bup988+A+fGeL2hL
 Ve8qalWSXN9clrKJYnWqjM/WaPYRsMcXM3uhc+AHBnoRYsR+A7XWDItRHtm+F6EtcsaI9g
 z8N0v+JmiE0TcELIiWso5/js0fCHnec0cEpal48f7mRLAtvqDuG1maluchTHgqYw41INF2
 9i3meG3gn2ymUjw6JcC2OoyiQ4+3NOiodAaxuL8sMtQ18qEQYDfBQoF2SG+ZmA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=K2shMsaX
Subject: Re: [Buildroot] [2025.02.x, PATCH] package/php: bump to v8.3.29
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> For more information on the release, see:
> 
> - https://www.php.net/ChangeLog-8.php#8.3.29
> - https://www.php.net/ChangeLog-8.php#8.3.28
> - https://www.php.net/ChangeLog-8.php#8.3.27
> - https://www.php.net/ChangeLog-8.php#8.3.26
> - https://www.php.net/ChangeLog-8.php#8.3.25
> 
> Fixes the following security issues:
> 
> - CVE-2025-14180
> 
> For more information, see:
>   - https://github.com/php/php-src/security/advisories/GHSA-8xr5-qppj-gvwj
> 
> - CVE-2025-14178
> 
> For more information, see:
>   - https://github.com/php/php-src/security/advisories/GHSA-h96m-rvf9-jgm2
> 
> - CVE-2025-14177
> 
> For more information, see:
>   - https://github.com/php/php-src/security/advisories/GHSA-3237-qqm7-mfv7
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  .../php/0006-Sync-headers-installation.patch  | 21 +++++--------------
>  package/php/php.hash                          |  2 +-
>  package/php/php.mk                            |  2 +-
>  3 files changed, 7 insertions(+), 18 deletions(-)
> 
> diff --git a/package/php/0006-Sync-headers-installation.patch b/package/php/0006-Sync-headers-installation.patch
> index da1c6a6e4c..3c4e6b1779 100644
> --- a/package/php/0006-Sync-headers-installation.patch
> +++ b/package/php/0006-Sync-headers-installation.patch
> @@ -22,9 +22,11 @@ systems by installing only what is intended outside of php-src.
>  Closes GH-13210
>  Closes GH-13213
>  
> +Upstream: https://github.com/php/php-src/commit/52dba99d47563f38d8ed5f84690a3cb2c1785475
>  [Thomas: minor backporting tweaks]
>  Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> -Upstream: https://github.com/php/php-src/commit/52dba99d47563f38d8ed5f84690a3cb2c1785475
> +[tperale: xxhash include fixed in https://github.com/php/php-src/commit/be8819259417d63b389eb9ea6c00abd6aeb8e1c6]
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
>  ---
>   ext/date/config.w32        |  2 +-
>   ext/dom/config.m4          |  2 +-
> @@ -190,26 +192,13 @@ index d38b032efd3..bafbd0b9f8d 100644
>  -									'php_hash_murmur.h php_hash_xxhash.h');
>  +									'php_hash_murmur.h php_hash_xxhash.h php_hash_fnv.h ' +
>  +									'php_hash_joaat.h xxhash/xxhash.h');
> -diff --git a/ext/hash/php_hash_xxhash.h b/ext/hash/php_hash_xxhash.h
> -index a1e8840ce27..ace70deedb0 100644
> ---- a/ext/hash/php_hash_xxhash.h
> -+++ b/ext/hash/php_hash_xxhash.h
> -@@ -18,7 +18,7 @@
> - #define PHP_HASH_XXHASH_H
> - 
> - #define XXH_INLINE_ALL 1
> --#include "xxhash.h"
> -+#include "xxhash/xxhash.h"
> - 
> - typedef struct {
> - 	XXH32_state_t s;
>  diff --git a/ext/iconv/config.m4 b/ext/iconv/config.m4
>  index 3cf400fe962..63221eddb0b 100644
>  --- a/ext/iconv/config.m4
>  +++ b/ext/iconv/config.m4
> -@@ -149,7 +149,7 @@ int main(void) {
> +@@ -163,7 +163,7 @@ int main(void) {
>   
> -     PHP_NEW_EXTENSION(iconv, iconv.c, $ext_shared,, [-DZEND_ENABLE_STATIC_TSRMLS_CACHE=1])
> +     PHP_NEW_EXTENSION(iconv, iconv.c, $ext_shared,, [-DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -DICONV_CONST=$php_cv_iconv_const])
>       PHP_SUBST(ICONV_SHARED_LIBADD)
>  -    PHP_INSTALL_HEADERS([ext/iconv/])
>  +    PHP_INSTALL_HEADERS([ext/iconv], [php_iconv.h])
> diff --git a/package/php/php.hash b/package/php/php.hash
> index dbb130f30b..02ebf1b0f6 100644
> --- a/package/php/php.hash
> +++ b/package/php/php.hash
> @@ -1,5 +1,5 @@
>  # From https://www.php.net/downloads.php
> -sha256  388ee5fd111097e97bae439bff46aec4ea27f816d3f0c2cb5490a41410d44251  php-8.3.24.tar.xz
> +sha256  f7950ca034b15a78f5de9f1b22f4d9bad1dd497114d175cb1672a4ca78077af5  php-8.3.29.tar.xz
>  
>  # License file
>  sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
> diff --git a/package/php/php.mk b/package/php/php.mk
> index 5460f440cb..37dabdcd1a 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PHP_VERSION = 8.3.24
> +PHP_VERSION = 8.3.29
>  PHP_SITE = https://www.php.net/distributions
>  PHP_SOURCE = php-$(PHP_VERSION).tar.xz
>  PHP_INSTALL_STAGING = YES
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
