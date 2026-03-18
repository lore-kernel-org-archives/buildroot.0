Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12CC8FCD0A7
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 04:44:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD56C41414;
	Wed, 18 Mar 2026 04:44:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qrSTYfCgUCz3; Wed, 18 Mar 2026 04:44:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA54D4133E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773809043;
	bh=/DNhWacLLLg7wOiGLBPsgycF15ffIlAce/sWGKrQCDA=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p/X3rDlAHVf9ey/jRu7eo2NU4mok4ebEZISxib65UzAL2gVDR8iLWACSmWGsNwMZT
	 ZL207NtGod2xhi7FwoeRkdVoLmGa/nPY3nu1DkvhvgbsrlfdHIuv6TgiwapYfDsUGO
	 YITIPnBDUK7198b+367Wa6WE7WWEU7sTo0cAJp1umq6zyasGavrjY9nzyxdtcSQWL2
	 LulvwwroY+gnx29Eoh3L4qQzk7BeMWgllLBSgu7xG28/42h1jh/O/iit2JCs4etPgv
	 +ikcBjompmwBIhvQRG9neWy8d6+cLRyFMhoKLNOFzyLaIfBL/mBKZKN836WP+CDXyF
	 ovQVcDM3PZZHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA54D4133E;
	Wed, 18 Mar 2026 04:44:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CD2FED3
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 04:44:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD22B4013D
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 04:44:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YGlanoK4VbGr for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 04:44:00 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A29774032F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A29774032F
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A29774032F
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 04:43:58 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 89D94BDE1247;
 Wed, 18 Mar 2026 05:43:54 +0100 (CET)
MIME-Version: 1.0
Date: Wed, 18 Mar 2026 04:43:54 +0000
From: Andreas Ziegler <br025@umbiko.net>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
In-Reply-To: <mailman.9.1773748801.2109898.buildroot@buildroot.org>
References: <mailman.9.1773748801.2109898.buildroot@buildroot.org>
Message-ID: <56f32918983755443d8008e93fd25978@umbiko.net>
X-Sender: br025@umbiko.net
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1773809034; bh=2wfT2NxOy63klRgB+j6sEf8KZR8gtsJuaCrRwJ284o8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=mOnFxMAJeazk/iNBm2mjRYmtXvEH0eyYecI224KEqyklL0jSthMB5gIf5P4P7jrFy
 /68+E65l2P3iyYTczM0+3yOheRIRNZW+/avq1xwkcmibzZ8n/g8ltbmpsE4s0zkIz3
 G3d2CeRA/chKdnLzyyRP4fvzgxJ+BBH7J3qkA5sI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=mOnFxMAJ
Subject: Re: [Buildroot] [PATCH] package/pkg-generic: add support for
 uninstalling packages
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas, Shubham, ALL,

On 2026-03-17 10:08, Thomas Petazzoni wrote:
> 
> Hello,
> 
> On Tue, Mar 17, 2026 at 01:41:25PM +0530, Shubham Chakraborty wrote:
> 
>> I didn't consider reverse dependencies. The scenario you described
>> (uninstalling openssl breaking ntp) is a
>> serious problem that makes the current implementation unsafe.
>> 
>> I see a few potential approaches to address this:
>> 
>>  1. Add dependency checking that refuses to uninstall if reverse
>> dependencies exist (similar to package managers like apt/dnf)
> 
> This would make the feature useless for a significant number of
> packages I'd say.

In most cases, exactly these reverse dependencies make removal of the 
package desirable. Testing with and without sometimes needs manual 
intervention. Also I prefer clearing up the mess after testing to doing 
a full rebuild: it's less time consuming.

>>  2. Implement cascade uninstall (uninstall the package and all its 
>> reverse
>> dependencies)
> 
> This would probably be the logical thing, I guess?
> 

Nice to have, but is it worth the effort? This is not a tool for 
everyday use, and most people will know what they are doing.

>>  4. Simply document this as a "use at your own risk" feature for 
>> advanced
>> debugging scenarios
>> 
>> I wanted to ask: would any of these approaches be acceptable for 
>> Buildroot?
>> Or is the fundamental issue that without proper
>> dependency tracking during uninstall, this feature is too dangerous to
>> include regardless of warnings/checks?
> 
> This has so far been the project's opinion on this topic. But nothing
> is set in stone forever, so we can always revisit/rediscuss things.

I used to delete files manually, until I discovered the central 
packages-file-list*.txt files, and have been using a similar Python 
script for a few years. Shubham's approach to use the package based 
lists is better.

Including the script as a build target is optional.

> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com

Kind regards,
Andreas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
