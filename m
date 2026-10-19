Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B484CCF2DB
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 13:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 165E980F90;
	Mon, 19 Oct 2026 13:17:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qPmH5T1dqDLB; Mon, 19 Oct 2026 13:17:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 41A0680F4D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792415840;
	b=VZwAV0LTOdKCpFyeKj4ORPVQvJ7jCbHmlpgbxyggwWEyc9FM2DvfkOfH7wM6gFCcesUx
	 YKFskRuHxJVXp1dsw/RcCqUP2CQZ7KbYkCskcoeIonG4eNEtPTI1cHmr3j+frEtokhhS+
	 Evzih2PWakaPsjaLwHzw63tc6YN04l2+5nYkaqjDCk8ay/vyJhrjseEQ1lVdDTMCOF/XU
	 w+j2HRv6PAr4tN+qolSrOBSaV4BIJa//x2mcJyYyyoj+a303D/436/Tl813v+fPi+vfea
	 wq664ubE7xgE0OP86sIVDfnmyqhFN0CrxyPapL4zauek4Kpw4/hYJdZeAyJGz/rS96g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792415840;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZCr1POaVaw2jLeSLUBz7NbpvXvufmBT+iZP6ofir/+8=;
	b=MGhGuF605xSrMTCgic/ICmPRwm6b5dKM8lCTeMm1CDm0ATS4cXN1lB4V0Vbh0Oacc7fA
	 vCKaTHBhsrbqkDoQKWQCCSaugPcRbD1PDjrZdCI9e4AAZTK1CzQPl1x/4eHn7BKHZGCk8
	 2+QfPw8+knEv5N4zGAIshq+XQlPYRn4jgznAHS6lyuS5le1B1t38AIjrjYJsDdOYg3+vJ
	 HklV1lGFyAc6CSydRVl5PXXvmf7LWVNzRgwftra9RW7xn3sbQ4TDpxrMhaPVn6mRDmV9m
	 91QSPbR5pAqn6PiniYPeOru3yWfMo0orPqZ/m2apGW7KRQD76Kyi1APYfeBvUkiYgcw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792415840;
	bh=ZCr1POaVaw2jLeSLUBz7NbpvXvufmBT+iZP6ofir/+8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=A+7GjcRPrrKnPXH+ko9JAMF1wCM5Co6S+zdecXuf99o9HRcBA+r0AGEcIMjwHwYxQ
	 lsWAn9xkJRGsGQ7URqnn3fQBRypQcOFtLzSmM8tBr+gZsFBPKdpmsimFGfARQMtXEz
	 gevmZFhnlA3brUvfLlXmEOr20XOToOwx9S0vg3sYdRLbhNFWnTl1T/XC0qmY4/ZH+t
	 NivZ9vK11mNB/d9JNLVXYFAncnUOwmHwsPJguQxlUXYCrSVAnM3xcWj42ZI3QVO+xv
	 s/NgzX2y89YRyx+p4N6FQQMoEmrc7VHVKuyPBDgJTs6ivkS+pZURZq0AA39oJRQPXN
	 xlueer9aql/BA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41A0680F4D;
	Mon, 19 Oct 2026 13:17:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A81C23A
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 13:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26D4E80F23
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 13:17:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OG_etkBjxwe6 for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 13:17:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 248AE80F4D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792415837;
 b=XNkO7dTFKnDitzHPhGcMvMSuI6OUJIJVcnU2l+ED5NV8yXwG8Sp8GT61c6OXHGk98/lf
 uSZx4tymvtfD+PDSMkYbLfIDIL3rsuS+5t9mUIkFYV8K1qrt+7YxpVIbVKTBbtftdt1Oy
 /1YrHsr/Oo9jD5XuJGl2IvzDUnt/5yiQQOtG5Lrgz+mXV15oa1x3UicEbayPtA/IieV0F
 RIqBCXezaNKy0IXfsQQwCBm3fmiKgS+6Pzmax+OHeG4RSQ1jbCraFT6u8qV3NT53m9NHq
 0kxg8ALqQZjWLhzJfU1bbdTAmPameZPeukVQrEi7L4fjHRUs/aTOS4L+/l31PrNcfew==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792415837;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=bilswv2f03wIPvfzL9lmySTq+14owWu0VIQQrsS3Gxo=;
 b=piJWKLzlQ7Up9KzyUNg1rJWlXTj5fYwIWFhFWNPC8Xb1j88hWjqNEv9oI7z54fpQD31R
 K5Ee+Y0Lw7L+vwMdPxfvNP+bi2Jdsh9J7etC+8qOFbMi42aVdTKanlAbRkkFW4Yaa+ibO
 3MpqbSN61FWSBFRFMPjZw0BPS9/CLjMEQ9rIr8Rv3vKAOxCnCbhGIErJLVZPQhsHm4NTR
 0nj/GiqUg9zaem1rEFCuqk6JkBy5DmEpn2Zeyw4vxXcE//3gjSVzeytMXWnLtuuD5R2px
 DmxUuqI2RoYZHtEWq5BeiJsfSgRCGB8GTxlAI957fRgRCaB0p9Vi18PHwOZ6/E3tcsQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="lC/G2KbZ"; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 248AE80F4D
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 13:17:16 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 08A9DC653EB
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 13:18:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E7B7F60582;
 Mon, 19 Oct 2026 13:17:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E3BE410328D5D; 
 Mon, 19 Oct 2026 15:17:08 +0200 (CEST)
Date: Mon, 19 Oct 2026 15:17:07 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org
Message-ID: <atYYTth52JM0V0g-@windsurf>
References: <20261019122636.1673626-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261019122636.1673626-1-dario.binacchi@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/drogon: bump to version 1.9.14
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

On Mon, Oct 19, 2026 at 02:26:26PM +0200, Dario Binacchi wrote:
> Release notes:
> https://github.com/drogonframework/drogon/releases/tag/v1.9.14
> 
> Drop the local patches, as both fixes are part of the trantor
> submodule shipped with this release:
> - 0001-Fix-EPOLLRDHUP-POLLRDHUP-mismatch-on-Linux-SPARC-SPA.patch:
>   https://github.com/an-tao/trantor/commit/0f45310fbbb6
> - 0002-Fix-incomplete-struct-tm-type-on-uClibc.patch:
>   https://github.com/an-tao/trantor/commit/66dc5780ed4d
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

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
