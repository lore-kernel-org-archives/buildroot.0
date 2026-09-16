Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2047AC982C3
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 12:46:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD4E080E8C;
	Wed, 16 Sep 2026 12:46:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lb43d8K52ZKv; Wed, 16 Sep 2026 12:46:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E8C3D80E50
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789562798;
	b=Datar2uVVBlq8Iac5W82dYvJguuRUyZ9Vyf6iqLxRKWYaKQAel4JdF4SkwXXJpLgQSlE
	 e3E0HkM9Rf8hS8yHVrgeot+IRBVualGiSJ4iH+qARpwPXreC/GiNuX+YjrABt/g7WTR6O
	 jQ0dBP5a21Kbc7f4M0wXHr2fk5iXwK0wP393Kz5k31a7WUY2f8y7gIAVyD25JV/yqpO7f
	 1tzkGEunfxI9e6AGGS+OvNztOZF6ps4rS3t9Eox2IC5OOeZs8LIxKfajZULkhWryRVAA7
	 Au3xLxIg2UoYAcYdCmjYeZYSfHeodEtg8/hAeAkxmJzY7ML88PnXYkiplbz+fkPmb2g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789562798;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=JsJeP3rarE+iUqC3cq0lVbJmOnLn7kn+JbUP+gmO8QA=;
	b=A83TYIJAPKw6NtZBIsDaRyQt6H8N+NGDA9UML1IrbabPImXovs6SuoS8ogk61wg/bJTL
	 ReMQwlXvBjOyhb+sEySP1rCWcGSBB5V8W2hVRwmvmB3DQ5pb5ZuNZtWE1ig7bvLwbptAt
	 XOygMzOsq0yAyIrar/b7iFDv7SII6negsD6WdYV7L8mCSbrao5v5B0acMl0gIbE903Q+Z
	 MBsvWb01uHj/wTyXJ9PDzkfDbBWzQQPfm56nh+Rn3m0uLHGuNVccYjJHEb8/jH29VkZu9
	 ZkIKbNKLF5bIqC3eIa8yVUsvPM0H2RK6wzw1Lru23viW7XqWveHKXRTRJS/4wwExQ8A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789562798;
	bh=JsJeP3rarE+iUqC3cq0lVbJmOnLn7kn+JbUP+gmO8QA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oTkaKw8I/HVaslIADHfruL7al1VzbYL2GqhkS3e3PPI3RjLmi2QxkXTXcKC/pHKd+
	 aL7mkXZ2w7fs7A9LosbWg3YAtKMZ1zK9SF9PfEiYOiYOn5TqD9i7ailWGjcKBfG45I
	 GPnlrdO8s+BIBs865uXFIZiEiZGz7Bb2mhO55ZRtoRdS2yY5K1BokUggPSW4GocHj4
	 k585XFtYkpZomk2RgrOWiZ+1mozejwGmIMJcgwJ+4wKKren1PaGsrAj3DqiNV1vjll
	 pGxMGvRHLCGWO6qXnkTlrei1ulPrAXjUbs726Q917nQzsub0JEnuo+OCT2QANQWVuM
	 YrRgPrO8JXmqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8C3D80E50;
	Wed, 16 Sep 2026 12:46:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E3432E3
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 12:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F78C40707
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 12:46:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zuLfNYD9NNKV for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 12:46:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 80E92406F7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789562794;
 b=GFL8myv7fo7rQ5m5n6bs3uqDlEmSskm5HoOJIUkGnldXYtGYoGC0quwT2UVpHch5I4NO
 2COt9VP/pbjav5yy10yr5On7K6ktJeX5Oc0/HzH4erA+EjR7d82qh9npJH2KGETgYvlex
 v97s90dezb54MYmh8A6d5QlXFnY1ND/7zrNTxk3FFf5jp8jO3M4tqGfWFaMxF2gfJmCLH
 k8Juj4352u9MeTnJ2A1ni9eNEHcTPlbNj5wAB0826CCtZEiacGO+igkgpsJfw+1Pvgx4i
 XECd8sswzOWShb+2k+6XAGsnI8kp50j9BVugsPHsvieuvD0s/uK0Qr26aIBaXpK/y7A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789562794;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=Nya3Lw+Ll4phdNaEYtvI7g559UINcgDdgj9acsFe0NE=;
 b=JzGyOjk2yZ5jHbfsNrqZB3vScQkqsKIfvOwGaSwpaz8o8TLcoiXsO/fvohnGbWHmJ1BP
 M8Hre4e/aMKFPpphkJYmohgLiaIw4UyzCcOyBx4aHiq+U2+rQG+RgAbbRIoTPvBpuRr/H
 3PTLdgNE/5uoJxeARq+/7vJDe9lnTmn9eujITL6kQvCcCTJZToVQvwgmewGnHBP1uNUg6
 9nsJvX+f/aTLXVJjNIeuMqbpxOu9j486QDKpKVXnmqSEY8+OmLokAvECUNSosg3G7/8Fi
 pFGbhf3Mvz/pDZ9DKUNCPB/m23xeqKF43JHf5QP9YSZdCOFZLk/lLPwYLOJLHl1WYLw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=ALlX7Eb6; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 80E92406F7
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 12:46:33 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id C7D341A08D2
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 12:46:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9BEB760337;
 Wed, 16 Sep 2026 12:46:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 39A4D11C7AFD8; 
 Wed, 16 Sep 2026 14:46:29 +0200 (CEST)
Date: Wed, 16 Sep 2026 14:46:28 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Thomas Perale <thomas.perale@mind.be>, 
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Message-ID: <aqpraYAviEpbIuPJ@windsurf>
References: <20260618065137.3987932-1-james.hilliard1@gmail.com>
 <20260618065137.3987932-2-james.hilliard1@gmail.com>
 <aqhkbaMkRynOxfoT@windsurf>
 <CADvTj4qjk_fMqf4M8Mq4C=w34GuL4e8uYBFsUSx2grCC2Dukdw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADvTj4qjk_fMqf4M8Mq4C=w34GuL4e8uYBFsUSx2grCC2Dukdw@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v3 2/3] package/pkg-python: derive PyPI site
 from blake2b-256 hash
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

On Tue, Sep 15, 2026 at 11:14:14AM -0600, James Hilliard wrote:

> > I must say I am not a fan of this approach. It is very "tricky" and
> > not obvious to understand that the _SITE information is in some cases
> > derived from information in the .hash file. For me this breaks the
> > principle of "obviousness" that makes Buildroot generally quite nice
> > to work with. I don't really find the current situation problematic,
> > and what we have currently is completely obvious to use/understand.
> 
> Yeah, it's a bit weird deriving from a non-make file, although auto deriving
> _SITE in general does have precedent and if the hash is missing there
> should at least be a clear error explaining the reason:
> https://github.com/buildroot/buildroot/blob/2026.08/package/pkg-luarocks.mk#L79-L85

This is not at all the same thing: this is a case where we have a
default. If nothing is specified, a default is used, but that default
value is not magically inferred from the .hash file.

> > Of course, if the other maintainers are happy with your approach, I
> > will not oppose. But since so far nobody provided feedback, I thought
> > I should share my humble feedback.
> 
> Here's some background on where the suggestion for this change came from:
> https://lore.kernel.org/buildroot/fb186248-7df4-4f73-94a2-c9b2ebefa843@bubu1.eu/

OK. I still find this "meh". But again, this is just my own
opinion/voice, and I will not oppose to this getting merged. It's just
that it's been sitting on patchwork for a bit of time with no
feedback, so I thought that to help get things move forward, I would
share my feedback.

> > Another concern: I assume you're adding
> > $(BR2_COREUTILS_HOST_DEPENDENCY) to DOWNLOAD_DEPENDENCIES so that
> > 'awk' is available?
> 
> Isn't awk already mandatory?:
> https://github.com/buildroot/buildroot/blob/2026.08/support/dependencies/dependencies.sh#L157

Indeed. But then why does your patch have:

  $(2)_DOWNLOAD_DEPENDENCIES += $(BR2_COREUTILS_HOST_DEPENDENCY)

> > But then if we run "make show-info" without doing
> > any build, it means we no longer have the _SITE information?
> 
> That should still work fine, we still set _SITE with this approach, it only
> changes how/where it gets set.

Not if $(BR2_COREUTILS_HOST_DEPENDENCY) must be built to calculate the
_SITE value (see above question).

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
