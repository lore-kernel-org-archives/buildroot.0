Return-Path: <SRS0=O81Z=N4=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C3A3C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 12:53:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB12761050
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 12:53:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BB12761050
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.buildroot.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61B9C605E5;
	Mon,  6 Sep 2021 12:53:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KOlQlSmSm8ce; Mon,  6 Sep 2021 12:53:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A441E60596;
	Mon,  6 Sep 2021 12:53:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 23E901BF2A0
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 12:53:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1300381BF4
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 12:53:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=heine.tech
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nr8I7DSXryXv for <buildroot@lists.busybox.net>;
 Mon,  6 Sep 2021 12:53:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8F0DC81BD9
 for <buildroot@buildroot.org>; Mon,  6 Sep 2021 12:53:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 989111814BB; Mon,  6 Sep 2021 14:53:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heine.tech; s=dkim;
 t=1630932822; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=Fskqc/+ASI7oRS5M4yZXYBjw+XRClfQRn7qThKN3DyE=;
 b=tTfcdd10P7PA7xvRG6CtQRFFjYpXDvC3gEo5aPCT1WByp+loZtRMlXnz16gq64lf5rif3I
 otpffGcaXnBSagBOythkRi7XU556mCMZQyl5HPIHTikcK632t3Kw6R5Is+xYlE2pHi9F+a
 fauzN3/Z4sakZzOYjLRJsHtXf6rxpZ0=
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210905182508.1151818-1-fontaine.fabrice@gmail.com>
Message-ID: <2952975a-e15b-3dae-ea6b-7e55a2da0427@heine.tech>
Date: Mon, 6 Sep 2021 14:53:40 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210905182508.1151818-1-fontaine.fabrice@gmail.com>
Content-Language: en-US
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/boost: fix fiber dependencies
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
From: Michael Nosthoff via buildroot <buildroot@lists.buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Hi,

On 05.09.21 20:25, Fabrice Fontaine wrote:
> Commit d39d8f7cee9b4634e6f490020204f63fae419e8e forgot to update fiber
> dependencies resulting in the following build failure:
>
> WARNING: unmet direct dependencies detected for BR2_PACKAGE_BOOST_FILESYSTEM
>    Depends on [n]: BR2_PACKAGE_BOOST [=y] && BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS [=n]
>    Selected by [y]:
>    - BR2_PACKAGE_BOOST_FIBER [=y] && BR2_PACKAGE_BOOST [=y] && BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS [=y] && BR2_TOOLCHAIN_HAS_THREADS_NPTL [=y] && !BR2_MIPS_CPU_MIPS32 [=n] && !BR2_MIPS_CPU_MIPS64 [=n] && (BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS [=n] || BR2_TOOLCHAIN_GCC_AT_LEAST_6 [=y]) && !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 [=n]
>
> Fixes:
>   - http://autobuild.buildroot.org/results/40b8af6ce273ebd5fca56d6734f64dacd562efb1
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   package/boost/Config.in | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/package/boost/Config.in b/package/boost/Config.in
> index f6409769c6..536e5b8486 100644
> --- a/package/boost/Config.in
> +++ b/package/boost/Config.in
> @@ -149,8 +149,7 @@ config BR2_PACKAGE_BOOST_FIBER
>   	# mips support uses the "pause" instruction, only available
>   	# since mips32r2/mips64r2.
>   	depends on !BR2_MIPS_CPU_MIPS32 && !BR2_MIPS_CPU_MIPS64
> -	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS \
> -		|| BR2_TOOLCHAIN_GCC_AT_LEAST_6 # boost-context -> boost-thread
> +	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-filesystem
>   	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-context
>   	select BR2_PACKAGE_BOOST_CONTEXT
>   	select BR2_PACKAGE_BOOST_FILESYSTEM
> @@ -160,8 +159,7 @@ config BR2_PACKAGE_BOOST_FIBER
>   
>   comment "boost-fiber needs a toolchain w/ NPTL"
>   	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
> -	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS \
> -		|| BR2_TOOLCHAIN_GCC_AT_LEAST_6
> +	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
>   	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
>   
>   comment "boost-fiber needs a toolchain not affected by GCC bug 64735"

whoopsie, I somehow missed that this was an OR dependency. Nice catch!

Reviewed-by: Michael Nosthoff <buildroot@heine.tech>

Regards,
Michael


_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
