Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B0F7C3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 17:59:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C13B6121C;
	Fri, 16 May 2025 17:59:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yDxkTKpDJPOE; Fri, 16 May 2025 17:59:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42E506132D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42E506132D;
	Fri, 16 May 2025 17:59:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F87213D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:59:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 80F22400F6
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:59:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0wSpk6FzLzd0 for <buildroot@buildroot.org>;
 Fri, 16 May 2025 17:59:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 84A644003A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84A644003A
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 84A644003A
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:59:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 60A941C110D; Fri, 16 May 2025 19:59:25 +0200 (CEST)
Message-ID: <909285d4-01a8-46eb-a0f3-d84a64a454e1@rnout.be>
Date: Fri, 16 May 2025 13:19:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20250512214743.439158-1-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250512214743.439158-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747418365; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=j6aWJ9qgt1uTQFmYUJ95bBl6av1N5lw96tZdZvMgk0I=;
 b=FKt/TPrIfaIR8Uf9+1tgD1dQ5pAprtWodih5BZeTh6yoX2U4CWgGDqZlQMv8BcRYm3vhq0
 KPSvdIJUIhSWMomWF/vZQ+lW4UUq+7C1gFRkyb6ZTKamIABKYYZoy8z08l8gEgH9HWnaEm
 0DHjMYRrqkw4PczC5OnMR3GNMHZ/B/Gb66WpqxwWUfs8YzALO7kQnTfVoTt3N7N8mZJ75K
 003dtb/Kh1VEuohJte2fQIKjmUIEY4Z6qxlT9pk0DwUp6BQAMwnKaTfSozHAQjTiCIdkRD
 fGfU3685x0a0vd9xcEclzbu2XlnH3iK+KfsS3t4mcoS48djYC1vdZ17rvZ+Rlw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=FKt/TPrI
Subject: Re: [Buildroot] [PATCH] package/berkeleydb: fix build with gcc-15.x
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



On 12/05/2025 23:47, Bernd Kuhls wrote:
> Inspired by
> https://src.fedoraproject.org/rpms/libdb/c/c250c61cc3d56c5cff7ba59308f46245a32bdc69
> 
> "GCC 15 defaults to C23.  The last release of this package was over a
>   decade ago, and it is no longer maintained, therefore it should not be
>   expected to compile to the latest standards."
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/berkeleydb/berkeleydb.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/berkeleydb/berkeleydb.mk b/package/berkeleydb/berkeleydb.mk
> index 1c121370db..b2d4b689f3 100644
> --- a/package/berkeleydb/berkeleydb.mk
> +++ b/package/berkeleydb/berkeleydb.mk
> @@ -26,6 +26,7 @@ BERKELEYDB_BINARIES = db_archive db_checkpoint db_deadlock db_dump \
>   define BERKELEYDB_CONFIGURE_CMDS
>   	(cd $(@D)/build_unix; rm -rf config.cache; \
>   		$(TARGET_CONFIGURE_OPTS) \
> +		CFLAGS="$(TARGET_CFLAGS) -std=gnu99" \
>   		$(TARGET_CONFIGURE_ARGS) \
>   		../dist/configure $(QUIET) \
>   		--target=$(GNU_TARGET_NAME) \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
