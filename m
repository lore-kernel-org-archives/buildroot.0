Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 027FDEDE9BF
	for <buildroot@archiver.kernel.org>; Tue, 10 Sep 2024 20:45:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1A23608BE;
	Tue, 10 Sep 2024 20:45:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Dab0WOe3pe8; Tue, 10 Sep 2024 20:45:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2ABC608BA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2ABC608BA;
	Tue, 10 Sep 2024 20:45:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 93CD11BF4D8
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 20:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15B76406C1
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 20:45:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FYiOpKgNIRLa for <buildroot@lists.busybox.net>;
 Tue, 10 Sep 2024 20:45:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A3CF0406DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3CF0406DC
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A3CF0406DC
 for <buildroot@buildroot.org>; Tue, 10 Sep 2024 20:45:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CC69F1BF203;
 Tue, 10 Sep 2024 20:44:57 +0000 (UTC)
Date: Tue, 10 Sep 2024 22:44:56 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20240910224456.52a90479@windsurf>
In-Reply-To: <20240909152748.3876779-1-peter@korsgaard.com>
References: <20240909152748.3876779-1-peter@korsgaard.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726001098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cSMylG0v5vDf2GAPjo5xn3uwzcKNyCps5oQfP/8XME0=;
 b=g38dznbPXmHntt/s0wPZGUrd2YCjauNKDGBcnEC0YLb5k0y0kN3CwtbHHlKYxinX28DGAo
 u5k8dzYvSeDoQylNsDAMNFBR5GlSEBzcZcJ7So2g77yyul5HuwsZND2sEPCtuzUjIxN2Yf
 IZNxnI0St2bPvMDmQpVDFF/v5gPJgo8TpgRsSIl2FhNXvkme3Ttxyg5gxaPOa5DRTdw7ll
 6hwxIXpKZucM9JVXNfZ48PSo/04K8AS7TGpB7CdWa+t8IkR06mmA4alCF+m5Ex8kkGTNIb
 cp55Llxsd8k+NNh+OkCnFe7dYx9IdAnR/wv6LLPiAU2Qqf0yB6KL9LPfMROxiA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=g38dznbP
Subject: Re: [Buildroot] [PATCH 1/2] support/misc/Vagrantfile: move to
 Debian bullseyes (12)
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

On Mon,  9 Sep 2024 17:27:46 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Ubuntu Bionic (18.04) was EOL'ed in June 2023:
> 
> https://ubuntu.com//blog/18-04-end-of-standard-support
> 
> And the VM image is only available in virtualbox format:
> 
> https://app.vagrantup.com/ubuntu/boxes/bionic64
> 
> So move to Debian bullseye (12), matching what we do for the docker image.
> This is available in virtualbox and libvirt (qemu) format:
> 
> https://app.vagrantup.com/debian/boxes/bullseye64
> 
> Bullseye does not come with rsync out of the box, so install it.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  support/misc/Vagrantfile | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)

Both applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
