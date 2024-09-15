Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B27C35FE7
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 10:03:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0125F404E0;
	Sun, 15 Sep 2024 10:03:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zo972anTUEns; Sun, 15 Sep 2024 10:03:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08C15401A4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 08C15401A4;
	Sun, 15 Sep 2024 10:03:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 263C51BF947
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 10:03:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2271A60663
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 10:03:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qSh0IebsIp37 for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 10:03:48 +0000 (UTC)
X-Greylist: delayed 467 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 15 Sep 2024 10:03:47 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6AD27605F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AD27605F1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.173.1.68;
 helo=mailgw-out1.grenoble.cnrs.fr; envelope-from=bonet@grenoble.cnrs.fr;
 receiver=<UNKNOWN> 
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6AD27605F1
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 10:03:47 +0000 (UTC)
Received: from [IPV6:2a01:e0a:12:eba0:3224:1719:af5c:c1e8] (unknown
 [IPv6:2a01:e0a:12:eba0:3224:1719:af5c:c1e8])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 246A8BFF7F;
 Sun, 15 Sep 2024 11:55:57 +0200 (CEST)
Message-ID: <bdf93e5f-47ab-4359-b544-807eb639fc15@grenoble.cnrs.fr>
Date: Sun, 15 Sep 2024 11:55:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Grant Edwards <grant.b.edwards@gmail.com>
References: <vc23rg$llm$1@ciao.gmane.io> <20240914094334.1228db8e@windsurf>
 <vc515t$108g$1@ciao.gmane.io>
Content-Language: en-US
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
In-Reply-To: <vc515t$108g$1@ciao.gmane.io>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1726394157;
 bh=ikL7Q7V5Gg7VJYpR+IiUqzaqWssXqI99j1sOvrUwjD4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=pqXJFLInNNi6ZAsBtYg+CUyia6l2fTZRgTqs205+7Q2Oae9yVx1VObvTh7x99spyY
 13CwiGliWsyj36zNkKhiAOqYyTrqRHyCtKKqlCrw5JcHsoog31DdJMsvZ5L0JtgMpW
 WJlP2eRPDt620ElVbl1NDdvEv29/DK7fGfNVYkS0m6C/klCroxKJO8cepyKyNW1CCV
 w0SVXLM/oti6U6q6hFFX7PpGWyE7B3n6u+BiLAd1I2Nh6HXjWI4ms0g/WLUXuPadwi
 4mPYPkK/4Wv/8R6edlafcR4YBYY0yrLerha4c2N5GQEJNNQd2sCcIN+bRbtc5cT846
 +wgJKXwrq7k2g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=pqXJFLIn
Subject: Re: [Buildroot] Upgrading buildroot and rootfs/kernel compatibility
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

Hello!

Grant Edwards wrote:
> In buildroot-2024, you're not allowed to have Fortan support in your
> toolchain unless you've told BR 2024 about it:
>
> [excerpt from toolchain/helpers.mk showing the test]
>
> I don't really understand the reasoning behind that.  Why would the
> unannounced presence of Fortran support in the toolchain be a problem
> that should cause the build to fail?

This is the kind of question `git blame` is made for. Blaming that test
gets you this commit[1], which explains the rationale:

commit bdccc57816a6ba043945096202ff676faed929d9
Author: Vincent Fazio <vfazio@gmail.com>
Date:   Thu Jul 6 12:18:33 2023 -0500

    toolchain/helpers.mk: perform reverse support checks

    Previously, it was possible for external toolchains to be used that had
    support for languages or libraries that Buildroot was not aware of.

    If Buildroot is not made aware of this support, it will not know to copy
    the requisite libraries into the filesystem.

    This is problematic as packages may perform their own checks [0] to find
    out what the toolchain supports and builds will link against libraries
    from the toolchain but will be missing dependencies in the filesystem.

    Now, the support helpers alert the user when a toolchain supports a
    language or library that has not been set in the Buildroot configuration.

    Also, while we're here, add `-ffree-form` to the Fortran check to
    suppress a meaningless warning.

    [0]: https://bugs.busybox.net/show_bug.cgi?id=15634

    Signed-off-by: Vincent Fazio <vfazio@gmail.com>
    Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Regards,

Edgar Bonet.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/bdccc57816a6ba043945096202ff676faed929d9
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
