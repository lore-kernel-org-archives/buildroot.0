Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA1F0C48BC3
	for <buildroot@archiver.kernel.org>; Mon, 19 Feb 2024 21:23:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F01640BA3;
	Mon, 19 Feb 2024 21:23:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pEJxKWoMDlSt; Mon, 19 Feb 2024 21:23:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4344840B9D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4344840B9D;
	Mon, 19 Feb 2024 21:23:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C9C491BF3A3
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 21:23:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C3DE2407D2
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 21:23:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fuif8T_ZMooE for <buildroot@lists.busybox.net>;
 Mon, 19 Feb 2024 21:23:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BBF5A40784
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBF5A40784
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BBF5A40784
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 21:23:52 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 3AD9913F89A;
 Mon, 19 Feb 2024 22:23:33 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 19 Feb 2024 22:23:32 +0100
Date: Mon, 19 Feb 2024 22:23:32 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Andreas Naumann <anaumann@ultratronik.de>
Message-ID: <ZdPG1PGaE3RfoWHk@landeda>
References: <20240219095155.2758428-1-anaumann@ultratronik.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240219095155.2758428-1-anaumann@ultratronik.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1708377830;
 bh=MlTR7GaPGdL/Hf98CfPTsVRzT6z8shnG6B+lGMX3t9s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h1Zn4gu7SfYwBK4B/st8dBLNWFpVaBnen7I34/5H4AetdiBYsYipGwxLaTSeq+hFM
 wxjG+leztpr9z2ezgI/KKhufjq+DcxDA7Zkx02h4AwVjtUm6ks26Sb2BZuyMM4HNi4
 ME3kbpkO/nLx/t3Ekl11Ff4OycAeO8ulCfPt7qtDT31PKVVlzpgzaaeWW9A8P1BhIZ
 VYXRHAHiaHS1jn4yo3Zoq8V7EeDjtkeTURM8WVIwGfXN+GOCQU1wmP6srAiHuRPZcd
 BR/2ZmSjN2X7+OxZhXMyd3xLkqWW1+/Gh9irNcGR+KM/VLU50fuBWpz5O+XmkNIb/p
 WA25/z/1TElZg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=h1Zn4gu7
Subject: Re: [Buildroot] [PATCH 0/2] Fix flutter build failure
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Andreas, All,

On 2024-02-19 10:51 +0100, Andreas Naumann spake thusly:
> Hello Adam, all,
> I was motivated to give flutter a spin after your talk at FOSDEM,
> however the recent bump to Python 3.12.1 broke some script during
> the flutter-engine configure step.
> Fortunately now a new major stable version has been released 3.19.0,
> which contains a patch for this.
> 
> After bumping engine and sdk they successfully build again, as does
> creating the flutter bundles which you provided in
> https://github.com/aduskett/buildroot-fosdem2024-flutter-demos
> 
> I have not yet been able to run them using ivi-homescreen, but that's
> probably due to my target display/wayland setup.
> 
> However, the flutter-gallery no longer builds with 3.19, even after
> bumping to the main HEAD. Their github README says
> "NOTE: The Flutter Gallery is now deprecated, and no longer being active
> maintained."
> I thought about including a patch for removal of the gallery package,
> but that would leave us with no example for how to create a flutter
> bundle.

The upstream repository has also been "archived", which means it is
frozen and will never get fixed, ever.

That's a bit unfortunate indeed, but we don't have much choice going
forward: we'll have to drop that package in the near future, but not
now: we're still considering reverting the python 3.12 version bump for
2024.02, as it still causes issues in the target==build case, which
means we'd be able to keep the current flutter stack for 2024.02 LTS.

Then, we can reintroduce python3, the flutter-engine bumps in this
series, and drop flutter-gfallery, hopefully introducing another package
as an example on how to build flutter packages...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
