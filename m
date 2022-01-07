Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7383CC433EF
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 10:28:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 368D6429B0;
	Fri,  7 Jan 2022 10:28:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Up9JPFbQUoW; Fri,  7 Jan 2022 10:28:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 924D642968;
	Fri,  7 Jan 2022 10:28:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 397BB1BF2EC
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 10:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 336AA40157
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 10:28:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 76LY3eWM8N7v for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 10:28:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AD22A400CC
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 10:28:28 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:5148:b9c:d8ec:b3b5])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 75AEE780375;
 Fri,  7 Jan 2022 11:28:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641551306;
 bh=22Z4xzhzHAYeSoB7uFK9dimROc3V8HomW1znw1fgFXg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EyZf4N0BQ7wg5u+s/6mCkg7rSszOfzOYPMmZN/3ennc9G5YafFyYo8tWtTzV/wzzT
 eUTKDywo+YUSm+JEkYiQYaHC28CppV0lQia4RSBBvoP/xnU9catoBR8HQjJ4Vv7ymv
 4Q0+8c9m1OlyFYADvqvPiMcY1Zjji2n0z8sH9JbZw+v5bqEUGSDsKu+Daz/SFkzJxg
 qN+Z4LkkR6fnM5YfFlgJCnKP1hseHaNNfKJ0ixah1WuKk2XfH+LvNv4Ca5tas7mfaE
 Ea6rF8AaXN9lRi5XTpb8VVmcbVAW5qm27w4s4+36TlSw/6H3LHAaeIlDGLm2hwqJwP
 1GSOlTspTIeQA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 07 Jan 2022 11:28:19 +0100
Date: Fri, 7 Jan 2022 11:28:19 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220107102819.GA1268635@scaer>
References: <20220106210000.397694-1-thomas.petazzoni@bootlin.com>
 <20220106210000.397694-2-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220106210000.397694-2-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v3 01/11] support/download/dl-wrapper: add
 concept of download post-processing
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
Cc: Matt Weber <Matthew.Weber@rockwellcollins.com>,
 Patrick Havelange <patrick.havelange@essensium.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-01-06 21:59 +0100, Thomas Petazzoni spake thusly:
> In order to support package managers such as Cargo (Rust) or Go, we
> want to run some custom logic after the main download, but before
> packing the tarball and checking the hash.
> 
> To implement this, this commit introduces a concept of download
> post-processing: if -p <something> is passed to the dl-wrapper, then
> support/download/<something>-post-process will be called.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  support/download/dl-wrapper | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
> index 3315bd410e..e6509e5671 100755
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
> +            ${OLDPWD}/support/download/${post_process}-post-process \

I added double-quotes when expanding those variables.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> +                -o "${tmpf}" \
> +                -n "${raw_base_name}"
> +        fi
> +
>          # cd back to free the temp-dir, so we can remove it later
>          cd "${OLDPWD}"
>  
> -- 
> 2.33.1
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
