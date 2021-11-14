Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B35A9C433EF
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 13:34:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4179661077
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 13:34:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4179661077
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1155380DB6;
	Sun, 14 Nov 2021 13:34:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SPCPbKJirRJC; Sun, 14 Nov 2021 13:33:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6363880DA0;
	Sun, 14 Nov 2021 13:33:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E72571BF3E0
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 13:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D32A84022B
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 13:33:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IDKJtW7MEgvh for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 13:33:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BD8F14024C
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 13:33:55 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 27E031BF205;
 Sun, 14 Nov 2021 13:33:54 +0000 (UTC)
Date: Sun, 14 Nov 2021 14:33:53 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211114143353.0dfd4592@windsurf>
In-Reply-To: <20211114113310.1304245-1-fontaine.fabrice@gmail.com>
References: <20211114113310.1304245-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH/next 1/1] package/pppd: bump to version 2.4.9
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 14 Nov 2021 12:33:10 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop patch (already in version)
> - Update hash of bsd-comp.c, ccp.c and passprompt.c (no change in
>   license)
> - rp-pppoe has been renamed to pppoe since
>   https://github.com/paulusmack/ppp/commit/b2c36e6c0e1655aea9b1b0a03a8160f42a26c884
> - Manage EAP-TLS which depends on openssl and has been added and is
>   enabled by default since
>   https://github.com/paulusmack/ppp/commit/e87fe1bbd37a1486c5223f110e9ce3ef75971f93

I am rather confused by this, especially since you're changing pppd.mk,
but not the Config.in that has some funky logic:

        select BR2_PACKAGE_OPENSSL if BR2_TOOLCHAIN_USES_GLIBC
        select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL \
                                                 && BR2_TOOLCHAIN_USES_GLIBC

Could you explain a bit more how this is intended to work, and what is
the logic/rationale ?

Also, I've tested and this 2.4.9 version of pppd build fine with musl,
so:

        depends on !BR2_TOOLCHAIN_USES_MUSL # Use __P() macro all over the tree

could be dropped.

Thanks,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
