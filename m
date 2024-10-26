Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 939D0D10BFA
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 14:09:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56ACE41D7C;
	Sat, 26 Oct 2024 14:09:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DJov1GQ6lHez; Sat, 26 Oct 2024 14:09:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 091A841D92
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 091A841D92;
	Sat, 26 Oct 2024 14:09:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2000F5C24
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:09:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E92B81371
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:09:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PhJyfpaF7gJb for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 14:09:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EBBD280DCE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBBD280DCE
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EBBD280DCE
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:09:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 098CE1C0006;
 Sat, 26 Oct 2024 14:09:12 +0000 (UTC)
Date: Sat, 26 Oct 2024 16:09:12 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
Message-ID: <20241026160912.6e619bdb@windsurf>
In-Reply-To: <20240923161409.2937293-1-dario.binacchi@amarulasolutions.com>
References: <20240923161409.2937293-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729951753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fyqzz5LofLfBfIRSNBESWucDePNTbNLkXiyAr9IxP6k=;
 b=iIhPszhVdS4fUQ882eX7IT/AQ07qbPzTPfLgSAFx74/PRN2XnmAH9SiRAtYzKhPPn5bgCf
 Pir99DWxLD9pEpenJJ7KhDssT/Cgze1DDV4W2WL3rrFfOkVSbDKYndxVRd9JCUJby0FLMd
 r3p6Q23zH8mUim5VOL/mAFyjopMxnQisjmxwjJvISLtIxYY/ogcY9G/c7Pcq03/DNMbKYq
 QWTyiOGHTd3Tu4SpNvMayGmrkKbI5UH9Evwoel44Z4+gLMrmXPH7EJFhQJ4bAhRwT7O8hA
 dvuecBAXqSiEg0bazPp1MtTUxSiZK35fyzmugKNWeNuaLor3b03BipKXHFRX+Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iIhPszhV
Subject: Re: [Buildroot] [PATCH v2 1/1] package/babeld: bump to version
 1.13.1
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

On Mon, 23 Sep 2024 18:14:09 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> - Implemented the per-interface option "probe-mtu", which automatically
>   discards links with a mis-configured MTU.
> - Fixed a typo in the handing of the option "v4viav6".
> 
> Release notes:
> https://github.com/jech/babeld/blob/master/CHANGES
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> Changes v1 -> v2:
>  - Replace the added patch with the merged one.

Applied to master, thanks.

However, please note that your fix submitted upstream (and merged) is
not really the most appropriate fix. Indeed, it means you're directly
including kernel headers. I think the correct fix was to add the
missing definition in uClibc-ng.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
