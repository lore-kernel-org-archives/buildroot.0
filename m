Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA20DD5B872
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 22:29:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1F1481F82;
	Mon, 15 Dec 2025 22:29:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7UGg7gQw4l3W; Mon, 15 Dec 2025 22:29:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9681081EFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765837740;
	bh=fMQE65BKZ9xSD/7maMuaS+9c3kbCyVnsajzo6XuQF9U=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gXzI0D1hqTcXHWRCIU0GgsYcdn1a4XZAVUVIrGJeH21XTdxMRE+olBEYBDaxUmCNK
	 fDz9xfgrhnhRmZrn++k/ulfiFU6pPOycQwJ2e5DsF8gcpFEFlaY76LJVXgTQeD7gYQ
	 iprtj4OTdvHJpny0exf0BxhNvn/AUVhslpEB1Y21y6BOrohSc2zIu/cMSr6jKHFfCi
	 KmBFd9Vbgvp7zPEQMgFe7uCxG6513wGpqWZw1Oy0Vjk9M6vtZ5uG4S9cV7M88LYObE
	 lFmJ/aSYv66zHF7yhmS6R4lk4PFXIhT6o2TJBxhiVQQkDXol7aFk20SeclBtRnhBpF
	 7tvn7ykbSVd6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9681081EFA;
	Mon, 15 Dec 2025 22:29:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E458255
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:28:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3519240AB1
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:28:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3O9vOBJl84os for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 22:28:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3B0E540AAB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B0E540AAB
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3B0E540AAB
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:28:57 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 5CAFA4E41C18;
 Mon, 15 Dec 2025 22:28:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 197C460664;
 Mon, 15 Dec 2025 22:28:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 157991194211F; Mon, 15 Dec 2025 23:28:52 +0100 (CET)
Date: Mon, 15 Dec 2025 23:28:51 +0100
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Cc: buildroot@buildroot.org, Christian Hitz <christian@klarinett.li>, Zoltan
 Gyarmati <zgyarmati@zgyarmati.de>, Baxiche Su <baxiche@gmail.com>, Jesse
 Van Gavere <jesseevg@gmail.com>, Christian Hitz <christian.hitz@bbv.ch>
Message-ID: <20251215232851.31d2eac8@windsurf>
In-Reply-To: <20250610122924.431830-2-roykollensvendsen@gmail.com>
References: <20250610122924.431830-1-roykollensvendsen@gmail.com>
 <20250610122924.431830-2-roykollensvendsen@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765837734; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=aujXrgdydgv1wdT1saUs/EB+3Z1TatRfp3/ko8RXooQ=;
 b=xYuaSCNvQLRabYOUsDznsqv0eZ8WN5YDx65m+xLhCaBkJBmgMXsY6DDqRfPkAiClnSTSgh
 r9MzDmp28oCTMzHPEV689VePrkRW3Bvw2jenB2ru1pY1FkkJqiZllb/hyNE5OObawcqbEF
 /Y2aV9bZREhOutMzdIdYgFIGmHWiD5Wl+0bdr7/xPChZcquYd7emq+XdmPUUXNKMjPZNK4
 r89wj/JmWI55JuNKyIhCmwNQVT0AkIInaNJoxK/Ht/8Veql3ZrcMDvAENg011u/TYVQ9Bd
 XbNedM2g3Gl01vdgT2ObA+3eqbd5bb9PkIU7DLnxoVTRO1zEtLzqek+hZ8ahpw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=xYuaSCNv
Subject: Re: [Buildroot] [PATCH 2/6] package/qt6/qt6connectivity: new package
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

Hello Roy, Christian,

Sorry for the very long delay in replying to this.

On Tue, 10 Jun 2025 14:29:16 +0200
Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:

> diff --git a/package/qt6/qt6connectivity/Config.in b/package/qt6/qt6connectivity/Config.in
> new file mode 100644
> index 0000000000..ba329d732e
> --- /dev/null
> +++ b/package/qt6/qt6connectivity/Config.in
> @@ -0,0 +1,17 @@
> +config BR2_PACKAGE_QT6CONNECTIVITY
> +	bool "qt6connectivity"
> +	depends on BR2_PACKAGE_NEARD || BR2_PACKAGE_BLUEZ5_UTILS

So when bluez5-utils is available, it has a build time dependency on it:

> +QT6CONNECTIVITY_DEPENDENCIES += $(if $(BR2_PACKAGE_BLUEZ5_UTILS),bluez5_utils)

but it doesn't have a build-time dependency on neard? This is quite
unusual, this definitely deserve some comment, or at least an
explanation in the commit log. Could you provide more details on this
topic?

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
