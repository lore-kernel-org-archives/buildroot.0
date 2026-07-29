Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 659F8C54F51
	for <buildroot@archiver.kernel.org>; Wed, 29 Jul 2026 16:04:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A7C880D50;
	Wed, 29 Jul 2026 16:04:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eb4PAeCJojwY; Wed, 29 Jul 2026 16:04:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0426D80B39
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785341088;
	bh=PJ+gdoUDXZBeTYT37en0dIWSZ131U09iOgpON+rdTCo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JM6F/b18mIYOU5YVl8V+ftBrZ+IhSwfnlLWrQR0+GdSsoF17WD+u5CutGS+3EJrAC
	 xHDSAzIexhV4b7b0qCAPleugQf2xYh6qiIzmN403q4Qk+IqBG+bD69hu5yZc9fgfw2
	 DermFUNhfWG3Rf2p9xo5S7ieH5rgNtPOMpCHajKnir1X0K7aQcG1NxFiK/mQ7E2qxR
	 3E9vuG6mRCxCsAlcAVtfVS5Ccl8IaJRCwMM+NheFv25weJx+GAD3u+2BZBGc3hy6/S
	 0p3DmtyU1mqyo7PNk8nQZn7qmFIxV9HZKCLNgH9l2h4Xi/vn3ny0cZJNLv/dGDYFOt
	 nEg9D9sLDDaXA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0426D80B39;
	Wed, 29 Jul 2026 16:04:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CDC9F194
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 16:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BECE380B39
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 16:04:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fbcsvCT0iMaV for <buildroot@buildroot.org>;
 Wed, 29 Jul 2026 16:04:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8E02880AD1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E02880AD1
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8E02880AD1
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 16:04:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 9CBA713F879;
 Wed, 29 Jul 2026 18:04:39 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 29 Jul 2026 18:04:39 +0200
MIME-Version: 1.0
Date: Wed, 29 Jul 2026 18:04:39 +0200
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: buildroot@buildroot.org, Fabio Estevam <festevam@gmail.com>
In-Reply-To: <6a9c4d00-ef01-72a1-5e11-24341ffd8b1f@crashcourse.ca>
References: <20260726204437.3148734-1-ju.o@free.fr>
 <6a9c4d00-ef01-72a1-5e11-24341ffd8b1f@crashcourse.ca>
User-Agent: Webmail Free/1.6.17
Message-ID: <b65e70c2fe7fd1be78cb0deebf3d5f87@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785341081;
 bh=1nxPJfKJVONdYxcf3mWKEkSg+CUdlB0EUwbRSyfHPQk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PJr3DUbaGXD/4W9UIxBYRT8ap5/nVE4VCAQQPx43UNZEjUIlElyj+YqjpP4majmMh
 vxsuv33Wd/Vhj5/ksAwMVjudT6nbg3EO6ZtFwfVt10KLs8Fjw9Ra96nIp9eIED+jq6
 w8IPuPEoHcElMwvdXTQ7c07EdpFa+HZ3vph4nWrtc0gUBYG1HT74Xx6wgy95cvW09V
 stpYvYNSTsg8C2Xg92N3OccEouAg4tYa7NDOEzz0EJop5spf8nOqXEx4Jf2h/AGrK9
 j8W0/sbE//DZ3gv9cE3vWanUoeDdPKNU3VVHjZkDKUqFxljuvOB3nOtMh5wfrSfPyL
 0MHnq/3z4mu9w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PJr3DUba
Subject: Re: [Buildroot] [PATCH 1/1] configs/freescale_imx93frdm: bump
 U-Boot, TF-A and Linux
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Robert,

On 29/07/2026 12:05, Robert P. J. Day wrote:
> On Sun, 26 Jul 2026, Julien Olivain wrote:
> 
>> Since Buildroot commit [1] "package/gcc: switch to GCC 15.x as the
>> default", compiling freescale_imx93frdm_defconfig fails in TF-A with
>> error:
>> 
>>     include/drivers/nxp/trdc/imx_trdc.h:7: error: header guard 
>> 'IMX_TRDC_H' followed by '#define' of a different macro 
>> [-Werror=header-guard]
>>         7 | #ifndef IMX_TRDC_H
>>     include/drivers/nxp/trdc/imx_trdc.h:8: note: 'IMX_XRDC_H' is 
>> defined here; did you mean 'IMX_TRDC_H'?
>>         8 | #define IMX_XRDC_H
>> 
>> The issue happen because this defconfig is using a Buildroot
>> (internal) toolchain which uses gcc version 15 by default.
>> 
>> This issue was fixed upstream in [2], first included in TF-A v2.13.
>> 
>> This commit updates U-Boot, TF-A and Linux to use the NXP
>> tag lf-6.18.20-2.0.0, which include this fixes.
>> 
>> Note that, as described in the commit log of [3] which introduced
>> this defconfig, U-Boot and Linux were forks. Now the necessary
>> patches are included in the vendor BSP, this commit switches those
>> repos to use the vendor ones.
>> 
>> While at it, this commit also switches the defconfig to use an
>> external glibc stable Bootlin toolchain, to follow recommendations
>> from [4]. Since an external toolchain is used, the linux-headers.hash
>> custom hash file is no longer needed and is also removed. At the
>> time of this commit, the Bootlin stable toolchain is a gcc 14.
>> 
>> Also, due to the upstream uboot commit [5], this commit adds a uboot
>> config fragment to disable CONFIG_EFI_CAPSULE_AUTHENTICATE, to
>> remove the dependency on the command "cert-to-efi-sig-list", provided
>> the host efitools package, which is not yet in Buildroot.
>> 
>> This commit was run tested on board 700-94611 Rev B1.
>> 
>> [1] 
>> https://gitlab.com/buildroot.org/buildroot/-/commit/a75b8623f5515d99bec48f96586115953150558e
>> [2] 
>> https://git.trustedfirmware.org/plugins/gitiles/TF-A/trusted-firmware-a.git/+/2e9198d0e0cbe9546348dd0a71ff6c3d2061d4eb%5E%21/
>> [3] 
>> https://gitlab.com/buildroot.org/buildroot/-/commit/2e05f22ff862192a7e512d0db0486351bba94ae8
>> [4] 
>> https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs
>> [5] 
>> https://git.u-boot-project.org/u-boot/u-boot/-/commit/fd58c275f6ba524101ba0990e53f5a11ac390bd0
>> 
>> Reported-by: Robert P. J. Day <rpjday@crashcourse.ca>
>> Signed-off-by: Julien Olivain <ju.o@free.fr>
>> ---
> 
>   ... snip patch ...
> 
> Is there an ETA on when this will be applied to master? Or am I
> supposed to fetch it from some other staging-type branch?

The patch is waiting for a reviewer and/or a tester.

Since you are the initial reporter of this issue, it would be great if
you could test this proposed patch on your side. Then reply with
comments or saying the issue is fixed (and how you tested), with a
"Tested-by: ..." tag.

Only then, a maintainer will merge the patch in master.

See:
https://nightly.buildroot.org/manual.html#_reviewing_and_testing_patches

> rday

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
