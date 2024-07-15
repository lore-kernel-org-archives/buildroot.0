Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 973C7C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 18:31:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B3ED40647;
	Mon, 15 Jul 2024 18:31:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SC_NbSQrFnNW; Mon, 15 Jul 2024 18:31:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13F4740654
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13F4740654;
	Mon, 15 Jul 2024 18:31:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CD3221BF3F0
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 18:31:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C4C6C4065B
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 18:31:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eQQ543vv1L9N for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 18:31:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4141040654
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4141040654
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4141040654
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 18:31:53 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 01C3C2C8378B;
 Mon, 15 Jul 2024 20:31:50 +0200 (CEST)
Message-ID: <5dd9bcb5-eaa0-4f56-86cd-6c8d21f6b026@bubu1.eu>
Date: Mon, 15 Jul 2024 20:31:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Marcus Hoffmann via buildroot <buildroot@buildroot.org>
References: <20240228202414.719244-1-buildroot@bubu1.eu>
 <20240228202414.719244-2-buildroot@bubu1.eu>
 <20240712152810.4a4f12f3@windsurf>
Content-Language: en-US
In-Reply-To: <20240712152810.4a4f12f3@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1721068311; bh=tNwqsfTwJF1hMI0ike4ZOc0n85sASgG+9qO9MzaB9vQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=gyw5RRCq1JKNP/yy3cPSdYCvS8zXxouj3/3NPRnFnhwGoCyDKA7hGBY20soUGaepY
 sNxNo82VNZzscuzHrh+iCqBr46Y8EVdXAnnR+oeVd0vpMCYF4Trp9SPDcQMELeQb0N
 W78ktxBQDyfC52MhK56FV1KAyt7mRy8itZ6YrA+v4RmOkuPefTuWxbkJEBHcqRi+KP
 X3Q/ZUIcb5tCG/I7f4ydX3d0GnRlHuricZw9iFIUp7Y2wroiPMIEt5X76lTlQ0N863
 z3add0Dihhkx5tH/O1y6OkKSAKZCFn0RTKYeXQyWTYkL4+ROv3Cv5ByspCpscq7lnE
 z4pdB1NOoR/ow==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=gyw5RRCq
Subject: Re: [Buildroot] [PATCH v2 2/2] package/picotool: new package
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Samuel Martin <s.martin49@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 12.07.24 15:28, Thomas Petazzoni via buildroot wrote:
> Hello Marcus,
> 
> On Wed, 28 Feb 2024 21:24:13 +0100
> Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:
> 
>> +config BR2_PACKAGE_PICOTOOL
>> +	bool "picotool"
>> +	depends on BR2_INSTALL_LIBSTDCPP
>> +	depends on BR2_HOST_GCC_AT_LEAST_4_9 # libusb
>> +	select BR2_PACKAGE_LIBUSB
>> +	select BR2_PACKAGE_PICO_SDK
>> +	help
>> +	  picotool is a tool for inspecting rp2040 binaries and
>> +	  interacting with rp2040 devices when they are in bootsel
>> +	  mode or devices USBstdio support from the Raspberry Pi Pico

Just noticed this is missing a "with" between devices and USBstdio.

>> +	  SDK.
>> +
>> +	  https://github.com/raspberrypi/picotool
> 
> Could you give some details on the use case for having picotool on your
> target? In which context is your RP2040 connected to your target
> system generated by Buildroot?

We use it to to reboot a usb-connected rp2040 devices into bootloader 
mode from where you can apply a firmware update. (This requires using 
the pico sdk for the rp2040 firmware and setting a specific flag when 
setting up the usb support)

Does that help?

> 
> Thomas

Best,
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
