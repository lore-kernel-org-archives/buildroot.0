Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A61BBCC6B0E
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 08:03:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42DFE607D5;
	Tue, 13 Oct 2026 08:03:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yFFOsUL13VY9; Tue, 13 Oct 2026 08:03:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2081F6079D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791878587;
	b=GZo0ZFYMKXH+ton5ZcDh5mYUyFexs0F/c4OlORE/EAhV+PyEXozPjbMKYmhbPO+k1h8n
	 gs1EA2cNjMOKpnIhZdbJitREESeIoLBcb3D9hWcC0c5SRIt6YT33fLilhjh6rCsq8Ln86
	 kh3UlOQq5Ucv0RLIxD4efZvlLY/GkodRZhTqKXOVX2Qb9IGerT7skJsPitdoAt52eytdg
	 7oFZxQ/fLUNQoiVRx58gu6xc/z5JkrzyIgls9ohtjZO/OVbmhSB6vYAN3Fl9T6yY/rfh1
	 /wJC9TnNCr81AnK+aR6RKJ5uiBlVk8ViXIHpkw4mdUzk+jGTbQBb+JZUD/ShURSXxRA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791878587;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=V7WBTaxZavmxYzDylkzOh1X+AXlhy75IfycfDd5LM2E=;
	b=e2ZfPLW7DiZcLo2ZGJLSArhvpKTPulRnczgGNYfCnb0IhBfpawtWNUenp9d0tuvVvgjd
	 2zAxEqAaXjAfQzGrPO+qjL0ZrjxmoYegKPR6AkjcqDnd05stu3NcDm50F+plMp/OvYZtb
	 Xxc0aqumqwj9mUflwK9RFGbj9JTNeawdh7/ZfultxSpAVeAxBN5Mmnz+4Z7aG7gj3uW5h
	 C1rU0CsbgExfNavCybjQqq0cG+twJhyAd8fwiH7UTe1TqEuVqwt0c5gEUVpYMR2BuSaYw
	 A9EGH3SmC6ngAhNOzscAUa/Ulpm253ldcSKoP/+UZfVpS0fQ8gnluJrn2mD6jk8HEIA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791878587;
	bh=V7WBTaxZavmxYzDylkzOh1X+AXlhy75IfycfDd5LM2E=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=b8ohxz9Xforso/asPwSNw7OXtAdu/MP4wcew7btorbSJdZhlTkhGDBDSxbDzkBkfD
	 jfPJ+kL4ZYwaV5fLaaBfrekMxKp/6a5t6KD/2bAKuGbx6ZlxFfGA1B4B1NimM0pBB4
	 OVDpGYiW68IeYBsE/dTy8TvL06ittvNvPu+5nv5pc8SUol+DcRI5TJcn7QAsbm8xe8
	 5K4uB9aeXUYMU9YFT6eqzNMIEB4w6zbAE90zanTLCcPOV6RXgYySUQ41DlSRbLRQUv
	 DrCaY/X/Rezus7s9PHtdo5y5vh0v5F56quZyC+0e5L4Y4jR1D1z03o6rMT+A/n8EeG
	 Ca8KvObTTgCIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2081F6079D;
	Tue, 13 Oct 2026 08:03:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 59972DE0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F9AC4052A
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:03:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 18FLkIks5gHo for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 08:03:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4F9154068C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791878584;
 b=NOfb0w3h8bLzqbxibdqLOLZAgfhLH4e3R22FAKoMXxF9dvzvUdq+0BzGR1WmuGgdxxZ8
 PU/EjHDfX0vH7eL1VRW8AB+5wRE65UayAUndRUpKSwrz0EmykwkQPOMTd1WImYm/PHzZk
 rjaHN6lsjcidVnTZ5E9rCag+xCTEPodEC3PPcl855xsE6Lq07jgBlCi2GzlR3QoZ//sU9
 JvloHi9f6GCVJefOZWwjoEXMRHrgPylYoKMzqlc6Lt5XTmfTGGss3bk4D7BgNFHuz1wEB
 SBStDO1Yfm+iHMQdUJWPejdqYc5+ejBQ0FUmwE1Usp8QhFVL+xB6UAzzhNuK+1HYq3g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791878584;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=SElEWFANp36ezkEp8Jv8o4+73oo5Id0LGL0cLJHuYBI=;
 b=BiQyOOlbJ0Ne7XCCZ6ovNU5vWbX0TeN6myV3L1x2OhE7b7ZRm4zfk9BULO4PuiuJ263P
 xXD8aJdm2lJFAP8N+F90FBqFEBFx6eVROborUW9k34wM+fnmlPH+EXJsAciwGubNB6X33
 dbP229q0OR8kat0H+aEh3tpGKlilll2aXSvFA9NNnMUzDZ0oYNZKW76yAijXKzSDtxe31
 E52TyndaMoIkrZQ2tZWi9e/XMMREqBK3lall3RlSXXBiYUUgf3A6XgJT0SyvEK9TsZ2Eu
 zDPf9q+bw7samu3VkLUWcDREQ/HzNJl3B69yCVHV0fIB4lyujQ9fr9bfsKNr2w/aVNQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=g72Qa8la; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4F9154068C
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:03:03 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id D7AED1A1208
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:03:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id ADDE660362;
 Tue, 13 Oct 2026 08:03:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1648811D70D9F; 
 Tue, 13 Oct 2026 10:03:00 +0200 (CEST)
Date: Tue, 13 Oct 2026 10:03:00 +0200
To: Alexander Shirokov <shirokovalexs@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <as3ldlJ2YEh4QmpF@windsurf>
References: <20260617161331.141666-1-shirokovalexs@gmail.com>
 <20260618092926.41905-1-shirokovalexs@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260618092926.41905-1-shirokovalexs@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [v1,
 1/2] package/aichat: require SSE2 on i386 target
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

Hello,

On Thu, Jun 18, 2026 at 11:29:26AM +0200, Alexander Shirokov wrote:
> Hi All,
> 
> Just a brief note: while I started with the simplest fix (disabling the
> package), the root cause may lie in a different area.
> 
> As I can see, the broot package is now failing as well. It appears to be related
> to SSE too (at least according to the function names).
> 
> For example [1]:
> 
> 	error[E0425]: cannot find function `defilter_avg_sse2_inner` in this scope
>    	--> /home/thomas/autobuild/instance-1/output-1/build/broot-1.55.0/VENDOR/zune-png/src/filters/sse4.rs:332:9

That's from a different crate, right? So it's a different problem from
the ring create requiring SSE2.

> I'll investigate more carefully to avoid having to fix or work around the issue
> in each package individually.

Did you come to any conclusion regarding this?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
