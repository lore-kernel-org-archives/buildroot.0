Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CEA7FED3FC
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 20:45:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8B466075D;
	Fri, 24 Apr 2026 20:45:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IrLjVXhZwU19; Fri, 24 Apr 2026 20:45:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F52A60755
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777063527;
	bh=2F19E/0MfDbIW0Bwx/oWa+1sxIM81R3P/nP6k5OYSy4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PA3WFlU/cJpJ3Kj0j1/BmKYm2fnHtfI+ehiN30p5gc7holnOfnMF1V/kytJfJ+Ubv
	 BMcRPdMGpHOmztKBXF9qg9lF7OX2m+8+z2lRsmEub0Fbomv7kI40KQl2AIGJumwJ/3
	 JtM0+z/Q35WkL83i4opqy9iQ1k73o8GvMfCfvMM2IOWWRMg2jvMI2YF0VFgMPQzrxU
	 V4ogIe2Bcw1W1VVmg+RQTnM6uHR+QXpi/0K3G4GhoPHMBHS7lVkyH8VDTlvsbpAtYN
	 aq0XYuY4tpjyJ2gUxRGaIyEJtCeKm9E6i9rz3PgJpTIJyiVMsrw1quEdtVPhmQEJaY
	 KjJ7/T+42aiuA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F52A60755;
	Fri, 24 Apr 2026 20:45:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 57EF42DF
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 20:45:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4CA6080A9F
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 20:45:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OinxY9zTq0gf for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 20:45:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AD0F780A9A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD0F780A9A
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AD0F780A9A
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 20:45:24 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 1E46413F89C;
 Fri, 24 Apr 2026 22:45:21 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 24 Apr 2026 22:45:21 +0200
MIME-Version: 1.0
Date: Fri, 24 Apr 2026 22:45:21 +0200
To: Maxin John <maxin.john@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260423205432.1832982-1-maxin.john@gmail.com>
References: <20260423205432.1832982-1-maxin.john@gmail.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <2388ac7c764d3229465afec26080faf9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777063522;
 bh=wtj2Hg6s0v5TD1i3ceFTGom4744P63oTsjLHwGbX+6w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=evo0cXNFfGUILIVosSbvLMG4Fo6slEDCuAMKvtzpU8ezy/Xv5E9kuwmI0gQIsUuqd
 e6zfkF5K6TmfGCPFoxLp/I9q2ALgT+RjJ15wr+Vch8/YLHRURwSSd6vMsydmjZtrhY
 tE83GeVoCUwdbFjNcuDhhsf7vDHcoT7shTA6bS0oU0SawF2uXdP1I8Erdg+CZfCbf6
 DgSVDg5SzecnFU4ogQEIvXdR1koEUBh5dwlXthKx4UVsWCRd2v9rsbPA3B3GBHT0s0
 3QrXKXIwp2LAocoBTpSzLz4Bw+Ae8i4TtN3YA9qsMTxN4NWzMB+rDq0WVPSi++bxxS
 tKvXLazliMS+w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=evo0cXNF
Subject: Re: [Buildroot] [PATCH] package/mdadm: bump to version 4.6
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

Hi Maxin,

Thanks for the patch. I have few comments, see below.

On 23/04/2026 22:54, Maxin John wrote:
> Drop upstreamed/backported patches.
> 
> Release mail:
> https://lore.kernel.org/linux-raid/CALTww2_2pjjOSsVj-WT++m35555CjnPWokU7fut+HwUJVV-=ZQ@mail.gmail.com/

Since this patch updates from 4.3 to 4.6, could you also include the 
announces for 4.4 and 4.5, please?
For example:

4.6:
https://lore.kernel.org/linux-raid/CALTww2_2pjjOSsVj-WT++m35555CjnPWokU7fut+HwUJVV-=ZQ@mail.gmail.com/

4.5:
https://lore.kernel.org/linux-raid/CALTww293wnLE2+eZsZ42oyNZhS_cc2agB4GNqTz8j3xiP0ALWA@mail.gmail.com/

4.4:
https://lore.kernel.org/linux-raid/20241213121438.7ed6a0fd@mtkaczyk-private-dev/


> 
> Signed-off-by: Maxin John <maxin.john@gmail.com>
> ---
>  ...not-require-libudev-h-if-DNO_LIBUDEV.patch | 34 ---------------
>  ...ts-h-include-for-NAME_MAX-definition.patch | 32 --------------
>  .../0003-Create.c-fix-uclibc-build.patch      | 42 -------------------
>  .../0004-Makefile-Move-pie-to-LDFLAGS.patch   | 40 ------------------
>  package/mdadm/mdadm.hash                      |  5 ++-
>  package/mdadm/mdadm.mk                        |  6 +--
>  6 files changed, 6 insertions(+), 153 deletions(-)
>  delete mode 100644 
> package/mdadm/0001-udev-c-Do-not-require-libudev-h-if-DNO_LIBUDEV.patch
>  delete mode 100644 
> package/mdadm/0002-util-c-add-limits-h-include-for-NAME_MAX-definition.patch
>  delete mode 100644 package/mdadm/0003-Create.c-fix-uclibc-build.patch
>  delete mode 100644 
> package/mdadm/0004-Makefile-Move-pie-to-LDFLAGS.patch
[...]
> diff --git a/package/mdadm/mdadm.mk b/package/mdadm/mdadm.mk
> index 421f06d6953f..a6d7f98f0eb2 100644
> --- a/package/mdadm/mdadm.mk
> +++ b/package/mdadm/mdadm.mk
> @@ -4,9 +4,9 @@
>  #
>  
> ################################################################################
> 
> -MDADM_VERSION = 4.3
> -MDADM_SOURCE = mdadm-$(MDADM_VERSION).tar.xz
> -MDADM_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/raid/mdadm
> +MDADM_VERSION = 4.6
> +MDADM_SOURCE = mdadm-$(MDADM_VERSION).tar.gz

This MDADM_SOURCE line is no longer needed and can be removed. This is
because the .tar.gz name is the default value set by the package infra.

> +MDADM_SITE = 
> https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/snapshot

Also, since commit:
https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/README.md?id=3f90be087fa62c0c7ed76c2ac26752f0ac3a89e7

The README.md mention:
"""
Effective immediately 
[Github](https://github.com/md-raid-utilities/mdadm) is the primary
location for **mdadm**. Use pull request to contribute.
"""

Could you add this information in the commit log and change and
change _SITE to use this primary github repo? For example, use:

MDADM_SITE = 
https://github.com/md-raid-utilities/mdadm/archive/refs/tags


>  MDADM_LICENSE = GPL-2.0+
>  MDADM_LICENSE_FILES = COPYING
>  MDADM_CPE_ID_VALID = YES
> --
> 2.47.3

Could you send an updated patch please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
