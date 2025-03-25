Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FEB0C36008
	for <buildroot@archiver.kernel.org>; Tue, 25 Mar 2025 20:15:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D97A1811F4;
	Tue, 25 Mar 2025 20:15:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7G8HcJmjVdFZ; Tue, 25 Mar 2025 20:15:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17CE181441
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17CE181441;
	Tue, 25 Mar 2025 20:15:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D24631B8
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 20:15:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B7F9D81426
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 20:15:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NHVbt1qkbtEY for <buildroot@buildroot.org>;
 Tue, 25 Mar 2025 20:15:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 79EE8813FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79EE8813FF
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 79EE8813FF
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 20:15:50 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3914bc3e01aso3522360f8f.2
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 13:15:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742933748; x=1743538548;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ndBB64VW62khYA3Sbx1RqLZfgfkBaPNsW11ET9jmH7Y=;
 b=ieV6ziyJiDLPWKM1OincX0n7uR9ZDLr5C11waY/ldlofVXUMA8CNXB1P4atDnn2gMR
 IhR6vQZv1mpajsyW8xIzdmy72IHlKEQmF2eVVj+EbYFoYItzk6k0C0iG3tZp7nfrVqJp
 9qzWzZs1trnX0tH06dC38+pHWTFVQ8Z8ZQB5n6h9Fz8h7SsGeXTw6QaL/3yFZ212RTWn
 tfdruNCzEVdfb46SxXAe2xqZ6OcuArXqmZfUGcB6GGDAspmHqmgg04MTzyoap9ooal55
 pOL73aiGCRUMccluDC/5WNcw005jo+AzhgP3dA6fhlvhXAxvDH4lxSUu/WfGzglOUpHj
 17bg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaAeCuVeAl/90QFlIw2E0I/DcnOQNeJqV+eoCtfp8QJT35gduXqDuBv9ciIJJHqjWXPQjwT0kThlU=@buildroot.org
X-Gm-Message-State: AOJu0YyFWUs3iPtiO3jyxam/LFq0MxseyN5DotXkhGn6aOvW9KYy1SL2
 3a71jwpCn0PvMnt4fMD34jtt8k8ytpRD8a4FORXqK8lG+ew3TB0iAGRF3vG26y1Y3o1EfIyJcfi
 d
X-Gm-Gg: ASbGncsARH4zSmSQHZ25Ihg4N+GdcZY1+vX0LNs95t5EX1vxsFg7Hr1TSsfc3bo9+pU
 7INkp/UWx2sL0TdzQS3RCdKNXllCEyXtPESLnVHj08VS+SYJEPs/mPQYIAYVuXfWG9qHsNPd+FV
 iCih9mRv0Tonhvp9E/JFQMGKQMngpa3/TjQsllhYf1Sqaz/bo5CU0dTUKjFN9/Xo45pOE8n2baD
 4JuOlfOV1jTONf1A9H+sAfn4ICStvbEaktti15/42qzdgYqN9iJFXhsG8/nsrc9E5nzfXVrlGOl
 lG81nU/mhi9d1dD21hWmJ5LPLry5xx3yKtq1zugKbABEDPFoOOMhpsTTDg6KSPu8L6zbQ6y39nh
 7sKMS1GYlm5G6C19tbYlaU44u5E+i5fUVlMC6R8ShV5HaxPC8Rp1xmhwJpj+N9imyenaLyEM1ia
 s=
X-Google-Smtp-Source: AGHT+IFpgCCoJInEdYaehu98ecgRImDSkDbLRrGE1GaDKlsiOhzUbIXuQrXciWLreu2T9GOHZqsKIQ==
X-Received: by 2002:a5d:5f42:0:b0:390:fb37:1bd with SMTP id
 ffacd0b85a97d-3997f93bf7bmr14823586f8f.46.1742933748212; 
 Tue, 25 Mar 2025 13:15:48 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f47196sm209082755e9.16.2025.03.25.13.15.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Mar 2025 13:15:46 -0700 (PDT)
Message-ID: <712727dd-ca6e-4646-b335-cf1aa99ac3ea@mind.be>
Date: Tue, 25 Mar 2025 21:15:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Knight <git@jdknight.me>, buildroot@buildroot.org
References: <20250319043935.7756-1-git@jdknight.me>
Content-Language: en-GB
In-Reply-To: <20250319043935.7756-1-git@jdknight.me>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1742933748; x=1743538548; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ndBB64VW62khYA3Sbx1RqLZfgfkBaPNsW11ET9jmH7Y=;
 b=WAjEZoe6YJ6ppsyhRm7Xtrj4y94mKO3TvJ6UuyhudStpgeaV2sXjNlu9gRceak7RuM
 PN1XGKReIKRSCiyXdYOJi6Olt/Gg3MyKYKc931Q+vsaEX7Oln/3WqAZQFcgM+8CQfErh
 fD3+8zvWBXPFDftXgoc3HuFAGhvf+cY7Wz9i1XfM5zJKTeZhW40zmdR4qkDeISXJEEkT
 1CbYDsjE+bIMAyQK0301h0nWxTP0Sfh9J+kpaR1bzFBopm5xCdTlbhlUR7gCLVkQkqKS
 TrE1fTcqQ98vUyEF4tCXuc9Xyo+zs5o+ECzJW4AtOj1nhBSBQgpEQjbRTXfyCYtP5GGS
 cxhQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=WAjEZoe6
Subject: Re: [Buildroot] [PATCH 1/1] package: add support for <pkg>_SITE_ONLY
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
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 19/03/2025 05:39, James Knight wrote:
> This will allow individual packages to hint that sources for the package
> should only ever be downloaded from the specified `<pkg>_SITE` location.
> Can be useful to avoid hitting configured cache sites when it is known
> that a package would only ever be available from the package's site.

  Can you be a bit more specific about the use case? Is it intended for 
non-upstream packages for which you're sure they won't be in BR2_BACKUP_SITE? So 
it is just a small optimisation that only applies if you happen to have defined 
the wrong version or wrong hash (because otherwise BR2_BACKUP_SITE isn't even 
tried, so who cares)? Or are there other reasons?


  In addition to the comments I have below, I have a few more concerns.

- Since there are no in-tree users of this feature, there really should be a 
runtime test. It should also cover corner cases like BR2_PRIMARY_SITE_ONLY and 
_EXTRA_DOWNLOADS. And just to be sure, also a non-http download method.

- For all YES/NO options, we set a default in pkg-generic.mk. That way you see 
all values explicitly with `make printvars VARS=LIBFOO_%`.

- I guess we'll want the automatic host-from-target inheritance in 
pkg-generic.mk. Cfr. _AUTORECONF in pkg-autotools.mk.

-
> 
> Signed-off-by: James Knight <git@jdknight.me>
> ---
>   docs/manual/adding-packages-generic.adoc |  6 ++++++
>   package/pkg-download.mk                  | 17 ++++++++++++++---
>   2 files changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/manual/adding-packages-generic.adoc b/docs/manual/adding-packages-generic.adoc
> index f0b0508f537d4a0329b48e2f8696ca43b098f1f2..35bd05e790520b92462e7acfb47472d44f5de792 100644
> --- a/docs/manual/adding-packages-generic.adoc
> +++ b/docs/manual/adding-packages-generic.adoc
> @@ -336,6 +336,12 @@ not and can not work as people would expect it should:
>        still patch the source code, use +LIBFOO_POST_RSYNC_HOOKS+, see
>        xref:hooks-rsync[].
>   
> +* +LIBFOO_SITE_ONLY+ can be set to +YES+ to indicate that the package
> +  should only be attempted to be downloaded from the configured site
> +  defined by +LIBFOO_SITE+. Useful to avoid hitting configured cache
> +  sites when it is known that the package would only ever be available
> +  from the package's site.

  This could be a bit more explicit, something like:

* +LIBFOO_SITE_ONLY+ can be set to +YES+ to indicate that the package
   should always be downloaded from the +LIBFOO_SITE+ and never use
   +BR2_PRIMARY_SITE+ or +BR2_BACKUP_SITE+. Even if +BR2_PRIMARY_SITE_ONLY+
   is enabled, +BR2_PRIMARY_SITE+ will not be used for this package. This
   option applies to all of the package's downloads, including those
   specified in +LIBFOO_PATCH+ and +LIBFOO_EXTRA_DOWNLOADS+.

> +
>   * +LIBFOO_GIT_SUBMODULES+ can be set to +YES+ to create an archive
>     with the git submodules in the repository.  This is only available
>     for packages downloaded with git (i.e. when
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index cf5959ea95549c896fd0837faf43f8e09f88b167..9b8ed92e9d3fb036aae6b84825cd2410337bf34d 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -59,6 +59,15 @@ gitlab = https://gitlab.com/$(1)/$(2)/-/archive/$(3)
>   # Expressly do not check hashes for those files
>   BR_NO_CHECK_HASH_FOR =
>   
> +################################################################################
> +# DOWNLOAD_DEFAULT_URI - Default download site to get a package from.
> +#
> +# Argument 1 is the source location
> +#
> +################################################################################
> +
> +DOWNLOAD_DEFAULT_URI = $(patsubst %/,%,$(dir $(call qstrip,$(1))))
> +
>   ################################################################################
>   # DOWNLOAD_URIS - List the candidates URIs where to get the package from:
>   # 1) BR2_PRIMARY_SITE if enabled
> @@ -77,8 +86,7 @@ DOWNLOAD_URIS += \
>   endif
>   
>   ifeq ($(BR2_PRIMARY_SITE_ONLY),)
> -DOWNLOAD_URIS += \
> -	$(patsubst %/,%,$(dir $(call qstrip,$(1))))
> +DOWNLOAD_URIS += $(DOWNLOAD_DEFAULT_URI)
>   ifneq ($(call qstrip,$(BR2_BACKUP_SITE)),)
>   DOWNLOAD_URIS += \
>   	$(call getschemeplusuri,$(call qstrip,$(BR2_BACKUP_SITE)/$($(2)_DL_SUBDIR)),urlencode) \
> @@ -129,7 +137,10 @@ define DOWNLOAD
>   		$(if $(filter YES,$($(PKG)_SVN_EXTERNALS)),-r) \
>   		$(if $($(PKG)_GIT_SUBMODULES),-r) \
>   		$(if $($(PKG)_GIT_LFS),-l) \
> -		$(foreach uri,$(call DOWNLOAD_URIS,$(1),$(PKG)),-u $(uri)) \
> +		$(if $($(PKG)_SITE_ONLY), \
> +			$(DOWNLOAD_DEFAULT_URI), \

  Does this work? The -u option seems to be missing...


  I marked this patch as Changes Requested.

  Regards,
  Arnout


> +			$(foreach uri,$(call DOWNLOAD_URIS,$(1),$(PKG)),-u $(uri)) \
> +		) \
>   		$(2) \
>   		$(QUIET) \
>   		-- \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
