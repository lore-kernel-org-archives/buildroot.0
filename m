Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C56C55182
	for <buildroot@archiver.kernel.org>; Mon,  3 Aug 2026 12:32:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 415B84064B;
	Mon,  3 Aug 2026 12:32:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e6epMAZy6gM8; Mon,  3 Aug 2026 12:32:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62BEC4064C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785760362;
	bh=l9tuTa798wQDwBxrr3eK3f/3IGlQYn044sAZmpn0EkE=;
	h=To:Date:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=jM50Emy2iJinwhZWsXmS3ONQoaDGWR/I8fQ3yIFaocQbnVshpVwEZBcBjXy2Zj/OE
	 +ljRDuc4h5mSzjUydsxDBSyR4Ai7+SHHn0JF4k01NdVZkSsH8bADogInOaPV+YUgH0
	 Vu7p0g+8roRdGcy7mMESBFagEALguwXimqSBDb20C0LimIox7wrvLJcQ1sE0IEiQuv
	 SyIyc1TD0jrCHvpoOv9MoSeo4+trQo52ReDSJtBkroCtovcvABhwGDZMInNJ/IIgpw
	 tdAKc+sYc0tm8ybiyIh5tYwdoBI8nLuQB4PB/3Hef2D+KHFgoW5XXXDgHIg9xaRo5o
	 NaifM5ZeUzvaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62BEC4064C;
	Mon,  3 Aug 2026 12:32:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 21A7A36E
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 12:32:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0979280DBB
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 12:32:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JzeH6sOwioGY for <buildroot@buildroot.org>;
 Mon,  3 Aug 2026 12:32:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.181.117.226;
 helo=mail.actia.se; envelope-from=john.ernberg@actia.se; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D1CB780CE9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1CB780CE9
Received: from mail.actia.se (mail.actia.se [212.181.117.226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D1CB780CE9
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 12:32:36 +0000 (UTC)
Received: from S036ANL.actianordic.se (10.12.31.117) by S036ANL.actianordic.se
 (10.12.31.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Mon, 3 Aug
 2026 14:32:31 +0200
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%3]) with mapi id
 15.01.2507.061; Mon, 3 Aug 2026 14:32:31 +0200
To: Neal Frager <neal.frager@amd.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [PATCH v3 1/1] package/xen: fix build error when
 BR2_PACKAGE_XEN_TOOLS not enabled
Thread-Index: AQHdIzL+CnuhQhZHBkKtqWqN7yh4cbaL/euAgAAidAA=
Date: Mon, 3 Aug 2026 12:32:31 +0000
Message-ID: <96913e91-66ba-4b38-80de-523dbd8f74f5@actia.se>
References: <20260803102918.4064744-1-neal.frager@amd.com>
 <20260803102918.4064744-2-neal.frager@amd.com>
In-Reply-To: <20260803102918.4064744-2-neal.frager@amd.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.12.12.63]
x-esetresult: clean, is OK
x-esetid: 37303A2955B14556677264
Content-ID: <7CC945DC626FC84BB14FCB2DC3E0FE08@actia.se>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=actia.se
Subject: Re: [Buildroot] [PATCH v3 1/1] package/xen: fix build error when
 BR2_PACKAGE_XEN_TOOLS not enabled
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
From: John Ernberg via buildroot <buildroot@buildroot.org>
Reply-To: John Ernberg <john.ernberg@actia.se>
Cc: "alistair@alistair23.me" <alistair@alistair23.me>,
 "stefano.stabellini@amd.com" <stefano.stabellini@amd.com>,
 "ibai.erkiaga-elorza@amd.com" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "micheal.saleab@amd.com" <micheal.saleab@amd.com>,
 "yann.morin@orange.com" <yann.morin@orange.com>,
 "matthew.l.weber3@boeing.com" <matthew.l.weber3@boeing.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "brian.j.wood2@boeing.com" <brian.j.wood2@boeing.com>,
 "ju.o@free.fr" <ju.o@free.fr>,
 "stewart.hildebrand@amd.com" <stewart.hildebrand@amd.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>,
 "michal.simek@amd.com" <michal.simek@amd.com>,
 "romain.naour@gmail.com" <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On 8/3/26 12:29 PM, Neal Frager wrote:
> The 0002-Update-linker-flags.patch assumes that the qemu-xen files are included
> in the xen source tree. However, if BR2_PACKAGE_XEN_TOOLS is not enabled, the
> qemu-xen dependency will not be handled and the patch will fail to apply with
> the following error.
> 
> Fixes: build error below
> Applying 0002-Update-linker-flags.patch using patch:
> patching file tools/Makefile
> Hunk #1 succeeded at 36 (offset -1 lines).
> Hunk #2 succeeded at 185 (offset -8 lines).
> can't find file to patch at input line 76
> Perhaps you used the wrong -p or --strip option?
> The text leading up to this was:
> --------------------------
> |diff --git a/tools/qemu-xen/include/hw/xen/xen_native.h b/tools/qemu-xen/include/hw/xen/xen_native.h
> |index 6bcc83ba..2590904e 100644
> |--- a/tools/qemu-xen/include/hw/xen/xen_native.h
> |+++ b/tools/qemu-xen/include/hw/xen/xen_native.h
> --------------------------
> No file to patch.  Skipping patch.
> 1 out of 1 hunk ignored
> make: *** [package/pkg-generic.mk:239: output/build/xen-4.21.1/.stamp_patched] Error 1
> 
> To avoid making BR2_PACKAGE_XEN_TOOLS a required option, fix the
> 0002-Update-linker-flags.patch so that the part that modifies the qemu-xen
> sources is correctly moved to a patch in the qemu-xen package.
> 
> Move this:
>   #define QEMU_HW_XEN_NATIVE_H
> 
>   #ifdef __XEN_INTERFACE_VERSION__
> -#error In Xen native files, include xen_native.h before other Xen headers
> +#warning In Xen native files, include xen_native.h before other Xen headers
>   #endif
> 
>   /*
> 
> to package/qemu-xen/0001-Update-linker-flags.patch.
> 
> To test:
> BR2_aarch64=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
> BR2_PACKAGE_XEN=y
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Reviewed-by: John Ernberg <john.ernberg@actia.se>

Thanks! // John Ernberg
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
