Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE714C48295
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 15:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91B8E409A2;
	Mon,  5 Feb 2024 15:34:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91B8E409A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UcAX9nczLA0A; Mon,  5 Feb 2024 15:34:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8E004090A;
	Mon,  5 Feb 2024 15:34:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8E004090A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CAD881BF2F6
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 15:34:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A137E40320
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 15:34:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A137E40320
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j8n4TSOuT-zT for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 15:34:03 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EF53B40022
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 15:34:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF53B40022
Received: by mail.gandi.net (Postfix) with ESMTPSA id D79AA60004;
 Mon,  5 Feb 2024 15:33:59 +0000 (UTC)
Date: Mon, 5 Feb 2024 16:33:58 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240205163358.7752aec0@windsurf>
In-Reply-To: <20240116214427.945514-1-fontaine.fabrice@gmail.com>
References: <20240116214427.945514-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707147240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dtes1VIop1y7gtUMkHvNsNnJfqBOW6CzBrGKaS13veg=;
 b=ovrE7jdAwtIaoCUi/SBsuEiDrYaIRi0jQRHwl3IGnG034fNKRnw1VEqFSFpEKDnoNH+KjM
 4/G4XPMeJ0YWKMxCCksKaEhF86CCiAooZIsHOvNmY+LBSgjOjYdwQ9F3Z1Yp+6s41Q74sY
 yDZCSFeCROoeRCP/n50baF9e24JBYJfQUv7PnWRozxJboJn1dQgkq4vrfJka2WF2It8cMZ
 S3aERv6yB6xDMJ9o4rDXdFiKrJW4NkA+frk6yICw3POJ5e2h+fdrSYiotJmm95g68SG1CH
 LEzqbV6Ht0KLsiYkM7F9WZWqbRL3effre4uu0Adg/6lxUICJMSvu0ux6KWa0CQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ovrE7jdA
Subject: Re: [Buildroot] [PATCH 1/1] package/libtracefs: needs threads
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 16 Jan 2024 22:44:27 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> libtracefs needs threads resulting in the following build failure since
> its addition in commit b1dbd3f679e6660325472e3fdca72127d74e6929:
> 
> In file included from /home/autobuild/autobuild/instance-2/output-1/host/xtensa-buildroot-linux-uclibc/sysroot/usr/include/stdio.h:27,
>                  from ../src/tracefs-instance.c:10:
> /home/autobuild/autobuild/instance-2/output-1/host/xtensa-buildroot-linux-uclibc/sysroot/usr/include/features.h:218:5: warning: #warning requested reentrant code, but thread support was disabled [-Wcpp]
>   218 | #   warning requested reentrant code, but thread support was disabled
>       |     ^~~~~~~
> ../src/tracefs-instance.c:20:10: fatal error: pthread.h: No such file or directory
>    20 | #include <pthread.h>
>       |          ^~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/e0a8dd0781a1d1824a4cb78f47dcff4055083959
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libtracefs/Config.in  | 5 +++--
>  package/linux-tools/Config.in | 5 +++--
>  2 files changed, 6 insertions(+), 4 deletions(-)

Thanks a lot! It looks like you missed trace-cmd package, which also
selects libtracefs, so I fixed that up when applying. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
