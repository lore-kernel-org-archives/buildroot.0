Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F352CCF9E0
	for <buildroot@archiver.kernel.org>; Mon, 27 Oct 2025 09:25:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EEC783F5E;
	Mon, 27 Oct 2025 09:25:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G0CIBEb_8y7U; Mon, 27 Oct 2025 09:25:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31C2D83F14
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31C2D83F14;
	Mon, 27 Oct 2025 09:25:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D2E343F
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 09:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 15F3961267
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 09:25:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pkbHeecLWRWJ for <buildroot@buildroot.org>;
 Mon, 27 Oct 2025 09:25:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0533E6124B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0533E6124B
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0533E6124B
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 09:25:43 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id CD03B1A16BA;
 Mon, 27 Oct 2025 09:25:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A0D7C6062C;
 Mon, 27 Oct 2025 09:25:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D46E8102F24DE; Mon, 27 Oct 2025 10:25:23 +0100 (CET)
Mime-Version: 1.0
Date: Mon, 27 Oct 2025 10:25:17 +0100
Message-Id: <DDSZVS4QNIJ7.3TPH8C5KHSOF2@bootlin.com>
To: "Neal Frager" <neal.frager@amd.com>, <buildroot@buildroot.org>
X-Mailer: aerc 0.20.1
References: <20251025134655.1068839-1-neal.frager@amd.com>
In-Reply-To: <20251025134655.1068839-1-neal.frager@amd.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1761557139; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=8i3ffgdz4mtenqD2Mcw4scnormwIdJ+sP2vfEgxl72Q=;
 b=hRQjA4ps00IBRvXFYgAVT+eQbQFacCSa+RNVatgCUZn7AURXECV0gOObcRch+5YtjOnrqX
 rcCrZYzjtoWUSQPe1Ms2Dhs3znRMycGTFJS3BF7Bguc8g923kkVn6anNO3KXlrmQ9/WPPW
 qetx6suFCxVyvuvSm2f0BpqYZvPMukLkCq4x47NOl0pXEeZmtWpfuzUqpF8tI1j5PpyEks
 7dsWKrE9gnLTasosbXN8UP+D2pHT8b1ie74+8AgtotflDgIvv8QoeZnwMKCBNo+84N0VTN
 L4MbTnSsc89r4GrUJeRpoBUZSuBiXFC2Zn1VEgv/lilaywHKQlJReqZCWc7VIg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=hRQjA4ps
Subject: Re: [Buildroot] [PATCH v1 1/1] boot/xilinx-prebuilt: add local
 versal xsa support
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: ibai.erkiaga-elorza@amd.com, yann.morin@orange.com,
 brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Neal,

On Sat Oct 25, 2025 at 3:46 PM CEST, Neal Frager wrote:
> Most of the time, users will be running Vivado on their local host machine,
> and will generate a XSA (Xilinx Shell Archive) locally.
>
> Instead of requiring users to create a https:// location for their XSA file,
> this patch improves ease of use by allowing users to work directly with the
> XSA file on their local machine.
>
> BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA_LOCATION can thus be defined as either
> a local location or a https:// location for the XSA file.
>
> In either case, a hash for the XSA file needs to be added to the
> boot/xilinx-prebuilt/xilinx-prebuilt.hash when using this option.
>
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  boot/xilinx-prebuilt/xilinx-prebuilt.mk | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.mk b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
> index 95b656cdde..a7ec9abff5 100644
> --- a/boot/xilinx-prebuilt/xilinx-prebuilt.mk
> +++ b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
> @@ -10,6 +10,9 @@ ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA),y)
>  XILINX_PREBUILT_FILE = $(call qstrip,$(BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA_LOCATION))
>  XILINX_PREBUILT_SITE = $(patsubst %/,%,$(dir $(XILINX_PREBUILT_FILE)))
>  XILINX_PREBUILT_SOURCE = $(notdir $(XILINX_PREBUILT_FILE))
> +ifeq ($(findstring ://,$(XILINX_PREBUILT_FILE)),)
> +XILINX_PREBUILT_SITE_METHOD = file
> +endif

According to the BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA_LOCATION help text,
using a local file is already supported by using the file:// URL prefix.

Can you elaborate on which use case you are adding now? I think you are
just making it a bit easier and cleaner to do the same thing as before by
using a path instead of a URL, but I may be wrong.

Also, updating the Config.in help text should part of this patch.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
