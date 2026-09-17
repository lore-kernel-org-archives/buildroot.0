Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA07C982D6
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 15:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18C9860B25;
	Thu, 17 Sep 2026 15:09:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L7vcsbzZeTXM; Thu, 17 Sep 2026 15:09:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 846FF60667
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789657750;
	b=haffgYCLhhFQX0UVmlkCpVqw9umQzbOw1HIGlUTnI+TWnI4zGuBABlFgCZbIhiNfyps2
	 cLkfQSAG3qX4nCTUR4OZ4kQvSKA7fxbTk21FfSmCz7WlvgR+N49q7GuKFuWLq+thkJtKz
	 CdOJAWg+GIUgeBlptlH1Ia4ZX6TqCNpAiVyqeyRzw8ciNzYGsA9FkAGotz3jz5OYmhoU/
	 6DJdSzGjp0gi6L6pjVeYpuL7sE/EZ2aUhSgFL+ux0/Lk/RYvbk1ljV2xifBDPWLEPkTjz
	 ETRjasvGk/w/CS05TfHVDuq/+5vcZy65BuwfUQQ5E6TUD8czV6ZPf1Hz7pPQtNhd9iA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789657750;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=t0zlYyAw9Jx+8iyzRbqnW1rZsqu9n3qEKH4WoJ8PgqQ=;
	b=YA8OXLLQvnQTasiFAF79Fdxp7I5oEJtfDoU1QCEVlJpDYgHPGAo4vDHZgzdvUH3GhtLv
	 W+pJfpg8sujyLkbDvsNhaZfxLI8vF02h6auTgud/xp6j0A4swoR+sBry7BRK42Z8rRG5X
	 Q8uPDqgQHhu9DrQCxdIDhl1/JWCXjuMN2vO8GH7cHzRnulWqQfQlvXlERhrWP/0nHXi8Q
	 ijtXwkmPuQVAn3e9bOgyPrn75cQlQwnPQ9YuF4fa6hb5/lbhOu9GgASXgYl2wi0Mo2hXn
	 cUVYRfSP/kUdIGpl4lFLnWAWzjEXUkHoy3N0/DzFOvpWRwLkVWoflpQGa3biy2Ncp1g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789657750;
	bh=t0zlYyAw9Jx+8iyzRbqnW1rZsqu9n3qEKH4WoJ8PgqQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iFzqsGFb5w3BIG1Ht2KEKXYULQiJyFrpnOMeoXQ4xaO6TPzg5hkQMjqsZs8Yo6ajN
	 0+siZYB7HkYy9fnS1mmfWaG1S9jdeP8ID5zfge6UnAxE87YVuJEBB4sWYXP7v0G3Vd
	 ag/QRR96htWBj767glAulhMeZ9PgXhU0R6B6ux8UWqGdy9NoZrXvu332uTBK2IASfu
	 w5xFkiHcvWjnLWN5vd40YWPPdGGqA/+x4m5jYlyPhQPO2jSG8y8s10VO+zP14dWhUj
	 UYM75PzqOsKbzg3W6JZCYLpHe0wYT6cR3eBOb2MWnV/adcnmxplmpBenhqopYp9dzd
	 RU1wQk2L69uUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 846FF60667;
	Thu, 17 Sep 2026 15:09:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 85A5F37A
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 15:09:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 62CB580C1A
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 15:09:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P4O67snGkS3t for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 15:09:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D17B780A91
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789657747;
 b=nQTn5sS1fSd1B8MYEjVnJm9CsEJBQ7kg+4mYG7kaGsb3rnJYOCvwK6FcxgpuX75SAstE
 emx6wvuBMPfPAf6oSDNDlmY8s8Dp+LWYH2nIh+gjwQtIVQwOK9RrdmL89zrLpEyCHPknA
 hVIUFYKkjXjE0EP92ahSMYB7a36H9ZTIuJzevrkqFnSYtGDh9uof+n+62BXEWRuc9ts0l
 JxHjtbjeObcJuhBOYO0weOLCwRUtKG56iqB1oV7ny+qfnG7L+zn2cOpM++ZPmlZys9yQN
 NnPwWzcH1suNcgqf4l36kUIcjq2Mi7ng+5lL+s4TAXo6DhExGeL3T4bmRhAK4RI1DFA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789657747;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=X0fC+lRXNtR1pGLk8GbIx/J+oK3RvLDuS5rU4Mh8HME=;
 b=ASTk/uA3CT0F0F4bW0QFpRHQ/Vxp6DfjHHGP5DY26tmFavuWckd+QvZ/DkmBExFPCnKA
 MMTwuRM1h3KzX57yrotjhpqrIkJe6w4x7OUldROR1MDqK9PWRrFQ6XkFDKSd570TtqILP
 /MWfKTFwhOa5msdXhTMvqIKfiQHJ2xiVh4ZDfKZthv0178Yp4FHNMymUu4bn0UkFnyFur
 guw5fZV75aRnjCWSUr/CV76HYGlPEHPw9QVe4dYWUONTOXaWHANosF3TUnv5rxd6Ed+IU
 dhslEcQUQ9tfDcOhl5O3NLY4B0CKrtKrPX7usL2+4+fqRPp5jC1aATJPoV0UEOjcN1A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Fg6sHPF9; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D17B780A91
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 15:09:05 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 444354E407AD
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 15:09:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 103375FAA3;
 Thu, 17 Sep 2026 15:09:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 219BA11C7B08C; 
 Thu, 17 Sep 2026 17:08:57 +0200 (CEST)
Date: Thu, 17 Sep 2026 17:08:57 +0200
To: Joachim Wiberg <troglobit@gmail.com>
Cc: buildroot@buildroot.org, Fiona Klute <fiona.klute@gmx.de>
Message-ID: <aqwCXlNydsZNVG35@windsurf>
References: <20260914103020.3485030-1-troglobit@gmail.com>
 <aquaR_Y91tlsUAUn@windsurf>
 <6eb130833663f005da1547e17c30781b3b3330a4.camel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6eb130833663f005da1547e17c30781b3b3330a4.camel@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/mrouted: bump to version 4.7
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

On Thu, Sep 17, 2026 at 04:12:28PM +0200, Joachim Wiberg wrote:
> On Thu, 2026-09-17 at 09:44 +0200, Thomas Petazzoni wrote:
> > On Mon, Sep 14, 2026 at 12:30:20PM +0200, Joachim Wiberg wrote:
> > > - Fix invalid daemon path in S41mrouted
> > Is this invalid because of the bump, or was it already wrong for
> > mrouted 4.6 ?
> 
> It hard-coded /sbin/mrouted but the daemon has always installed to
> /usr/sbin/mrouted, so it works with BR2_ROOTFS_MERGED_USR=y but not
> without.

Then, this fix is unrelated to the version bump, and should be in a
separate patch (which should indicate which commit introduced the
issue). Then, this patch will be backported to our stable branches,
while the version bump will only be in master.

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
