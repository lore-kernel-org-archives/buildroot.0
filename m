Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77567CC6B03
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 05:58:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D37E6073B;
	Tue, 13 Oct 2026 05:58:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YeMJmPcp9V-h; Tue, 13 Oct 2026 05:58:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 495A460629
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791871113;
	b=Fx/7rmUx2Rh7nSf4DiDs2gl9AWJOuoTIWv/xkobmXFdgASrecs63ciIDaCeIeNLUQBdc
	 2+q120X4siGWuMXFlo/95AoyDQaWhVUe3E7O4I9vPoVby70hCtBhr5HPvu+7qmp9MVUVH
	 FIhqbEiJY8FUQrtbIAYaVdtpo1wwTzeEN/x84QPembiuoNOYfaDW1/W7NMgoftiuOiYz7
	 zzbpM9miZ/jyYDSCX3CTDEpDf+Bcx+9F77ZxLbrI3zEKjv1wNlZx2c/SMEqqO998W3WQq
	 L+yLYgWBWrPFjKcAyskTNFHACQjHIL9UsAX/3N98wZaGS1V2C2uV1fhgZpOm8XUJI/Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791871113;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:In-Reply-To:References:User-Agent:Date:Message-ID:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=1XqAh1QSKNI13ZBlCQ0ZGaOOvO7+6MhcvFMCp530btY=;
	b=BGV5+mKhm2SI8eHYmidV9MBV7SLk5ixthlSS768kpM88zKlKHM9t+IY2jI/ZLh0bC3Et
	 ekwB2+cpwP0AnJp7NgjqwIuw7kA6avMAshbSrbtEfUrmAusND5nQq6go9YOtbNBbmEHsR
	 EPFI1P/jKBYI8PzGch+se3SJ+tCmd+TA3brBt8OBbWyHO/P9X9YIKZpvkIkjZIO0iOdf9
	 UauIrWaLe8e+nFNLnf9tvEafTXsXBLxSNEaD5k3pMinNiBzaBu/Aq7t6lXof9TsY80CNk
	 Mdvvqc1LVJ5ELstwe8PBZ+sPixoT9VKfBkTtsiHaNRpgYNdxSgD5BLMgwLI0ekzkasA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791871113;
	bh=1XqAh1QSKNI13ZBlCQ0ZGaOOvO7+6MhcvFMCp530btY=;
	h=To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cSTf4cFfW8Kl8Kz4vDichZViRC2n818xuvi9E5XKACxNEe8dOZ9/0HxANxAGhTH4e
	 k6X7hHtWiQatf8Kbj7/ihs99sIjaC3TVMz0o0xFhfnJbp9p3r52kLN2vaKBr+sueEz
	 9YjpfWmEoFwYysAz0kerCBpddhxMp2y1/rwgf4FkrNGeQZ0PYiKPMAmuZMgs/GqE6Z
	 l+dNbMTSpiDls6W9LVRFX1NEoJBquvMF9M3MDNftiqLrkgqr1y4ZGUrH9s84erVwcr
	 3eAPANL9z1TJ1N//kLVuBo3hAj8MSHbT52lFuri3H/8D9sAIYppa6LYyoQ1viC95ZL
	 l/8cDSaL6MzAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 495A460629;
	Tue, 13 Oct 2026 05:58:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F5441E9
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 05:58:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9CAC88089E
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 05:58:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xKOh7T--x_1C for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 05:58:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8E48280892
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791871111;
 b=A6RDRvQAIqCS+NJp+HoxRCuf6/ccfOCzj1vW+jy49F6c849TstdWvMhrX2NaJvjQ+xWF
 MrOCDt1WFJv+si7ASXjYY5JGyF5s7QyO1ypDf3dPvFsj7rbDPE1bLmuv3Fx2EbYwiZiNE
 H3d6n/qzHt7rOdqzMVy0vSQASIInF7m3Pu7iZIQ46+eBylPWaOl4GjG/yEDlT0g51XBdS
 dDBpipP0eJCldVgZJo/0XxZrwIOui/ncU+D2FvOT50ElPxt2fM3BgoT6wlcy7j+qg7kMj
 eU6iEVOANBaqdF+GG20wajf0zSC3yOuwRUeL3W8L/mNcw4f5pZY0ZJR7P70CGpEJTPA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791871111;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:
 References:User-Agent:Date:Message-ID:MIME-Version:Content-Type;
 bh=5Z7Vwg4nfnVkipfQ7wHh4rlOkJkkteVOFuxaOy/jlAg=;
 b=mIXgI0rrMF3bQ7MBTORz4JLCxmTmvqD8Kn4ACIjbQDGyVYAY7pwV1lkYsjcJEvPd6r9u
 fNj8evRaJAOlqFbiq7gvjaIWPCJbXYsnORymRsb9h38caj0tBuPQXuzUin6zSCSmflvfu
 ypmO29eQAA2mANIV86Qx0UY0DHm/q12hXQDwN+vH5Yki8qAPok+wTl2FjWI5qQi8/cHug
 98Lqg9xBCdCAv0QA0BDLvAt5o8UukB0SoppfsxuIKOf+VBxSSan4H6fWemJJdJoKZcvZz
 2kRvdN+wMrkZsgoQPPUfus6laaJywzF4R5GR/oSDxq7cikhjLI5Ae3nDCSldADlvTKQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=tkos.co.il;
 dkim=pass header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=e4EOuIIG; 
 arc=none smtp.remote-ip=84.110.109.230
Received-SPF: Permerror (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8E48280892
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 05:58:30 +0000 (UTC)
Received: from localhost (unknown [10.0.8.4])
 by mail.tkos.co.il (Postfix) with ESMTP id 68BDC44046D;
 Tue, 13 Oct 2026 08:57:17 +0300 (IDT)
To: Arnout Vandecappelle <arnout@rnout.be>
Cc: Titouan Christophe <titouan.christophe@mind.be>,  Titouan Christophe via
 buildroot <buildroot@buildroot.org>,  ju.o@free.fr,
 thomas.petazzoni@bootlin.com,  git@jdknight.me,  thomas.perale@mind.be
In-Reply-To: <505a5107-4e45-4b46-92c0-e4cd10025e9a@rnout.be> (Arnout
 Vandecappelle's message of "Mon, 12 Oct 2026 12:40:12 +0200")
References: <20261010201508.963412-1-titouan.christophe@mind.be>
 <20261010201508.963412-4-titouan.christophe@mind.be>
 <877bjo425e.fsf@tarshish>
 <58a1eb0e-91e4-4810-a13f-26cc2f1bc625@mind.be>
 <871p9v4fpl.fsf@tarshish>
 <812cdd41-61b0-4f4a-9258-72ad40699895@mind.be>
 <505a5107-4e45-4b46-92c0-e4cd10025e9a@rnout.be>
User-Agent: mu4e 1.14.2; emacs 30.2
Date: Tue, 13 Oct 2026 08:58:28 +0300
Message-ID: <8733ua2lbv.fsf@tarshish>
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

Hi Arnout,

On Mon, Oct 12 2026, Arnout Vandecappelle wrote:
> On 12/10/2026 10:35, Titouan Christophe via buildroot wrote:
>>>> This is a tradeoff, really.
>>>> On one hand (A), there is the risk of breaking the functionality of a board by
>>>> bumping from one patch version to another.
>>>> On the other (B), any new Linux patch version brings a handful of security
>>>> fixes, and this happens on a weekly basis.
>>> The basic question is what are these deconfigs meant to achieve? My
>>> understanding is that defconfigs demonstrate hardware working with a Buildroot
>>> generated image. For many users this is the first Buildroot step. Hardware
>>> bring-up is non trivial, and defconfigs preserve a known working state for a
>>> given target system. defconfig is only an enabler for new users.
>> Indeed, this discussion should address the intended role of in-tree
>> defconfigs.
>> My personal opinion on this role:
>> - They provide (as you say) a first entry into Buildroot for many users.
>> - However, I believe they should build a somewhat up-to-date system, and
>> demonstrate ways for users to keep their boards up to date.
>
>  Another way to achieve that is to add a HOWTO to the docs that explains how
>  to use a defconfig. Something like:
>
> 1. Find the right defconfig.
> 2. make foo_defconfig; make; deploy
> 3. It boots? Joy! Now prepare for modification.
>    make BR2_DEFCONFIG=<my own defconfig> savedefconfig
> 4. Switch from the custom kernel to the corresponding LTS branch and test.
> 5. Switch to the latest kernel and test.
> 6. If it works, fixate that and contribute the change.

For the record, I like this direction. Especially if steps
(4) and (5) become as easy as possible for new users.

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
