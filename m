Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41022CA9ED1
	for <buildroot@archiver.kernel.org>; Mon, 12 Oct 2026 10:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B767180BCC;
	Mon, 12 Oct 2026 10:40:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oFYuoSPiHgex; Mon, 12 Oct 2026 10:40:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C55F680BE7
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791801626;
	b=eFFZ3Z/g/YlFBgDzN/Hq/hGSPFsZjHwpGghfHoNqkzPlaLl8FK5fHIX6BtG9MLvYO/SV
	 cZc/MsE9jmoSvOl1+HiKf55YtqRkJ7PS8EMTfQ9o0H1lQdFJRuA/ZSqxFIMabI9pb6cRd
	 IYr/4brayfi6NN9bUUPEEPVwrq+bJRoDNVght0VREL55Jz6PHCneM1dBxYk23S10z0ep+
	 d7Y9dyLyE2R+PdzD03BiAE1p5EGhEUgA7qJIx/5P6UrvWDXH6K06WVPyh5GIys5NiL7NF
	 lbfG486TvTT4aP5KCJRIKK0dVP80N7fiCKxInSjx8sdaonASig8+fzq2h6hn4BpdUVg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791801626;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=qa0zlz5u3xplyFkHT3BABDbCXn/G4qXUUsl4oifE0Sc=;
	b=KhZTiwK63Yl7c9ufCIfJ6huHS3BHTCdtNkQUGEHJdmBH/PzE5/jhf5jWn6mMU/0wmFYE
	 TDzWudvNarazVXF9kdcdBIY4yUaqHMpeZtVsaZv8uFIlrjIP84oN4l3HPOI7LfhkBcH5x
	 p/D5G8eASw4bulQqtIOz4Qz22t9w7PWbmSFjpW1Yz4sUP8UuLCcIC50ugW/aFu2P5BdF2
	 ShE38QStnbI8mmDECSw5Vhnv4lnz8m7TTOA01FYwS2C8DTYQX4vGL1OpNcV3VdR8r8DFG
	 +wqH5BElNpKnDISqryXPnf/U5nSIUbmyzbDa2oxIaEIL/xCz3DQMQ9pRC0Y/jYZqaYQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791801626;
	bh=qa0zlz5u3xplyFkHT3BABDbCXn/G4qXUUsl4oifE0Sc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SFWUgkyGdDqRY3xVLtQT8SnGUqlsIxMONhjGNk4Weg/uFrJiJr7jNbZ79OZHU5EqQ
	 32lPn6LHJdQnEj2tWh50liXVQvqGAhJ2bC0rlHqMZexa2kxnqqJ/yn4En5G6DmfnBu
	 Tc0aofQL2Bl1oU0fW9pCMn5WFYd451a/6QNZYYy2/umfJKyiOq6KreA3gBSzmIrIgE
	 2QY0MuCVSWlzVvcNac5+PiaeYB07EIMrfl48DP06NjS6zT0bX2w+olA6+Xj6Ctto3V
	 /Mys4aN8UQg6+GKnSt6Wt9HPJ0Vt4/SLgir1lOsmxtz+2Xencjqunfm5XoFVG8G/IZ
	 uAMYtHywo1fqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C55F680BE7;
	Mon, 12 Oct 2026 10:40:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BD9E179
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 10:40:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 81F9080BE7
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 10:40:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dVjPPrGt1REo for <buildroot@buildroot.org>;
 Mon, 12 Oct 2026 10:40:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D3D4D8085B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791801625;
 b=RSjEfpkDeznEl/kaX3Fdy/IdT3ISdPznocJ5cvZozBYZ5KpdWvkKGyRjWE6slhs2TALb
 YEp7nq8Gimp2FxY9ISWabukjtplYM9pFzPTwt1DbllYrpp+QuBj17iSflG3Ol69i4exbR
 vjaLZDY5KZZ75fKl9leoZhUE3eYmJybK5VJer6fMgIvIAI8BkazWtoPBzh808v1VH5shU
 ktIPdFOTFqmOCEDDgMFSlm14zF7cOryM8jt9HH/exEo42WmwdevqOBGUSHIi/LwQPj6AE
 Ctcdfl2Q0XxbFBA/bE6YDKHD32MgCI7SnE4RlrkzBou3F4Pyd5DnhIt0MdB/4PWhTQw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791801625;
 h=Received-SPF:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=r/+Ndr4LhzaLgMXdL7mNbYUaopzXNVdN5iVbt+7hRyM=;
 b=B11hJAzVkKXnY089nfd6m7AEVf0tefUEpTX8nV7yixlf9aSsIKWPS1CbVboZpREM10Am
 6W6s04IcUSaq9V54zY9YkGUL9eNsjQYZEidZ95iVj8BiI6KKAdD8ncBNaqUqZG6dO3SA+
 W1bh4OHuQ0U432jL+/bbgq9WIDJMiUT6XYvTKG8UPWw+qN6uCgNbdJzFXq0PFSFcFs6Bx
 d6b50s5u8P4Bnaxa0qtv2sXgoadKItdl//sgmED/8Ku81QVfDho+Cd6Z81qsEF+Z2tUaD
 uehzjMzbzg4x6w+7wZY4y7xYfGCDBJYkqPrOMzsxI0RM1Op5mIyojjWbo1t45sO4gxw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=rnout.be;
 dkim=pass header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b="HXu/wbFj"; 
 arc=none smtp.remote-ip=79.99.201.12
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D3D4D8085B
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 10:40:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9D372B97A160; Mon, 12 Oct 2026 12:40:15 +0200 (CEST)
Message-ID: <505a5107-4e45-4b46-92c0-e4cd10025e9a@rnout.be>
Date: Mon, 12 Oct 2026 12:40:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Titouan Christophe <titouan.christophe@mind.be>,
 Baruch Siach <baruch@tkos.co.il>
Cc: Titouan Christophe via buildroot <buildroot@buildroot.org>, ju.o@free.fr, 
 thomas.petazzoni@bootlin.com, git@jdknight.me, thomas.perale@mind.be
References: <20261010201508.963412-1-titouan.christophe@mind.be>
 <20261010201508.963412-4-titouan.christophe@mind.be>
 <877bjo425e.fsf@tarshish> <58a1eb0e-91e4-4810-a13f-26cc2f1bc625@mind.be>
 <871p9v4fpl.fsf@tarshish> <812cdd41-61b0-4f4a-9258-72ad40699895@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <812cdd41-61b0-4f4a-9258-72ad40699895@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/10/2026 10:35, Titouan Christophe via buildroot wrote:
>>> This is a tradeoff, really.
>>> On one hand (A), there is the risk of breaking the functionality of a board by
>>> bumping from one patch version to another.
>>> On the other (B), any new Linux patch version brings a handful of security
>>> fixes, and this happens on a weekly basis.
>> The basic question is what are these deconfigs meant to achieve? My
>> understanding is that defconfigs demonstrate hardware working with a Buildroot
>> generated image. For many users this is the first Buildroot step. Hardware
>> bring-up is non trivial, and defconfigs preserve a known working state for a
>> given target system. defconfig is only an enabler for new users.
> 
> Indeed, this discussion should address the intended role of in-tree defconfigs.
> My personal opinion on this role:
> - They provide (as you say) a first entry into Buildroot for many users.
> - However, I believe they should build a somewhat up-to-date system, and 
> demonstrate ways for users to keep their boards up to date.

  Another way to achieve that is to add a HOWTO to the docs that explains how to 
use a defconfig. Something like:

1. Find the right defconfig.
2. make foo_defconfig; make; deploy
3. It boots? Joy! Now prepare for modification.
    make BR2_DEFCONFIG=<my own defconfig> savedefconfig
4. Switch from the custom kernel to the corresponding LTS branch and test.
5. Switch to the latest kernel and test.
6. If it works, fixate that and contribute the change.


  Regards,
  Arnout

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
