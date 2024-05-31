Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C88FFC25B75
	for <buildroot@archiver.kernel.org>; Fri, 31 May 2024 12:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88B6C606D4;
	Fri, 31 May 2024 12:54:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jBH1qBYTtV7O; Fri, 31 May 2024 12:54:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A0596111D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A0596111D;
	Fri, 31 May 2024 12:54:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6D06F1D5251
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 12:54:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 672D66111D
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 12:54:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NeTQ4bgW7FA2 for <buildroot@lists.busybox.net>;
 Fri, 31 May 2024 12:54:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 22CCA606D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22CCA606D4
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 22CCA606D4
 for <buildroot@buildroot.org>; Fri, 31 May 2024 12:54:07 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 801C913F81D;
 Fri, 31 May 2024 14:54:01 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 31 May 2024 14:54:01 +0200
Date: Fri, 31 May 2024 14:54:01 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fiona Klute <fiona.klute@gmx.de>
Message-ID: <ZlnIaaG4tq48mtHV@landeda>
References: <20240531104425.2515591-1-fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240531104425.2515591-1-fiona.klute@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717160044;
 bh=ECFJyDP7e1AO4hbHwo9VRjO958wOB+8TwPmwe/K2rK0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vB95eHnvgXUdra7Uafn5xhv1dXuy+XmQvIiy8JMDac29Pw1M1ZytuZt0IjmVkLAzk
 un5CjgaNip2HNmpwMyRBcsFGKU7ekAwa1Al+O5yRKoUZ6kgjCkodd+9fRGyHi0WPwY
 Z6Bi7uIG8gvyFkppZYu0Y7Yy0UlXjE4s8jLgTddC7dmLhfEMQF+cZOI1ubT1bjjaJv
 d+FftRGjR8k3s28qp+NkU5ASQ3G7FaXTKo4b7koL5ryvicEF/YIXnLYEMUaWOfY/Dq
 VZBvnQWDOe+o69TowAuGDwcpKwOTmWwa0EFwRG7SkQJIqWR4hQUFeUOwlzDsywdWFl
 LtWy2PR+0lVKw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=vB95eHnv
Subject: Re: [Buildroot] [PATCH 1/1] utils/docker-run: Allow running with
 Podman
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fiona, All,

On 2024-05-31 12:44 +0200, Fiona Klute via buildroot spake thusly:
> Podman is command line compatible with Docker, there's no need to
> require contributors to install Docker to run checks before sending
> patches.
> 
> The additional "--userns=keep-id" option is necessary because unlike
> Docker Podman creates a user namespace for containers by
> default. Without keep-id the repository and pre-existing output files
> belong to root inside the container namespace, breaking writes,
> certain Git safety checks, and possibly all access (if the user is
> using a strict umask).
> 
> Signed-off-by: Fiona Klute <fiona.klute+wiwa@gmx.de>

I have a hook that validates that the author has properly signed-off
their contribution, and your sub-addressing triggered the check. Damn, I
need to test for more corner-cases!

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  utils/docker-run | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/utils/docker-run b/utils/docker-run
> index 79694474c1..3dcabe2718 100755
> --- a/utils/docker-run
> +++ b/utils/docker-run
> @@ -29,6 +29,16 @@ declare -a mountpoints=(
>      "$(pwd)"
>  )
> 
> +if command -v docker >/dev/null; then
> +    DOCKER="docker"
> +elif command -v podman >/dev/null; then
> +    DOCKER="podman"
> +    docker_opts+=( --userns=keep-id )
> +else
> +    echo "ERROR: Neither docker nor podman available!" >&2
> +    exit 1
> +fi
> +
>  # curl lists (and recognises and uses) other types of *_proxy variables,
>  # but only those make sense for Buildroot:
>  for env in all_proxy http_proxy https_proxy ftp_proxy no_proxy; do
> @@ -84,4 +94,4 @@ if tty -s; then
>      docker_opts+=( -t )
>  fi
> 
> -exec docker run "${docker_opts[@]}" "${IMAGE}" "${@}"
> +exec ${DOCKER} run "${docker_opts[@]}" "${IMAGE}" "${@}"
> --
> 2.45.1
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
