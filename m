Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FE06C3DA4B
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 18:49:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A441402DA;
	Mon, 15 Jul 2024 18:49:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KnCWFhJW3Daq; Mon, 15 Jul 2024 18:49:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADD2840323
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADD2840323;
	Mon, 15 Jul 2024 18:49:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 41D131BF3F0
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 18:49:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3CCF36062B
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 18:49:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ogHs2ETYQIG6 for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 18:49:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EBD08605C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBD08605C9
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EBD08605C9
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 18:49:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D1DC2E0003;
 Mon, 15 Jul 2024 18:49:09 +0000 (UTC)
Date: Mon, 15 Jul 2024 20:49:08 +0200
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Message-ID: <20240715204908.570651f2@windsurf>
In-Reply-To: <bac58c99-45bc-4d7d-9b34-1fca6bbdfd24@mind.be>
References: <20230916154940.746749-1-fontaine.fabrice@gmail.com>
 <37f6d34b-589e-4570-88d7-28aa967d45b5@gmx.at>
 <CAPi7W83Uf-Cjr7EWJEmN_E90FkqBq50jv2vJtK5yk+DJ2CLMTw@mail.gmail.com>
 <8c7c1d56-02a1-4a1f-a5b2-cae3928d79ba@gmx.at>
 <bac58c99-45bc-4d7d-9b34-1fca6bbdfd24@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721069350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lQ9VZYZLrlk9SLMgnaFe+fOYzbtmaSI2YW8k1M7CmcY=;
 b=F193Dvtke2XkJvXpOF+0dHUGGBzO0tXOSPdd6HsApV51U9AJdV/FBMfbh0vShtXmNeCjeh
 +D14NSLRgRCaDhrJJ1P+qpi88Flk8fUvgIm3oxmttMY3BUo4oisgIYrpqP48Uc0XP1PeUa
 56GxYVCyka8zBWkoEF4u0WR8ope8FrBu+RlS4bAC1jW+39mNKM1BC0PT4qe7m2oYwVMifo
 euAW9uHIVYktqDChsIQsbcKRDMd1DZQ3rFJXO67cmGgUBgthmHMUaT0R/maYOxPUh9xqt9
 p5fTyJJ7UiBwoZVEZ0q75EfGSAUcz+fARpJhSP6dZ6xLuXafMyGueK/np2HHTA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=F193Dvtk
Subject: Re: [Buildroot] [PATCH 1/1] package/at-spi2-core: propagate dynamic
 library dependency
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Daniel Lang <dalang@gmx.at>, Bernd Kuhls <bernd@kuhls.net>,
 Simon Dawson <spdawson@gmail.com>, James Knight <james.knight@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 12 Jul 2024 22:08:09 +0200
Arnout Vandecappelle via buildroot <buildroot@buildroot.org> wrote:

>   We're months later, the bump to 2.50.0 has been merged, so it should be 
> possible now to drop the dependency on !STATIC, right? IIUC it takes a little 
> more effort because we also need a way to enable/disable the gtk2_atk_adaptor 
> option...

Thing is that I don't see how the gtk2_atk_adaptor option pointed by
Daniel Lang can help, and how it relates to dlopen() being needed or
not.

Indeed, in meson.build, regardless of gtk2_atk_adaptor, I see:

if not get_option('atk_only')
  if cc.has_function('dlopen')
    dl_dep = []
  elif cc.has_function('dlopen', args: '-ldl')
    dl_dep = cc.find_library('dl')
  else
    error('Could not find a library with the dlopen function')
  endif
endif

so unless atk_only is defined, dlopen() will be needed. atk_only is
defined as such:

option('atk_only',
       description: 'Build only the ATK stub library without atspi or at-spi2-atk (UNSUPPORTED)',
       type: 'boolean',
       value: false)

of course the UNSUPPORTED is a bit scary. But perhaps that would make
sense in the context of Buildroot. Both libgtk2/libgtk3 require
at-spi2-core, but we can imagine that real accessibility support is not
always needed, so being able to build a stub at-spi2-core might be
interesting, and that would allow to not require dlopen(), apparently.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
