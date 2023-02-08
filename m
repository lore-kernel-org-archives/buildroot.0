Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D586C636D3
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 19:24:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0966408A8;
	Wed,  8 Feb 2023 19:24:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0966408A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rde8mOzLIm9e; Wed,  8 Feb 2023 19:24:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB716408AC;
	Wed,  8 Feb 2023 19:24:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB716408AC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2723D1BF2FE
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 19:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 017B1415E1
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 19:24:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 017B1415E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mURzWMGgbkyo for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 19:24:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70B3F408A8
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 70B3F408A8
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 19:24:32 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.112.65])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 7154219F57E;
 Wed,  8 Feb 2023 20:24:26 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 08 Feb 2023 20:24:25 +0100
Date: Wed, 8 Feb 2023 20:24:25 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20230208192425.GA2677@scaer>
References: <20230208181933.3925279-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230208181933.3925279-1-peter@korsgaard.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675884269;
 bh=S5d5TrYbFND6d61AuDvaLuGqj1XCf0wSlqhCil342TM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JLWI8LQBAjiWXrbZMRZKQiDyPBJEp54yqfigi9sm8nF/8EnKiZA/D23fauEoHtVui
 x7Bz8uHG/2pjHzFwnJ9lyo6Y62p2SRztAF8nUamDe4InQdapDT1SoXGkvr7WIBkTCH
 hY393hCE8BBC/s5Q4oQ73NWdwUQ0cB+5khr5GXb4bpmAkGB9gBwnGTfw/BtIbYdVv6
 zNM4KN0qr1CzWQ8zZGi81DwYtonhOd3MdmVFqCK1/+S8y7brNXKjrITU3sCA0nE1Yj
 EBxFrwHcDYGT9uHwjxKmxlb9LTgWd36IlVkgJI2WsJsmR3N8pprj9y4rbIxX0tbjLz
 uler+VvuZBUZw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=JLWI8LQB
Subject: Re: [Buildroot] [PATCH 1/5] package/pkg-waf.mk: drop bundled
 waf/waflib when external waf is used
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

Peter, All,

On 2023-02-08 19:19 +0100, Peter Korsgaard spake thusly:
> Waf requires that the version of the waf script matches the version of
> waflib, so drop any bundled waf/waflib if _NEEDS_EXTERNAL_WAF is used, as
> otherwise waf errors out with errors like:
> 
> Waf script '2.0.24' and library '1.9.3' do not match
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/pkg-waf.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/package/pkg-waf.mk b/package/pkg-waf.mk
> index e090afa9e6..a067e69c9b 100644
> --- a/package/pkg-waf.mk
> +++ b/package/pkg-waf.mk
> @@ -38,6 +38,13 @@ WAF_OPTS = $(if $(VERBOSE),-v) -j $(PARALLEL_JOBS)
>  
>  define inner-waf-package
>  
> +# The version of waflib has to match with the version of waf,
> +# otherwise waf errors out with:
> +# Waf script 'X' and library 'Y' do not match
> +define WAF_PACKAGE_REMOVE_WAF_LIB
> +	$(RM) -fr $(@D)/waf $(@D)/waflib
> +endef
> +
>  # We need host-python3 to run waf
>  $(2)_DEPENDENCIES += host-python3
>  
> @@ -47,6 +54,7 @@ $(2)_NEEDS_EXTERNAL_WAF ?= NO
>  ifeq ($$($(2)_NEEDS_EXTERNAL_WAF),YES)
>  $(2)_DEPENDENCIES += host-waf
>  $(2)_WAF = $$(HOST_DIR)/bin/waf
> +$(2)_PRE_CONFIGURE_HOOKS += WAF_PACKAGE_REMOVE_WAF_LIB

It would make more sense to make that either a post-extract or a
post-patch hook.

Regards,
Yann E. MORIN.

>  else
>  $(2)_WAF ?= ./waf
>  endif
> -- 
> 2.30.2
> 

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
