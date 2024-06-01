Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D4E5C25B76
	for <buildroot@archiver.kernel.org>; Sat,  1 Jun 2024 13:53:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E729A60627;
	Sat,  1 Jun 2024 13:53:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NJRnpVhXos6j; Sat,  1 Jun 2024 13:53:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6D5260665
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6D5260665;
	Sat,  1 Jun 2024 13:53:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2D80E1BF2F5
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 13:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69D20401ED
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 13:53:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8ihHTqQous1e for <buildroot@lists.busybox.net>;
 Sat,  1 Jun 2024 13:53:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E47B140120
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E47B140120
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E47B140120
 for <buildroot@buildroot.org>; Sat,  1 Jun 2024 13:53:11 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 54EB313F899;
 Sat,  1 Jun 2024 15:53:05 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Jun 2024 15:53:05 +0200
Date: Sat, 1 Jun 2024 15:53:05 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <Zlsnwa_hAKmKzNjb@landeda>
References: <20240601100417.50377-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240601100417.50377-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717249988;
 bh=bkdk9qKARAxKthFRS3dCQQPf+5XICgMtSEk8xwUn8O0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X89odE7QBkHf76Diy/iwKNsFV+jfyyCIQYHMhQkCoaBDXEZFhH0eAiKjiysIDzWFD
 LsdiSi7vyA8oP0ggBiBV6lRXB/iiIAAkAeGMqNlU/twxfLEMOAqopl2WqrJjabaHSL
 plh8MLNq6fcigb3mNuSmk+M9Y+t5Vh6kHsHmJVjunwdCBdxNIrLVD/U6HGty6121Sy
 E9cvRaLDAtUJpz8DHu0B5Sa/NC/UK3cFQ/QgTqs5BYHiY9+saDZN1F1dQXhNq6YZkj
 3ycNrG6kJgksZs+glHghC2dj2rWgJL/UYVq5LxRsnlcknKQZfizeXwfeb9wLX+2lwT
 vZhLGfKIkAj0w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=X89odE7Q
Subject: Re: [Buildroot] [PATCH next v2 1/1] utils/docker-run: set podman
 userns option in environment
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

Julien, All,

On 2024-06-01 12:04 +0200, Julien Olivain spake thusly:
> Commit 9a629f5 "utils/docker-run: allow running with Podman" added an
> option on system providing the podman command. This case is mainly
> for Fedora systems.
> 
> Fedora repositories has a podman-docker package, that provides the
> docker command for compatibility. See [1]. In that case, invoking
> "docker" redirects to podman.
> 
> When this package is installed on a Fedora system, both the docker and
> podman commands are available. Since the docker command is checked
> before podman, the --userns option is not passed in that case. This
> brings "permission denied" errors.
> 
> Other cases are also possible, like a host system providing the real
> Docker alongside a podman installation. In such a case, to avoid
> unexpected change of behavior of the docker-run script, the original
> search order is preserved (search for "docker" first, then "podman").
> 
> This commit change the way the podman user namespace mode is set. Rather
> than adding the "--userns=keep-id" command line option only in the podman
> case, it is globally set using the PODMAN_USERNS=keep-id environment
> variable. See [2].
> 
> Doing so makes sure that the variable will be consumed by the "docker"
> compatibility command, and just ignored by the real "docker"
> implementation.
> 
> [1] https://packages.fedoraproject.org/pkgs/podman/podman-docker/
> [2] https://docs.podman.io/en/latest/markdown/podman-run.1.html
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
> From Yann comment:
> - preserve docker then podman search order,
> - globally set the PODMAN_USERNS variable instead of
>   passing the --userns in the podman case.
> ---
>  utils/docker-run | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/utils/docker-run b/utils/docker-run
> index 3dcabe2718b..1adb02d74e6 100755
> --- a/utils/docker-run
> +++ b/utils/docker-run
> @@ -29,11 +29,16 @@ declare -a mountpoints=(
>      "$(pwd)"
>  )
>  
> +# We use the PODMAN_USERNS environment variable rather than using the
> +# --userns command line argument because Fedora system may have the
> +# podman-docker package installed, providing the "docker"
> +# compatibility command.
> +export PODMAN_USERNS="keep-id"
> +
>  if command -v docker >/dev/null; then
>      DOCKER="docker"
>  elif command -v podman >/dev/null; then
>      DOCKER="podman"
> -    docker_opts+=( --userns=keep-id )
>  else
>      echo "ERROR: Neither docker nor podman available!" >&2
>      exit 1
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
