Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 199DEC001DE
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 19:28:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A221F8417B;
	Fri, 28 Jul 2023 19:28:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A221F8417B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l2n7qWb-Enbj; Fri, 28 Jul 2023 19:28:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D814280EB6;
	Fri, 28 Jul 2023 19:28:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D814280EB6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DC7611BF312
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 19:28:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B673A80C26
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 19:28:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B673A80C26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TPBGpXaGVbcE for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 19:28:30 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7170C80BD8
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 19:28:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7170C80BD8
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1A1FF1C0002;
 Fri, 28 Jul 2023 19:28:27 +0000 (UTC)
Date: Fri, 28 Jul 2023 21:28:27 +0200
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20230728212827.310d9a8e@windsurf>
In-Reply-To: <20230728045411.1023408-1-christian@aperture.us>
References: <20230728045411.1023408-1-christian@aperture.us>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690572508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8zDQ5cAf9Khvq18UgApz2O0pTXS8uXmvycBVjbgYycs=;
 b=dtzAk78wRl4He75RxUtEn0kbSlI5eDOO0T/byf8Zr8WG9cpcOagHjex7JO1PJQokAqOptr
 ExoVRVP+jgVn8aV++e31JxSYQZ9O0jhu/SXKFXSI460Y/5kp3NnKMOi+WYAEaA/+t8xQRj
 tbZKnBR26n/bHNalilCeISLvYz9Wo9PhfnDWwuBqVwLxid/qiIlXmztET6gk82w/Srz1Ds
 MfNY2igJGvTTOG/X67BagccPCXby9osb3VtWO8VYNdR3VWMnT7VJ8eQL6MUymvNpExxFNZ
 y1YPW7LPCSfwWkriNA00J9+ofZCDi5jWSmmNEnsJ3fHJOHLZjZptq0y+ZaqPhw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dtzAk78w
Subject: Re: [Buildroot] [PATCH v2 1/1] package/go: fix go-bootstrap when
 parent dir contains invalid .git
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Romain Naour <romain.naour@gmail.com>, Anisse Astier <anisse@astier.eu>,
 Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 27 Jul 2023 21:54:11 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> Building host-go within docker fails:
> 
> error obtaining VCS status: exit status 128
> 	Use -buildvcs=false to disable VCS stamping.
> 
> Reproduction of the issue:
> 
> mkdir go-issue-61620
> cd ./go-issue-61620
> wget https://go.dev/dl/go1.19.11.src.tar.gz
> mkdir go-bootstrap
> tar -xf go1.19.11.src.tar.gz -C ./go-bootstrap --strip-components=1
> cd ./go-bootstrap/src/
> bash make.bash
> cd ../../
> wget https://go.dev/dl/go1.20.6.src.tar.gz
> mkdir go
> tar -xf go1.20.6.src.tar.gz -C ./go/ --strip-components=1
> printf "gitdir: ../../does/not/exist/.git" > ./.git
> cd ./go/src/
> GOROOT_BOOTSTRAP=$(pwd)/../../go-bootstrap/ bash make.bash
> 
> The error only occurs when the .git that git detects in the parent directory of
> the GOROOT_BOOTSTRAP is invalid or not present causing errors when running `git`
> commands within GOROOT_BOOTSTRAP.
> 
> Report: https://lists.buildroot.org/pipermail/buildroot/2023-July/671344.html
> Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/4725186525
> Upstream issue: https://github.com/golang/go/issues/61620
> Upstream PR: https://github.com/golang/go/pull/61621
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>
> 
> ---

Applied to master after dropping the change in go.mk, as you specified.
Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
