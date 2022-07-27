Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E60A9C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 09:24:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7ABDB402AF;
	Wed, 27 Jul 2022 09:24:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7ABDB402AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7RxbAHAup5B5; Wed, 27 Jul 2022 09:24:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3566340187;
	Wed, 27 Jul 2022 09:24:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3566340187
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D809C1BF57F
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 09:24:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B24DA60B17
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 09:24:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B24DA60B17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v2gAqaAa2r2w for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 09:24:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DA01607F4
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5DA01607F4
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 09:24:50 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 346C21BF212;
 Wed, 27 Jul 2022 09:24:47 +0000 (UTC)
Date: Wed, 27 Jul 2022 11:24:45 +0200
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Message-ID: <20220727112445.07bf1a77@windsurf>
In-Reply-To: <20211006204133.465875-1-arnout@mind.be>
References: <20211006204133.465875-1-arnout@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658913887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pcS+YGM4+53nw06EkCUvf5qggpXfGxWnbs4kNDbIvUI=;
 b=fK2e4d0tdnNDx0NZAgI27NeGHnj+gletVs81U2lrnZYfWbbPlp/GRDB2/YwLeIZb/is/4i
 GHuzMq1hgi0gVIpfniNeMok4i6ssx65VXdWXiCFuZauU86uVdT6z+BH7IWPsGuM+ImbUBc
 BrfBjTkgFXTcqS3zBHuFHoJV555uAqTfVW/ueKZ2lZ/8EyFESw2k1QL1Z0AK52PFZuTM/N
 HssCuAUIe37HOqXSK3N+dMxQba1yUTFCaXH1DB5Yq9bHkMdY7gWKkNqXmu2yxBfqA5YeP7
 ruoSFZfdo1laqIHoQS2rN3Bw8KfmRYNTYLVSE7SLPmkBzX8wxtZZEcqEgZXv2A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fK2e4d0t
Subject: Re: [Buildroot] [RFC 1/2] toolchain: invert glibc <-> !static
 dependency
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
Cc: Raul Cabello <raul.cabello@suse.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  6 Oct 2021 22:41:32 +0200
"Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> wrote:

> Currently, glibc depends on !BR2_STATIC_LIBS in all the toolchain
> variants.
> 
> However, for some architectures, glibc is the only supported libc.
> Therefore, for these, it's possible to select static libs, at which
> point no libc is selectable any more.
> 
> To overcome this situation, invert the dependency between glibc and
> static libs: BR2_STATIC_LIBS depends on !BR2_TOOLCHAIN_USES_GLIBC, and
> all the dependencies on !BR2_STATIC_LIBS are removed from the glibc
> variants of all toolchains.
> 
> Fixes: https://bugs.busybox.net/show_bug.cgi?id=14256
> 
> An alternative (simpler) fix would be to let BR2_STATIC_LIBS depend on
> !BR2_s390x. However, that doesn't solve the problem for the myriad of
> other architectures that only support glibc. In addition, there are some
> architecture variants that only support glibc, etc. etc., which really
> complicates stuff.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

I have applied this, after making sure it applies on master, since
there were conflicting changes. I rewrote most of the commit log,
because the situation in master was different than what it was when you
wrote this patch: we had already changed BR2_STATIC_LIBS to not be
selectable when the internal backend uses glibc. Your patch generalizes
this to the external toolchain backend as well.

Also, you had forgotten to adjust the gen-bootlin-toolchains script, so
I did that. And I added a Config.in comment inside the static/shared
choice that explains why static is not available.

Thanks for this!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
