Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33DF6C2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 07:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADF6340887;
	Sat, 17 May 2025 07:38:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yUI_Fxx_H4KE; Sat, 17 May 2025 07:38:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE45540B52
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE45540B52;
	Sat, 17 May 2025 07:38:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 09C3A223
 for <buildroot@buildroot.org>; Sat, 17 May 2025 07:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0601940887
 for <buildroot@buildroot.org>; Sat, 17 May 2025 07:38:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v4qL1mC6dFDy for <buildroot@buildroot.org>;
 Sat, 17 May 2025 07:38:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2EDC34086D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EDC34086D
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2EDC34086D
 for <buildroot@buildroot.org>; Sat, 17 May 2025 07:38:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 07EA71C0F9B; Sat, 17 May 2025 09:38:27 +0200 (CEST)
Message-ID: <ba4dd77a-49f0-412a-8a04-f6a1575267d1@rnout.be>
Date: Sat, 17 May 2025 09:38:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Vincent Fazio <vfazio@gmail.com>, buildroot@buildroot.org
References: <20250517024045.625622-1-vfazio@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250517024045.625622-1-vfazio@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747467508; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=n81+/d7h1NlXt0fnS+zXTE8D8zZ7syq3mOLv+FmXo1o=;
 b=Qne9TfSl+NzH8K0aNeEJGwmlpj9s1mUSmyLu/ffPcfM3TuExg0e4KBM7i3EMR47Zs9+bOD
 gOdTKiWvUVyCqU5z2AclaRvHCtNKusJ4NfO/O59L8mIOaI2eSKHjmYtCaE0sYYqfKqgtwB
 OCE4Vf9z7gsDa7xb5ZwVFcEJw4qpEHy5agQeRQC85QFyGwm7NBhvKVm8Rz6FTwimz3cVid
 dyY9saKu+fDws6apaV9jwIw/yMR776yWaR+dqMX5NE6zhH2bTYHFNwViQF4LnJEa+Y3JoJ
 LI9WD0e+0Sk5XlxvUoxe8RzyofhkqVjy7F0enYCyyO3ioh0jlnhEBZML3ReKug==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=Qne9TfSl
Subject: Re: [Buildroot] [PATCH] package/m4: bump to 1.4.20
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



On 17/05/2025 04:40, Vincent Fazio wrote:
> The new version bundles an updated gnulib that includes support for
> -std=c23 which is the default for gcc 15.
> 
> Signed-off-by: Vincent Fazio <vfazio@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/m4/m4.hash |  2 +-
>   package/m4/m4.mk   | 12 +-----------
>   2 files changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/package/m4/m4.hash b/package/m4/m4.hash
> index a81f4fab9c..a5b8456cc2 100644
> --- a/package/m4/m4.hash
> +++ b/package/m4/m4.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated after checking pgp signature
> -sha256  63aede5c6d33b6d9b13511cd0be2cac046f2e70fd0a07aa9573a04a82783af96  m4-1.4.19.tar.xz
> +sha256  e236ea3a1ccf5f6c270b1c4bb60726f371fa49459a8eaaebc90b216b328daf2b  m4-1.4.20.tar.xz
>   # License files, locally calculated
>   sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
> diff --git a/package/m4/m4.mk b/package/m4/m4.mk
> index f5e1e27ad8..396c2bbee2 100644
> --- a/package/m4/m4.mk
> +++ b/package/m4/m4.mk
> @@ -4,20 +4,10 @@
>   #
>   ################################################################################
>   
> -M4_VERSION = 1.4.19
> +M4_VERSION = 1.4.20
>   M4_SOURCE = m4-$(M4_VERSION).tar.xz
>   M4_SITE = $(BR2_GNU_MIRROR)/m4
>   M4_LICENSE = GPL-3.0+
>   M4_LICENSE_FILES = COPYING
>   
> -# gcc-15 defaults to -std=gnu23 which is incorrectly detected and
> -# generates build failures in the gnulib copy included in
> -# m4-1.4.19. We workaround this by forcing the previous gcc default
> -# standard, which is -std=gnu17 only when host gcc is >= 15. This
> -# workaround can be removed when m4 will be updated to a version
> -# including a fix for gcc-15.
> -ifeq ($(BR2_HOST_GCC_AT_LEAST_15),y)
> -HOST_M4_CONF_ENV = CFLAGS="$(HOST_CFLAGS) -std=gnu17"
> -endif
> -
>   $(eval $(host-autotools-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
