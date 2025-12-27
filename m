Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C276BE9271F
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 23:17:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C54680EA7;
	Sat, 27 Dec 2025 23:17:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xL096mf-DNap; Sat, 27 Dec 2025 23:17:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3275E80EB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766877460;
	bh=XXnrH50N/Qad4inzpRkCY/Gf1qUiwHrHW9Y6RuTsF0o=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LnZrw/8J2lfVeauiEWTRIxAuk5eGOE2L5Eg+LzM0cqw1MYxjJOSmtUt5bIKO2Yrjd
	 JO8Y4K0qkjrbT3koZLGDuZI9SLkP8vWLHkPugtOZ8UFPsIN5PhX3ErNy7fFNLzvQJj
	 +lC5qNy33zPL/Xs4xmTPSGeeXF53v/Wvq4FSXMNRrQ2PL/StFzVrtEabd7kMsCxiSU
	 6jbzD4IlJibMqca0Kxc29bYe3W24MGEM6C1AqSZVqdUKYYvrXFc6qJjd1zaC5AzpH/
	 nObVZ9bzhEACzaOzdXa2ibxSmeclJjIjvs/HDzIlf6cVNScW3fZcMSDxaaE+xdgtQl
	 wvsDzw0Vx7pTg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3275E80EB4;
	Sat, 27 Dec 2025 23:17:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A9FFCD8
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 23:17:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9663340177
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 23:17:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3MSZ98Gbak9n for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 23:17:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8399F400F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8399F400F8
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8399F400F8
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 23:17:37 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id BC7704E41E22
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 23:17:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8601560725;
 Sat, 27 Dec 2025 23:17:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 330EA11978B01; Sun, 28 Dec 2025 00:17:33 +0100 (CET)
Date: Sun, 28 Dec 2025 00:17:33 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <20251228001733.5e16a830@windsurf>
In-Reply-To: <20251205190034.1839192-1-bernd@kuhls.net>
References: <20251205190034.1839192-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766877454; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=CsyRZOUbkTmNcZm08eY08J0CnMyFRpAwY/Ycicrtxa4=;
 b=Q5XSpJi0fdXNaLE4LuNMXGBEZsoM6wdM2WS9eyVc8lAourodsG8w7GOaBJra1Y4XGs6WrN
 cUwhFsNuqxS48CCf0LOq+qIM2T7+35cULy3hDFivWNjspH99AgyN9USvrNaBqbNquDQWCM
 3vW1TvaUjS8JRcsCkB825ZvXwzjhVrpIWlO+rznW7UFmqCKWPGuoWQY841icxuW47JuA2S
 3sH1PcYudA56owm44Q6ZcXRXybaZbQkHrq4IlF34PD7o6W/3/3vOUn88jNnG+34ScPKjD2
 JMJbwD1rVdBpPehgrtLXKC/eexuMqJCHcLl6rv7adBcphfv5oF5poHrC0rp46g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=Q5XSpJi0
Subject: Re: [Buildroot] [PATCH/next 1/4] package/matchbox-lib: bump version
 to 1.14
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

Hello Bernd,

On Fri,  5 Dec 2025 20:00:31 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Changelog: https://git.yoctoproject.org/libmatchbox/log/?h=1.14
> 
> Switched _SOURCE to .gz, upstream does not provide bz2 tarballs anymore.
> 
> Updated license hash due to upstream commit:
> https://git.yoctoproject.org/libmatchbox/commit/COPYING?h=1.14&id=bd46fea025212dac5e2a218a41f971d4cba92b76
> 
> Fixes:
> https://autobuild.buildroot.net/results/66a/66ac5ae4b1cd053122ccebad9f61af02fa5fe7f6/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

I'm afraid your patch series again is not properly organized. You
continue to mix version bumps with build fixes. This is not good at
all, as it prevents our LTS maintainers from doing their job. Please
stop doing this, and provide fixes *then* bumps.

So I've changed this series to:

- Fix all 3 packages to use a .gz tarball (the issue exists in 2025.02)
- Fix the build issues, including some more that I discovered
- Bump matchbox-lib to 1.14

Could you please try to remember about this policy of providing fixes
separately from bumps?

Of course an exception is when the problem doesn't exist in a
maintained stable branch, in that case it's fine to provide a bump as a
fix.

Thanks for your contribution!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
