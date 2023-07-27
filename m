Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 985CFC001E0
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 08:14:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D971E40960;
	Thu, 27 Jul 2023 08:14:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D971E40960
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZtlVBkGvoi1Z; Thu, 27 Jul 2023 08:14:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D390408FC;
	Thu, 27 Jul 2023 08:14:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D390408FC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 250111BF59C
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 08:13:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B720408FC
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 08:13:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B720408FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YXYFa2OudI80 for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 08:13:58 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6AF39408CA
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 08:13:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AF39408CA
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D6EF461D59;
 Thu, 27 Jul 2023 08:13:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8643C433CA;
 Thu, 27 Jul 2023 08:13:55 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20230726212009.221147-1-thomas.petazzoni@bootlin.com>
References: <20230726212009.221147-1-thomas.petazzoni@bootlin.com>
From: Antoine Tenart <atenart@kernel.org>
To: Buildroot List <buildroot@buildroot.org>,
 Christian Stewart <christian@paral.in>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 27 Jul 2023 10:13:53 +0200
Message-ID: <169044563315.6100.13848963115642161448@kwain>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1690445636;
 bh=J4fIPL74KdCybork1BkfBSjGVG4RDhYdYjlRn+wTrqM=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=ZEjzSP9yDopY7LUNXmyBcr7Zss6RL6luMDMFfdw4QJtoY508EPHJvhrBdx9brIbBu
 FCpooBv4qfXqKi4ZblqbPIKgG41CKmBOF1erGm1tuSE45kS//sBakyqMlykeaYKC+H
 09N+UZRVRY/GKBXRHhoxPBg6OKElZ/NHX07s/sSLbpZnzonlIXLP9ClQU6NLtRVXp3
 3+w/eoTziq5/n+veZ23WuhMrC1UFwQhIZ8DPpa8lCGxB7LFYFSvycQZmYO0J8NhpYf
 p7uBf0QvAurD9ZJCQvyqyt8vcIFT/xl00PV0AUT6XGnjKri5OXrzSKUWN49D3gIofk
 EVH+z56ieTVQw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=ZEjzSP9y
Subject: Re: [Buildroot] [PATCH RFC 1/2] utils/docker-run: make it
 compatible with SELinux
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

Quoting Thomas Petazzoni via buildroot (2023-07-26 23:20:07)
> 
> diff --git a/utils/docker-run b/utils/docker-run
> index 17c587a484..eee1aad7a4 100755
> --- a/utils/docker-run
> +++ b/utils/docker-run
> @@ -12,8 +12,8 @@ declare -a docker_opts=(
>      -i
>      --rm
>      --user "$(id -u):$(id -g)"
> -    --mount "type=bind,src=${MAIN_DIR},dst=${MAIN_DIR}"
> -    --mount "type=bind,src=${GIT_DIR},dst=${GIT_DIR}"
> +    --volume "${MAIN_DIR}:${MAIN_DIR}:Z"
> +    --volume "${GIT_DIR}:${GIT_DIR}:Z"

Using Z will label all the files in MAIN_DIR and GIT_DIR with a private
label and IIRC that means relabeling all files each time a new container
is started; which can take quite some time if there are lots if files in
there. However z can be used to label files with a shared label and they
won't be relabeled after the first run.

Antoine
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
