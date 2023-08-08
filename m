Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4FB5C001B0
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 20:51:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1ED9E41748;
	Tue,  8 Aug 2023 20:51:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1ED9E41748
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MF7V8EDwoAXS; Tue,  8 Aug 2023 20:50:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AF7A4174F;
	Tue,  8 Aug 2023 20:50:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AF7A4174F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1292C1BF5E0
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 20:50:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED22B60B8E
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 20:50:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED22B60B8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hUf4_fJaHZ0a for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 20:50:56 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 00B02606A0
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 20:50:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00B02606A0
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:7690:354b:c655:f7b2])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 2E52F780344;
 Tue,  8 Aug 2023 22:50:48 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 08 Aug 2023 22:50:47 +0200
Date: Tue, 8 Aug 2023 22:50:47 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20230808205047.GC421096@scaer>
References: <20230726212009.221147-1-thomas.petazzoni@bootlin.com>
 <20230726212009.221147-2-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230726212009.221147-2-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1691527853;
 bh=3wIGilrqAJaL94jSEEwbS0gt9ccVFEgAj/b3O9BKzZ0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eV0nu00qmkmH8r9Ki0Wl6cbDG3mSrEYngkufLEapoW+SYyG6x1tbBRh4IC9/1H9fw
 q8ivH81aXEIrXfd92TQcjEiaaGJsvyvuXDAUUf7sYcyMnW2koKwIr3kT9JZ8+Xp4Y8
 7JlbV0rLWEbwkLr8FEfdr0KiA2rOf4cej2HnfBzLqwfGz+cHKGBZbiW1V5RCPHSMOz
 DkaIj6BDaB2WsnmZHWxusapW9sjjukcZFhq8mqSCBZx2O/5QyU04ZgQbpyeDQo/D6E
 Wtp4M4swChJu2R0iImv5aUib9ZAn8CXHBuKgcL+O7z23Nko6mQGCzTDU4AqWZETcnt
 G4sU82vXRVUfw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=eV0nu00q
Subject: Re: [Buildroot] [PATCH RFC 2/2] utils/docker-run: mount the
 download directory if specified
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
Cc: Christian Stewart <christian@paral.in>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2023-07-26 23:20 +0200, Thomas Petazzoni via buildroot spake thusly:
> If the user has defined $BR2_DL_DIR in the environment, it would be
> nice to have it accessible inside the Docker container, and the
> BR2_DL_DIR environment variable set to access it.
> 
> This commit does exactly this: it mounts the host $BR2_DL_DIR as /dl
> in the container, and sets BR2_DL_DIR=/dl in the container.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
> Here as well, opinion from Docker expert would be useful. For example,
> with this change, the files added in the download directory are owned
> by $USER:docker and not $USER:$USER as would probably be expected.

Here, with --mount, they do belong to $USER:$USER...

So, I guess your issue is that /dl does not exist in the container, so
it is created by the docker runtime and thus group-belongs to docker,
and the SELinux labelling means that everything beneath it also belongs
to docker.

Also:

* what about files that already existed before: are the chgrp-ed to
  docker, or do they retain their group?

* and from within the container, whom do the files belong to?

Regards,
Yann E. MORIN.

> ---
>  utils/docker-run | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/utils/docker-run b/utils/docker-run
> index eee1aad7a4..6ea4311c68 100755
> --- a/utils/docker-run
> +++ b/utils/docker-run
> @@ -20,4 +20,8 @@ if tty -s; then
>      docker_opts+=( -t )
>  fi
>  
> +if test -n "${BR2_DL_DIR}"; then
> +    docker_opts+=( --volume "${BR2_DL_DIR}:/dl:Z" -e "BR2_DL_DIR=/dl" )
> +fi
> +
>  exec docker run "${docker_opts[@]}" "${IMAGE}" "${@}"
> -- 
> 2.41.0
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
