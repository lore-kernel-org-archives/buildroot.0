Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4217D3C912
	for <buildroot@archiver.kernel.org>; Wed, 10 Dec 2025 14:27:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7168140611;
	Wed, 10 Dec 2025 14:27:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JTfQ20v5RYdk; Wed, 10 Dec 2025 14:27:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2368B405AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765376824;
	bh=zAddPTcvigPD4FBhz3z+c9uxYEwRreHH4yuSuDUii2E=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=S3U5NTmwqbOfKM+kmtWy8iB68cVikK3157syQt1T22aTETFazOBr0kUtSLacK0FOw
	 o7hgffE0VFZFGu08qjlo8a1hNe3fzWGBEPMCGgKkAx2CdgEpXYT4IqiodH/nuMdksR
	 WkPsAku69qINbHYAdduotfhXNFA7Gq7vd8BRW+rEY5TX2DfNuhVetgUZ2Y9cWsxeag
	 yvAv7a6xJoT7pIRSvPoXjRIVDjaHU50uBwBthU3ty37074TpFkQWvAy5dyt6t03Rsg
	 OTg/h87bX41ufqxhbbRsdldlkNv7LzDhqB4k+MSpUtWc45E/fOijMWKcXlG35DWd1k
	 VbLKW65lhFetw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2368B405AB;
	Wed, 10 Dec 2025 14:27:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DA4152C0
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 14:27:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C023061794
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 14:27:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a7VmqhfVeac4 for <buildroot@buildroot.org>;
 Wed, 10 Dec 2025 14:27:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B9B5B61790
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9B5B61790
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B9B5B61790
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 14:27:00 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 465371A20A8
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 14:26:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1D9CF60714
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 14:26:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 759D511931862; Wed, 10 Dec 2025 15:26:58 +0100 (CET)
Date: Wed, 10 Dec 2025 15:26:57 +0100
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: buildroot@buildroot.org
Message-ID: <20251210152657.5422b252@windsurf>
In-Reply-To: <20251210151337.7c42babf@kmaincent-XPS-13-7390>
References: <20251210102940.2535550-1-kory.maincent@bootlin.com>
 <20251210145715.50e51799@windsurf>
 <20251210151337.7c42babf@kmaincent-XPS-13-7390>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765376818; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=6j+6i+6B0715h2WAXImbwPtSRZuaofIqDWiKmSL0sRA=;
 b=PzGmM60KR/d/GxTqxTd1P3rw3Z1pgwMXij6rpWK12lI0Wk9cNCxbTSCmvmAMVbcsQV1u7D
 lDM2tG7c4Iwmu0u374A4mfbj0qiuRKTnxfYlps9CSu7Z6M+8mtEg6Gw8fncGms9oyAwacJ
 xANO2pQJ+pLOEfS1VNP+nYEWhfvTTdN5rj7ux7VoC+LWR+79YGy0HjW7j05izWFe6XZxvk
 MdrWQL/PUFb5K3NtslvVkjiUFAg0J36LyrpCkw5dJaHMAiA89LyL4i48bzJAuHMuQXv03+
 SwJEh+oHsPvnL2Ud3FBRvq4SRRFaESi+KxjrvEsiU9tb/0O29EVc4GLG9WEpGg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=PzGmM60K
Subject: Re: [Buildroot] [PATCH] package/util-linux: Fix host uuidd build
 configuration
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

Hello,

On Wed, 10 Dec 2025 15:13:37 +0100
Kory Maincent <kory.maincent@bootlin.com> wrote:

> > Sorry, but I don't really understand the conflict. --enable-libuuid to
> > me does not conflict with --disable-uuidd. --enable-libuuid enables the
> > libuuid library, --disable-uuidd disables the uuidd daemon, which can
> > optionally be used by libuuid, but isn't strictly needed.  
> 
> Oh wow, my brain read --enable-uuid and --disable-uuid.
> uuid and libuuid are indeed two distinct things, sorry for the confusion.
>  
> > Which specific tool was missing in your case?  
> 
> I was needing the uuidgen tool on my case.
> That why I need to enable uuid.

And --enable-uuidd controls whether uuidgen is built?

I'll generally be fine with dropping --disable-uiidd, but please
provide a good commit log, explaining the difference in build time
(since it's a host package, we don't care about the difference in
installed size). I presume the build time difference will be minimal if
not negligible.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
