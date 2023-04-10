Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 300ACC77B70
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 16:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65E8041517;
	Mon, 10 Apr 2023 16:40:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65E8041517
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PtmqaPA2jbYg; Mon, 10 Apr 2023 16:40:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4849D4176B;
	Mon, 10 Apr 2023 16:40:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4849D4176B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 006231BF314
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 16:40:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9B144176B
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 16:40:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9B144176B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B4ZX8G5o6_6j for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 16:40:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E643F41517
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E643F41517
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 16:40:36 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id BA2FD5FFBA;
 Mon, 10 Apr 2023 18:40:31 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 10 Apr 2023 18:40:31 +0200
Date: Mon, 10 Apr 2023 18:40:31 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230410164031.GC2819@scaer>
References: <20230410083252.138426-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230410083252.138426-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1681144833;
 bh=GIp4lAXlEz4zOopnY6vgBnXqU5v/yvp10HErao6q8/M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SWh4bbDTH1osvwRygcXiKKSSWEJihFWlKjvKOCEXp63doU650iUkH9iPnQV07FcgU
 AUSZN+Cv6e8WVlBvJ5KedjPTDvZgG+bcLSa8mWsUF58et8fFQvLlsjX0fNbXvNBSeg
 mrYVAikZEl9/kU8bO1+r0WVEmCz0GnhxMH1ug0UyYmXRmmtWY904/bsezcyNViDtxj
 RSfW11U3wt4SrAVysS8M7gmAbNXS0GoDzwMq3DebxzhKAbFuqDxdU8lhhKS1vpYBVk
 +E+EujsJVAtbVP0FJzv6H8i90UH2w8YJBIXECR7NunKJ+kvmF1ZuE0KEnx2as/w2rq
 vxqED5GTcrHzg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SWh4bbDT
Subject: Re: [Buildroot] [PATCH v3 1/1] package/pkg-cargo: ensure
 host/target rustflags are properly split
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, all,

On 2023-04-10 02:32 -0600, James Hilliard spake thusly:
> Set HOST_LDFLAGS RUSTFLAGS via the host-config feature, see:
> https://doc.rust-lang.org/nightly/cargo/reference/unstable.html#host-config
> 
> We have to enable this nightly feature first using:
> CARGO_UNSTABLE_HOST_CONFIG="true"
> 
> Separately set target RUSTFLAGS for the target triple specific env
> variable.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

FTR, Arnout did a review of a previous iteration, and proposed a commt
log with a lot more details and explanations on the actual reasons why
we have to do this change:

    https://lore.kernel.org/buildroot/0a2e0dd8-b579-644a-9d83-af88e40d40de@mind.be/

Could you please reveview what he wrote, and incorporate that in your
commit log (and amend/extend further if needed), and then respin,
please?

Regards,
Yann E. MORIN.

> ---
> Changes v2 -> v3:
>   - rebase
> Changes v1 -> v2:
>   - add RUSTFLAGS to HOST_PKG_CARGO_ENV
> ---
>  package/pkg-cargo.mk | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
> index 5600c8e97e..264bf5a1ae 100644
> --- a/package/pkg-cargo.mk
> +++ b/package/pkg-cargo.mk
> @@ -34,7 +34,10 @@ PKG_COMMON_CARGO_ENV = \
>  # using nighly features on stable releases, i.e features that are not
>  # yet considered stable.
>  #
> -# CARGO_UNSTABLE_TARGET_APPLIES_TO_HOST="true" "enables the nightly
> +# CARGO_UNSTABLE_HOST_CONFIG="true" enables the host specific
> +# configuration feature
> +#
> +# CARGO_UNSTABLE_TARGET_APPLIES_TO_HOST="true" enables the nightly
>  # configuration option target-applies-to-host value to be set
>  #
>  # CARGO_TARGET_APPLIES_TO_HOST="false" is actually setting the value
> @@ -43,9 +46,11 @@ PKG_COMMON_CARGO_ENV = \
>  PKG_CARGO_ENV = \
>  	$(PKG_COMMON_CARGO_ENV) \
>  	__CARGO_TEST_CHANNEL_OVERRIDE_DO_NOT_USE_THIS="nightly" \
> +	CARGO_UNSTABLE_HOST_CONFIG="true" \
>  	CARGO_UNSTABLE_TARGET_APPLIES_TO_HOST="true" \
>  	CARGO_TARGET_APPLIES_TO_HOST="false" \
>  	CARGO_BUILD_TARGET="$(RUSTC_TARGET_NAME)" \
> +	CARGO_HOST_RUSTFLAGS="$(addprefix -C link-args=,$(HOST_LDFLAGS))" \
>  	CARGO_TARGET_$(call UPPERCASE,$(RUSTC_TARGET_NAME))_LINKER=$(notdir $(TARGET_CROSS))gcc
>  
>  #
> @@ -53,7 +58,8 @@ PKG_CARGO_ENV = \
>  # and should be removed when fixed upstream
>  #
>  ifeq ($(NORMALIZED_ARCH),arm)
> -	PKG_CARGO_ENV += RUSTFLAGS="-Clink-arg=-Wl,--allow-multiple-definition"
> +	PKG_CARGO_ENV += \
> +		CARGO_TARGET_$(call UPPERCASE,$(RUSTC_TARGET_NAME))_RUSTFLAGS="-Clink-arg=-Wl,--allow-multiple-definition"
>  endif
>  
>  HOST_PKG_CARGO_ENV = \
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
