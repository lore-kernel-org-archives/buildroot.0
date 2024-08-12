Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C402DC52D7C
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 19:19:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5ECB8403AD;
	Mon, 12 Aug 2024 19:19:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XHlRQvQCxmcp; Mon, 12 Aug 2024 19:19:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 071F440423
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 071F440423;
	Mon, 12 Aug 2024 19:19:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 88E141BF59A
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 19:19:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 74593405DD
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 19:19:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5qeFYvMgVCHz for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 19:19:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 13504405D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13504405D9
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 13504405D9
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 19:19:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2224CFF802;
 Mon, 12 Aug 2024 19:19:07 +0000 (UTC)
Date: Mon, 12 Aug 2024 21:19:06 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240812211906.05268a9f@windsurf>
In-Reply-To: <Zri50N1KfTZ1bLqc@waldemar-brodkorb.de>
References: <Zri50N1KfTZ1bLqc@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723490348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Vdbo8etoqGJfCXl96gJU3t1XDj1EvJ8g6Z07YpXqRU=;
 b=FJMRUCdNR9X7ub1dbSSkK/2nas61j3RYx5NdibbH8iI1EitV4dg/wpBB0dcU1QVmmbN7Ps
 tqnquLTXTcCgIXdkSlUrv6KNQVTZ/3gSUjDnwFbnGYkeKY2B69yw8/vR4Iq/IFTqSiOpbz
 3YS+ekhgmUotYC6czqDQ1OS4+r2WSh4Dwr1OZWyeI/FLPOL8CRM8xOQiSSKz+htxODp2I/
 Iw2+J6i10QaRkSc7t6xoSLeVO3Xr2oYQtaXTvi5NYB+vRy3BOtvKN0O0b7+RxEuikNCGvo
 d3P/VCZur5hnMoZQwfdPyiPr9fVXjBTXF7Y1zu9yl+JqiNtxp6ojEUyZxDu3aQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FJMRUCdN
Subject: Re: [Buildroot] [PATCH next] package/bind: update to 9.18.28
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 11 Aug 2024 15:17:04 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Bind 9.16.x is EOL since April 2024.
> See here for what version should be used in production:
> https://kb.isc.org/docs/aa-01540
> 
> Remove patch 0001 as CC_FOR_BUILD is used in upstream code
> to compile host utility gen.
> 
> See here for a changelog:
> https://downloads.isc.org/isc/bind9/9.18.28/doc/arm/html/notes.html
> 
> COPYRIGHT file has been updated, following Copyright holders were
> added:
> Copyright Joyent, Inc. and other Node contributors. All rights reserved.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  .checkpackageignore           |  1 -
>  package/bind/0001-cross.patch | 34 ----------------------------------
>  package/bind/bind.hash        |  8 ++++----
>  package/bind/bind.mk          |  3 ++-
>  4 files changed, 6 insertions(+), 40 deletions(-)
>  delete mode 100644 package/bind/0001-cross.patch

Thanks a lot for this update. It looks good, but it breaks the
following defconfig:

BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_VFP=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_BIND=y
BR2_PACKAGE_BIND_SERVER=y
BR2_PACKAGE_BIND_TOOLS=y
# BR2_TARGET_ROOTFS_TAR is not set

/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-musleabihf/12.3.0/../../../../arm-buildroot-linux-musleabihf/bin/ld: warning: libns-9.18.28.so, needed by ../../lib/bind9/.libs/libbind9.so, not found (try using -rpath or -rpath-link)
/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-musleabihf/12.3.0/../../../../arm-buildroot-linux-musleabihf/bin/ld: ../../lib/bind9/.libs/libbind9.so: undefined reference to `ns_plugin_check'
/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-musleabihf/12.3.0/../../../../arm-buildroot-linux-musleabihf/bin/ld: ../../lib/bind9/.libs/libbind9.so: undefined reference to `ns_plugin_expandpath'
collect2: error: ld returned 1 exit status
make[4]: *** [Makefile:560: rndc] Error 1

The same defconfig builds before the version bump. Could you have a
look?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
