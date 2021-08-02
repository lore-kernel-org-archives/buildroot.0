Return-Path: <SRS0=hSOo=MZ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53CDAC4338F
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 20:55:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E995560F4C
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 20:55:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E995560F4C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C707606A5;
	Mon,  2 Aug 2021 20:55:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V8RrlfN_cstE; Mon,  2 Aug 2021 20:55:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AE4E606DE;
	Mon,  2 Aug 2021 20:55:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5F85A1BF303
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 20:55:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F4D483196
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 20:55:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cNNrssvWY51e for <buildroot@lists.busybox.net>;
 Mon,  2 Aug 2021 20:55:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 107108318B
 for <buildroot@buildroot.org>; Mon,  2 Aug 2021 20:55:17 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:f475:5bfa:f4b3:5a3a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id A654F5FF23;
 Mon,  2 Aug 2021 22:55:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1627937715;
 bh=SzZsMCVFL3E2Jh0LawSgZDPJeuXKCKhMOBWNEwUXkQg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B2vmotJwLMTJfK1qdDyFU5lJsChTe75enVe6wD/mMxjvh0WDfqZTYw03YklCAbgyI
 B1ZJQWQadRAiQLe33vR9OLbuNHl1K+euScVBMewkokqAIqvgAP4ztuQhKhRyJz9zzX
 zOvPt5pMG4vNugYnlC8TXB6es7P7FAU0zpVvya3vwwkBqx9O7t98uL6tEYt9a1+RGu
 61Djvf4i+AT0wfttNpFwr8rlOw3+OacLeDLl7+kcZxwJxB4FDHcsQVRD4O7QdTgmpA
 FICKkRPES7/nm+ClVaaH7NWIxbWJxlUckT1YP1IyhMNBTUuFc1WD7XxCaAkejTyd06
 aWKYrxr2itJXQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 02 Aug 2021 22:55:06 +0200
Date: Mon, 2 Aug 2021 22:55:06 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Message-ID: <20210802205506.GE27036@scaer>
References: <20210802162244.620782-1-arnout@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210802162244.620782-1-arnout@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [RFC 1/2] docs/manual/migrating.txt: add section
 with general migrating tips
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
Cc: Michael Nosthoff <buildroot@heine.tech>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Arnout, All,

On 2021-08-02 18:22 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> This is based on Arnout's experience with migrating Buildroot.

Except for the details, this also quite closely matches my own
experience.

> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  docs/manual/migrating.txt | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/docs/manual/migrating.txt b/docs/manual/migrating.txt
> index 92e487c71e..9fd7d7e676 100644
> --- a/docs/manual/migrating.txt
> +++ b/docs/manual/migrating.txt
> @@ -8,6 +8,34 @@ Some versions have introduced backward incompatibilities. This section
>  explains those incompatibilities, and for each explains what to do to
>  complete the migration.
>  
> +[[migrating-approach]]
> +=== General approach
> +
> +To migrate from an older Buildroot version, take the following steps.
> +
> +. For all your configurations, do a build in the old Buildroot
> +  environment. Save the full +.config+ and
> +  +build/packages-file-list.txt+.

(read my comment below first, then come back here)
Maybe run 'make clean' here?

> +. Review the specific migration notes below and make the required
> +  adaptations to external packages and custom build scripts.
> +. In the new Buildroot environment, run +make menuconfig+ starting from
> +  the existing +.config+.
> +. If anything is enabled in the Legacy menu, check its help text,
> +  unselect it, and save the configuration.
> +. Review the CHANGES file to see if any of your packages and features
> +  are affected by the changes.
> +. Build in the new Buildroot environment.

Above, you said to start with a full build, so if folowing this sequence
to the letter, we still have a full build. We need to run 'make clean'
first (go back reading my comment, above).

> +. Fix build issues in external packages (usually due to updated
> +  dependencies).
> +. Compare the new +packages-file-list.txt+ with the original one, to
> +  check if no required files have disappeared.

Maybe also suggest graph-size et al. about investigating size changes,
too?

> +. For configuration (and other) files in a custom overlay that overwrite
> +  files created by Buildroot, check if there are changes in the
> +  Buildroot-generated file that need to be propagated to your custom
> +  file.
> +. Run +make savedefconfig+ and verify that what is selected really is
> +  what you intended to enable.

I am always wary instructing people to look at defconfig files; I always
consider them to be artefacts of the configuration.

Rather, I suggest people read the output of legal-info to check that all
the packages there are acceptable, and see graph-depends to see how a
package came to the build.

Regards,
Yann E. MORIN.

>  [[br2-external-converting]]
>  === Migrating to 2016.11
>  
> -- 
> 2.31.1
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
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
