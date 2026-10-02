Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15EA7CA5FDD
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 20:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B86D060D90;
	Fri,  2 Oct 2026 20:13:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qsw0x7B9J-8b; Fri,  2 Oct 2026 20:13:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9403960D70
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790972034;
	b=ZwcHeXouljFIcY6U1qOjv/jKe3iuw+f7M2qNBgtKuOv26JDGFKuTF9fYMFwJZkPu0Vv3
	 5mI4W+1hMnam+Jm9Tsy9cnglJi/Og5gA/aEjAyS2mbaaj54DD7vo0v8CAsTkOUdu5n9CV
	 44Zh2P7JJDuu9xXbg0O+EBgcqbebiMuwxf8BOr9PF6VP2/XDem4KSaVQb/kPBALvBTdCq
	 FZEMGwBuUekY84baeZYfbi0Wh5txIHl+wYZQPhrwLKRRel0lb7evZAJesRTej8VYm3x/K
	 saufsAk7yyYt/+Zd+AThZEW6bnOXsL3VB/qLNVa5izsm2xiciShW0IZyqpFn3BWyFFw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790972034;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Oss5JsZIQHAadRz38ymZyrvrBxJJiNfPFvi3tHSnWEs=;
	b=jG6qEeW0znULTzfdN4kAgFgrk3rUkY+ltSpseXXOqx7BRPJ2duT/iyl5HVSaFVNjYq81
	 7bo1XC7fEvHFkxqbWw60uSIf1yLVfP7uIF2tms7AU1Fz34soFKaD9Icr5e+m92o0A5Q8j
	 sTecf/bPSRD47W+IuyxKL9/IxZ4N+E6UjfRqL0gVLTYQVsNmLjc3bzh2/DwD6o9ELJEKW
	 nzqWjPMDuGT1tnOdgqWiJVsCbBB1nXoRyhKbocx9k3ZUjG82+WaROTzuAcImTbQJGoZln
	 6AY4inBESnqY7zc9e8qDy+xeHzQfRJ+3HClTwGgyW2IcnorWuOeAscmK1QhfOeo3TaQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790972034;
	bh=Oss5JsZIQHAadRz38ymZyrvrBxJJiNfPFvi3tHSnWEs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ch6pc/PIivMd9EhyBWgu1cZc6A093DT5dKCQ6ogShij8lnMewGhQqAQgYgYQ4luX7
	 pPSc0QVz94FR0UgWWhPByyKkVbNUxWRj1frEutBJCSLuQLo5cWppwhwbw6p4F+Fzj/
	 2NeWb/2j5AQlY0y+M63OXGOS9RIk1oKzHEIQfRBbh7Ud69QahuFL1x61JhzErTfBKG
	 yjsotFGAZEaAZGY3u4DlRv6oSCA8fNBXr1MYh+3Iz9u2cmRBjN4uzmamOmRwNBRB0w
	 P6Z0OXbzGI3bH6NzaRER2QOrwozBrmUt8vWBOwmUz/pn5LHXebsk89l8JGuYG6Dr5n
	 YOZlT13HpHeqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9403960D70;
	Fri,  2 Oct 2026 20:13:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F0C96263
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 20:13:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EDEBA400BC
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 20:13:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JF-eEwt-sLZw for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 20:13:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 81BCF4008C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790972031;
 b=XCmdosS2X8hdi/v87FC0u3Uu1DKZci0CQCGoSJFYVuFrbGvh3mw0yPclcwlnJsfHZF34
 FOB9/YVCBhvIbiJ/q9ZE4wYRUIL9ffoYFq72qYYVCtAYZfkMvKJGRyUBNa5S7jgXoGBzm
 m7g+aSKo8eAcrDec74gsmCvsQG4h9Uo69SfWrc3HgIPYHyDmLjto3jUdazAJvhO4fYtAl
 0CIzW+BT9mOoqufqnOjkIL0Nct3v6eBSktdBxykMy7aJMHUTDUaHE9PZbJP+UW4qpn9rx
 3EIpj10WbqDs1iWlyhVJ6EW/epv0eYWHCZhDJev8hOmzjZejdohyel08aNY6lNEqS0Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790972031;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=KkCbN8Bi0+PLR0t2kRf5B5+IBJfN7TU+U5+n9YAMitg=;
 b=MsHyBQPXZbXtYxiuMFJFFzQXxcJuH2PHC4ceZ21xSOkrUXhElyUFS7u+ja2XEdnmP2uI
 A/txvm6jvpXH/iA8H65yry4LcaAzCIVWnnBnGhukYgtPMRmTSky+2wTNSNWS5VnxPxnxK
 DryZxugGL4dlR3ZEz7AY0xk+wqD3PEJRt+NkXB/omuVfRCLRpN3pXfzWy27FhaAc0srkg
 Z8kmUdkcF/Ts7QA3mmqgc2pMfMiRcD+qn3fmafKUDMWv/f4aUdhriNEyX3MZjBVleOfFN
 msuLpfPdU+/gfrp8eTcTBn8PQG3gsMzM2D3dczW554Xp829SUXZDg2aDtC2j8LbVYlQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=wereyiNA; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 81BCF4008C
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 20:13:50 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 4E09E4E41114;
 Fri,  2 Oct 2026 20:13:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 22A72603DC;
 Fri,  2 Oct 2026 20:13:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 551B0103281F4; 
 Fri,  2 Oct 2026 22:13:47 +0200 (CEST)
Date: Fri, 2 Oct 2026 22:13:46 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <asAQRNiFkD7hQkGm@windsurf>
References: <20260316195726.690352-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260316195726.690352-1-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/tailscale: don't overwrite
 tailscaled when using merged bin
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Mar 16, 2026 at 01:57:26PM -0600, James Hilliard wrote:
> When merged bin was enabled in systemd in buildroot commit
> a530492cd3e6de7ed5f9406f7573fe7b9061b3d5 the tailscaled package

This isn't correct: it has nothing to do with
systemd. BR2_ROOTFS_MERGED_BIN can be enabled independently of
systemd. So the problem started occurring when BR2_ROOTFS_MERGED_BIN
support was merged.

I've updated the commit message, and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
