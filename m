Return-Path: <SRS0=49zi=O7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29346C433EF
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 07:04:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AC3C60F22
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 07:04:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9AC3C60F22
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B5A340297;
	Mon, 11 Oct 2021 07:04:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OaJ-3G2P9yUP; Mon, 11 Oct 2021 07:04:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B80440289;
	Mon, 11 Oct 2021 07:04:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A71231BF29D
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 07:04:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 96794401C7
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 07:04:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TThCGy9rwoz9 for <buildroot@lists.busybox.net>;
 Mon, 11 Oct 2021 07:04:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EE9D4401C4
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 07:04:32 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id A87614000A;
 Mon, 11 Oct 2021 07:04:29 +0000 (UTC)
Date: Mon, 11 Oct 2021 09:04:28 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Christian Stewart <christian@paral.in>
Message-ID: <20211011090428.50e68324@windsurf>
In-Reply-To: <20211010234655.585526-1-christian@paral.in>
References: <20211010234655.585526-1-christian@paral.in>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH-NEXT v3 1/6] support/download/dl-wrapper:
 add concept of download post-processing
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
Cc: Anisse Astier <anisse@astier.eu>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Christian,

Thanks for your work on this topic! I didn't review the patches in
details, but here are a couple of comments on the form:

 - The initial series also had support for Cargo, I think we want to
   retain that as the idea was to solve both Go and Cargo at the same
   time, to make sure we have a solution that works for both.

 - PATCH-NEXT doesn't make any sense right now, there is no "next"
   branch.

 - Your patch series lacks a cover letter with a description of the
   changes between versions. So of your commits have a v1 -> v2
   changelog, but we don't know what changed in v3.

Best regards,

Thomas

On Sun, 10 Oct 2021 16:46:50 -0700
Christian Stewart <christian@paral.in> wrote:

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



-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
