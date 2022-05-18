Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF61C433FE
	for <buildroot@archiver.kernel.org>; Wed, 18 May 2022 20:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A691541C66;
	Wed, 18 May 2022 20:21:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ywRHMJiwZcJd; Wed, 18 May 2022 20:21:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5292341C63;
	Wed, 18 May 2022 20:21:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 80A5A1BF41B
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 20:21:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6FCD883187
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 20:21:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xIhyAi3RlXEL for <buildroot@lists.busybox.net>;
 Wed, 18 May 2022 20:21:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EEE8883183
 for <buildroot@buildroot.org>; Wed, 18 May 2022 20:21:36 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e41f:d4df:64d5:4e9])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 9B48413F88A;
 Wed, 18 May 2022 22:21:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1652905294;
 bh=ODXhRPVu7wGRkKnV/KCIusQGT3/IwGHdQHlaSh2EFgw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QqDkKiwuoB/Y9JK++z/nGddFae8zLZKec6hWhu6pao6hIouxX5xX/Xl0Tix+F653m
 YLDR4o+feu32ZLfUqG0PPRtq9PiDHjwj8P3lNcKhAcobGjTeFX0WuaYrRcRV5xAGeL
 8S02zU5/VsqkSeZ/vMBBp60EuikvF01741CBzAfBfp5B+MvXVAkq3Afut+5P7xD3ZN
 9nUDibuGrb6tf23bmq6X7mcCLYHeOYP/K9QV+FeRyQ8dhyK9RF1e+wSSP3S2bot0gr
 dxZodkKKrRle4PsTd1syT7DQfkSs39+Fmsa19SJu6bJie5uiLo8IxrBKAZpP9AXiJi
 GBH/GBPQhXRVA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 18 May 2022 22:21:29 +0200
Date: Wed, 18 May 2022 22:21:29 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20220518202129.GX1597494@scaer>
References: <20220517103608.3455749-1-christian@paral.in>
 <4b7583c4-5d03-60bc-4b42-4b2f18177a78@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4b7583c4-5d03-60bc-4b42-4b2f18177a78@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2 1/1] package/pkg-utils: prevent
 kconfig_enable_opt from changing =m to =y
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Christian, Arnout, All,

On 2022-05-18 20:01 +0200, Arnout Vandecappelle spake thusly:
> On 17/05/2022 12:36, Christian Stewart via buildroot wrote:
> >This patch changes KCONFIG_MUNGE_DOT_CONFIG to prevent changing `=m` to `=y`.
>  Good catch!
>  Patch is a bit over-complicated, but I don't know how to do better.
[--SNIP--]
> >@@ -21,8 +21,14 @@ KCONFIG_DOT_CONFIG = $(strip \
> >  )
> >  # KCONFIG_MUNGE_DOT_CONFIG (option, newline [, file])
> >+# If setting to =y and the option is already set to =m, ignore.
> >  define KCONFIG_MUNGE_DOT_CONFIG
> >-	$(SED) "/\\<$(strip $(1))\\>/d" $(call KCONFIG_DOT_CONFIG,$(3))
> >+	if [[ "$(lastword $(subst =, ,$(strip $(2))))" == "y" ]]; then \
>  This part we could avoid by adding a 4th option and setting it only on
> KCONFIG_ENABLE_OPT.
> 
> >+		if grep -q "$(strip $(1))=m" $(call KCONFIG_DOT_CONFIG,$(3)); then \
> >+			exit 0; \
> 
>  This is a kind of hard-to-follow control structure - better turn around the
> condition and do the replacement inside it. So, combined with the above:
> 
> 	if $(if $(4),grep -q ...,true); then \
> 		sed ...; \
> 		echo ...; \
> 	fi

Actually, I think the check should not be in KCONFIG_MUNGE_DOT_CONFIG,
as it really belongs to KCONFIG_ENABLE_OPT.

Maybe something like:

    diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
    index 7d1aea7710..56cd72a9a9 100644
    --- a/package/pkg-utils.mk
    +++ b/package/pkg-utils.mk
    @@ -22,12 +22,16 @@ KCONFIG_DOT_CONFIG = $(strip \
     
     # KCONFIG_MUNGE_DOT_CONFIG (option, newline [, file])
     define KCONFIG_MUNGE_DOT_CONFIG
    -	$(SED) "/\\<$(strip $(1))\\>/d" $(call KCONFIG_DOT_CONFIG,$(3))
    +	$(SED) "/\\<$(strip $(1))\\>/d" $(call KCONFIG_DOT_CONFIG,$(3)) && \
     	echo '$(strip $(2))' >> $(call KCONFIG_DOT_CONFIG,$(3))
     endef
     
     # KCONFIG_ENABLE_OPT (option [, file])
    -KCONFIG_ENABLE_OPT  = $(call KCONFIG_MUNGE_DOT_CONFIG, $(1), $(1)=y, $(2))
    +define KCONFIG_ENABLE_OPT
    +	if ! grep -q -E '^$(1)=' $(call KCONFIG_DOT_CONFIG,$(2)); then \
    +		$(call KCONFIG_MUNGE_DOT_CONFIG, $(1), $(1)=y, $(2)) || exit 1; \
    +	fi
    +endif
     # KCONFIG_SET_OPT (option, value [, file])
     KCONFIG_SET_OPT     = $(call KCONFIG_MUNGE_DOT_CONFIG, $(1), $(1)=$(2), $(3))
     # KCONFIG_DISABLE_OPT  (option [, file])

Or maybe just that:

    diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
    index 7d1aea7710..8aebd14114 100644
    --- a/package/pkg-utils.mk
    +++ b/package/pkg-utils.mk
    @@ -27,7 +27,7 @@ define KCONFIG_MUNGE_DOT_CONFIG
     endef
     
     # KCONFIG_ENABLE_OPT (option [, file])
    -KCONFIG_ENABLE_OPT  = $(call KCONFIG_MUNGE_DOT_CONFIG, $(1), $(1)=y, $(2))
    +KCONFIG_ENABLE_OPT  = $(call KCONFIG_MUNGE_DOT_CONFIG, $(1) is not set, $(1)=y, $(2))
     # KCONFIG_SET_OPT (option, value [, file])
     KCONFIG_SET_OPT     = $(call KCONFIG_MUNGE_DOT_CONFIG, $(1), $(1)=$(2), $(3))
     # KCONFIG_DISABLE_OPT  (option [, file])

Also, I notice now that this KCONFIG_MUNGE_DOT_CONFIG is pretty fragile.
Given a .config with:

    FOO="1234"
    BAR="$(FOO)"

and then:

    $(call KCONFIG_SET_OPT,FOO,azerty)

would yield a .config with just:

    FOO="azerty"

because \<FOO\> would match the assignement to BAR.

So we may need to revisit that mess of mine...

Regards,
Yann E. MORIN.

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
