Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E3AD64089
	for <buildroot@archiver.kernel.org>; Fri,  8 Nov 2024 20:57:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90838611D5;
	Fri,  8 Nov 2024 20:57:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sG4_9cbPelBC; Fri,  8 Nov 2024 20:57:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C52860619
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C52860619;
	Fri,  8 Nov 2024 20:57:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6EFE8C2
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 20:57:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B29C84538
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 20:57:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hwL2JeQXBePt for <buildroot@buildroot.org>;
 Fri,  8 Nov 2024 20:56:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 59E3A8453C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59E3A8453C
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 59E3A8453C
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 20:56:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 84F2E5FFC0;
 Fri,  8 Nov 2024 21:56:53 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:33076])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 08 Nov 2024 21:56:53 +0100
MIME-Version: 1.0
Date: Fri, 08 Nov 2024 21:56:53 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
In-Reply-To: <20241103101141.964221-1-bernd@kuhls.net>
References: <20241103101141.964221-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.9
Message-ID: <a1d3344315d2847c2bc055a6a927087f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731099415;
 bh=4D5sC0VugU+MTQYrApsfotKA/nC2B0sds9u7AsY3XXU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kOwBiLx2HEz2UO6C6rZ465TTMX1PDOiOW/qptfbVDZzNkyoUJjKDmPWc2DsxGpNLZ
 NRNN2t67vKZcpOeYcAV2xquVAXn4a1qDXaTv3e9hpsxVeTQPr4k9ohSjI5405CAeSq
 SwlId6tDhUnIUkFXVEbZnxzpXZ+AP8+cbnb6QCetI8F5QhNWFwIkw5vmb8GWpAJLp2
 HjM+dG5yagwbk4aLIaCfezTRsTiVfTmtEAnO5vcqdtE7AOSWA6VHdqEyk7nn1LWasH
 +V7LxauiPIIbN1uAtlrGd/KWJo9tTO1huJ0vUBXfTRuLLtXTy87Mf8nspSoc0KDEck
 CIyUsQsRa3xLA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kOwBiLx2
Subject: Re: [Buildroot] [PATCH 1/1] package/ffmpeg: fix build on riscv32
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 03/11/2024 11:11, Bernd Kuhls wrote:
> Ported patch from OpenEmbedded:
> https://github.com/openembedded/openembedded-core/commit/010b068bcc126dbbc1e2032997e8d83360a7de35
> 
> "ffmpeg 6.0 has added assembly routines which uses rv64i ISA
> unconditionally, ideally it should check for ISA before using those
> instructions."
> 
> Fixes:
> https://autobuild.buildroot.org/results/8a7082a0f24ebcf264aeac5e0fea704dc6a6bb1c/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

> ---
>  package/ffmpeg/ffmpeg.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
> index a010c0168c..1e18b5e2da 100644
> --- a/package/ffmpeg/ffmpeg.mk
> +++ b/package/ffmpeg/ffmpeg.mk
> @@ -529,6 +529,11 @@ else
>  FFMPEG_CONF_OPTS += --disable-altivec
>  endif
> 
> +# Fix build failure on several missing assembly instructions
> +ifeq ($(BR2_RISCV_32),y)
> +FFMPEG_CONF_OPTS += --disable-rvv --disable-asm
> +endif
> +
>  # Uses __atomic_fetch_add_4
>  ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
>  FFMPEG_CONF_OPTS += --extra-libs=-latomic
> --
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
