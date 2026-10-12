Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5CD1CA9EC5
	for <buildroot@archiver.kernel.org>; Mon, 12 Oct 2026 06:04:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 165C340575;
	Mon, 12 Oct 2026 06:04:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FRwC01w_lAcv; Mon, 12 Oct 2026 06:04:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A60E7405E8
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791785087;
	b=GVKWb0wxe1LYt2qRZFjVgKqKTYgvMeuG8p0UunnUQna7bBxXM6IVVtVHvsQIzxJVMCpr
	 vhWylYOF2bu7NPRgfENLq+w+m9/WivRyOTjUAtK3HK6RM4M0LbrwvIS9FN212zdxvd0cc
	 /MBbRiDrQLTOKXgYARiYptZiASiOwHPOExv1SRmOtS+MvVVhaQgtenuNKSDlmAMsHL01B
	 DHmvh8TCRUnqfOtXcS5HcoAa1WtkoD0fEpRlVlRMx6d9iEzQeqfeVbFqQIw0s7Jnup4Eh
	 zasofv/g7V2cJXajWoy/cUf9V40xGVI1gm4IEfeNjqRk5G6uNXGLf3RdLRSvUB0VwBA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791785087;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:In-Reply-To:References:User-Agent:Date:Message-ID:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=rYvW8XSm9RNAFFDt+kXRoS68eyaOSAYOCOAeEXUEUm4=;
	b=CFpZUu7CKV1eolMXlL1HvAaZk8Vk4zTW5IrjcGvp+CvjjfnzRd0Sfgyn7yggDjyxN/QJ
	 cDN+e/3iqVWkZILGF4VeuxJJyERY2RRA76XfmgXHtodOhijspJC58yA0mqFjqCLhioG9N
	 1TxS4EI0MlyOaomz7v0kHxnGdqU8oOdlZUAEtEze3qOsXfsYNQpPjgYqfowgPCxBqxctw
	 L0adntf6X329bg6ncqC28e78uXx71HqbcGAquFoWLspP2e/H57yvtwkwpKs6qPpOk1Zjc
	 gXdZNQbHDThwqO4rmgSCi5OGLlnKluRoRuOfWF11EtAr0VTJvxf1A7GMn5V6YMF4GOg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791785087;
	bh=rYvW8XSm9RNAFFDt+kXRoS68eyaOSAYOCOAeEXUEUm4=;
	h=To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SBCqQqEt8DEb5L1PyoUDrKNgvEU+EVkrV+QTReoMXEnEcNlHLOh6BifHJNEMzzz5I
	 Dmo2UbAqYVkLZmHS2LOSt3MoE6dqOlfr0J2TTEAKmAykvlo71I/D0NhlA1elUisrht
	 vDEBRGCmjLasGs8FkKCiXUN0gZBfi7pI6fN6Sshk1MJXoFwzd8zRfdZqAk9GE3OmDY
	 HGD38UkIAEfCyV4pK2cjmVCWl4Y9uPLsLXt7Bqe2t1Bkz1pLWL+E3y8IyrSZjc3j0+
	 LpQUR+zaJB9HBPtsl97gHFGfnEKsBQmYSbhXNxmZXScxAHYRLRqP8eX9gATXqnL+ck
	 nlirPadtCaAqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A60E7405E8;
	Mon, 12 Oct 2026 06:04:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 555D91DE
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 06:04:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46786400A8
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 06:04:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2cAnRO9xn21E for <buildroot@buildroot.org>;
 Mon, 12 Oct 2026 06:04:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 29EE64002B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791785084;
 b=gyzQMS5Lwo3x3G7FpTIcqGnyIRvxlveTDlRR0FM3dH8WngkYkXisiVPTNPRkpDx9I649
 5WEV6N2AKqjyn+JJXL1DzrQFVD6vq2+sa9x/h19dQ0/QF1tMhw2v5AtYWB6jbrkvkn19c
 OivTn1JWM+0ZLFubti58vwayqNnJ1Tle9VHLpteSGEZQXVmHtF1+Uc2a4LCIMKadkYp1M
 uap+PsVDvgzKNkpO2Fpf2NDp2+FrN2SVpainSzfOL/8eH3hCVUqB1G//fX8Tfk02E2ZNk
 n9QrGxeVxGzjBDFvJu61hC0lvjbRKCZPNDzIMNnfWN8H/xNfOPVoAP82zaQy4am6HIQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791785084;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:
 References:User-Agent:Date:Message-ID:MIME-Version:Content-Type;
 bh=BKljGOvyjj5b/uSvX89cgGRLw+r/xG4r3Uyhs4ErhK4=;
 b=FM1NdZCK3la+fznMllGzmDBv3a+v8wlFCLuY9zn1KR1utSYinlLckTOfvdqNJDy7VDP7
 unW0SAG9CEX5sQcdUWzg+yd2evJkibdx1nNImiPGRvETDFyLBPQc4Ejr1/+mr6V4nLawl
 wZotIUXd1cXBSPvlHFRtkwaFrwn9Zi8fX8aObSl1bxV4BRLzA+AlQYwSkPCvn5EZ9aXRr
 awnqDd/oQVvUjEYVNn1n5R5O+Vj7crnkFXZMQbo9tpJRCWF6K9qHPo6RD+G3NSjEyiz6Y
 gbBze4KPP5O6/NBNEr1It5Mkjy80VUHdGA7Eu7TQXqnuUf3z2At5j3rc7hvGk3f52bQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=tkos.co.il;
 dkim=pass header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=hEIhpVk9; 
 arc=none smtp.remote-ip=84.110.109.230
Received-SPF: Permerror (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
Received: from mail.tkos.co.il (unknown [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 29EE64002B
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 06:04:43 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id A3D0D44046D;
 Mon, 12 Oct 2026 09:03:28 +0300 (IDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Titouan Christophe via buildroot <buildroot@buildroot.org>,
 ju.o@free.fr,  thomas.petazzoni@bootlin.com,  arnout@rnout.be,
 git@jdknight.me,  thomas.perale@mind.be
In-Reply-To: <58a1eb0e-91e4-4810-a13f-26cc2f1bc625@mind.be> (Titouan
 Christophe's message of "Sun, 11 Oct 2026 21:10:11 +0200")
References: <20261010201508.963412-1-titouan.christophe@mind.be>
 <20261010201508.963412-4-titouan.christophe@mind.be>
 <877bjo425e.fsf@tarshish>
 <58a1eb0e-91e4-4810-a13f-26cc2f1bc625@mind.be>
User-Agent: mu4e 1.14.2; emacs 30.2
Date: Mon, 12 Oct 2026 09:04:38 +0300
Message-ID: <871p9v4fpl.fsf@tarshish>
MIME-Version: 1.0
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Titouan,

On Sun, Oct 11 2026, Titouan Christophe wrote:
> On 11/10/26 18:45, Baruch Siach wrote:
>> On Sat, Oct 10 2026, Titouan Christophe via buildroot wrote:
>>> Update all defconfigs that are using a custom Linux version based on a
>>> longterm supported Linux version so they use the newly introduced symbols.
>> This is a significant policy change for Buildroot. The configs/
>> directory is meant to carry configurations that are "known to work",
>> according to adding-board-support section in Buildroot manual
>> (docs/manual/adding-board-support.adoc).
>
> Thank you for raising that concern ! I am currently preparing a v2 of this
> patch (with many other fixups), and I will update the manual accordingly.
>> Automatic update of the kernel component without actual hardware test
>> risks introducing regressions that make the system unbootable.
>
> This is a tradeoff, really.
> On one hand (A), there is the risk of breaking the functionality of a board by
> bumping from one patch version to another.
> On the other (B), any new Linux patch version brings a handful of security
> fixes, and this happens on a weekly basis.

The basic question is what are these deconfigs meant to achieve? My
understanding is that defconfigs demonstrate hardware working with a Buildroot
generated image. For many users this is the first Buildroot step. Hardware
bring-up is non trivial, and defconfigs preserve a known working state for a
given target system. defconfig is only an enabler for new users.

> Now onto practical considerations and my opinions:
> - From my understanding, (A) is not very frequent when bumping from one patch
>   version to another. It can certainly happen on a specific board from time to
>   time, but this is definitely far from the general case. If you (or anyone
>   else) have some recent examples of such situations, I'd be glad to read
>   about them. On the contrary bugs in core components that would affect all
>   boards, such as the ext4 corruption introduced in linux 6.1.64, would be
>  more easily controllable tree-wise with such a mechanism.

I have seen cases where trivial changes broke essential functionality. In one
case I remember a removed print broke two different network PHYs on the same
board because of missing proper initialization delay.

The current suggestion does not even preserve the original user tested
kernel version. By the time a defconfig reaches master branch, the
kernel is different. If this commit is accepted, I think we should
provide a way to preserve somehow the information of user tested kernel
version.

> - We see that many boards in the Buildroot tree are updated very infrequently,
>   and are using old kernel versions, sometimes lagging more than 200 versions
>   behind (see for example configs/minnowboard_max_defconfig). This is not a
>  good sign for newcomers.

I agree we should remove unmaintained defconfigs after a given time of
inactivity. But I'm not sure blind kernel version updates make the state of
these platforms much better.

> - Each kernel version bump for a single board is a patch that has to be
>   reviewed and applied by a maintainer. I believe their time is better
>   invested into patches that need actual effort, especially given the current
>  patchwork backlog

This commit only saves stable kernel version updates. These patches are
trivial. We can think of a fast track mechanism that allows contributor to
assert some newer kernel version works on a given hardware, and automatically
generate a matching commit.

The point here is to preserve the vital information contributors provide
of tested software.

> - From my LTS steward perspective, it is practically unfeasible to apply linux
>   version bumps on the maintained branches, because their minor kernel
>   versions differ from master. On the other hand we try to deliver on the
>   premise of improved security, hence getting security updates in due time.
>
> With all that being said:
> - Linux kernel versions are still stated explicitly in Buildroot and are
>   bumped with patches that follow the usual review process. They would only be
>  declared in a central place.
> - It is still possible to pin a particular linux kernel version to a board
>  with BR2_LINUX_KERNEL_CUSTOM_VERSION if needed
>>
>> For this reason adding-board-support section also says:
>>
>>> Always use fixed versions or commit hashes for the different
>>> components, not the "latest" version.
>> If we intend to change this policy I think we should discuss the
>> motivation on the list. In case such discussion did take place, this
>> comment should reference that discussion. In any case, the manual should
>> also update to reflect the current policy.
>
> I indeed brought the discussion in person with the maintainers that were
> present at the Buildroot Developers meeting after ELC, but I should be more
> verbose in writing, I will pay more attention to that in v2. If you have
> anything else to bring to the discussion, please let me know as well.

Thanks,
baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
