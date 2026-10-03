Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 269CDCA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 12:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D26B981218;
	Sat,  3 Oct 2026 12:35:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yPOiLupZEgHH; Sat,  3 Oct 2026 12:35:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0A7FC80FB9
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791030928;
	b=cEh4AYbn6GOuNebovPq4tvZai7uxZ56mQ096S6V1f9lVmTi6ncaIHiCiFpR+YrITThN5
	 6utSAIu+VhMWeqQrZS8Jdp6Ca+euRnmk6+kaq/QN9yRZlcKWUqoUv+Nsj7mk8gDRxDelR
	 z+uoPQlN4WoNA6EzSgK1WpbktRq5iBKHBUeeZzXzmdGOh3+YR0nIonD6Tc0Y9gO4b3XS6
	 G/zr/+m1dD/QehnnZ1NddCr02W+Js1zMag8YzWJqiQ32Dy+2VEhJ5WCImPcjEJJkBHSjG
	 JghWKSZGzQvSiwwj/k8b2bVSoSFYU2xedZ7pvlGGIl/di4ejlKd+CwWvm8mR0ipvyMQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791030928;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=usUFfUtvPfzCucGsber2a//jPDKDXWN4Nsb+6bWwnxc=;
	b=aps69gWBkaFi0uq5NMb7ZIipkuO/xJR2TkuHQtnsgEN9cBcEXPek8Mo+PwZ7A1287mBw
	 BhG91tiq08vIB4B6+cOWYLducGi8xgrpHijGmuLPcCcl0Zm4gvkvsk8HEZ0+svqKXo3Af
	 GiWPvdbYXIEtkZNC09/UXh30fDXsVdXz8mUDh5d3T87smBM1L+e+uQn79bvHiUL9SoYnF
	 aN404oDxVxg6Jis9k0Z43P8+M13E4OEanrXR5zXfoai0mdRnIabkVjcgH3QbWHgLOBYIy
	 tAx88nVpzl/0I4J9wIuJPAmglNion7TGLcWxSD5fifDzowxvupwQNR9kbjH6CE8xWTA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791030928;
	bh=usUFfUtvPfzCucGsber2a//jPDKDXWN4Nsb+6bWwnxc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iienjaxRpDbFprYi6Cc7X/KHbBt/CvzLnDFxN1PVoK3T6/uYYUp3AWKlFaszOFVsf
	 cjWaIO7Odcw8rRBnusE0Dz5y0UzBlUeu7qstrOnBNNNsZ4Br5721oKqhJtkLYxtJVE
	 Yo8WEqRD9jbVcLN3zo28OZbDwUDElwg4+IxaSGxEyXa14kIiOsnOY1Bsad6X5KNKg/
	 pNGqpv1gGv9lblPM9EqoM1T/f1w056ImpCcgvEZ0uwoAJuAJ7Vs4OlYv/sWZGp/Hg2
	 bOGvmjRcJoj3mAI9Nc9/TNE9PTavB0dG9b1wxvcRdpby5mTOMCiPgGOFfqBFPkk8RV
	 bwDp9dEtSvQoQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A7FC80FB9;
	Sat,  3 Oct 2026 12:35:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 64B752E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:35:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 57099412F9
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:35:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 71WY7M1gYdwU for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 12:35:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6A4F0412F5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791030925;
 b=Ii5zOW97x8cbJBbyAxOD3j8kobgLrchegEO7yh+KaIcVnL7Ey4Br4cOLGTcq/YqER0xr
 A0NqVPT64CyKkxw3bVY9ZHuYN97CIGGeAzTFF66lMoQkrZGSxrqPrrywlnakULJJw46j6
 0jQVRPDbUnfUu1Vt4TEo6ERHra95I6EsdS9r+kn3NL1m7vcSKAGhj6R2ehVsBwlM9exsR
 UTy2AxHiJji5rp7E1FTOqAv9TknQzm9yWKRynmRyZY9sQBGJ+ELKl8xjUfkQxcfUVueqf
 rkbGQnzumepGzXCnNpmAN99bMnL2UsFZ4Qu52qcLbEK35Om3zxjWIA0KAfM66tqEeGw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791030925;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=F0rUnLdzy7dygSbBcVPX/dNFSMqkA5v0gNfpvwHl1lg=;
 b=QbDZHyun5PqUxPoDDsim/nm08PWexQkB63d9ZcwiFZArJuKwalxstekITY77lx2CytrO
 mab679cT/BFBsNystPKfqzjI3rJRt9NjGkTPpQlCeBI1NMVz7l8JHpjdosKTF51vWjZ95
 OHLXdIKLcDEVENhUOojGqhVlUJas5QjOfCPHQ4uPYm7tG+SfW9NqFh0DMspnN+mJYt+40
 ej/Xk7d8nBn2ljBnDadzg0YdWYFKq/nb5bvV1sk088Nqn8eBGiMV46OSlF/Oqp2uCJO9Z
 IPZixlosmGYQ7wJbaJ1ICfdrHfoy4AN8s1fhRQouCkMi1Tn44wsp3UVbmWVThqxmakA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=ehBptWhU; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6A4F0412F5
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:35:24 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 26E221A10FC
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:35:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id ECB91604FF;
 Sat,  3 Oct 2026 12:35:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 07647103283A3; 
 Sat,  3 Oct 2026 14:35:21 +0200 (CEST)
Date: Sat, 3 Oct 2026 14:35:21 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <asD2hdJBG1BbodOd@windsurf>
References: <20261003084453.545653-9-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003084453.545653-9-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-git: bump to version
 3.2.0
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

On Sat, Oct 03, 2026 at 02:43:54AM -0600, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

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
