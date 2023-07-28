Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADCCC001DE
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 19:32:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7315C42189;
	Fri, 28 Jul 2023 19:32:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7315C42189
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z-FP5QHa5OMM; Fri, 28 Jul 2023 19:32:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3784F4217C;
	Fri, 28 Jul 2023 19:32:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3784F4217C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EB63A1BF312
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 19:32:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9A4D42149
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 19:32:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9A4D42149
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id flVrW3vyvo6D for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 19:32:18 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8453D42181
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 19:32:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8453D42181
Received: by mail.gandi.net (Postfix) with ESMTPSA id 93B0F60004;
 Fri, 28 Jul 2023 19:32:16 +0000 (UTC)
Date: Fri, 28 Jul 2023 21:32:15 +0200
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <20230728213215.2b705395@windsurf>
In-Reply-To: <20230728093658.703943-1-thomas@devoogdt.com>
References: <20230727212026.2269634-1-bernd@kuhls.net>
 <20230728093658.703943-1-thomas@devoogdt.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690572737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/YuoP84N19omZlIay/d+zVsiRrLhzBYFWGDI7kSXEcc=;
 b=OoMtGDma6hKM1vrdtvl4c6qY/8El2U9O7SbCRE1RdGGSPXiLEjzOKds31MseaBmt7ptfQ/
 +mxHQvYc3rMAO2BRspX1SHfW3hnBDo5VqYLIg6lc/aEMbLOYRmN9H8F8yTbcuG3AuoLIS4
 oAyfPsfIM7WIZ0y0va4diLlqSBjdW61SMMX5cubE8Q440aIsAzHPt+bp98Osbg7UDBHchI
 lMBER7IAgN/GLiHavadJzdc49XaO7S7zyUfHx4VBFfcrhshWnygkkd+CuezOh4xlYE3L84
 X5Cnzb75FB9fqJ2SgeU4h6henwaKpEhDJ90xJ/qp5RFIpycYgkS5Sq6krT0/Pg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OoMtGDma
Subject: Re: [Buildroot] [PATCH] package/fluent-bit: fix build without c++
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 28 Jul 2023 11:36:58 +0200
Thomas Devoogdt <thomas@devoogdt.com> wrote:

> FLB_{IN,OUT}_KAFKA is enabled by default since v2.1.5,
> causing compile errors if no c++ support.
> 
> These patches allow the Kafka plugin to be build without C++.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/d63/d638390da721eb3bdfcc7a4229114b492aaead99/
>  - http://autobuild.buildroot.net/results/709/70960056479eab860e94eed993566fcb78c4dbbe/
>  - http://autobuild.buildroot.net/results/366/3667126ee954f927f83ccfbaae3c6fb8ebd07dbb/
>  - http://autobuild.buildroot.net/results/9bd/9bd090216b9a8005fc3d020a9c0adf5e825bea59/
>  - ...
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
> ---
>  ...MakeLists.txt-allow-compilation-with.patch | 117 ++++++++++++++++++
>  ...isable-cxx-support-for-librdkafka-77.patch |  29 +++++
>  2 files changed, 146 insertions(+)
>  create mode 100644 package/fluent-bit/0002-lib-librdkafka-CMakeLists.txt-allow-compilation-with.patch
>  create mode 100644 package/fluent-bit/0003-CMakeLists.txt-disable-cxx-support-for-librdkafka-77.patch

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
