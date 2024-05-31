Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 340CEC41513
	for <buildroot@archiver.kernel.org>; Fri, 31 May 2024 20:09:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D07DD41869;
	Fri, 31 May 2024 20:09:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6z5LKvlG8gqW; Fri, 31 May 2024 20:09:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8ED1C4186A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8ED1C4186A;
	Fri, 31 May 2024 20:09:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 404EB1D5762
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 20:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2AF6881EF3
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 20:09:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AHZ1P2_Po9Ob for <buildroot@lists.busybox.net>;
 Fri, 31 May 2024 20:09:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1CB84817B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CB84817B3
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1CB84817B3
 for <buildroot@buildroot.org>; Fri, 31 May 2024 20:09:17 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 4F58013F8A7;
 Fri, 31 May 2024 22:09:12 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 31 May 2024 22:09:12 +0200
Date: Fri, 31 May 2024 22:09:12 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <ZlouaKs-LeeUbKc-@landeda>
References: <20240531195107.125727-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240531195107.125727-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717186155;
 bh=O9rE31a+45R9ngcrB6sXGNxSt+kQuLueeMYC+624m24=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oPfnuYD5GKWBA3YHiloiNv8CWEEmyCaifj0SnN0/PYAUsepWU/D8pvw6+xvBxdsrr
 FMnk9PvA7ej2/M2DE2ig1Z789UhChqm3qdi2B9zlRAK60wDuUSA2aOaFUfCpay0Hnl
 ajbJzhnkQvYI1wISTF20Xt4tTfoMGwyjxRYeftqRZE9nt28hZybPLd+xlT+58D8SJf
 7ZCXxSZJf5/JEju/x8wwnho1LH5Klfb6ky1KrvCcxv1eYpnNO9utUFMh7twJlJ7XSA
 r6BYJGnFVaD6GVZDtkmyz2HldbTBVSRaVetnqZznqwBDBOxfABKLuXJ2Bz0f1yYD/C
 YPEZs2dWGLWqA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=oPfnuYD5
Subject: Re: [Buildroot] [PATCH next 1/1] utils/docker-run: check for podman
 before docker
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

On 2024-05-31 21:51 +0200, Julien Olivain spake thusly:
> Commit 9a629f5 "utils/docker-run: allow running with Podman" added an
> option on system providing the podman command. This case is mainly
> for Fedora systems.
> 
> Fedora repositories has a podman-docker package, that provide the
> docker command for compatibility. See [1].
> 
> When this package is installed on a Fedora system, both the docker and
> podman commands are available. Since the docker command is checked
> before podman, the --userns option is not passed in that case. This
> brings "permission denied" errors.
> 
> This commit inverses the command check order, to check for podman
> before docker. This makes sure this mechanisms will work when both
> commands.

When I applied the patch, my reasoning was that we wanted to keep
checking for docker first, to keep the current behaviour for those that
have docker-the-real-thing installed along with podman, to avoid any
surprise. So I think we should keep using docker if it is installed,
even if podman is installed too.

So...

> Note that the same behavior of the --userns=keepid option can be
> achieved by setting the environment variable "PODMAN_USERNS=keep-id".
> See podman-run man page [2].

Why can't we export PODMAN_USERNS=keep-id, and keep the ordering, like
so (elidded for brevity):

    if command -v docker >/dev/null; then
        DOCKER="docker"
    elif command -v podman >/dev/null; then
        DOCKER="podman"
    endif
    exec PODMAN_USERNS=keep-id ${DOCKER} run blablabla

That way, we keep to using docker first; if that is a real docker, it
would just not act on PODMAN_USERNS, but if it is podman-as-docker, then
it would honor it. If docker is not installed but podman is, then it
would also honor it.

Thoughts?

Regards,
Yann E. MORIN.

> [1] https://packages.fedoraproject.org/pkgs/podman/podman-docker/
> [2] https://docs.podman.io/en/latest/markdown/podman-run.1.html
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  utils/docker-run | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/utils/docker-run b/utils/docker-run
> index 3dcabe2718b..51390945119 100755
> --- a/utils/docker-run
> +++ b/utils/docker-run
> @@ -29,11 +29,11 @@ declare -a mountpoints=(
>      "$(pwd)"
>  )
>  
> -if command -v docker >/dev/null; then
> -    DOCKER="docker"
> -elif command -v podman >/dev/null; then
> +if command -v podman >/dev/null; then
>      DOCKER="podman"
>      docker_opts+=( --userns=keep-id )
> +elif command -v docker >/dev/null; then
> +    DOCKER="docker"
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
