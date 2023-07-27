Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3841AC001DC
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 10:50:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D724C41E52;
	Thu, 27 Jul 2023 10:50:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D724C41E52
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UmQuo_BGlVkF; Thu, 27 Jul 2023 10:50:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCA0041C6C;
	Thu, 27 Jul 2023 10:50:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCA0041C6C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AD2D11BF40B
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 10:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9456483595
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 10:50:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9456483595
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D7XRswWSTkT0 for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 10:50:23 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E2FED83544
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 10:50:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2FED83544
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AC94E61DF7;
 Thu, 27 Jul 2023 10:50:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C53BC433C7;
 Thu, 27 Jul 2023 10:50:20 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20230727122449.3b7993c6@windsurf>
References: <20230726212009.221147-1-thomas.petazzoni@bootlin.com>
 <169044563315.6100.13848963115642161448@kwain>
 <20230727104821.496f8f0b@windsurf>
 <169045318850.6100.416444363161517133@kwain>
 <20230727122449.3b7993c6@windsurf>
From: Antoine Tenart <atenart@kernel.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Jul 2023 12:50:17 +0200
Message-ID: <169045501791.6100.10586717881840201028@kwain>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1690455021;
 bh=pHrFpLQmlo8OBqkF03CHxqPAOYmUNLVmCy3IyhldV+s=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=E8Hwe3uUyJXSHxpPyGsqux5G2eAEThvMGAP4ldCSzD1hMuSMZKpXPh2TQfh6jvQHX
 R2tCL7SO5f6tbYLSZ2gBeMel+akhal4hPib1DMst53jQFxkqO+zKmdEmEQmhfQeP1q
 cgNWKiArXGS3NxLym4AW40e0hyVaeokFS85k1J5dRTRkiBzMD8+PVthoBj4QP6L4nH
 5igypGSYM/JQ/G3sHSDdX3gVXfcCPIh70AlN8L+4X71P2cS84EkDj6WLBOEzN6dFub
 1p16Xh0PWvg35QxekLDOyCEc4eD5P2Nh+OkpaAJW72eYzVbR06rqruscZCbDJMhEZb
 DfQTnacxrLCCw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=E8Hwe3uU
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
 Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Quoting Thomas Petazzoni (2023-07-27 12:24:49)
> On Thu, 27 Jul 2023 12:19:48 +0200
> Antoine Tenart <atenart@kernel.org> wrote:
> 
> > IIRC --mount was introduced for better consistency in the docker args
> > and supporting names parameters (I don't know the full reasoning but
> > it's probably linked to supporting APIs -like yaml definitions- in a
> > better way?). While doing so they tried to fix issues in --volume and
> > labeling files on mount was one of them.
> > 
> > The issue is both logical and practical: files should be labeled when
> > being created (not when being mounted) and relabeling files "magically"
> > can cause issues (eg. don't `-v /home:/home:z` !). The reasoning with
> > the new --mount option is a directory should be created and configured
> > on the host and then only mounted by containers (hence the directory is
> > not anymore created if not present when using --mount).
> > 
> > So here, idk, not a docker expert :) I'd say using relabeling of a
> > directory that is under Buildroot's control is probably OK. While
> > replying, had a quick look at this and it seems the preferred solution
> > would be instead to use the `--security-opt label=disable` option:
> > labels would be kept in sync with the host and I guess the goal of using
> > Docker here is not for isolating the build but to have a known
> > environment. I never played with that option so please investigate
> > before switching to it.
> 
> I tried --security-opt label=disable, and it works, at least it fixes
> my permission issue, without having to do the z/Z thing. Probably it's
> a better option than using z/Z that has the side effect of adding
> SELinux labels on all files being mounted? To be honest, I'm not clear
> on the consequences of --security-opt label=disable.

I agree on not relabeling files if that's an option. Not sure about the
consequences of `--security-opt label=disable` too. My understanding is
the containerized process won't be labeled with a container-specific
label, but they still could be labeled with a permissive one not 100%
matching the user label.

Without having a full understanding of the implications we can still
expect child processes not to have more rights than the parent and
created file labels to match what would have happened on the host (could
you check?). Given the goal is not to isolate the build, my guess is
that is fine and the best option.

Antoine
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
