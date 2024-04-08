Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB7DC67861
	for <buildroot@archiver.kernel.org>; Mon,  8 Apr 2024 21:08:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 05848408C5;
	Mon,  8 Apr 2024 21:08:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rytZCB3KSPU9; Mon,  8 Apr 2024 21:08:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04B8B4117C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 04B8B4117C;
	Mon,  8 Apr 2024 21:08:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B28DD1BF2A6
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 21:08:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9DE2381EDC
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 21:08:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BPdkez97Zvv2 for <buildroot@lists.busybox.net>;
 Mon,  8 Apr 2024 21:08:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 60ADC81ECF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60ADC81ECF
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 60ADC81ECF
 for <buildroot@buildroot.org>; Mon,  8 Apr 2024 21:08:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D6CD5C0003;
 Mon,  8 Apr 2024 21:08:07 +0000 (UTC)
Date: Mon, 8 Apr 2024 23:08:06 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240408230806.5ca01f62@windsurf>
In-Reply-To: <20240404194723.1346001-1-fontaine.fabrice@gmail.com>
References: <20240404194723.1346001-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712610488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aYeiNQDfsDO7ls30lEfzct6N9a6StKFjL6D/JR0zXmw=;
 b=kC3uIaaTaXrqkpGQjb4ZXsYE/0X7w6Y1ZY5y+DyBEHqRxB+8aAyFH73+FVtnq7Z8ERSzCQ
 bhXkwwM8AczfHKenEErNZ3QmX4lvGiDCBXpcFndcxeTAetAgZ+AIUA1wkR9ObvjpkHONhs
 f4ULwSuD5lVVDP7Ei+yWU3yZOx0IxT3ZKVuICLwG1Z2rJYN0aUMNBOzQNV4LRIhx+Txf3I
 shdPBg4TV9agvP0EdF+Fq010D3TgVkzY9dXF/R/XEA/GKA2QYznrqS1oYjk8fECBy0+wPC
 duta4iTAgpMT2RTXSobWWKVrugl745AVoW7U/z/N22ivS7hZClaenluTI/ZKUA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kC3uIaaT
Subject: Re: [Buildroot] [PATCH 1/1] package/privoxy: fix build with root
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

On Thu,  4 Apr 2024 21:47:23 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Set GROUP_T when installing configuration files as root to avoid the
> following build failure raised since commit
> b6816034ebddd522a8fef9daa454c28fa1230dd6:
> 
> /usr/bin/install: missing destination file operand after '/home/buildroot/instance-0/output-1/target/etc'
> 
> Fixes: b6816034ebddd522a8fef9daa454c28fa1230dd6
>  - http://autobuild.buildroot.org/results/eb4ccf248c9c5048e9b71058bb0311b1e0763883
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...0002-GNUMakefile.in-fix-root-install.patch | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 package/privoxy/0002-GNUMakefile.in-fix-root-install.patch

I'm confused because the Buildroot build does not run as root. So why
does this happen?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
