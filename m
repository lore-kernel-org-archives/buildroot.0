Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1854C0015E
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 10:19:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3285F4025D;
	Thu, 27 Jul 2023 10:19:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3285F4025D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RZ-AG1BffDKE; Thu, 27 Jul 2023 10:19:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D6E24011A;
	Thu, 27 Jul 2023 10:19:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D6E24011A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 70DC81BF40B
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 10:19:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42E4F41F08
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 10:19:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42E4F41F08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t_rdd2Ra_Kaq for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 10:19:53 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 779AB41F03
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 10:19:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 779AB41F03
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 24B2861E01;
 Thu, 27 Jul 2023 10:19:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 184F3C433C8;
 Thu, 27 Jul 2023 10:19:50 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20230727104821.496f8f0b@windsurf>
References: <20230726212009.221147-1-thomas.petazzoni@bootlin.com>
 <169044563315.6100.13848963115642161448@kwain>
 <20230727104821.496f8f0b@windsurf>
From: Antoine Tenart <atenart@kernel.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Date: Thu, 27 Jul 2023 12:19:48 +0200
Message-ID: <169045318850.6100.416444363161517133@kwain>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1690453191;
 bh=xIeF2/0lNa32lhyDxnH8pord7yXbHEv2fZBFiJaHV28=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=ebvCR0KsdqLn+XKItmCejAIytsmi/gxOtTaYlBP8KQes3797nbHnJqkmdEfteP8eI
 Xa3BTlVA8OU07JROCFUAfbmtn7D6SVN8yX9ShOnv3ARgl7SK/vRtlefgHvhYAH9KeY
 giOO9laDdz6PvPmHzAqWR4EPOsoDt8LyvHSt5NoWInNCh0Rrkq5yTWGxJAPc68OYbg
 4H8c3ATJ20oBFiKfACyEGbPvHK4OjDyP36w8yOAvQLS6tkdqSjLYPriY76XWCn5beY
 Bv235Giy7M5y2C5FPtJBS+Q/KoywrYEpvhXY9PkDG5pc37GiH1JsiiC3gL+YmWzVyI
 /2tBOoxcS0ckA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=ebvCR0Ks
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
Cc: Christian Stewart <christian@paral.in>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Quoting Thomas Petazzoni via buildroot (2023-07-27 10:48:21)
> 
> Do you know why --mount, which is apparently "superior" and recommended
> over --volume, does not support this SELinux labeling mechanism?

IIRC --mount was introduced for better consistency in the docker args
and supporting names parameters (I don't know the full reasoning but
it's probably linked to supporting APIs -like yaml definitions- in a
better way?). While doing so they tried to fix issues in --volume and
labeling files on mount was one of them.

The issue is both logical and practical: files should be labeled when
being created (not when being mounted) and relabeling files "magically"
can cause issues (eg. don't `-v /home:/home:z` !). The reasoning with
the new --mount option is a directory should be created and configured
on the host and then only mounted by containers (hence the directory is
not anymore created if not present when using --mount).

So here, idk, not a docker expert :) I'd say using relabeling of a
directory that is under Buildroot's control is probably OK. While
replying, had a quick look at this and it seems the preferred solution
would be instead to use the `--security-opt label=disable` option:
labels would be kept in sync with the host and I guess the goal of using
Docker here is not for isolating the build but to have a known
environment. I never played with that option so please investigate
before switching to it.

Antoine
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
