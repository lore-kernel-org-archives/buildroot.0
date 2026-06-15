Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 722ABCD98DE
	for <buildroot@archiver.kernel.org>; Mon, 15 Jun 2026 21:30:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43DC141B90;
	Mon, 15 Jun 2026 21:30:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ZvVEM8TjdPg; Mon, 15 Jun 2026 21:30:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63F3741B93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781559049;
	bh=gA3QngFyLNODQGpwVOj6OVPo4tqZb5DqVLHprtpTSzg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iP4faCPobt4+zQpuFFFJEdzEkHUVbhBM5Hxyg/3ItZ5jHvTVyOs3qb+mXTSLBcLNm
	 IcS2ao10Ccz1zEFUjwos3HxX4bxOXadKbQHPaaFzQqBp+0vN7hpoMfsuqF4uWXbKwk
	 5/Ksa04UlsSn0zGZkszUrdO/7ej1N0BAHIUBB+FR5R1PdPvACurLuZUI1JZQ5OcmMH
	 PiFbf4WuaW6eMcWcpYud9+UlU8UtiwTVG3sBZx8zsFNrs1UCl2VXVJmBSjI6lIrnOa
	 S77ubzyZkg3DfXJVsdqgsU5oaHoXEUjwrQWVutMxVNGuFLYkw8NMYjiT82A/UHy+2h
	 uwz7J2O7O1AsQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63F3741B93;
	Mon, 15 Jun 2026 21:30:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 08F99169
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 21:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E377841B90
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 21:30:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wuPbISIz6UTh for <buildroot@buildroot.org>;
 Mon, 15 Jun 2026 21:30:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 041B841B93
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 041B841B93
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 041B841B93
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 21:30:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 82DA02003B4;
 Mon, 15 Jun 2026 23:30:39 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 15 Jun 2026 23:30:39 +0200
MIME-Version: 1.0
Date: Mon, 15 Jun 2026 23:30:39 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Romain Naour
 <romain.naour@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260615202559.1465158-3-bernd@kuhls.net>
References: <20260615202559.1465158-1-bernd@kuhls.net>
 <20260615202559.1465158-3-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.16
Message-ID: <9082606ff7e046d77509548484b36907@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1781559043;
 bh=zxBTYM+1ysPfdN3aYq5BgEt2y1mYEwaR1ka46u80dh8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fJKPQH0szDsZ43H8kLS4IsE6caw+4fAuvcJxqrUV3SYPYVbAsABuhqEqSF7gaWUg/
 rRpRVBtxhbCEq8/WLf1trV4OugNoxybKKMNRF37zynymliDNY50AyBSBdaCW6S1l5m
 TOG1nM6mexHWD5lz4MUQfDJ2nHRZrk8dzbRqczEzfeU6xxmBSzpi8hu09mkq3FWiyI
 hDX3b4mZxF9J3abzoZEBJRzwa7FPzEHBFLcNYpvqfV1AasZxstzit20ZozC6QrHV7Y
 aYLmR6mvmnZ/bcUjSEjHyEx2ipfdiG8erWEuY0cjEkTtGLzWGUPjH5FUSWikf/ZZ6j
 bUdIb0GKMPcWA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fJKPQH0s
Subject: Re: [Buildroot] [PATCH 3/5] linux: select host-libelf for all
 architectures when building latest version
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

Thanks for the patch.

On 15/06/2026 22:25, Bernd Kuhls wrote:
> Fixes:
> loongarch64: 
> https://autobuild.buildroot.net/results/d35/d350f09f06d43246284b4c0112544d79a9b0f083/
> powerpc: 
> https://autobuild.buildroot.net/results/638/63835fa811ad0566a3e373d79686405fdb5a0df0/
> x86_64: 
> https://autobuild.buildroot.net/results/711/7113e9d3e616733f2e98ea175ab80ccb718c90a1/

Could you provide a bit more info why we need to enable host-libelf
for all architectures?

Looking at the autobuilder logs, it seems to be related to the Kernel
objtool, which seems to be enabled only on those three architectures.

Shouldn't we select libelf only for those architectures only?

For example, we ended up selecting host-openssl for all
architectures because almost all needed it. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/bba86304b0ac4ae266cfb52e54a239b0850b10ca

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> Gitlab pipeline passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/9b6fe0892e0acd8d750f614656648fb51467f668
> 
>  linux/Config.in | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index 0baa52de0f..51b0a3fcc5 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -192,6 +192,9 @@ config BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG
>  	select BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL if \
>  	       BR2_LINUX_KERNEL_LATEST_VERSION || \
>  	       BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> +	select BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF if \
> +	       BR2_LINUX_KERNEL_LATEST_VERSION || \
> +	       BR2_LINUX_KERNEL_LATEST_CIP_VERSION
>  	help
>  	  This option will use the default configuration for the
>  	  selected architecture. I.e, it is equivalent to running
> --
> 2.47.3

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
