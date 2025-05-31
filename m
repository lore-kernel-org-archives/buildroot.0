Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4923EC5AE59
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 16:40:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 181F16069D;
	Sat, 31 May 2025 16:40:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rN3dbU9avy5w; Sat, 31 May 2025 16:40:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 568C460743
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 568C460743;
	Sat, 31 May 2025 16:40:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E3A9E235
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:40:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E102640A31
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:40:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PVRZNF-tgjcb for <buildroot@buildroot.org>;
 Sat, 31 May 2025 16:40:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1B8D8409E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B8D8409E8
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1B8D8409E8
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:40:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1F6381C00B7; Sat, 31 May 2025 18:40:07 +0200 (CEST)
Message-ID: <00fa5a92-a754-45a2-926d-e01cdabfe4cc@rnout.be>
Date: Sat, 31 May 2025 18:40:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>, Bernd Kuhls <bernd@kuhls.net>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20250404182407.45244-1-christian@aperture.us>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250404182407.45244-1-christian@aperture.us>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1748709607; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=MqW5OjipLQkcofw4J/rehmcb45xsS5PPMinPdTyXVu0=;
 b=SSYZNEw2BKb8JtJQ/29XpszF+yg5FW05xmISEaCKE/UUZhWl2Jq7xfBfCdChyr1ByovRIn
 tGKe9hGckrSDAGRXSGWZ9vqRUi/q9Vq13dJAacWrHd6WC4SqMubbxCgfnCgXfD71hCfdz/
 /XMjvUAZMyb5zTOImZpRfSf3+EYuxYb/QPDW6Ks2DJ1Y04zUuE1cGGYhclHlYV530hfQrO
 sX1YoaC8dYaueoNtXstwxHa6o8YQOq4Htb5xX0pxx1dslvMA40qN8iacpd0wjmm6UpEC87
 jJUqEfmfX3ceZDJjJjTw2c8ibZwtgLth+SBVJ/XfDuc4ZKgWqtgH6hdI6AOeYw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=SSYZNEw2
Subject: Re: [Buildroot] [PATCH v1 1/1] package/pkg-cmake.mk: force config
 version >=3.5
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



On 04/04/2025 20:24, Christian Stewart via buildroot wrote:
> Some packages have CMakeLists.txt requiring CMake <3.5.
> 
> Newer CMake forces at minimum version 3.5, leading to build failures:
> 
> https://github.com/skiffos/SkiffOS/actions/runs/14208988354/job/39812576139#step:8:638
> https://github.com/skiffos/SkiffOS/actions/runs/14211566256/job/39819600184#step:8:26664
> 
> Add the suggested build flag to force version 3.5.x and fix the error:
> 
>    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
> 
> This is applied to all cmake packages to force 3.5 as a minimum.
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>

  Applied to 2025.02.x, thanks.

  On master, we will fix the packages with patches, but on the LTS branch it's 
easier to use this workaround.

  Regards,
  Arnout

> ---
>   package/pkg-cmake.mk | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> index c7032312fb..7bff3851cf 100644
> --- a/package/pkg-cmake.mk
> +++ b/package/pkg-cmake.mk
> @@ -53,6 +53,10 @@ define inner-cmake-package
>   
>   $(3)_SUPPORTS_IN_SOURCE_BUILD ?= YES
>   
> +# Some packages requires CMake 3.0.0 but latest CMake requires >=3.5
> +# Set the policy version minimum to force these packages to 3.5 or greater.
> +$(2)_CONF_OPTS += -DCMAKE_POLICY_VERSION_MINIMUM=3.5
> +
>   # The default backend, unless specified by the package
>   $(3)_CMAKE_BACKEND ?= make
>   

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
