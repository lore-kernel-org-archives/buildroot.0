Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1747AC3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 20:37:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1C8180BE7;
	Mon, 22 Jul 2024 20:37:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QuMivC_Qi3-R; Mon, 22 Jul 2024 20:37:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8C2780CB1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8C2780CB1;
	Mon, 22 Jul 2024 20:37:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 712511BF296
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 20:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6BE5A60754
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 20:37:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XXfPwWRNDg9f for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 20:37:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3F1D26074C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F1D26074C
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3F1D26074C
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 20:37:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 352F21BF204;
 Mon, 22 Jul 2024 20:37:49 +0000 (UTC)
Date: Mon, 22 Jul 2024 22:37:48 +0200
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Message-ID: <20240722223748.5893f728@windsurf>
In-Reply-To: <20240213123753.2471309-2-buildroot@bubu1.eu>
References: <20240213123753.2471309-1-buildroot@bubu1.eu>
 <20240213123753.2471309-2-buildroot@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721680669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q87aWENqclrkROnYhtFUWOnl0hvE0PXMwOfw/M7V9ZA=;
 b=h4PCBdQhIHmZ7+SaS8TYnP7j3Rupjz74v4zbrVcKfAcWObgKvxUCLL8mcKM7mAK64w7S5n
 Y3cH9ACbt8EnWnq8GTRVJqSKOmj+XhjXBiK+5smOhgdYgh8phPHad1fc326Fd2PrUgwBSF
 IpvwDFVe5G/w62hcZAQ4ttVXIRrMG6jJhef6U2JAMAo6krWyXVJRD0ib3WzvC8KMwoP+py
 SHPh3FFspRVcYUViapLe0pQyQFZ7vdnQD0SGiZmMe/P1iQxFsUdHW17Ik7hJHJ/jkcCTpw
 SeZG9SBw9+hWpsrP9Tj3Fb7BkEkQ/l9cO45HipSoJOt1KzR1N2PWVDfa5tS3DQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=h4PCBdQh
Subject: Re: [Buildroot] [PATCH 2/2] package/python-can: needs PYTHON3_CURSES
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 13 Feb 2024 13:37:53 +0100
Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

> The can.viewer tool requires curses support. [1]
> 
> [1] https://github.com/hardbyte/python-can/blob/v4.3.1/can/viewer.py#L44-L53
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
>  package/python-can/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/python-can/Config.in b/package/python-can/Config.in
> index 61955a2b00..106da4560c 100644
> --- a/package/python-can/Config.in
> +++ b/package/python-can/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_PYTHON_CAN
>  	bool "python-can"
> +	select BR2_PACKAGE_PYTHON3_CURSES # runtime for can.viewer tool

I am not 100% sure on this one. Do we want to make this dependency
mandatory, while it is only needed for a viewer tool, which probably
most users of python-can won't use?

I see two alternatives here:

1. Leave things are they are today, i.e let users figure out that they
   need to enable curses support for the viewer.

2. Add an explicit BR2_PACKAGE_PYTHON_CAN_VIEWER option, which selects
   BR2_PACKAGE_PYTHON3_CURSES and enables the installation of the viewer
   tool. When this option is disabled, viewer.py is not installed (or
   removed if disabling installation is not possible)

Thoughts? This is not a hard feeling on my side.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
