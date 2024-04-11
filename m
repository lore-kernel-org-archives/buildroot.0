Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E075CD128A
	for <buildroot@archiver.kernel.org>; Thu, 11 Apr 2024 05:59:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 299C740540;
	Thu, 11 Apr 2024 05:59:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KwZNlEvhFwVU; Thu, 11 Apr 2024 05:59:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE13B405FF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE13B405FF;
	Thu, 11 Apr 2024 05:59:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C36CC1BF215
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 05:59:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0EAF40291
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 05:59:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6-PyfF7t8eHT for <buildroot@lists.busybox.net>;
 Thu, 11 Apr 2024 05:59:53 +0000 (UTC)
X-Greylist: delayed 46050 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 11 Apr 2024 05:59:52 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0AC284018E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0AC284018E
Received-SPF: Pass (sender SPF authorized) identity=helo;
 client-ip=217.70.183.195; helo=relay3-d.mail.gandi.net;
 envelope-from=jeanmichel.hautbois@yoseli.org; receiver=<UNKNOWN> 
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0AC284018E
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 05:59:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F1E9F60005;
 Thu, 11 Apr 2024 05:59:49 +0000 (UTC)
Message-ID: <9b5aee40-4cdb-480c-bd9f-d1bcbe5c57a9@yoseli.org>
Date: Thu, 11 Apr 2024 07:59:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240410171211.1633127-1-jeanmichel.hautbois@yoseli.org>
 <20240410171211.1633127-2-jeanmichel.hautbois@yoseli.org>
 <20240410215656.1756a37e@windsurf>
 <f85e872c-8d99-4dcf-997e-95d3a382b463@yoseli.org>
 <20240410231711.084c9d7e@windsurf>
Content-Language: en-US
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
In-Reply-To: <20240410231711.084c9d7e@windsurf>
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yoseli.org; s=gm1; t=1712815190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fow26T061qflWq566WltbDPQElMmhxQuYF8nIZbIw4s=;
 b=bhNJO8EMHl9nrR0aYJ3N2Fr1jvscBQJslS7HYiFfoFuqnad1KFImN8PhHPItKqHY3bQ5Sx
 eWWt+DEZOGCFkbXKX1A7qdjvCppTuwVVfytvzO0Cbyg7WZaArfXcmeE+oBWyKQ9mDGfjBe
 yPDe/ymp2mXJ3klgKz+1yRht+TjYeC7rcKa0HP1yNIxxM6a8wSmHyX52VZ5H4Ed8RSzYOk
 hNaySFn2J4IYwuHF+4sIR9t7v6keoJOM211Ze4q9fRBZSwbGZowzW+gx4qVK4S/fL4x8xe
 /QLlq0hgrWKveUW+Nnhr5pBWo9G2Ij4z8uJGIYizCqoiLs63F2A5EXLF8jyPaA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=yoseli.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=yoseli.org header.i=@yoseli.org header.a=rsa-sha256
 header.s=gm1 header.b=bhNJO8EM
Subject: Re: [Buildroot] [PATCH v2 1/3] arch: add support for mcf5441x
 Colfdire
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 yann.morin.1998@free.fr
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 10/04/2024 23:17, Thomas Petazzoni via buildroot wrote:
> On Wed, 10 Apr 2024 23:08:14 +0200
> Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org> wrote:
> 
>>> What happens when you don't specify -march? Do you know which of isaa,
>>> isaaplus, isab and isac the MCF5441x corresponds to?
>>
>> I did not check what happens, but based on the following file it is isac:
>> https://github.com/gcc-mirror/gcc/blob/master/gcc/config/m68k/m68k-devices.def#L168
> 
> And if you specify -mcpu instead, does it work? What doesn't work if
> you omit -march?

If I change the line to pass isac, host-gcc-final doest not build at all:
<snip>
checking if mkdir takes one argument... no
Invalid --with-arch=isac
make[3]: *** [Makefile:4553: configure-gcc] Error 1
make[2]: *** [Makefile:1029: all] Error 2
make[1]: *** [package/pkg-generic.mk:283: 
/home/jm/Projects/wabtec/buildroot/output/build/host-gcc-final-12.3.0/.stamp_built] 
Error 2

As I am not as experimented as you with toolchains, I would certainly 
appreciate some guidance to debug if needed.

I can tell for sure that with "cf" and the 54455 family specified, it 
builds my applications ;-).

JM
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
