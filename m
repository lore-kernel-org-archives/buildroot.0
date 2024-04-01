Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E521CCD1288
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 14:46:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9771B60672;
	Mon,  1 Apr 2024 14:46:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hjp3muxbijqK; Mon,  1 Apr 2024 14:46:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A03C860788
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A03C860788;
	Mon,  1 Apr 2024 14:46:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C44631BF33E
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 14:46:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B0F0B60788
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 14:46:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id la39_kAmj2Sf for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 14:46:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2B0F560672
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B0F560672
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2B0F560672
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 14:46:10 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id ECE4913F8AE;
 Mon,  1 Apr 2024 16:46:03 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 01 Apr 2024 16:46:03 +0200
Date: Mon, 1 Apr 2024 16:46:03 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZgrIq-iBXXp1w6Si@landeda>
References: <20240331084924.6075-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240331084924.6075-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1711982767;
 bh=v9Q/bCY7FEeMjJORGGAJBw4C2eUZM3zidOvtlXoX36c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Tgs6mPZFB8fajHqUI8OZWQWu0kZYB/By9NvtjRCPT8eYMUX1yIuhCrgCW6ed/NIT0
 a03v+4z4X+myBOxwsFDaPb8bIJqlr1ksVvhXDDIIb/v2PIC8bpzPIfyCuFQpuqsmgE
 2wxUaKX0gDrXSy7lxBes5Xqd6fseDDLLOCyLtDPLQDp1pnlye2TPgQa/YE+OgiKOV0
 rSfEpYaoJ+0pYNHYunAUQuHYGbRGht6qI9sIy9jcSGIqp2elG2jo/Y5GDHQTKggq1G
 JpqKmJmxS+iK1gyD0NwmreoRKel3ltzo+88XdCelaD6zxDy9I8DmoW0BuvnR1xr2kQ
 L+Lp8jTZ1Xtqg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Tgs6mPZF
Subject: Re: [Buildroot] [PATCH v2,1/1] package/dav1d: fix riscv32 build
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-03-31 10:49 +0200, Fabrice Fontaine spake thusly:
> Fix the following riscv32 build failure raised since bump to version
> 1.4.1 in commit d8c440936d51b7f76472b43002780f5490b7a3bf and
> https://github.com/videolan/dav1d/commit/43ee02a99cce1f221bdb574c9ee484180d71013f:
> 
> /home/buildroot/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/riscv32-buildroot-linux-gnu/13.2.0/../../../../riscv32-buildroot-linux-gnu/bin/ld: src/libdav1d_bitdepth_8.a.p/itx_tmpl.c.o: in function `.L0 ':
> itx_tmpl.c:(.text.unlikely+0x76c): undefined reference to `dav1d_inv_txfm_add_dct_dct_4x4_8bpc_rvv'
> 
> Fixes: d8c440936d51b7f76472b43002780f5490b7a3bf
>  - http://autobuild.buildroot.org/results/28192c494c7a2f88cc90205b6a08afd11782df40
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2 (after review of Bernd Kuhls):
>  - Fix condition
> 
>  package/dav1d/dav1d.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/dav1d/dav1d.mk b/package/dav1d/dav1d.mk
> index 74c68d1660..18cb81868a 100644
> --- a/package/dav1d/dav1d.mk
> +++ b/package/dav1d/dav1d.mk
> @@ -24,6 +24,11 @@ ifeq ($(BR2_ARM_CPU_ARMV4)$(BR2_ARM_CPU_ARMV5)$(BR2_ARM_CPU_ARMV7M),y)
>  DAV1D_CONF_OPTS += -Denable_asm=false
>  endif
>  
> +# riscv assembly requires riscv64
> +ifeq ($(BR2_riscv):$(BR2_RISCV_64),y:)
> +DAV1D_CONF_OPTS += -Denable_asm=false
> +endif
> +
>  # Uses __atomic_fetch_add_4
>  ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
>  DAV1D_LDFLAGS += $(TARGET_LDFLAGS) -latomic
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

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
