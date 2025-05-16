Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64FD7C3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 10:56:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 144E24198D;
	Fri, 16 May 2025 10:56:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sNVAZfcfhtRX; Fri, 16 May 2025 10:56:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C1804178C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C1804178C;
	Fri, 16 May 2025 10:56:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0899513D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:56:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E233C608B0
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:56:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GLMGXqaxz0nm for <buildroot@buildroot.org>;
 Fri, 16 May 2025 10:56:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9BD6F60AC8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BD6F60AC8
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9BD6F60AC8
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:56:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 989C91C10F2; Fri, 16 May 2025 12:56:01 +0200 (CEST)
Message-ID: <c9bd5ee5-4546-4d58-9068-2b73d1cdab8e@rnout.be>
Date: Fri, 16 May 2025 12:56:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Titouan Christophe <titouan.christophe@mind.be>, buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>
References: <20250507130044.1040159-1-titouan.christophe@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250507130044.1040159-1-titouan.christophe@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747392961; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=os2PgjvMzdIdypJZZ9IB/zBMEA8OaGTHG6u0m/9eeEo=;
 b=GfHKsqTE5IdfAA1pDxsyOLjrxVhd/IiFgn5A13Hu6VAJuBAS3dZPt0QHcRSFqXPicEYr5h
 bnYxasysXcQPR8C40vB6M44d9jmmvS+si16gbZTlwQIFYeUL4jjcxpjrx51LunbJNcBPOg
 PbHA9RoV1rA083Yp/rIiRk60g8wazwj+IwN7Grde/KNGUFm6LacLKwrcFBdgJQSCQ5HxBV
 TUZzWeJVEBhW3Hc8qseyBVX9LJfgQX+doC0aJKp4iAZku0457tZzOjGOJ2Z/KRC1QPXGNg
 iTffm/pWpmatKwzv80i/271EBz5x5JvSp8NM6+z7ZNXZYYKNZZ4TMqV4yf90kg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=GfHKsqTE
Subject: Re: [Buildroot] [PATCH] package/sqlite: add patch to fix
 CVE-2025-29087
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/05/2025 15:00, Titouan Christophe via buildroot wrote:
> This patch was commited upstream, and released as part of sqlite 3.49.1
> 
> However, the configuration system changed between sqlite 3.48 and 3.49
> from autotools to autosetup, and this has proven challenging to support
> in Buildroot (see `git log package/sqlite`), hence why we are still on
> sqlite 3.48.
> 
> Therefore, until the package build infrastructure correctly supports
> building sqlite 3.49, let's simply import the upstream patch to address
> the CVE.
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   ...ast-to-avoid-32-bit-integer-overflow.patch | 33 +++++++++++++++++++
>   package/sqlite/sqlite.mk                      |  3 ++
>   2 files changed, 36 insertions(+)
>   create mode 100644 package/sqlite/0002-Add-a-typecast-to-avoid-32-bit-integer-overflow.patch
> 
> diff --git a/package/sqlite/0002-Add-a-typecast-to-avoid-32-bit-integer-overflow.patch b/package/sqlite/0002-Add-a-typecast-to-avoid-32-bit-integer-overflow.patch
> new file mode 100644
> index 0000000000..b9904785c1
> --- /dev/null
> +++ b/package/sqlite/0002-Add-a-typecast-to-avoid-32-bit-integer-overflow.patch
> @@ -0,0 +1,33 @@
> +From f4fc2ee20311a0a5141726c71d318ab52001c974 Mon Sep 17 00:00:00 2001
> +From: drh <>
> +Date: Sun, 16 Feb 2025 10:57:25 +0000
> +Subject: [PATCH] Add a typecast to avoid 32-bit integer overflow in the
> + concat_ws() function with an enormous separator values and many arguments.
> +
> +Fixes the following CVE:
> +  - CVE-2025-29087: In SQLite 3.44.0 through 3.49.0 before 3.49.1,
> +                    the concat_ws() SQL function can cause memory to be
> +                    written beyond the end of a malloc-allocated buffer.
> +
> +For more info see https://nvd.nist.gov/vuln/detail/CVE-2025-29087
> +
> +Upstream: https://sqlite.org/src/info/498e3f1cf57f164f
> +
> +Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> +---
> + src/func.c    |  2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/manifest b/manifest
> +index 2f7a6368f8..9f03427425 100644
> +--- a/src/func.c
> ++++ b/src/func.c
> +@@ -1570,7 +1570,7 @@ static void concatFuncCore(
> +   for(i=0; i<argc; i++){
> +     n += sqlite3_value_bytes(argv[i]);
> +   }
> +-  n += (argc-1)*nSep;
> ++  n += (argc-1)*(i64)nSep;
> +   z = sqlite3_malloc64(n+1);
> +   if( z==0 ){
> +     sqlite3_result_error_nomem(context);
> diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
> index 218b3f0a1d..05e305ac17 100644
> --- a/package/sqlite/sqlite.mk
> +++ b/package/sqlite/sqlite.mk
> @@ -13,6 +13,9 @@ SQLITE_LICENSE_FILES = tea/license.terms
>   SQLITE_CPE_ID_VENDOR = sqlite
>   SQLITE_INSTALL_STAGING = YES
>   
> +# 0002-Add-a-typecast-to-avoid-32-bit-integer-overflow.patch
> +SQLITE_IGNORE_CVES = CVE-2025-29087
> +
>   ifeq ($(BR2_PACKAGE_SQLITE_STAT4),y)
>   SQLITE_CFLAGS += -DSQLITE_ENABLE_STAT4
>   endif

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
