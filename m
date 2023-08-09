Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 247F5C0015E
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 21:31:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8B7A417A6;
	Wed,  9 Aug 2023 21:31:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8B7A417A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GxPLXa88tjuQ; Wed,  9 Aug 2023 21:31:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84FAB417A9;
	Wed,  9 Aug 2023 21:31:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84FAB417A9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3B4381BF28A
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 21:30:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2162C40647
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 21:30:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2162C40647
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id crC0e5rYi04H for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 21:30:58 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 00C86400D9
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 21:30:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00C86400D9
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:7f53:5cb:7a96:c3a1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 424D478031A;
 Wed,  9 Aug 2023 23:30:51 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 09 Aug 2023 23:30:50 +0200
Date: Wed, 9 Aug 2023 23:30:50 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Nicolas Boichat <drinkcat@google.com>
Message-ID: <20230809213050.GE421096@scaer>
References: <20230808044047.4065708-1-drinkcat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230808044047.4065708-1-drinkcat@google.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1691616655;
 bh=wT3cV+m9mp4mGsY6iEw1ThX+40lpOU7hwzos//ZEAIo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cJuTVuigRekdNx8BUcyWRUnLxhVkIwLHgfaryu1+nxpEdieNIayT7y1eKn7zuX2h/
 oryUaDJeMx80SNLJ1G1GX8FnnSo3bGR9Pr1VKL2+nrfGpdiMaKYAE1Wvcm2RAPCKeh
 2NAi0OQWzu2YvSu+k0H2SdVPH5U6Sq5suHmdN7do2nueDhHm9c2ed5ttgQdE43UfPP
 jDwRchjgL0WJJsGkJ1Vs2zvGNGd/kAF5K7SQzXG/Sh2Gutv9VokTqnO05thiFeruaE
 hVHkYxZYVWn3Y4QAayedqpuuN//nQ4WnQWdij6VXfLmhgWx7lqOwWa8fNct+EuK67s
 F293hbEf/34TA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cJuTVuig
Subject: Re: [Buildroot] [PATCH 1/1] utils/docker-run: Bind mount
 .git/objects if needed
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

Nicolas, All,

On 2023-08-08 04:40 +0000, Nicolas Boichat via buildroot spake thusly:
> If buildroot is checked out as part of a 'repo' manifest,
> docker-run doesn't fully bind mount the .git directory, leading to
> commands such as `utils/docker-run make check-package` to fail.
> 
> Signed-off-by: Nicolas Boichat <drinkcat@google.com>

Thanks, I've included this in my respin, after adapting to some rework
of mine:

    https://patchwork.ozlabs.org/project/buildroot/list/?series=368134

So I've marked this patch as superseded (the new one stil has you as
author!).

Thanks!

Regards,
Yann E. MORIN.

> ---
>  utils/docker-run | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/utils/docker-run b/utils/docker-run
> index ab95e61e84..6a58db6d9f 100755
> --- a/utils/docker-run
> +++ b/utils/docker-run
> @@ -32,6 +32,12 @@ if [ "${GIT_DIR}" ]; then
>      # path already (in a wordir), then that's a noop.
>      GIT_DIR="$(cd "${MAIN_DIR}"; readlink -e "${GIT_DIR}")"
>      docker_opts+=( --mount "type=bind,src=${GIT_DIR},dst=${GIT_DIR}" )
> +
> +    # 'repo' stores .git/objects separately.
> +    if [ -L "${GIT_DIR}/objects" ]; then
> +        OBJECTS_DIR="$(readlink -e "${GIT_DIR}/objects")"
> +        docker_opts+=( --mount "type=bind,src=${OBJECTS_DIR},dst=${OBJECTS_DIR}" )
> +    fi
>  fi
>  
>  if tty -s; then
> -- 
> 2.41.0.640.ga95def55d0-goog
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
