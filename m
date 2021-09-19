Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9BB9C433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 09:37:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A971610A8
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 09:37:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5A971610A8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1FBFC401D6;
	Sun, 19 Sep 2021 09:37:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TW8UVN6d_aWi; Sun, 19 Sep 2021 09:37:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06C624013B;
	Sun, 19 Sep 2021 09:37:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A05341BF5E6
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 09:37:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F42160648
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 09:37:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vRfUUywEqtrN for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 09:37:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 948DB60646
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 09:37:19 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:35ad:6fdd:a5c5:c816])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id B0F2F2003D0;
 Sun, 19 Sep 2021 11:37:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1632044238;
 bh=Ga5jdLyuHMS92PQ7VXbD6fHQreA2CR6rU7YAZGsu19k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WioAphaVsXMa1VqIORKsq8YyjBlQfvkIM9cBUTf/w1MS5UyhFX1sLAJthdPK9TN73
 ByqdfUAQ1TdlZmPLCeUcZDwtMaCJRlcUdnoZqp3pgQco/eTM4oZf9CHOjjHNnt/+gL
 bGx9Lo36RmJYpSOZnKVNZR6yG3VUuSkzHuIe+ZFn4zYZDlVebeBMyvPlLR3Sktg9A9
 3qSs587fAWydxSaA9jfDOQd4TDffJoE8pcjxZc6TqtoBFuTfKOwdcaAHVi7FhDxCLJ
 Eaktx3zdTAjGnarBEeFI426+fq1keATWZYIxSW5tFVWULwcmyVht/r5g4zF4UydbMx
 eX4AW1/wa1j2w==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 19 Sep 2021 11:37:09 +0200
Date: Sun, 19 Sep 2021 11:37:09 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Stewart <christian@paral.in>
Message-ID: <20210919093709.GO1053080@scaer>
References: <20210919071016.3339939-1-christian@paral.in>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210919071016.3339939-1-christian@paral.in>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH-NEXT v2 1/5] support/download/dl-wrapper:
 add concept of download post-processing
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
Cc: Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Christian, All,

Can you fixup the patches as you already noticed, and respin a fixed
up series, please? In the meantime., I've marked this one Changes
REquested in Patchwork.

Also, what was still preventing applying this to Buildroot, was a few
still open questions, the most prominent one I can remember is about
BR2_PRIMARY_SITE and BR2_BACKUP_SITE.

Indeed, what we download from the main site is an un-vendored source,
but what we will get in primary or backup sites are vendored sources.

Downloading vendored sources from primary or mirror also means that no
vendoring should be applied afterward, i.e. vendoring should only occur
on sources downloaded from the main site.

Did you try that? Can you report on how that eventually played out?

Regards,
Yann E. MORIN.

On 2021-09-19 00:10 -0700, Christian Stewart via buildroot spake thusly:
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> In order to support package managers such as Cargo (Rust) or Go, we
> want to run some custom logic after the main download, but before
> packing the tarball and checking the hash.
> 
> To implement this, this commit introduces a concept of download
> post-processing: if -p <something> is passed to the dl-wrapper, then
> support/download/<something>-post-process will be called.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  support/download/dl-wrapper | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
> index 3315bd410e..2d74554213 100755
> --- a/support/download/dl-wrapper
> +++ b/support/download/dl-wrapper
> @@ -25,7 +25,7 @@ main() {
>      local -a uris
>  
>      # Parse our options; anything after '--' is for the backend
> -    while getopts ":c:d:D:o:n:N:H:rf:u:q" OPT; do
> +    while getopts ":c:d:D:o:n:N:H:rf:u:qp:" OPT; do
>          case "${OPT}" in
>          c)  cset="${OPTARG}";;
>          d)  dl_dir="${OPTARG}";;
> @@ -37,6 +37,7 @@ main() {
>          r)  recurse="-r";;
>          f)  filename="${OPTARG}";;
>          u)  uris+=( "${OPTARG}" );;
> +        p)  post_process="${OPTARG}";;
>          q)  quiet="-q";;
>          :)  error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
>          \?) error "unknown option '%s'\n" "${OPTARG}";;
> @@ -135,6 +136,12 @@ main() {
>              continue
>          fi
>  
> +        if [ -n "${post_process}" ] ; then
> +                ${OLDPWD}/support/download/${post_process}-post-process \
> +                         -o "${tmpf}" \
> +                         -n "${raw_base_name}"
> +        fi
> +
>          # cd back to free the temp-dir, so we can remove it later
>          cd "${OLDPWD}"
>  
> -- 
> 2.33.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
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
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
