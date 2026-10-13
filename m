Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B79ECC6B0E
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 07:58:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 191FF40656;
	Tue, 13 Oct 2026 07:58:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lrMOa5tG2fKV; Tue, 13 Oct 2026 07:58:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3E46F4054A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791878302;
	b=tQEO0Hh7Tlqq8ESOkbwDZadXZadeKIskpbWvvr/wNX2g8Z3lFIc0Woctyu0Pd92uX+D6
	 LDOGWD3W9pdk8EYqENo6NywImFum+sdinGT1J5f0vT8EtuEax/U8SFg20NLM8DH/ZAcHp
	 TqW7YxfxhIwHKaCbrYGz2LCj21SxfDfE5MLcUguM1QzEoX9VelXci9pQgk7TFrpNcZ3JS
	 bYkSxiUxr6ENTsqVZHhYygupcLMnyLoaVBAwba2F2iQBX+pQx0AvVlwQh85y27wJfxD0g
	 KqU571r/1bNzdigpQsYj+E2/nq0g9DERv5ch5GgP7faBB8/bevSUHS2vPIOLzlfcPnw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791878302;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=AzDxLeIPa2neuqeJ3DpdRMrax1EQg3bSsKnLVp4mFbM=;
	b=bVZs7nzkWCql7kvp9nAi9JOmJezPYY50+cETeK0gCCd/T0P7J1z0LS8XyDpqKQpBBYYx
	 cUIPJfyAXfNwVqrZ/+akNcJF02eZkpVkEOZDCIhYE4lhkU8bfuIpeYPGsSYZO1v2OrusN
	 ylRzdAv8H8bcFLilMx+Cqm6fYttJU07U2izi8T5DHiJr0wag8zwwQO8hlmViplUv6Q4Jc
	 t3tzDCSqc9OhIbebXyg+OoQAo4oP0aCidzczZHv+1B7/9GNc2IsOEnfvJeV9qeLlDLdl6
	 lEdSKoHWHul1x8K8QtNBJ9oXNEgLjl9PJzQ+m3ze4pSB83jDiJGu9lIY0X5xV8jjdKQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791878302;
	bh=AzDxLeIPa2neuqeJ3DpdRMrax1EQg3bSsKnLVp4mFbM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QhanLykg/hwATcioQ2XQMz3E0qoDmmA5twAo5tGhBzcFae8Oe/NJ13m9hjGBuAkmQ
	 ds3ERCNp9w5uK9HAbO+yihYfQlM+OUf/W0yOYOPQzRagnpGmHBm1usq7MeLyePghdN
	 s9MzbotrPHCugnG/mzxpZ1TYpmne099YJYNpk3qr95XLZMdtPsNIgqJVHyzNHdbolN
	 1Rs3jJxY09EOgteQuJWPCIsI/qKOLqHfVvscsDYLsNAmPh0aWjoz7pzSxZ1hFc0k+q
	 srsxTw+iUyYRwlmX486uKWZtW7TMu1LlcfIJ2zHyA98ReypsKe1i40VVCruIaHWttn
	 wSUtpI2nbZNiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E46F4054A;
	Tue, 13 Oct 2026 07:58:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3FD97DE0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 07:58:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 25EBD40068
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 07:58:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JMzXefIa58sI for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 07:58:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org AC49F4005F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791878299;
 b=e0U6wdhrTL1058zW7L3lL/k5eZ80efYoXffF3AqsQ33GHNXJWGhG3mSTDeRsENjsqQ+R
 WLt4WjNPeQz2aqWjys8TPwxqWXKGMwO2U65+8G8kFi5jTIw2J3Bpo8P/7IT3VS4G8zQfu
 DZLL7Ksa434CWzmnW19nrP1/n2sPaZqFVfIweXan/edqlS4FZAFUxhPYWfirpAF1l0c6K
 9Vv60Hlw6iJepulga7jKte3wHm5EIiP11XTrYec0v1hXTNuUQtlEjNGCWTZZEJ/L8mU5u
 3h++2Xu9ZHxfXcbNWnVcA9hI3LVNs6DwzQ3GrPBUTsN39tkcdaQxv1sP1/lPaKyEy2Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791878299;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=NDhSy0PFgs7xVa79TKEaqDMdOzumicz7Wp0zb/OBZ5I=;
 b=fhdrA2g1nqWOZs2jSu73ckmbAA0h8Ju1nhfRgocQ2wKo+EMYYDhHVVByLG7Ee+uny7Ch
 UL945bewkp+mAmWAc2pnL8X/5l9ykAo4iL5mbKeIQ/XQpFaSdwNpQ7d0kwfCnYZl0OmSh
 SAFUkSsQ5TObsa7iG2dLAi1/YNzI2gPzE9V/UZ0AZJ699Lw+u/xa253hoCzsdbqaC5Ck/
 q+fqHHjrVhxTKI14ARUVNS7a/+HgXQe8FT6CUJ0BN98UmSJEQ8JduREB5PqFFOwxS6UxY
 vx44a8hWwzJtgfnp0tRhxBcvJ0NKHeXSVESUOQ1RlUiOYALoDnP/GGQiIGR2nvcAs/A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=GGaB7AB7; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AC49F4005F
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 07:58:18 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 0A0051A11F2;
 Tue, 13 Oct 2026 07:58:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D1CD060362;
 Tue, 13 Oct 2026 07:58:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C764311D707A9; 
 Tue, 13 Oct 2026 09:58:14 +0200 (CEST)
Date: Tue, 13 Oct 2026 09:58:14 +0200
To: Xukai Wang <kingxukai@zohomail.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
Message-ID: <as3kkbzrQr1JYJ5x@windsurf>
References: <20261012063152.153325-1-kingxukai@zohomail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261012063152.153325-1-kingxukai@zohomail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/python-gymnasium: bump version to
 1.4.0
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

On Mon, Oct 12, 2026 at 02:31:52PM +0800, Xukai Wang via buildroot wrote:
> https://github.com/Farama-Foundation/Gymnasium/releases/tag/v1.4.0
> 
> Signed-off-by: Xukai Wang <kingxukai@zohomail.com>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
