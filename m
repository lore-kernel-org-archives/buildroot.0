Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 331C4C3DA7F
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 22:22:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E717440182;
	Mon,  5 Aug 2024 22:22:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D0oCRdLc-D35; Mon,  5 Aug 2024 22:22:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A865940196
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A865940196;
	Mon,  5 Aug 2024 22:22:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B3D481BF313
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 22:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9FBB580F8B
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 22:21:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cwc19_taFZa2 for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 22:21:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 538B780F56
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 538B780F56
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 538B780F56
 for <buildroot@buildroot.org>; Mon,  5 Aug 2024 22:21:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4B530C0004;
 Mon,  5 Aug 2024 22:21:55 +0000 (UTC)
Date: Tue, 6 Aug 2024 00:21:54 +0200
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Message-ID: <20240806002154.2498f917@windsurf>
In-Reply-To: <20240510214957.7961fff9@windsurf>
References: <20240324185659.1777379-1-bernd@kuhls.net>
 <20240510214957.7961fff9@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722896515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=54kxUAOrno402jFRTEjHkU/1P2m/cXeaFdXz9COcQpY=;
 b=K+MGWuDqO3kaxl1sZGqtMUYb3LeDUC0N2bTr8LsZ4N7H6oYaA0h7DS04NNkCObDNRKeoXU
 xD8ScIXMASq7SgYK7f1oFgG01HiIoGAa4+0P6W+EHdoQ3LYT+QkXqa3MSjj0Hf9xTBLXyw
 4h+N/fnWoVZpU9gV8+e17n/NtiZibUvVu444HaJuPdveFkjYdlKvJ/gcH6nReqO0+OrOxM
 yc+yXzJeYrRpDNXuuZksm73cXrNlp5XAQXH7bXFi3k1hCsZBE8dyM7nHNep1AEg445AV7z
 LVfPOttnTa4vtDIuzHOOERYTfE+SG3WmsR1tFeorJ5yrkQkEW650U57w2z+Heg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=K+MGWuDq
Subject: Re: [Buildroot] [PATCH 1/1] package/mjpg-streamer: fix undefined
 symbol error
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd,

On Fri, 10 May 2024 21:49:57 +0200
Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:

> Thanks for the patch. Are you sure this is the right fix?
> 
> Indeed, the way I understand it is that there is a main executable
> (mjpg-streamer), which loads using dlopen() a number of plugins. This
> symbol resolutions_help is already provided by the mjpg-streamer main
> executable itself, so why can't the dlopen()'ed plugin use it? Here
> you're basically duplicating this symbol into the plugin itself. Is
> that the right way to fix this issue? I am not sure 100% clear on what
> are the rules that allow a dlopen() library to use the symbols of the
> "thing" that dlopen()s the plugin, but it seems like it is possible.
> 
> Also, there is another plugin, input_opencv, which uses the exact same
> symbol, so it would also need to be fixed.
> 
> Opinion from upstream here would be greatly appreciated to see how they
> chose to design their code base.

Since I had no feedback from you on this question, I had a deeper look,
and indeed your proposed fix is incorrect: the plugin should really
call into the resolutions_help() function of the mjpg_streamer
executable.

It doesn't work because the resolutions_help() symbol is not explicitly
exported *and* we are stripping our executables.

An easy solution is to export all symbols of the main binary, which can
be achieved by adding:

set_property(TARGET mjpg_streamer PROPERTY ENABLE_EXPORTS ON)

into the CMakeLists.txt file. A better solution would be to only export
those symbols which are needed by the plugins, but obviously it
requires a bit more work.

I couldn't test at runtime, but before my patch, I can clearly see that
the stripped mjpg_streamer no longer has any symbol table containing
resolutions_help(), while after my patch it contains a symbol table
with this symbol.

Could you give it a try and report back?

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
