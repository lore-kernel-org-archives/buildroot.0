Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EAFEC10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 21:27:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCBA441E4F;
	Thu,  9 May 2024 21:27:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8edGTVqlXLCT; Thu,  9 May 2024 21:27:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EB1141FA9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EB1141FA9;
	Thu,  9 May 2024 21:27:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CC3E51BF427
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 21:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B877941FA9
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 21:27:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9jLL22J-TRxD for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 21:27:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E6FC841E4F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6FC841E4F
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E6FC841E4F
 for <buildroot@buildroot.org>; Thu,  9 May 2024 21:27:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3C082E0003;
 Thu,  9 May 2024 21:27:27 +0000 (UTC)
Date: Thu, 9 May 2024 23:27:26 +0200
To: <nick.whitlock@eizo.com>
Message-ID: <20240509232726.54ff0818@windsurf>
In-Reply-To: <TY2PR01MB4572A27ADF9451486BA9889084E62@TY2PR01MB4572.jpnprd01.prod.outlook.com>
References: <20240509190028.693457-1-nick.whitlock@eizo.com>
 <20240509215156.7185ff8f@windsurf>
 <TY2PR01MB4572A27ADF9451486BA9889084E62@TY2PR01MB4572.jpnprd01.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715290049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cRt+zrsy661574sPFRmssXzSWszSqCMje5bZMwHE804=;
 b=dIB/auXMgc4jnvs8qsc0y29W5wg/u/fswfSRODmXWW5yKHEOZKv0a0esYCKCmXNvtdJ+SV
 h4SO6sH5zxMgjLXhwEjApw2krHR/+ioUM0PQi4xxTrSZ05UbBdjM/ED79rSTuZ9nn57Irq
 VV02uP/pkj/pIyy/uBeGu6JaFaU9pCDuo37htTxKAHuT4Rowf/3P2q+18f1uuLozeJ7aXz
 TZ6tbIV5CgQKK7IXNaJHuH1cN46m9YOMDiAQTBkXCdS0mr7oFMd61CXt/YkTNoEA72kuCg
 FVRlzuTrxIdn/g9wrhXz9tPs25m2hdDMJL9Nqk8Z8ZkIXdulmP2FGbQsbs4uJQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dIB/auXM
Subject: Re: [Buildroot] [PATCH] package/nvidia-driver: bump version to
 550.78
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
Cc: yann.morin.1998@free.fr, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Nick,

On Thu, 9 May 2024 21:16:36 +0000
<nick.whitlock@eizo.com> wrote:

> > We need your patch to have your Signed-off-by line, otherwise we unfortunately cannot apply it.  
> 
> Is this mentioned somewhere in the documentation? I'm not sure how to apply this.

See
https://buildroot.org/downloads/manual/manual.html#submitting-patches.
Extract from this:

   Finally, the patch should be signed off. This is done by adding
   Signed-off-by: Your Real Name <your@email.address> at the end of the
   commit message. git commit -s does that for you, if configured
   properly. The Signed-off-by tag means that you publish the patch
   under the Buildroot license (i.e. GPL-2.0+, except for package
   patches, which have the upstream license), and that you are allowed
   to do so. See the Developer Certificate of Origin for details.

So for once, our documentation does have the relevant details :-)

> > Why does this have a depends on BR2_PACKAGE_NVIDIA_DRIVER_MODULE ?
> > From what I can see in your patch, this option is merely installing
> > more user-space libraries, so why do you make this depend on the
> > driver module being enabled?  
> 
> Those libraries depend on the driver module, from my understanding.

What makes you think this?

> > - Are these hashes provided by some authoritative source upstream?
> > If  
>   so, indicate where. Otherwise, keeping the locally calculated sha256
>   is sufficient.
> 
> To my knowledge, I'm not sure. I computed them locally using
> `md5sum`, `sha1sum` and `sha256sum` and they seemed to take when I
> built it.

Then, only include the sha256, this is enough.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
