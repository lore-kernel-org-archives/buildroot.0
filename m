Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F06CDC4829D
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 22:02:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5A6F40730;
	Mon, 12 Feb 2024 22:02:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0JWPxLcTlaab; Mon, 12 Feb 2024 22:02:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1FC140753
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1FC140753;
	Mon, 12 Feb 2024 22:02:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CDDCD1BF853
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 22:02:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA7E2404BC
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 22:02:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3UdWFuOl3PkR for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 22:02:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 297BA4012D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 297BA4012D
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 297BA4012D
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 22:02:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E983020004;
 Mon, 12 Feb 2024 22:02:50 +0000 (UTC)
Date: Mon, 12 Feb 2024 23:02:50 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240212230250.47533eb3@windsurf>
In-Reply-To: <20240106132608.1264366-1-fontaine.fabrice@gmail.com>
References: <20240106132608.1264366-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707775371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YX37dWCBHsLVIlRK11jHOf05VgtvAsMayGk6zhJiBho=;
 b=OUXW0Vo5jH2fsjxPngU/HihKlVwd92ojSLKLgFFg+Tlkv9BgAH4cpUOppGuTJwzVnicCtI
 euSBfcsXKRTvZ55R3NpnI9hx8Jf++LQUXaOL4PeMnsC+sfQFisDaO+dGfEt1nYek8EKW6v
 uLNTpIzKei8FzeSxBeY3ahK1FY/OB9UsCabOWX5wcyg96K4OgLJTlWo+wX+kV/GaFsTC6r
 vbCmVJfkSuXSNhCjVLMb3YBPilzcB2g51jUFQxAAH+Jsb/V+9ymi62cV5sB9GDX8Wd9wpK
 CdFdFF1WVRDi1Grg9YOXImX7gOwqNHOnbH8lWtt8j+F8fE/zXX1yU0b0Ntdzyg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OUXW0Vo5
Subject: Re: [Buildroot] [PATCH 1/1] package/botan: disable neon with arm
 soft float
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

On Sat,  6 Jan 2024 14:26:08 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Disable neon with soft float to fix the following build failure raised
> at least since version 2.19.1:
> 
> In file included from build/include/botan/internal/simd_32.h:27,
>                  from src/lib/block/aes/aes_vperm/aes_vperm.cpp:15:
> /home/thomas/autobuild/instance-1/output-1/host/lib/gcc/arm-buildroot-linux-musleabi/10.4.0/include/arm_neon.h:31:2: error: #error "NEON intrinsics not available with the soft-float ABI.  Please use -mfloat-abi=softfp or -mfloat-abi=hard"
>    31 | #error "NEON intrinsics not available with the soft-float ABI.  Please use -mfloat-abi=softfp or -mfloat-abi=hard"
>       |  ^~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/6b311e97484db2b0f8adbda140320d696713b1e0
>  - http://autobuild.buildroot.org/results/c309940ea6db0845d8221fb51611d0254222c644
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/botan/botan.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
