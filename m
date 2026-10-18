Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B41CCF2C9
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 14:30:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1D4940794;
	Sun, 18 Oct 2026 14:30:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fHZTyW8GsYvG; Sun, 18 Oct 2026 14:30:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4210D40778
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792333833;
	b=YIx83dOXyTTtmebZPyHeY/BQFjzuHGPIUTQPltSIC4z+h8ebmwpbzQlUZVev8otUl3bT
	 sCzbutj0VVc+IHYGIWziFyFSw49/uG1jT9hhVtr0raZkiCv6d/FqwFUMcqTLbAYrEmMGV
	 yHoooHHinZgtIHIjk2cD/UdolLg+Rg1lRR8JhSA49h3OZZ5M9s95DbQM94o0eN3mB1Dml
	 dHSEnGm9C9D09GlsGGrijUpkrYF9K6IpUt77oCmEOXtrSIGZjoK7Q0WbL98bnacZe2qU7
	 Lx1/DEzt4nxFpgoElaSRW/bCpfRtSWIebED8Gtka3+qHH++ety0BwKXlQjRVIQiv2/w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792333833;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=Fp5Z3qtLJujiCOzoJg/CODeqAia0Omr1PYVsLIW/mME=;
	b=cPAHkw7z7HcoEfJQhkrrZNZVOeLduAFZRVNA1CgE8nhQTkQrlDzCORFjGc542rULdsby
	 KfAId/jP//lc/KFrFSYrHM2xPwoK/lhJ5dZdklB1nDHD+278WeErJM8qOnvRIfx3eaJWI
	 BdqYZdSjxZjkLX/eEmd2w4Hm3koPVV+kJzvt0nuVTLifNwt7KuXKTPA/7zRVcYAc98Q0Y
	 3FrqhzdF3Jz/maNMcAfbN6Wl/b6+OL0JwCD4kCluJ6ew54TikVvVkF/aev+rLQj7fA2dk
	 /T2jUUDcLGckGGLHOrGRBNGbgrPYp/UAGZ7qnvm7wF22LATOco0F6NttXqH72Jjq9Hg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792333833;
	bh=Fp5Z3qtLJujiCOzoJg/CODeqAia0Omr1PYVsLIW/mME=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XJFtJuj0dxdphR0ld2BtumWqMoK2TZ6Xc3/C+ZSbCj9BQ9VPlpt5d/l+GDuI4UtuT
	 LrsaP81QDxr9i+USBNFSJJNAC95xw/snbUZUihvzgGjMa553z4pvmEWcfxwf4ZY19c
	 A3fy9EyK8pG8Po4IvckXVMuZx3eoXVgV9RE4Iznx2HHuQ0mmO4auDZc0xp/cnarTfy
	 CnUBw5q2DwupvxHZNzFxNZqRFHuK8TlBYZINnR/2uLMGMb12kS/ZRNnvW15XOXyWTK
	 14+Cd4ZVptLCDNolMPnEX+CzN9q+r1vSpDvC99bHPIyv5rUPW3XR/0w1wGYZ3AIXfz
	 9vUDYFYSWC8Yw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4210D40778;
	Sun, 18 Oct 2026 14:30:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 622E22A8
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:30:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5382940778
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:30:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OA5j7MVEKqbM for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 14:30:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A469040758
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792333830;
 b=CXKQlfQWlB84VzcuIXsEq/079sm64a6mHxKTD9pgLszM70he4b7SWUK0v3BDLs1rLFOG
 VJh/ewvOSw3NZqtF19DHJBwSyYzuj3u3Sx4qQAogf27brZSOyUV/c7TfhIMDshx1tf4xj
 erCc9MiE/Cwk5qe7wGo0j1ao4upblmnra6a6Lt5VUuUXyalyAvIODI6wCSSpVBedNQhTi
 ytnpQX+sm+TZehk9gZSISquM1qlv1ys9ZVMSPJL7b5c2Lg1+JQK72p6ACJmovKBoLWWee
 /T1Ve+HpzUtx5AMDPUiLLYLzWVJXQ2pJzoVj7ZS19TjBswSabx1r/0+cpDNFnUBOaYA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792333830;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=awyLErPRQ77I/ZziMpclWd3944AdbeOe5V0WcJCQt/4=;
 b=gNOkW6NU6zUIa3FEhF4TZDih81levc843e0eI2bj2VOdOOgBNhbe/f4ZZL2JrQRgDQgi
 wbGCFDXw76esbubuLcb3xJJUDmpROurjFW8XRa/0A8LnH2w7ux6q9rZsw2bInNGXFPo1W
 CmqxLRtv1t3AzO8Vv/YOvl8HDbBoeYmwqFut27TSsRaj7tnT20Sm+KbYIWbNVwngItZXJ
 /IyIUAn4YPO18x2Q3g2MDpp/tDhSzYch7tzfpexmbOo2J4FcQMukARNXIQQkC4XXkxihL
 27Ve1Axm8alKQp4h9aGfB61+d50qXpVdyMnECu7YsMumIgwY4V+FB1DVFd6r/78gPfQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=q3SVbbcY; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::10"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A469040758
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:30:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id AAB29B0057C;
 Sun, 18 Oct 2026 16:30:27 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 18 Oct 2026 16:30:27 +0200
MIME-Version: 1.0
Date: Sun, 18 Oct 2026 16:30:27 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261015215210.3426895-16-james.hilliard1@gmail.com>
References: <20261015215210.3426895-16-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <c09ba2362b0d3db0b87aa13e9bd1e3da@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-zope-interface: bump to
 version 8.7
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 15/10/2026 23:51, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
