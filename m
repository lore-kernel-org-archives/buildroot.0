Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02ABFCEACEF
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 20:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCF2A61411;
	Mon, 17 Nov 2025 20:02:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LqjExeSIdjVl; Mon, 17 Nov 2025 20:02:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7786B60F13
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7786B60F13;
	Mon, 17 Nov 2025 20:02:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F2366158
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:02:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4814408C5
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:02:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ymf4RmDjgQcc for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 20:02:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D9B4F40027
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9B4F40027
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D9B4F40027
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:02:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D0F29B979430; Mon, 17 Nov 2025 21:02:26 +0100 (CET)
Message-ID: <4a477285-a808-4a28-bd4f-0498b2a4a3d2@rnout.be>
Date: Mon, 17 Nov 2025 21:02:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>
References: <20251025143512.78812-1-thomas@devoogdt.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20251025143512.78812-1-thomas@devoogdt.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1763409748; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=1R7RA2i92kqEx+eriZZCup27wO0AwvJhk4Oe4pXUx2s=;
 b=GJh5MLrcX2c6n+xlutxM10w7I1o6sMymTiXXLDhbWSJRjhW7J5bQ3uIz0FbFceYaZ8shJd
 nv99hSvDi7B9UrLaH2GqXfBi729mikbKR9cF8qT1ALAG1otoYWbhfZjkn3FrS//eEkTCgG
 EWK+9EkPL4EiMnZDyxs4mrgErfLYOrisZL2kOnVTPb187pYAG4sCv2iZ1fxTNrBvQeJcoC
 8Du7pvjK9ZhkS2ZKpCf1mnGTejFUz4w4unmror0jL9fwCUnY6O+5M7tBjoyg16qc3HA+Tr
 Ene+LUd9oL20PQ9Z9id63C6p9bBkgBFpeqwfftTdmTgRLxG4DTyXT/VeG8BRGQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=GJh5MLrc
Subject: Re: [Buildroot] [PATCH v1] package/wpewebkit: disable internal
 ccache configuration
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



On 25/10/2025 16:35, Thomas Devoogdt wrote:
> WebKit's auto-configured ccache results in 100% cache misses.
> Disable WebKit's internal ccache setup [1] since Buildroot
> already manages the ccache in toolchain/toolchain-wrapper.c.
> 
> [1] https://github.com/WebKit/WebKit/blob/wpewebkit-2.48.3/Source/cmake/WebKitCCache.cmake
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

  Applied both to 2025.02.x and 2025.08.x, thanks.

  Regards,
  Arnout

> ---
>   package/wpewebkit/wpewebkit.mk | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
> index 796e271ecb..15a2ea93e8 100644
> --- a/package/wpewebkit/wpewebkit.mk
> +++ b/package/wpewebkit/wpewebkit.mk
> @@ -21,6 +21,10 @@ WPEWEBKIT_DEPENDENCIES = host-gperf host-python3 host-ruby host-unifdef \
>   
>   WPEWEBKIT_CMAKE_BACKEND = ninja
>   
> +# Buildroot adds support for ccache through its
> +# toolchain-wrapper, so tell wpewebkit not to mess with it.
> +WPEWEBKIT_CONF_ENV = WK_USE_CCACHE=NO
> +
>   WPEWEBKIT_CONF_OPTS = \
>   	-DPORT=WPE \
>   	-DENABLE_API_TESTS=OFF \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
