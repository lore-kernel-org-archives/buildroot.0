Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2591EC52D6F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 22:13:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEBF840711;
	Wed,  7 Aug 2024 22:13:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NxO0nIeu8ZsF; Wed,  7 Aug 2024 22:13:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A86FB4071B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A86FB4071B;
	Wed,  7 Aug 2024 22:13:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 45BF91BF321
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 22:13:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 311154071B
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 22:13:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R-exrYeDY5uJ for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 22:13:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B360A40711
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B360A40711
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B360A40711
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 22:13:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6A72E20003;
 Wed,  7 Aug 2024 22:13:06 +0000 (UTC)
Date: Thu, 8 Aug 2024 00:13:05 +0200
To: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Message-ID: <20240808001305.57b0c119@windsurf>
In-Reply-To: <20240807-tfa-src-update-v2-2-f2cd6166db5f@ti.com>
References: <20240807-tfa-src-update-v2-0-f2cd6166db5f@ti.com>
 <20240807-tfa-src-update-v2-2-f2cd6166db5f@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723068787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qCRiQ/qHxCxtYse8XAyjlX1+7ihLq0M1KDHPO9EIGF0=;
 b=m/mp71GoybP0+zSJkZf01GMz+2eICSIUkKrcz0yAS22cB1IMywuMONpklRHbRgf7sTpZPW
 Hte/fBrSghXjEukALM6pE+3QMHyvBCIONG9O+FL+o/c3F1HXa/ansfnDN8RUnCoAmJUg5Q
 6MxwCZxvQgtm8miW6qyFBhNSom8nTfJAIcE0pQWIaMvtjzlyn3XR7bqwX1m4Q+bDqcooGP
 4ZAiyEyTEw+tKrq8qf1ekYpxOI5FCpgx0PAG9jCn1S+s/Mly26G0Of95L4iC532609K7Jr
 oTfE+6P6rsBTcTMkvdcVNTLdZ8SLddFS2xtWEPTpVZWUFW3nIyH62qHhgqScAQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=m/mp71Go
Subject: Re: [Buildroot] [PATCH v2 2/4] boot/arm-trusted-firmware: bump to
 v2.11
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
Cc: Vincent =?UTF-8?B?U3RlaGzDqQ==?= <vincent.stehle@arm.com>,
 Marleen Vos <marleen.vos@mind.be>, Bryan Brattlof <bb@ti.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Ariel D'Alessandro <ariel@vanguardiasur.com.ar>,
 Romain Naour <romain.naour@gmail.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 7 Aug 2024 12:48:20 -0500
Bryan Brattlof via buildroot <buildroot@buildroot.org> wrote:

> diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.hash b/boot/arm-trusted-firmware/arm-trusted-firmware.hash
> index 660edb121edcc..8d53c849ff7a7 100644
> --- a/boot/arm-trusted-firmware/arm-trusted-firmware.hash
> +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated
> -sha256  7efa89e1b4e4106ee05d68e876c8efbb146364d89cfd5d26bf4647b09c08f32b  arm-trusted-firmware-v2.10-git4.tar.gz
> +sha256  c0f23ccc71c49989e9ad238acf334473c17b7c88f79a20c829c3d443e3794a22  arm-trusted-firmware-v2.11-git4.tar.gz
>  sha256  695ae232fef6da931157e032b520f145b2c4cbe675d92b6a12222a332e960e89  arm-trusted-firmware-lts-v2.8.13-git4.tar.gz
>  sha256  130d0c6e5159fa454b1e969fd281fa1d388819aefb203f65dd282544b5ab7ba9  docs/license.rst

You had forgotten to update the hash of the license file, which had
changed here. I fixed that up and applied.

Note: I also did an additional patch that added the license file hash
for the LTS versions as well.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
