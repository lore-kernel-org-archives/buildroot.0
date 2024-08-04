Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42846C3DA64
	for <buildroot@archiver.kernel.org>; Sun,  4 Aug 2024 20:22:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9882C605BE;
	Sun,  4 Aug 2024 20:22:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TNwIRiRULAHx; Sun,  4 Aug 2024 20:22:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFC93605D8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFC93605D8;
	Sun,  4 Aug 2024 20:22:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7E2291BF4DD
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 20:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7817E4018E
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 20:22:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dxY58yk1koYj for <buildroot@lists.busybox.net>;
 Sun,  4 Aug 2024 20:22:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 180EF400E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 180EF400E5
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 180EF400E5
 for <buildroot@buildroot.org>; Sun,  4 Aug 2024 20:22:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B6D34FF802;
 Sun,  4 Aug 2024 20:22:33 +0000 (UTC)
Date: Sun, 4 Aug 2024 22:22:32 +0200
To: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <20240804222232.56c2130a@windsurf>
In-Reply-To: <20240804094647.876936-1-troglobit@gmail.com>
References: <20240804060003.735172-1-troglobit@gmail.com>
 <20240804094647.876936-1-troglobit@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722802954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ofwDNgOKKnD6nYl8skSljIeO4fW0z+7Y1cxx/1zh8dk=;
 b=MYoDa/A+6ae6tW/Vh7a1YsYLVDXZ/VAAje5INMjRgwIOQ+tFS/+e+YSw3i4Ku9wYB65SRz
 pMgQ5FdSk2agtmjbeB1ddSBE4vaWKmzheJZ4v/L/uyhYeS7ruAAwz+f+OkBrqpY372H/nc
 K8cb3C77Wvf/Zv/+nq1agufsaXA9vniOGjn2xBund+MsYEe8041Ecs28oU6X025W/Gn1lb
 YyZUg2wfOlvqE/PesA3EqufiXahbKewB+VQkB607EVYLLTXczWVjIOBtdzomdpcScaSl/D
 TcRN9ulPJ0wsyzIUjvOPS7S+XimmH+V7G4O0+towFVlDJqsZ8GTkH4bLSPWZFw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MYoDa/A+
Subject: Re: [Buildroot] [PATCH v2 1/1] package/spdlog: add menuconfig
 option to select formatter
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Joachim,

On Sun,  4 Aug 2024 11:46:47 +0200
Joachim Wiberg <troglobit@gmail.com> wrote:

> Add an option menu to select the spdlog formatter: external fmt library,
> external using headers-only, C++20 std:format, or the bundled (version
> matched) fmt library, which each release of spdlog is tested against.
> 
> The formatters are mutually exclusive (see the CMakeLists.txt[1] file),
> selecting the 'internal' option disables all the other options in the
> .mk file, thus "enabling" the bundled formatter.
> 
> For backwards compatibility, the Buildroot default remains using the
> external fmt library.
> 
> [1]: https://github.com/gabime/spdlog/blob/5ebfc92/CMakeLists.txt#L95-L105

Could you provide some details on why we would want to support
different formatters?

In your reply to Baruch you said you wanted to package Rousette, which
requires the bundled fmt. How is the bundled fmt different from the
external one?

Also using a choice...endchoice here will not make it easy to package
Rousette, because you can't "select" an option of a choice...endchoice,
so the Rousette package will not be able to select
BR2_PACKAGE_SPDLOG_FMT_INTERNAL.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
