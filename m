Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51708EE01E8
	for <buildroot@archiver.kernel.org>; Tue, 10 Sep 2024 20:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05FC2608C2;
	Tue, 10 Sep 2024 20:51:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t0Zrf61U4voy; Tue, 10 Sep 2024 20:51:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF49F608C9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF49F608C9;
	Tue, 10 Sep 2024 20:51:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C347A1BF4D8
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 20:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B057280BE9
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 20:46:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XHFlWJ2KaZD8 for <buildroot@lists.busybox.net>;
 Tue, 10 Sep 2024 20:46:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 952EC80BC3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 952EC80BC3
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 952EC80BC3
 for <buildroot@busybox.net>; Tue, 10 Sep 2024 20:46:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 52FE820003;
 Tue, 10 Sep 2024 20:46:41 +0000 (UTC)
Date: Tue, 10 Sep 2024 22:46:40 +0200
To: Grant Edwards <grant.b.edwards@gmail.com>
Message-ID: <20240910224640.5f832e45@windsurf>
In-Reply-To: <vbq5j5$aai$1@ciao.gmane.io>
References: <vbq51m$cnj$1@ciao.gmane.io>
	<vbq5j5$aai$1@ciao.gmane.io>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726001202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wpqPFfi0wVmSRraMDJ0Ifr77F5LMJuHjk6z+CGBR07U=;
 b=DjU4lioY0BmQuXYYMxfMRCjRFBWRNG08SS+S3aXDpq7tZyW4Bi5n7DdEZmACxZpygjuqeL
 i6TViyz1wWpXW2iuEIAuCPHTSmWzq5SDKgitsURVtJnpOa4NY5xcroqYLjSF4NqdjbCiG1
 KdygcaTda2WsPXGxWy6pP0AD1eQOHc+umH+bk6SE1G7DWnsy1/DX6DdETyUeyWLwEoIFUw
 BD+wiJuGsaQqj5do/QSmU3LLTHOH1WjmWaQTFZ3wojqApnAcWLhaLLDZgo4F8QIek3WFQA
 D6Jv4OKwjpQzGkACpScSQqfvdAFfFurPIfVLImAopOMP3OTWJoOO7vbP4Zj+Ag==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DjU4lioY
Subject: Re: [Buildroot] How to control host gcc version?
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
Cc: buildroot@busybox.net, buildroot@uclibc.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 10 Sep 2024 19:10:29 -0000 (UTC)
Grant Edwards <grant.b.edwards@gmail.com> wrote:

> Ah, found it:
> 
>     8.6. Environment variables
> 
>     Buildroot also honors some environment variables, when they are
>     passed to make or set in the environment:
> 
>     HOSTCXX, the host C++ compiler to use
>     
>     HOSTCC, the host C compiler to use

Indeed. But in your case, what you probably should do is use a Docker
container. You can use the utils/docker-run script to easily run the
build in a docker container.

Basically do:

	./utils/docker-run make

and it will do the Buildroot build in our "reference" Debian bullseye
Docker container. If you're not happy with this container, you can do:

	IMAGE=<your-docker-image> ./utils/docker-run make

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
