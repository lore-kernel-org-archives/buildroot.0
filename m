Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFBACDB482
	for <buildroot@archiver.kernel.org>; Thu, 19 Oct 2023 19:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9488C401F1;
	Thu, 19 Oct 2023 19:44:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9488C401F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lUHymfjZpr4v; Thu, 19 Oct 2023 19:44:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A012D430F0;
	Thu, 19 Oct 2023 19:44:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A012D430F0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EADD51BF5F8
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 19:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C45D480DA6
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 19:44:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C45D480DA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GzX-q46n3cLc for <buildroot@lists.busybox.net>;
 Thu, 19 Oct 2023 19:44:46 +0000 (UTC)
X-Greylist: delayed 43802 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 19 Oct 2023 19:44:45 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A64B5808A3
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A64B5808A3
 for <buildroot@buildroot.org>; Thu, 19 Oct 2023 19:44:45 +0000 (UTC)
Received: from [IPV6:2a01:e0a:947:3d0:49f7:3e68:6eba:4cf6] (unknown
 [IPv6:2a01:e0a:947:3d0:49f7:3e68:6eba:4cf6])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 8F908C06CE
 for <buildroot@buildroot.org>; Thu, 19 Oct 2023 21:44:42 +0200 (CEST)
Message-ID: <3726ce0b-4b91-4128-b20a-d27eb0f483f5@grenoble.cnrs.fr>
Date: Thu, 19 Oct 2023 21:44:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20231017143424.430007-1-anaumann@ultratronik.de>
 <PH1P110MB1603AE1FC3925D2A2D33EEED9FD6A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
 <38dd6e9a-7fea-e3fb-21a1-5a381a36c8cf@mind.be>
 <bede2a82-ee1f-4f8a-97f8-c6e2b54b2b84@grenoble.cnrs.fr>
 <PH1P110MB160358C3869C0C4BADDCB52B9FD4A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
In-Reply-To: <PH1P110MB160358C3869C0C4BADDCB52B9FD4A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1697744682;
 bh=rjLBbzJ6hHASXVxmBeIjZAMAxalXnjU8vTB/TkBsto8=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=kAUzXp9qwHHAL37CgRlZAt50+X99W0KfAVEB/JoFC3ZNC8nrUV+8qRE/gRj/mGTYe
 XCwwvpV5D5jGCXxmwgB90BC4eDYNEZtbG5M+KQizwmvaHI36NVM4aqkrLPFkDvb45d
 NZrfNUF/0Up6SQJK4ujVYG6GYbNU+Oe5emNk2sy3nH2y0EZ04/FMWwOVSd+1ipscWE
 g6Xf7vknyr8BtnEu/9oPYHSn4SnK58fLUO59ylygZ995NbawQS7cuxKqM/ZksNPPda
 ErqhENg2xhFblV6Q7ogzu1DMtNGh6Bp1E1BGX+CqC43Hf52OlZvlD6mtRztvGfSzxQ
 R3a+hViS+0IuQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=kAUzXp9q
Subject: Re: [Buildroot] [External] - [PATCH 0/1] libgpiod v2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

About how to make upstream packages build with both versions 1 and 2 of
libgpiod, Vincent Fazio wrote:
> I was considering checking the version with pkg-config

Good point! This may be the cleanest way of setting up conditional
compilation. I will try it on a small piece of software I am
maintaining.

> all upstream packages are going to have to deal with it at some point

Indeed, but I guess most maintainers are not rushing to do so. FWIW,
other than Fedora Rawhide, it seems all mainstream Linux distros are
still supplying libgpiod v1.[1]

Regards,

Edgar.

[1] https://pkgs.org/search/?q=libgpiod
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
