Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 398FAC5B572
	for <buildroot@archiver.kernel.org>; Mon, 17 Aug 2026 03:40:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0BD0606BA;
	Mon, 17 Aug 2026 03:40:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8FrRrpabSfdf; Mon, 17 Aug 2026 03:40:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC4D8606C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786938014;
	bh=I56TMbk7tMTHbrwp92xEHnMU4trGUinRJ1C9YcJvWlY=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GuOTfuQhf4Gk+xXIBK/+bznL6vqVzNEeaZGnBKULRkXbokh5AijXhU3FyF5JUC6fV
	 imWhZlKBZNxPOehkt7nkTUJ1lqbG6Tj5SPIIbcXHE2GbsLntAZDi+qAjAeJ2o6PA2v
	 f3A8wBP6ncjudKw0yIPl6zhsouxAEu88swCNE9VxDizATSQEG8bI/mVmUvgg624+Gx
	 AZZjb960wYctfhDuCR94bXi91bmACeKDbqJP97E6p1B0DWwjEzFBlQHf/Zn6snKY1n
	 7fhOenVFJInoBpnbhDItm6E6QU3J5PdAApbaZ6kf1WfGRGZvKRPfSpcr/n5hAJe+f1
	 1UN87ojIrY0OQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC4D8606C5;
	Mon, 17 Aug 2026 03:40:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4145E336
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 03:40:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2DE58606BA
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 03:40:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n6-E3QpXqFtg for <buildroot@buildroot.org>;
 Mon, 17 Aug 2026 03:40:11 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 47756606B9
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=umbiko.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47756606B9
Authentication-Results: smtp3.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=UOiaZTB+
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 47756606B9
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 03:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=umbiko.net; s=mail;
 t=1786938007; bh=tx6bpaY4VVKceV0CBi+e4O6/GA5f4KlWKwuhO9+S960=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=UOiaZTB+eCKaHoicUsGxBb4wpIhIRVlw4xziWBB/zK8Z1p0R01Vye3JTmJ1YlS/Y2
 t8ebvposXjMb7689SuTZt6rJgMOhMf8UaPOeZnxiAipzD8cxQ/EBu1t8FEEXidRHIw
 6XJESi9yJ+kum/hxYlqY0+3ykITbYu43R6qUZ1w4=
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 26E60BDE26C2;
 Mon, 17 Aug 2026 05:40:07 +0200 (CEST)
MIME-Version: 1.0
Date: Mon, 17 Aug 2026 03:40:07 +0000
From: Andreas Ziegler <br025@umbiko.net>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Marcus Hoffmann <buildroot@bubu1.eu>
In-Reply-To: <aoC_7t65PJ5NLjlc@windsurf>
References: <20260709110822.305873-1-br025@umbiko.net>
 <20260709110822.305873-4-br025@umbiko.net> <aoC_7t65PJ5NLjlc@windsurf>
Message-ID: <d69442026a8c993fdd6e551fadfa7ca2@umbiko.net>
X-Sender: br025@umbiko.net
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
Subject: Re: [Buildroot] [PATCH v2 03/11] package/mpd: reorder config items
 based on order in meson_options.txt
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

Hi Thomas, Everyone,

On 2026-08-15 19:38, Thomas Petazzoni wrote:
> Hello Andreas,
> 
> On Thu, Jul 09, 2026 at 01:08:07PM +0200, Andreas Ziegler wrote:
>> MPD has 99 configurable options; of these, 44 are exposed in 
>> Buildroot's
>> Config.in. Sort order and grouping of these options are different 
>> within
>> the MPD project and Buildroot, which makes a comparison difficult.
>> 
>> Reorder entries in Config.in to reflect their order in 
>> meson_options.txt.
>> Also update at least some of the help texts to more closely resemble 
>> what
>> is published in the MPD manual.
> 
> Thanks for your patch.
> 
> The Buildroot policy in terms of sorting options in Config.in is
> rather "alphabetic ordering" and not "whatever order is used in the
> upstream meson_options.txt or configure.ac".

The original order in the mpd Config.in was by functional groups. These 
are indeed sorted alphabetical. Using the meson_options.txt order would 
make comparisons much easier ...

> Note that it is very possible that alphabetic ordering is already
> broken, in which case it would be totally OK to fix. But we will
> prefer to keep alphabetic ordering vs. meson_options.txt
> ordering. This is most notably to have a consistent policy between all
> our packages.

I will leave the file as-is for now.

> Best regards,
> 
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
