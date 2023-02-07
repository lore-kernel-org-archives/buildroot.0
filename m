Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F9C4C636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 11:30:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B84E640273;
	Tue,  7 Feb 2023 11:30:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B84E640273
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HgX20kfY9iF9; Tue,  7 Feb 2023 11:30:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3B3640639;
	Tue,  7 Feb 2023 11:30:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3B3640639
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 528531BF2AF
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 11:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2CF3340273
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 11:30:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CF3340273
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wf5GyhCpHJtE for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 11:30:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0BD240232
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E0BD240232
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 11:30:02 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id EDFB513F8D4;
 Tue,  7 Feb 2023 12:29:53 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 07 Feb 2023 12:29:53 +0100
Date: Tue, 7 Feb 2023 12:29:53 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20230207112953.GD4124@scaer>
References: <20220806195802.451076-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220806195802.451076-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675769400;
 bh=l/fSngzcxPPC/rpp/pl1Wfyau7bdSi18fAOE7nBLYLE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hCCOesH5ssiI2Hqr5huFzKeTQ+s5wEwbMfFYRWBbVwdQz3dn1ylRD/l01sxUqhkg5
 +gDmtHOxWOseNL+OWqou5nMhR/Yw/hEbiLFut0Fz7ABV90GxcS0uOKrVhauE40H1ko
 XP4FNqGvVqJHRYdZ9uwPQXcOo6Ghyd54NYAuxDrewMVR65cKhKCDjmrMYvYVOjiuQZ
 J4+sJKDgKF9Z7CyAPOY7UDihN/QkwIno239KtzfHRQBGcf0sn8zxG1bHIQZilD7DSX
 IOULLW2/mdmPEtnOqtKkdfSbBNPU2ZZnq0oyy91fmHI5a00Wr5gJAry712o2Iog9kZ
 M6mHt+w9qKXoQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hCCOesH5
Subject: Re: [Buildroot] [PATCH] toolchain/toolchain-wrapper.c: set CCACHE
 env variables only when ccache is enabled
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-08-06 21:58 +0200, Thomas Petazzoni via buildroot spake thusly:
> This commit modifies the toolchain-wrapper to make sure that the
> CCACHE_COMPILERCHECK and CCACHE_BASEDIR are only set if ccache support
> is enabled. Indeed, when BR2_USE_CCACHE is not set (or to a value
> different than 1), we don't call the compiler with ccache, so there is
> no reason to set those ccache environment variables, and they could
> potentially conflict with a separate usage of ccache, outside of
> Buildroot, for example when using the Buildroot SDK.
> 
> In particular, the value of CCACHE_BASEDIR doesn't not make any sense
> when the Buildroot toolchain is not used during the Buildroot build,
> as it points to the output directory $(BASE_DIR).
> 
> We pay attention to also not show those variables as being set in the
> BR2_DEBUG_WRAPPER dump.
> 
> To help a little bit with this, a ccache_enabled boolean is introduced
> to indicate when ccache is being used.
> 
> There is still quite a bit of #ifdef-ery involved, but it's not easy
> to find a simpler way to organize the code.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  toolchain/toolchain-wrapper.c | 49 +++++++++++++++++++----------------
>  1 file changed, 27 insertions(+), 22 deletions(-)
> 
> diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
> index 37b24dd24a..ee1fdf3c71 100644
> --- a/toolchain/toolchain-wrapper.c
> +++ b/toolchain/toolchain-wrapper.c
> @@ -507,10 +507,28 @@ int main(int argc, char **argv)
>  
>  	exec_args = args;
>  #ifdef BR_CCACHE
> -	/* If BR2_USE_CCACHE is not defined, or its value is not 1,
> -	 * skip the ccache call */
> +	/* If BR2_USE_CCACHE is set and its value is 1, enable ccache
> +	 * usage */
>  	char *br_use_ccache = getenv("BR2_USE_CCACHE");
> -	if (!br_use_ccache || strncmp(br_use_ccache, "1", strlen("1")))
> +	bool ccache_enabled = br_use_ccache && !strncmp(br_use_ccache, "1", strlen("1"));
> +
> +	if (ccache_enabled) {
> +#ifdef BR_CCACHE_HASH
> +		/* Allow compilercheck to be overridden through the environment */
> +		if (setenv("CCACHE_COMPILERCHECK", "string:" BR_CCACHE_HASH, 0)) {
> +			perror(__FILE__ ": Failed to set CCACHE_COMPILERCHECK");
> +			return 3;
> +		}
> +#endif
> +#ifdef BR_CCACHE_BASEDIR
> +		/* Allow compilercheck to be overridden through the environment */
> +		if (setenv("CCACHE_BASEDIR", BR_CCACHE_BASEDIR, 0)) {
> +			perror(__FILE__ ": Failed to set CCACHE_BASEDIR");
> +			return 3;
> +		}
> +#endif
> +	} else
> +		/* ccache is disabled, skip it */
>  		exec_args++;
>  #endif
>  
> @@ -518,12 +536,14 @@ int main(int argc, char **argv)
>  	if (debug > 0) {
>  		fprintf(stderr, "Toolchain wrapper executing:");
>  #ifdef BR_CCACHE_HASH
> -		fprintf(stderr, "%sCCACHE_COMPILERCHECK='string:" BR_CCACHE_HASH "'",
> -			(debug == 2) ? "\n    " : " ");
> +		if (ccache_enabled)
> +			fprintf(stderr, "%sCCACHE_COMPILERCHECK='string:" BR_CCACHE_HASH "'",
> +				(debug == 2) ? "\n    " : " ");
>  #endif
>  #ifdef BR_CCACHE_BASEDIR
> -		fprintf(stderr, "%sCCACHE_BASEDIR='" BR_CCACHE_BASEDIR "'",
> -			(debug == 2) ? "\n    " : " ");
> +		if (ccache_enabled)
> +			fprintf(stderr, "%sCCACHE_BASEDIR='" BR_CCACHE_BASEDIR "'",
> +				(debug == 2) ? "\n    " : " ");
>  #endif
>  		for (i = 0; exec_args[i]; i++)
>  			fprintf(stderr, "%s'%s'",
> @@ -531,21 +551,6 @@ int main(int argc, char **argv)
>  		fprintf(stderr, "\n");
>  	}
>  
> -#ifdef BR_CCACHE_HASH
> -	/* Allow compilercheck to be overridden through the environment */
> -	if (setenv("CCACHE_COMPILERCHECK", "string:" BR_CCACHE_HASH, 0)) {
> -		perror(__FILE__ ": Failed to set CCACHE_COMPILERCHECK");
> -		return 3;
> -	}
> -#endif
> -#ifdef BR_CCACHE_BASEDIR
> -	/* Allow compilercheck to be overridden through the environment */
> -	if (setenv("CCACHE_BASEDIR", BR_CCACHE_BASEDIR, 0)) {
> -		perror(__FILE__ ": Failed to set CCACHE_BASEDIR");
> -		return 3;
> -	}
> -#endif
> -
>  	if (execv(exec_args[0], exec_args))
>  		perror(path);
>  
> -- 
> 2.37.1
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
