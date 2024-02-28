Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54CDEC54E4A
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 16:38:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EF49605D9;
	Wed, 28 Feb 2024 16:38:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kY_SF6HUBWuo; Wed, 28 Feb 2024 16:38:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F21E60E89
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F21E60E89;
	Wed, 28 Feb 2024 16:38:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8ED141BF2B3
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 16:38:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7929D60E7F
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 16:38:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lHnd-fquT29M for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 16:38:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4D0F8605D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D0F8605D9
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4D0F8605D9
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 16:38:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0C370C0004;
 Wed, 28 Feb 2024 16:38:51 +0000 (UTC)
Message-ID: <3da3fab9-dd42-4cd7-ad82-3ee8ea166334@korsgaard.com>
Date: Wed, 28 Feb 2024 17:38:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <20231223213800.348426-1-yann.morin.1998@free.fr>
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20231223213800.348426-1-yann.morin.1998@free.fr>
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] boot/syslinux: carry fix for build failures
 with binutils 2.31+
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
Cc: Meliodas <meliodasren01@gmail.com>, Sam Lancia <sam@gpsm.co.uk>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 23/12/2023 22.38, Yann E. MORIN wrote:
>  From a report on the syslinux mailing list [0]:
> 
>      The GNU linker now writes two segments of type PT_LOAD into the
>      program header. However, this is not supported by the wrapper
>      script that converts the shared object to an .efi executable.
>      As per comment in that file:
> 
>          (...) Although there may be several LOAD program headers,
>          only one is currently copied.
> 
>      A simple workaround I've found to work is to ask the linker to put
>      everything into one PT_LOAD program header.
> 
> The issue is ackowledged in the syslinux wiki page about building
> syslinux [1]. This page refers to various resources, of which a Debian
> patch [2].
> 
> This information is also referenced in #11861.
> 
> Fixes: #11861
> 
> [0] https://www.syslinux.org/archives/2018-August/026167.html
> [1] https://wiki.syslinux.org/wiki/index.php?title=Building
> [2] https://salsa.debian.org/images-team/syslinux/-/blob/debian/master/debian/patches/0017-single-load-segment.patch
> 
> Reported-by: Sam Lancia <sam@gpsm.co.uk>
> Reported-by: Meliodas <meliodasren01@gmail.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> 
> ---
> Sam, Meliodas: I have no test-case to validate this change, so it would
> be nice if you could report on whether the above does indeed fixes the
> issue you reported. Bonus point: it would be even better if we could
> improve on the existing runtime test: support/testing/tests/boot/test_syslinux.py
> It currently only does a test build, so it does not catch the issue; the
> grub2 test we have does run, so we can catch failures. It would be nice
> to also have a runtime test for syslinux...

Committed to 2023.02.x and 2023.11.x, thanks

-- 
Bye, Peter Korsgaard

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
