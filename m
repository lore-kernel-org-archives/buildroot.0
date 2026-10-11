Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9948DCA9EBD
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 19:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93AB76069E;
	Sun, 11 Oct 2026 19:10:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id baDfeLBZtZQ2; Sun, 11 Oct 2026 19:10:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6390A6061E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791745821;
	b=N53enfCIA1OxvEEqOkijnqlxD+IEHe5zFbFwvZ1kgamaJhK02XuMtmYgn8PFhkllz10W
	 NTK3rhRhjR5Tfa7tK8MyW6qq/EySMoIsm+lXOVyzg2tOQh5soRvJ8fcZvTMGzB9gJpLno
	 pTAedSOpCeX5J6SHxxflhtKp6UbkqkLIFSgvOnL/t2rGj+wRg73bIt/TfrBuoz8wfY4nk
	 5FVVmgX/sao64/SrQ1StXLyy8ehOzl8VoFuuuJ8anpwtZSvA0NTWzn8hFt8MDI4LwSNwh
	 u1wpplPdzmDgT9dNqeqVV0fRfHwWQeffQilMqB7dAhrbC6oI8dmuR3x/We6/shzSjHw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791745821;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 To:Cc:References:Content-Language:In-Reply-To:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=6HUZVhKl6jtyj0+RPWXgc4b88ogvwhxOzSbbD/OSpiw=;
	b=bUgZj/SJ2BQ9knHV+g/i0LnKzmcWsj1/taiy1lZVapqgt+WGfclAkPlxkTaIHITi+AOb
	 lYUVHWD8pc2Jt+rehZK3JVLg5Ey5YEGVD+Qqo34QhErX22l0JpYQYdlaRiaY7EhWYr5bq
	 sgcvdRayrbHyQ+EunMkvt7P3EmBtjH65P+lOkbFgfw5+ve0pJJ+vCuFagUN/idXKcAauN
	 lQPCm6pbp2ogw6FtRCvpVU3yURbcKAHZFcIzBjnDttDyyIxDdxM+A/TJ6kFGZ19wlDPTo
	 +GCbSRHcytVH4PoRAXHhPrPAXd8Cv4A3pu79KEru76GSCKokPIVUPvufkQRVjr3ScSw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791745821;
	bh=6HUZVhKl6jtyj0+RPWXgc4b88ogvwhxOzSbbD/OSpiw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hXq22n7s7e68ntq0zlgzHSWxUOjl7VziFn8ZK8V54Q/PDJxH6xnI4+zP6hlbjQVGO
	 5Pgt1C1/f4Q2fOPc0IGsf0cQAsnYkmCwfKleXEdYoOBApTyLeOM1aCLxuNHLaOMEdi
	 Y8P0HMT7wrMPNNZzZZkf+z2lIzQU7kfvoCBhLlltVOyNU9oA9JrLnhQ3sGSz0e9tBg
	 nnRdwGoHV4m5G0RUsStjyOUb4pVY3KAO+0eKGYgSfA940gyVAnxH3MameiYNhFzUMS
	 rzPITJ6Qe1Ih4tmiw3NgwBVpOXp5pjO6BuQ1SSMi+LzdHZPbfwgLyw2Q9NN8YNBze3
	 kU3ybjXohNE+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6390A6061E;
	Sun, 11 Oct 2026 19:10:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FD9875
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 19:10:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 75F11405F0
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 19:10:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id trn-yo5BXPkl for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 19:10:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 67006405EF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791745818;
 b=sixg397pVl8EKT5kXkNGLuA4R7AMZEbsiQvlMF9jpxzXwMtbAN+oMMI97L2XgRnqC21M
 tBpiSDCxirq40eRZF4tuKDaghOLLOpEV5alNBZ0LKCayxwvlLjBRuW2ijGcasmWP35+Hf
 kpYEGmHhee8Byt4/44mj00o0mgF1O6IakNgqhULVkNctt46GitUoWAMMZGRY1AJUzVRPP
 jE9pSpDHAA2xx4L7VsSBZnff326T/IRtWWzhZJ890ZeqfX3dx0NLwY6uiyxC4a5M97Zog
 P5tqeKIwN+hu+T2UEAvlqw+mTC5LU01IWJtK10iL7cnleKc3gsRcZWv6fK5UPvNHfXQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791745818;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding;
 bh=YJ3Rk3UKhbVms2pzNxD1i5Xkn2ZCmq58MIG3ns79xKg=;
 b=ESos0NAZqq6wfOBGlIWFkDKziu4GKO6dVx9PaAIY5r8h2tTyLaj/SwQ0szFnTNWYpC6R
 eb2Jswlt/kaE17pIqJsQPQLmC9CPavLSBmh4sOdVABT8uCYlWii0xz2/H6NlDtBAGRHi7
 fzXdVSf4ZNS2ZLwp8fYEeX2tOPxSjoaMOlRlKPABFoOCa978PYsMJ1soFooRVEqJlBwcA
 I0zST3FGbQc0ee6s+y3/IIbqGGqxgdDQBGTS0iSrfLAF5ENAe0yJ7rm/I0uDvfQ9qqQyZ
 dwlknQr016V+dFnaFiW/TvEg5IXyaHUfg9Po4++qc9m3BJyZWsK0k7248KMqzJYbx+g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=TpOFaQq2; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::329"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 67006405EF
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 19:10:17 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4a166199820so7233745e9.1
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 12:10:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791745815; x=1792350615;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=YJ3Rk3UKhbVms2pzNxD1i5Xkn2ZCmq58MIG3ns79xKg=;
 b=vzXyDPXZBGfp0LclwzdwUT4BZn+PDuEPSlVwL7EsOhbGlUCSYGP+5nADmn+FmRBvS+
 ZZahrj+cT4hkZ8Ey5eOeW74k4YhQNUT2HEJnFI+aQyynDyfxUzEHoVlREiUKAKcKk76D
 4pLALwIEr5wSX5BCPBBRBOF3cqn3f+rwIueqXSm+D8kab0bqIlWawk3Yr4BKH5B57D44
 faxjJe4e7Cc5ECpkC0lmk+hDYfAVt86cHXqCGnsBBBgj+GgVrXD8aeo1w/z19D/urH/2
 cJlVCt5uz8hBZDwoS6pWAH8y+DKsJiCXiVYo5zwRXfWFJjRRq6q2K7yNqgee2UkpCZsJ
 diJw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzcOhTP0oNToygVgDKNaz8rq/trzLsRXhttn8iQngzJ8rM7QoGmocf97A+oPo61do+aC77SwPE3wz8=@buildroot.org
X-Gm-Message-State: AFq9FYJeV2/xC5AtJI3PnLLlc9rHypfiOp8fUPHisq8EzopCRtFjdYYY
 kTpv9uLA+g81n4OeuPKCxGEwxTw1FF351DiyCZFKY+yBTZmgs4l+R//VCG2zrCS2xrM=
X-Gm-Gg: AYBFou353QI83wQWW7LMTrmlJhpK47xaOStZCeCBje4w4HOkRdl4+yUe44ydezDV+Oe
 rB1eDHztkc1+E8tWlAW+tdaGIkF/LunwTMNs4T7LsmzVmLYMAFscfBebzdME+MNRYy82LrP6kNK
 RCq2bWCK7UkCi54FR67jGrjErmPqbj+iGWuAhqByqEfLMlm5x5dFVwhp2YgSdFHlGuWP4N9DAet
 har/PmwhEXFnP1vKonkM6X+MDgCOjiuw3aAHC75hyqtvn//qd6gtlJR9WYPn7NBtpxlDb4ef++s
 k0x+OEXXS62pGvy/EsKhGUee1H7HXsMQ/DCxROJ8XMex2oAkj3+zXIOrHaBeY1JMhciLskEo6yv
 fqWtgnVc4f+SXsDctsgJQ2Hp9K3hAh9d822ocHL8XqpZaDIW37J6lH4EXJEIqweTCWUhKXbA9n+
 Sir+hjZIFJI7eXjdqndF4PiHqlhvnwB7P8L21Leqcc3YDaTnJTsqSptpPgESe4pYDpcwcWPhqLB
 rxP0AkbB8uYCnRPeju/pIHymMoFyuRxrV8my+/KJhSSL5Sl
X-Received: by 2002:a05:600c:c051:b0:4a0:ff8:2a0e with SMTP id
 5b1f17b1804b1-4a18dcb4973mr98906495e9.3.1791745813818; 
 Sun, 11 Oct 2026 12:10:13 -0700 (PDT)
Received: from [10.20.174.153] (ptr-94-109-186-101.dyn.orange.be.
 [94.109.186.101]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9acf12bsm15739062f8f.46.2026.10.11.12.10.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Oct 2026 12:10:13 -0700 (PDT)
Message-ID: <58a1eb0e-91e4-4810-a13f-26cc2f1bc625@mind.be>
Date: Sun, 11 Oct 2026 21:10:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Baruch Siach <baruch@tkos.co.il>,
 Titouan Christophe via buildroot <buildroot@buildroot.org>
Cc: ju.o@free.fr, thomas.petazzoni@bootlin.com, arnout@rnout.be,
 git@jdknight.me, thomas.perale@mind.be
References: <20261010201508.963412-1-titouan.christophe@mind.be>
 <20261010201508.963412-4-titouan.christophe@mind.be>
 <877bjo425e.fsf@tarshish>
Content-Language: en-US
In-Reply-To: <877bjo425e.fsf@tarshish>
Subject: Re: [Buildroot] [PATCH 3/3] configs: update defconfigs with custom
 versions to BR2_LINUX_KERNEL_LATEST_X_Y
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Good evening Baruch,

On 11/10/26 18:45, Baruch Siach wrote:
> Hi Titouan,
>
> On Sat, Oct 10 2026, Titouan Christophe via buildroot wrote:
>> Update all defconfigs that are using a custom Linux version based on a
>> longterm supported Linux version so they use the newly introduced symbols.
> This is a significant policy change for Buildroot. The configs/
> directory is meant to carry configurations that are "known to work",
> according to adding-board-support section in Buildroot manual
> (docs/manual/adding-board-support.adoc).

Thank you for raising that concern ! I am currently preparing a v2 of 
this patch (with many other fixups), and I will update the manual 
accordingly.
> Automatic update of the kernel component without actual hardware test
> risks introducing regressions that make the system unbootable.

This is a tradeoff, really.
On one hand (A), there is the risk of breaking the functionality of a 
board by bumping from one patch version to another.
On the other (B), any new Linux patch version brings a handful of 
security fixes, and this happens on a weekly basis.

Now onto practical considerations and my opinions:
- From my understanding, (A) is not very frequent when bumping from one 
patch version to another. It can certainly happen on a specific board 
from time to time, but this is definitely far from the general case. If 
you (or anyone else) have some recent examples of such situations, I'd 
be glad to read about them. On the contrary bugs in core components that 
would affect all boards, such as the ext4 corruption introduced in linux 
6.1.64, would be more easily controllable tree-wise with such a mechanism.
- We see that many boards in the Buildroot tree are updated very 
infrequently, and are using old kernel versions, sometimes lagging more 
than 200 versions behind (see for example 
configs/minnowboard_max_defconfig). This is not a good sign for newcomers.
- Each kernel version bump for a single board is a patch that has to be 
reviewed and applied by a maintainer. I believe their time is better 
invested into patches that need actual effort, especially given the 
current patchwork backlog
- From my LTS steward perspective, it is practically unfeasible to apply 
linux version bumps on the maintained branches, because their minor 
kernel versions differ from master. On the other hand we try to deliver 
on the premise of improved security, hence getting security updates in 
due time.

With all that being said:
- Linux kernel versions are still stated explicitly in Buildroot and are 
bumped with patches that follow the usual review process. They would 
only be declared in a central place.
- It is still possible to pin a particular linux kernel version to a 
board with BR2_LINUX_KERNEL_CUSTOM_VERSION if needed
>
> For this reason adding-board-support section also says:
>
>> Always use fixed versions or commit hashes for the different
>> components, not the "latest" version.
> If we intend to change this policy I think we should discuss the
> motivation on the list. In case such discussion did take place, this
> comment should reference that discussion. In any case, the manual should
> also update to reflect the current policy.

I indeed brought the discussion in person with the maintainers that were 
present at the Buildroot Developers meeting after ELC, but I should be 
more verbose in writing, I will pay more attention to that in v2. If you 
have anything else to bring to the discussion, please let me know as well.

Kind regards,
Titouan

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
