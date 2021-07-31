Return-Path: <SRS0=zrjq=MX=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD13BC4338F
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 11:33:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73FB26044F
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 11:33:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 73FB26044F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3970483B8D;
	Sat, 31 Jul 2021 11:33:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GqM6OXmuFWkj; Sat, 31 Jul 2021 11:33:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D3B483B6A;
	Sat, 31 Jul 2021 11:33:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 342D31BF846
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 11:33:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C4FB83B6A
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 11:33:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s-7s_2ba7vDG for <buildroot@lists.busybox.net>;
 Sat, 31 Jul 2021 11:33:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3679883B5C
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 11:33:25 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:bd5f:2690:7a2e:30fd])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 7774E780316;
 Sat, 31 Jul 2021 13:33:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1627731203;
 bh=5AhKxsix7Iq1ywu5qFTvUeCYeK31ImUgI998vrSn0ZY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K4qpmsMlTqzMNcgKKOuyUkqWcTDlLCsmI6CIMm+hLl3MJnsvdRp1XXUkL/8lVIlu4
 dupmDIUEx42uJ3ZAAeGkoNyZKQpfYgQCPYPbU91erdoZIX4JZHn3r+kUCjN4iUavbk
 tvT0PfSjq3wFm0e6p5z1mNHkXi4A/7DRryh4Jl5FCcP8lPDDf5xbu5hviB184GOOq2
 ec+a7L6qYpLgjWLJOfyue6R3nj1MJBQmhqBCsgZgWuS4NSW8EXMBWhO+ZeEUWGvUHc
 xEVXySkKEmAjA3ZoQTaUxW32HzE0DR3m5zm17hz5Wzp2K0vrqZDfIzoDjLSxKtZI/t
 K4y+PBS9bXdPg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 31 Jul 2021 13:33:19 +0200
Date: Sat, 31 Jul 2021 13:33:19 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Message-ID: <20210731113319.GM3189549@scaer>
References: <20210725141146.539853-1-arnout@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210725141146.539853-1-arnout@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/2] package/pkg-kconfig: hide defconfig
 targets if defconfig not supported
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Arnout, All,

On 2021-07-25 16:11 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> When the savedefconfig target is not supported by a kconfig package,
> (like is the case for busybox) it doesn't make sense to define
> busybox-savedefconfig or busybox-update-defconfig. Calling these leads
> to an error from busybox itself "No rule to make target
> 'savedefconfig'.", which may be confusing.
> 
> Only define the savedefconfig and update-defconfig target if
> $(2)_KCONFIG_SUPPORTS_DEFCONFIG is YES.
> 
> Note that we also need to define it as phony in the condition, otherwise
> 'make busybox-update-defconfig' will just say "Nothing to be done" and
> we really want the error "No rule to make target
> 'busybox-update-defconfig'".
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Applied to master, thanks. But see a nit below...

> ---
>  package/pkg-kconfig.mk | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
> index 715c3e04ec..baad2e3baf 100644
> --- a/package/pkg-kconfig.mk
> +++ b/package/pkg-kconfig.mk
> @@ -279,8 +279,11 @@ $(1)-check-configuration-done:
>  		exit 1; \
>  	fi
>  
> +ifeq ($$($(2)_KCONFIG_SUPPORTS_DEFCONFIG),YES)
>  $(1)-savedefconfig: $(1)-check-configuration-done
>  	$$(call kconfig-package-savedefconfig,$(2))
> +.PHONY: $(1)-savedefconfig
> +endif
>  
>  # Target to copy back the configuration to the source configuration file
>  # Even though we could use 'cp --preserve-timestamps' here, the separate
> @@ -289,6 +292,7 @@ $(1)-update-config: PKG=$(2)
>  $(1)-update-config: $(1)-check-configuration-done
>  	$$(call kconfig-package-update-config,$$($(2)_KCONFIG_DOTCONFIG))
>  
> +ifeq ($$($(2)_KCONFIG_SUPPORTS_DEFCONFIG),YES)
>  # Note: make sure the timestamp of the stored configuration is not newer than
>  # the .config to avoid a useless rebuild. Note that, contrary to
>  # $(1)-update-config, the reference for 'touch' is _not_ the file from which
> @@ -296,6 +300,8 @@ $(1)-update-config: $(1)-check-configuration-done
>  $(1)-update-defconfig: PKG=$(2)
>  $(1)-update-defconfig: $(1)-savedefconfig
>  	$$(call kconfig-package-update-config,defconfig)
> +.PHONY: $(1)-update-defconfig

I think that the usual convention is to put the PHONY rule right before
the corresponding rule, not after, so I've just changed that (in both
places in this patch, and in the following patch too).

Thanks!

Regards,
Yann E. MORIN.

> +endif
>  
>  # Target to output differences between the configuration obtained via the
>  # defconfig + fragments (if any) and the current configuration.
> @@ -315,9 +321,7 @@ endif # package enabled
>  
>  .PHONY: \
>  	$(1)-update-config \
> -	$(1)-update-defconfig \
>  	$(1)-diff-config \
> -	$(1)-savedefconfig \
>  	$(1)-check-configuration-done \
>  	$$($(2)_DIR)/.kconfig_editor_% \
>  	$$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS))
> -- 
> 2.31.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
