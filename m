Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55272C5AE59
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 16:56:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22708408CF;
	Sat, 31 May 2025 16:56:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ub7wiRVT8sKa; Sat, 31 May 2025 16:56:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CC54408D7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CC54408D7;
	Sat, 31 May 2025 16:56:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 917B7127
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 83506401E0
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:56:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wbLwdWh-NUQF for <buildroot@buildroot.org>;
 Sat, 31 May 2025 16:56:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 995C64004A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 995C64004A
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 995C64004A
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:56:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2302B1C00EF; Sat, 31 May 2025 18:56:15 +0200 (CEST)
Message-ID: <c0e72250-361b-4780-9db3-011f0873b950@rnout.be>
Date: Sat, 31 May 2025 18:56:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250516205547.2826778-1-peter@korsgaard.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250516205547.2826778-1-peter@korsgaard.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1748710575; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=71tcNdmzxqkU3Jl+KMMu7iG8oKARrTrwZ9pTuksoFgA=;
 b=XfwNc+gJw4WUYZd4kZ8JjwTwD5Jtfe2Z+zI5xclgLldcNMZNTJ+glWBo3qs41VjvYWEmTY
 abJxJcDHBorSg7ubsKvBvVOWJbuAF+0m1TAHUkXbGCynCOAGyskca8PdEWgrwBq3xpuF3Y
 C+IrdL7M1NhfdL7BWB1LlwMHo3fzzPq1cAdkdlXnF39kvUAOCskdO46Vmj098lFxY4PN02
 I3+2Hg+l0D6D3edlu/vc/E+L/FzZdy4cWtW+K0G62nGP0/aBST3bsFyso+Nkl/DGvGgGw5
 B7J4BZKf1EfPafcp75NAuqnojqnOjEWBwEXryVvCvJHwbBC+1mdNyoITUzos7Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=XfwNc+gJ
Subject: Re: [Buildroot] [PATCH] package/pkg-autotools.mk:
 LIBTOOL_PATCH_HOOK: also handle libtool 2.5.x
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



On 16/05/2025 22:55, Peter Korsgaard wrote:
> Fixes:
> https://autobuild.buildroot.org/results/ac60d29fbcd9fb8ddb21b76b3b185e45e580c006/
> 
> Libtool 2.5.x has been released and is starting to be used by upstreams when
> generating release tarballs (E.G. openvpn-2.6.14).
> 
> https://lists.gnu.org/archive/html/autotools-announce/2024-09/msg00000.html
> 
> It needs to be patched similar to earlier versions, and the existing v2.4.4
> patch luckily still applies, so extend LIBTOOL_PATCH_HOOK to also patch
> 2.5.x versions with that.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/pkg-autotools.mk | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
> index 8ffb0e0047..16b21acb6d 100644
> --- a/package/pkg-autotools.mk
> +++ b/package/pkg-autotools.mk
> @@ -74,6 +74,8 @@ define LIBTOOL_PATCH_HOOK
>   			else \
>   				patch -i support/libtool/buildroot-libtool-v2.4.patch $${i}; \
>   			fi \
> +		elif test $${ltmain_version} = "2.5"; then\
> +			patch -i support/libtool/buildroot-libtool-v2.4.4.patch $${i}; \
>   		fi \
>   	done
>   endef

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
