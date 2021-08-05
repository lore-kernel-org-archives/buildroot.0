Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA576C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 20:05:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64B4560F22
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 20:05:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 64B4560F22
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E62782E22;
	Thu,  5 Aug 2021 20:05:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uasV_zd7v8KQ; Thu,  5 Aug 2021 20:05:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 667BF82D45;
	Thu,  5 Aug 2021 20:05:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 00D741BF3FD
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 20:05:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E3042401CA
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 20:05:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qdUTSLltAP_1 for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 20:05:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B4C0A400CD
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 20:05:30 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:70be:8b43:5d22:5801])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 45BB8B0053D;
 Thu,  5 Aug 2021 22:05:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1628193927;
 bh=7lzR5tdHJ9P3ZXfjfYeVZVwH/jS2n0+5BrQgB9bLyOM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dNAoiOWBTEC0COr1qJxafxjJ/huONYPSXHKmjIKBqRIPAYqFo/sx/lvJBDfk4O0y4
 ix4IPejVguG3mEkYwH6s/Z5z48fvKB9PBKvA98k2FbD8xwF6ySPhbvSclIaGillaRd
 kCiTTs3f/+AfIT6XivTUD2FWh4vCizYpGLuxG53wEFZwRO1/N/ftqNdsWn7soEdeY9
 Qg1qNMAOh7tZmUYuvD6W/bovF5qtpc7f7UsihtZb6wvFq9aQR26KPILDjUdt2L8gvd
 talKAHRbRNLSOF/O4o5+O2W72K2/NwasYYgeOC/emtLbhu81wYQLcQE1kCmvLB8hbA
 4ja3XD7EVk24w==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 05 Aug 2021 22:05:22 +0200
Date: Thu, 5 Aug 2021 22:05:22 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Message-ID: <20210805200522.GO27036@scaer>
References: <20210803154442.647813-1-arnout@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210803154442.647813-1-arnout@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] docs/manual/migrating.txt: add section with
 general migrating tips
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

On 2021-08-03 17:44 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> This is based on Yann's and Arnout's experience with migrating
> Buildroot.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> v2: (after review by Yann)
> - Run 'make graph-size' in the old environment, and save
>   file-size-stats.csv instead of packages-file-list.txt.
> - Run 'make clean' in the old environment.
> - Split "Update Buildroot" as a separate, explicit step.
> - Add a step to review the commit log for relevant packages.
> - Drop review of the CHANGES file - the commit log is sufficient.
> - Drop second patch ("individual packages") - the commit log is
>   sufficient.
> - Compare file-size-stats.csv after the build; also look for new files.
> - Drop comparing defconfig - it's already covered by comparing
>   file-size-stats.csv.
> - Include Yann's experience in the commit message.
> ---
>  docs/manual/migrating.txt | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/docs/manual/migrating.txt b/docs/manual/migrating.txt
> index 92e487c71e..89860c0940 100644
> --- a/docs/manual/migrating.txt
> +++ b/docs/manual/migrating.txt
> @@ -8,6 +8,36 @@ Some versions have introduced backward incompatibilities. This section
>  explains those incompatibilities, and for each explains what to do to
>  complete the migration.
>  
> +[[migrating-approach]]
> +=== General approach
> +
> +To migrate from an older Buildroot version, take the following steps.
> +
> +. For all your configurations, do a build in the old Buildroot
> +  environment. Run +make graph-size+. Save
> +  +graphs/file-size-stats.csv+ in a different location. Run +make
> +  clean+ to remove the rest.
> +. Review the specific migration notes below and make the required
> +  adaptations to external packages and custom build scripts.
> +. Update Buildroot.
> +. Run +make menuconfig+ starting from the existing +.config+.
> +. If anything is enabled in the Legacy menu, check its help text,
> +  unselect it, and save the configuration.
> +. Review the git commit messages for the packages that you need. Change
> +  into the +packages+ directory and run +git log <old version>.. --
> +  <your packages>+.
> +. Build in the new Buildroot environment.
> +. Fix build issues in external packages (usually due to updated
> +  dependencies).
> +. Run +make graph-size+.
> +. Compare the new +file-size-stats.csv+ with the original one, to
> +  check if no required files have disappeared and if no new big unneeded
> +  files have appeared.
> +. For configuration (and other) files in a custom overlay that overwrite
> +  files created by Buildroot, check if there are changes in the
> +  Buildroot-generated file that need to be propagated to your custom
> +  file.
> +
>  [[br2-external-converting]]
>  === Migrating to 2016.11
>  
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
