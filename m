Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49AD8D68B00
	for <buildroot@archiver.kernel.org>; Thu, 14 Nov 2024 12:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D463407C9;
	Thu, 14 Nov 2024 12:44:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rN1wXYa6VgVT; Thu, 14 Nov 2024 12:44:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46084407C8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46084407C8;
	Thu, 14 Nov 2024 12:44:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BE87972
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 12:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1AF3542F6C
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 12:44:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n3VaAipnrq4n for <buildroot@buildroot.org>;
 Thu, 14 Nov 2024 12:44:16 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=198.175.65.14;
 helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8B92E42F68
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B92E42F68
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8B92E42F68
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 12:44:16 +0000 (UTC)
X-CSE-ConnectionGUID: 0PWxPXReRF6iVk2hNGqRew==
X-CSE-MsgGUID: 9q8RWU9xTz+ifaLhi6cA9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="35317716"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="35317716"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 04:44:16 -0800
X-CSE-ConnectionGUID: dgiz66CCS5mFSWOOlLcTqQ==
X-CSE-MsgGUID: 0k/3ZLW/QP+RPqSErJwjlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="88594121"
Received: from smile.fi.intel.com ([10.237.72.154])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 04:44:15 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tBZCm-0000000Eib4-3gNf; Thu, 14 Nov 2024 14:44:12 +0200
Date: Thu, 14 Nov 2024 14:44:12 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
Message-ID: <ZzXwnIy2hU9zDrwF@smile.fi.intel.com>
References: <87cyiyxpsg.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87cyiyxpsg.fsf@dell.be.48ers.dk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731588257; x=1763124257;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=qmSrS28SG2WQWzR557ydbkXPGKexFL5XRWNRFMeLWYU=;
 b=JvUFQJOKDm5+Bj/xxVR5BnLWS4zNHAvftn/CZ47iQfKGOkWZLR1k0ZCf
 uCJSKyJqtda6LNx40hAJObY+P6JQx3Wm+wPtopCZR2gd09sTxsdlIqPmF
 jYQao1g1zBj7rqTtUkW1CA2jVRrIwy770yld/RPZuT4AvktJ8WeOK3ECZ
 GXMrZs7tj63PW+m0A1ppa2RGK0tJHKMdh2ycz7yE1vmkJn1ala8vqZOqV
 I3u0YEt19phNwwjWMxFrHF78OFnrmzzwqG9HR/2+mKiiIiu5JpEMct+Ml
 hZjh2ZQD03ZlhXiPQcaOpQPW63c4++uJEuUZhm9UREw9VWM9aMhpNGBSv
 A==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=linux.intel.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=JvUFQJOK
Subject: Re: [Buildroot] Buildroot 2024.11-rc1 released
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Nov 14, 2024 at 08:01:03AM +0100, Peter Korsgaard wrote:
> Hi,
> =

> Buildroot 2024.11-rc1 is released - Go download it at:
> =

> http://buildroot.net/downloads/buildroot-2024.11-rc1.tar.gz
> =

> or
> =

> http://buildroot.net/downloads/buildroot-2024.11-rc1.tar.xz
> =

> Or get it from Git:
> =

> git://git.buildroot.net/buildroot
> =

> Please give it a spin and report any problems to the mailing list or
> bug tracker.

Thanks!

...

> And a special thanks to our patch reviewers:
> =

> git log 2024.08.. | grep -Ei '(reviewed|acked)-by:' | \
>     sed 's/.*by: //' | sort | uniq -c | sort -n -r

Useless use of grep and sed :-)

I get this via

$ git log --no-merges --grep '(Reviewed|Acked)-by:' -E -i --format=3D"%(tra=
ilers:valueonly=3Dtrue,key=3DReviewed-by,key=3DAcked-by)%-C()" 2024.08.. | =
sort | uniq -c | sort -nr

(yes, that's a bit longer, but faster :-)

>       8 Petr Vorel <petr.vorel@gmail.com>
>       5 Romain Naour <romain.naour@smile.fr>
>       5 Julien Olivain <ju.o@free.fr>
>       4 Leo Yu-Chi Liang <ycliang@andestech.com>
>       3 Luca Ceresoli <luca.ceresoli@bootlin.com>
>       3 Fiona Klute (WIWA) <fiona.klute@gmx.de>
>       3 Dario Binacchi <dario.binacchi@amarulasolutions.com>
>       2 Maxim Kochetkov <fido_max@inbox.ru>
>       2 Marcus Folkesson <marcus.folkesson@gmail.com>
>       2 Damien Le Moal <dlemoal@kernel.org>
>       2 Brandon Maier <brandon.maier@collins.com>
>       2 Adrian Perez de Castro <aperez@igalia.com>
>       1 Yann Morin <yann.morin.1998@free.fr>
>       1 TIAN Yuanhao <tianyuanhao3@163.com>
>       1 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>       1 Rapha=EBl M=E9lotte <raphael.melotte@mind.be>
>       1 Niklas Cassel <cassel@kernel.org>
>       1 Marcus Hoffmann <buildroot@bubu1.eu>
>       1 Kieran Bingham <kieran.bingham@ideasonboard.com>
>       1 Jos=E9 Luis Salvador Rufo <salvador.joseluis@gmail.com>
>       1 J. Neusch=E4fer <j.neuschaefer@gmx.net>
>       1 Herve Codina <herve.codina@bootlin.com>
>       1 Gilles Talis <gilles.talis@gmail.com>
>       1 Fiona Klute <fiona.klute@gmx.de>
>       1 Fabio Estevam <festevam@gmail.com>
>       1 Christian Stewart <christian@aperture.us>
>       1 Arnout Vandecappelle <arnout@mind.de>
>       1 Alistair Francis <alistair.francis@wdc.com>
>       1 Adam Duskett <adam.duskett@amarulasolutions.com>

-- =

With Best Regards,
Andy Shevchenko


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
