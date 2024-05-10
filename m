Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA1BDC25B74
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 19:50:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45F494240A;
	Fri, 10 May 2024 19:50:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4KhwZTtBC1lF; Fri, 10 May 2024 19:50:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1EA54240D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1EA54240D;
	Fri, 10 May 2024 19:50:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 414711BF390
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 19:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D0054240D
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 19:50:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zHMBfEI36Ear for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 19:50:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B76574240A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B76574240A
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B76574240A
 for <buildroot@buildroot.org>; Fri, 10 May 2024 19:50:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6DA53240002;
 Fri, 10 May 2024 19:49:58 +0000 (UTC)
Date: Fri, 10 May 2024 21:49:57 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240510214957.7961fff9@windsurf>
In-Reply-To: <20240324185659.1777379-1-bernd@kuhls.net>
References: <20240324185659.1777379-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715370598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O6cJdRjMRt0C+313YiwqtlVNSPGpTLn/02wvw8+Aymg=;
 b=XrJ0SmdQDEiz3Gpyp4E1kUGBoysOqqvora44pM2LjWYpjUtrj7oyqLxWryatwma29VnTdS
 JJB/3Ab/yAfsSnZdOyQvRwhBqWwqJNDe1lbFC5naZa27+vHjVAnkMzX1R4+BfhjwyEzcPH
 trxZFoCRVclQGNTX71KfT7cXBsaH9JfTDxKRBuXU+whQZoaGy7CCzxk/Ez6CXr+4xYTrO3
 V0V58gSxOvzu3WJZwByTZ/vcaMhfrWkdSv6eSqjw3gDQ3V3XqADJx+M4bPG7FJU4zTnWx+
 ARRoVqly0FRsDMq3FhK41Wwul4IzIqvNQ8inEqQhHBfzJcxtBma6GD2FQitEqQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XrJ0SmdQ
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd,

On Sun, 24 Mar 2024 19:56:59 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> +diff --git a/mjpg-streamer-experimental/plugins/input_uvc/CMakeLists.txt b/mjpg-streamer-experimental/plugins/input_uvc/CMakeLists.txt
> +index 72b24fa..90bbfa0 100644
> +--- a/mjpg-streamer-experimental/plugins/input_uvc/CMakeLists.txt
> ++++ b/mjpg-streamer-experimental/plugins/input_uvc/CMakeLists.txt
> +@@ -22,6 +22,7 @@ if (PLUGIN_INPUT_UVC)
> +     MJPG_STREAMER_PLUGIN_COMPILE(input_uvc dynctrl.c
> +                                            input_uvc.c
> +                                            jpeg_utils.c
> ++                                           ../../utils.c
> +                                            v4l2uvc.c)

Thanks for the patch. Are you sure this is the right fix?

Indeed, the way I understand it is that there is a main executable
(mjpg-streamer), which loads using dlopen() a number of plugins. This
symbol resolutions_help is already provided by the mjpg-streamer main
executable itself, so why can't the dlopen()'ed plugin use it? Here
you're basically duplicating this symbol into the plugin itself. Is
that the right way to fix this issue? I am not sure 100% clear on what
are the rules that allow a dlopen() library to use the symbols of the
"thing" that dlopen()s the plugin, but it seems like it is possible.

Also, there is another plugin, input_opencv, which uses the exact same
symbol, so it would also need to be fixed.

Opinion from upstream here would be greatly appreciated to see how they
chose to design their code base.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
