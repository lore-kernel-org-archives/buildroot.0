Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1641FC5B549
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 16:53:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2F6F60831;
	Sat, 31 May 2025 16:53:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X4qLoiJ2HzEV; Sat, 31 May 2025 16:53:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13994607FC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13994607FC;
	Sat, 31 May 2025 16:53:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EBD8A235
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:53:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D16CC40BA3
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:53:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a5wLJVGdxX8k for <buildroot@buildroot.org>;
 Sat, 31 May 2025 16:53:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 51AF641791
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51AF641791
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 51AF641791
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:53:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8AADD1C00DB; Sat, 31 May 2025 18:53:13 +0200 (CEST)
Message-ID: <10b12f91-95d1-4836-9390-ea61fb4fbc99@rnout.be>
Date: Sat, 31 May 2025 18:53:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <20250515211806.1464239-1-yann.morin.1998@free.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250515211806.1464239-1-yann.morin.1998@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1748710393; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=LvpxKhAVpYjZoy5ZPMifTCqgsCGK9x19dyib6RBhouI=;
 b=dku6wAxUBqvfNyH4ai9uRYO28hJYbiZTOa9oxcS0TzLp3m4IIAkNrFjA8zs33f2TM/JRJ0
 mdDzd9GkpsjQtOstFKzMEsTisAXeub7LuwO23MB+Zq2u0gMMycTLWy2D/5UI/V10H5keKm
 Lqv2eqdwQt/lvfhIE8/gyObreX/CkM5PIy1z4vJ0g6rRZlaS0BPV8JnXmthUqfZpFAprhB
 79mjAtCaF7VK2VWuhtXNEIJHS8E34TSP03MJjEKPfwhOeTkOWdGYeF7GLoM6VQaqcx9aIQ
 s2ta4h9tV+iarFsZbGTiB8KcqaSpw50WQKSxbFekL0NM/vJDYJONOq3zY5c1AQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=dku6wAxU
Subject: Re: [Buildroot] [PATCH] Makefile: allow defconfig to be in a
 sub-directory
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



On 15/05/2025 23:18, Yann E. MORIN wrote:
> Currently, the defconfigs must all live in the top-level configs/
> directory. While this might be considered sensible for the bundled
> defconfigs, it can be tedious to manage in a br2-external tree, where
> things could get better sorted and managed in sub-directories.
> 
> A few examples:
>    - for a given board, a first defconfig is the full system, and a
>      second is the rescue system;
>    - for a given board, two defconfigs implement an A/B feature set;
>    - a set of configurations targetting various famillies of systems each
>      running on different hardware, sorted per familly.
> 
> Extend the Makefile to look for and report defconfigs in sub-directories
> of the top-level configs/.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   Makefile | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 411e1de515..c0a41cabd5 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1218,7 +1218,7 @@ help:
>   # $(2): br2-external name, empty for bundled
>   define list-defconfigs
>   	@first=true; \
> -	for defconfig in $(1)/configs/*_defconfig; do \
> +	for defconfig in $$(find $(1)/configs -name '*_defconfig' |sort); do \
>   		[ -f "$${defconfig}" ] || continue; \
>   		if $${first}; then \
>   			if [ "$(2)" ]; then \
> @@ -1228,7 +1228,7 @@ define list-defconfigs
>   			fi; \
>   			first=false; \
>   		fi; \
> -		defconfig="$${defconfig##*/}"; \
> +		defconfig="$${defconfig#$(1)/configs/}"; \
>   		printf "  %-35s - Build for %s\n" "$${defconfig}" "$${defconfig%_defconfig}"; \
>   	done; \
>   	$${first} || printf "\n"

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
