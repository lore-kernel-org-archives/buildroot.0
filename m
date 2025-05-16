Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37FD5C3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 18:00:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CCD06133E;
	Fri, 16 May 2025 18:00:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4SkrTCvZ0rNr; Fri, 16 May 2025 18:00:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E97BA613E1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E97BA613E1;
	Fri, 16 May 2025 18:00:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A30013D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:59:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 04650613BB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:59:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 15CqY71juolZ for <buildroot@buildroot.org>;
 Fri, 16 May 2025 17:59:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 14F20613C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14F20613C1
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 14F20613C1
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:59:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0D5C21C0E0E; Fri, 16 May 2025 19:59:54 +0200 (CEST)
Message-ID: <cc7f2887-8508-42d3-bfb5-e76333075429@rnout.be>
Date: Fri, 16 May 2025 19:46:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <20250515211806.1464239-1-yann.morin.1998@free.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250515211806.1464239-1-yann.morin.1998@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747418395; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=/DuVl1ThPTF86nOCaF80E6NyFiC9j31PclYcCEj6Erc=;
 b=ZniypOFLFd7vtVUMxxAI3cxj4O3ezhcbO2uu9yIXOjTiZDKtup/TM7co1v50VKdtvCLFSN
 kVL9D/k4VHQtSFycgIX44olNN6LBC19i7tXOR0a7WclXA/IhEpoONtWwxsDQTrpMLY415f
 nxFFXvs7xdYCCQgVzHBYB8hm8qx2xaY/dyWKJIz0mrgKxQkV8zb7tRnINEwugVm4xeA1/j
 MROEv5yluMgUNBapZapdXACfjIPtsz3komr9A+t+hNnQNnbyJ6q44Q4eftTicKWrszswfA
 HcnUnX/bBfm9jn4QSRPv0g9M5poFW6Nn8TLOz2B16Y1cmbF9H+8Nd9B7SR2mSQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=ZniypOFL
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

  It is actually only about list-defconfigs, so I rephrased:

Makefile: include defconfigs in sub-directories in list-defconfigs

Currently, list-defconfigs only lists the defconfigs that live
  live in the top-level configs/ directory. For the in-tree defconfigs
this is indeed the case, but it is possible to manage the configs in a
br2-external tree with sub-directories.

A few examples:
   - for a given board, a first defconfig is the full system, and a
     second is the rescue system;
   - for a given board, two defconfigs implement an A/B feature set;
   - a set of configurations targetting various famillies of systems each
     running on different hardware, sorted per familly.

Extend list-defconfigs to look for and report defconfigs in
sub-directories of the top-level configs/.



  Applied to master, thanks.

  Regards,
  Arnout


> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
