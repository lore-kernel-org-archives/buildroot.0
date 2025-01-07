Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 379DCE77197
	for <buildroot@archiver.kernel.org>; Tue,  7 Jan 2025 17:21:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B912C80DC4;
	Tue,  7 Jan 2025 17:21:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qAHrKliI9lbX; Tue,  7 Jan 2025 17:21:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F35AE80DD1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F35AE80DD1;
	Tue,  7 Jan 2025 17:21:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 30CF9DB4
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 17:21:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F1F0403C5
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 17:21:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8gVYoOP1oZpk for <buildroot@buildroot.org>;
 Tue,  7 Jan 2025 17:21:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E504C4049E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E504C4049E
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E504C4049E
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 17:21:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5C0A41C0004;
 Tue,  7 Jan 2025 17:21:02 +0000 (UTC)
Date: Tue, 7 Jan 2025 18:21:01 +0100
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20250107182101.15549426@booty>
In-Reply-To: <20250107063136.787314-2-neal.frager@amd.com>
References: <20250107063136.787314-1-neal.frager@amd.com>
 <20250107063136.787314-2-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1736270463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F0uj8Txab/GboIIWExv2Ox5TrcBcxtMGx3F6ex3DNEQ=;
 b=KMONTi3wzBR6a/JxW/CofgyF3/a7ocMbfgAbTK/rQSzkXbwQEqttCTdjE4n/ZZCU8mBzXP
 8MIs40rgAYeXvSaaLnFIROrdiqAKHpfmv9qHDXf/4lwTc0iAbfZtktVsIavWk9/VWQ4/yg
 oqel/ag3PtyX1ikajSt/adIPDO75lY6EjzrqzJZlaDji1nj/J9Gy1/HoGjDCBrZeB7N7rL
 fstCVDKEE2spz4x0FyksBxjKCmEij5e6r0qNSb88g2ZdUEneHuvbQkiPNWGfDz5VQHeTjp
 LMXPcbtfGNd1ePvaXW0VgtyT6SdjzLkIpMS6WD6kV4bzEAYtQnPhnnc+SQlg8A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KMONTi3w
Subject: Re: [Buildroot] [PATCH v4 2/6] boot/uboot: add qspi.bin file support
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
Cc: brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org, romain.naour@smile.fr, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 7 Jan 2025 06:31:32 +0000
Neal Frager <neal.frager@amd.com> wrote:

> u-boot has introduced a new file called qspi.bin for users who boot from a
> qspi flash device.  It combines the spl/boot.bin and u-boot.itb files into a
> single binary that can be written to the qspi flash.
> 
> Here is an example of how binman generates the qspi.bin:
> https://source.denx.de/u-boot/u-boot/-/commit/a4c98119109a60b9b236996f47065aa8fc0de9ca
> 
> At the moment, the qspi.bin is only used for the zynqmp platform, but other
> platforms may adopt it, so the buildroot support has been made in a generic
> way.
> 
> This patch adds the necessary support for buildroot to install this binary.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

[Tested on Kria KV260 starter kit]
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
