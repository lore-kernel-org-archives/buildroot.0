Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10968C4345F
	for <buildroot@archiver.kernel.org>; Thu, 18 Apr 2024 06:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7AAA6070E;
	Thu, 18 Apr 2024 06:40:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id papZKXCt5Ds6; Thu, 18 Apr 2024 06:40:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B715E60733
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B715E60733;
	Thu, 18 Apr 2024 06:40:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D51831BF4E6
 for <buildroot@lists.busybox.net>; Thu, 18 Apr 2024 06:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CDBC9401FB
 for <buildroot@lists.busybox.net>; Thu, 18 Apr 2024 06:40:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M-CTrYiFo9zb for <buildroot@lists.busybox.net>;
 Thu, 18 Apr 2024 06:40:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.173.1.68;
 helo=mailgw-out1.grenoble.cnrs.fr; envelope-from=bonet@grenoble.cnrs.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8E748401EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E748401EC
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8E748401EC
 for <buildroot@buildroot.org>; Thu, 18 Apr 2024 06:40:10 +0000 (UTC)
Received: from [IPV6:2a01:e0a:12:eba0:58f3:ebbb:82ca:e48d] (unknown
 [IPv6:2a01:e0a:12:eba0:58f3:ebbb:82ca:e48d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id D7010C093B
 for <buildroot@buildroot.org>; Thu, 18 Apr 2024 08:40:07 +0200 (CEST)
Message-ID: <6e04a9f2-8d53-4fae-9c1a-9c69b4c7fbdb@grenoble.cnrs.fr>
Date: Thu, 18 Apr 2024 08:40:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <e2634bc6-2e68-4331-8354-49407b40f191.ref@yahoo.com>
 <e2634bc6-2e68-4331-8354-49407b40f191@yahoo.com>
 <6068206a-9a0c-4ef4-a5bb-9e6f35218297@benettiengineering.com>
 <d144cbba-9be6-477f-9a79-e72361487734@yahoo.com>
 <810bfc26-b829-42a8-8ae3-bf42ac3b7eec@benettiengineering.com>
 <5bc2b354-bcfb-407e-8d77-47ffbade5cd8@yahoo.com>
Content-Language: en-US
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
In-Reply-To: <5bc2b354-bcfb-407e-8d77-47ffbade5cd8@yahoo.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1713422407;
 bh=1DYcto6fq3RaWRlyBjZ8T0R/gpLwpFaWnEErh1RujMY=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=SggDWVFAjjTZquwkviSUaCTyV4lwiCF8e4k/wKlnogQpdiVh7kohRgeGHEkpzZqqy
 ivb+13LgijdhHLS3qwZAJLCypdcmzXioc/WGNZonWcNbv8Fz7bfqtceKFLwrKpXvTY
 tpl56tJ+eUMa56DfRCEPYH2AbZTlWkmuNW+O5tcwHzd4gCCIXMuTRN+mYLx6RCMU7x
 4M2cDiSPYxscJsrHXfzQF/2QSNLCR2Qe7oun0/RxYPt2DbvL8o8++tQz4dN81tIIj1
 fR01IwBs1kLhezfIOp0xPhoInGDvtV71Vf/nAdlELX6glmWKO4BKHLe+zUZdHFnicH
 OTc1qxMy9RZKA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=SggDWVFA
Subject: Re: [Buildroot] Problem with device tree
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

Hi!

Don wrote:
> I cloned: git clone https://github.com/bootlin/buildroot which I think
> is the repository for the training.

Note that the official Buildroot git repository[1] is:

    https://gitlab.com/buildroot.org/buildroot.git

> How does one go about learning buildroot, the latest version, for the
> Beaglebone Black (or any other board for that matter)?

The latest stable version is 2024.02.1. Thus I would start by making
sure I have all the system requirements,[2] then:

    git clone https://gitlab.com/buildroot.org/buildroot.git
    cd buildroot
    git checkout 2024.02.1
    make beaglebone_defconfig
    make

This would be a sanity check. If that works, then you can start
customizing the configuration, doing out of tree builds, etc.

> that is lacking the output directory

The output directory will be created as part of the build process.

Regards,

Edgar.

[1] https://buildroot.org/download.html
[2] https://buildroot.org/downloads/manual/manual.html#requirement
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
