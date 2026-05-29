Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B13BCD6E43
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 10:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D78F141FEF;
	Fri, 29 May 2026 10:55:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bw3EY_iPfQSZ; Fri, 29 May 2026 10:55:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D7FC41FD7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780052157;
	bh=ndE6n5xc5hHggydgrMAUtHltvOtaHHs4u6r0yApmrdM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WPIcBt+ebBGmbCmOzjPd6R0yal9EZQSpX7auEE+LitAoayPAu81z+woJui++cGVgP
	 k+566bX+Ibt6kO5WY41aPo1qUAT01S9TE37HFZL2taEAGimkpU0A+LRtcSbBX8nCaO
	 2N2bZ7EJsq76sMltoxUp9qB+/gySVH2aOC8+MlcQeyydE9W7FA0dfHng+XcGe6HWtd
	 86xKrQjKkn5OAuYTxqBmUA3n/na3AJDTeVVdFQY5x1IndS7+6gIWalIO0CCheFXQur
	 /fjDE9eX/wn/YzEIxAGiMTi4aG1utw3pnCYwmYOEIgJNpKJ2n1rG1G7Qv4GOki3gj4
	 o2mDkVhLX3Gag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D7FC41FD7;
	Fri, 29 May 2026 10:55:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 206C2288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 10:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F3B983639
 for <buildroot@buildroot.org>; Fri, 29 May 2026 10:55:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2gBIq6NJwJQo for <buildroot@buildroot.org>;
 Fri, 29 May 2026 10:55:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E90F3834BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E90F3834BB
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E90F3834BB
 for <buildroot@buildroot.org>; Fri, 29 May 2026 10:55:54 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id EC6524E42D88;
 Fri, 29 May 2026 10:55:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 996AA601FA;
 Fri, 29 May 2026 10:55:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 926AC10888CC8; 
 Fri, 29 May 2026 12:55:50 +0200 (CEST)
Date: Fri, 29 May 2026 12:55:49 +0200
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>, 
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Ismael Luceno <ismael@iodev.co.uk>, Romain Naour <romain.naour@gmail.com>
Message-ID: <ahlwH3dJ6oX03Q94@windsurf>
References: <20260424132326.825570-1-jeanmichel.hautbois@yoseli.org>
 <20260424132326.825570-4-jeanmichel.hautbois@yoseli.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260424132326.825570-4-jeanmichel.hautbois@yoseli.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780052151; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=gcfAwt72nLg0/EYqq4SafdV16BM1qsZ34iDC5T5CTJs=;
 b=VMmbZhnrCjav4qzD6Py6Wa7HTKAq94jqzYas61l07VNFjuzN0t3v7UNatVuSJhGie8OA3C
 3+ZAaioJQrHm/QASYe2N8ebAlrIrWcSGgkUqLphaE7XetVcypYOgRiWev2hWebNjf5EAw5
 ot47uK/n9jf9WNBEcSVnefXuVbayvqKQVUROUdb1WABdFuHDyWK3R/LWT2b6SSc8VPEVYC
 F275Q/nUqY2j6y7OdBAAQK9zsTvXE8t6pRbWTM18XXYgFjlnqWPyyLPZdQ2EtlurtzhBb4
 rizNDNACd/hm2k/2lo6FmtUZNSoSA/LT61g3KgBK9y9qXV9dpmBeNAROcxMNbg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=VMmbZhnr
Subject: Re: [Buildroot] [PATCH 03/11] package/Makefile.in: add global
 ColdFire workaround flags
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Jean-Michel,

On Fri, Apr 24, 2026 at 03:23:18PM +0200, Jean-Michel Hautbois wrote:
> GCC's instruction scheduler on m68k ColdFire reorders memory accesses
> in ways that break code assuming sequential memory ordering. This was
> observed in uClibc-ng's elf_machine_relative and in OpenSSL's internal
> state management after fork().
> 
> Additionally, ColdFire uses 16-bit offsets for switch statement jump
> tables by default. Large functions such as pcre2_match() and nftables
> rule evaluation overflow this limit, causing assembler errors.
> 
> Add -fno-schedule-insns, -fno-schedule-insns2, and
> -mlong-jump-table-offsets globally for BR2_m68k_cf, alongside the
> existing -fno-dwarf2-cfi-asm workaround.
> 
> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> ---
>  package/Makefile.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 5ebb5f9ba8..42dd79118d 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -211,6 +211,10 @@ TARGET_FCFLAGS = $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
>  ifeq ($(BR2_m68k_cf),y)
>  TARGET_CFLAGS += -fno-dwarf2-cfi-asm
>  TARGET_CXXFLAGS += -fno-dwarf2-cfi-asm
> +TARGET_CFLAGS += -fno-schedule-insns -fno-schedule-insns2
> +TARGET_CXXFLAGS += -fno-schedule-insns -fno-schedule-insns2
> +TARGET_CFLAGS += -mlong-jump-table-offsets
> +TARGET_CXXFLAGS += -mlong-jump-table-offsets

I'm not against this, but you're changing those flags for everyone
using Coldfire, not only for your new Coldfire processor. Is this the
right thing to do? Are those issues also affecting other Coldfire
processors, and nobody noticed until now because almost nobody uses
Coldfire?

I think this is the part that's a bit missing in your description:
give confidence that the BR2_m68k_cf is the right condition for this.

Regarding -mlong-jump-table-offsets should we do this globally, or on
a per package basis, like we do with -mxgot?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
