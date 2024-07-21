Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E88BAC3DA5D
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 16:23:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B32AD605D4;
	Sun, 21 Jul 2024 16:23:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iJZI6eCSUAX7; Sun, 21 Jul 2024 16:23:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0BC3605E0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0BC3605E0;
	Sun, 21 Jul 2024 16:23:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C59CB1BF321
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:23:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2FB4401F5
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:23:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cp2UqiK9dvMd for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 16:23:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7394A401EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7394A401EF
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7394A401EF
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 16:23:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3380740008;
 Sun, 21 Jul 2024 16:23:43 +0000 (UTC)
Date: Sun, 21 Jul 2024 18:23:42 +0200
To: Andreas Ziegler <br015@umbiko.net>
Message-ID: <20240721182342.6403c1d7@windsurf>
In-Reply-To: <20240721065737.2744-1-br015@umbiko.net>
References: <20240721065737.2744-1-br015@umbiko.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721579023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WqKQUUOPzM/wRCYQbiQt3Cg+yGN7LBWAm+l+ZBKDr+A=;
 b=QLIkE59K1ASwkvjFTQGifqzuJTdB2UF/ZIF+P8sDQZPEmo6RnpFm0xAViJSoTAFO1Mhy/h
 U4Pjf4QuFUfhdHAKHQ6nGWJKBEA+wSH+TQUetIucTuE83XnypJgSkrCQ4qYlfWxfQuayMN
 NEZDeiN/GhTeeQDjM5tuRmm4jhTmxds2nqEMbiJOh8tkEsEWJNvamkG9J3sK+DyPlFtL5Y
 c1Jh7onNdp592f1gqyj0o1zNmZSHQ/RDheN3GEZPkfNnenwtO7aESzNostiRRPX4x8lgm+
 QbcU59jFl5oZuEYvgdXqAOzw7cFFLG5b/a5RGnRpqxvJRlFu2pHoidbrtvVCHA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QLIkE59K
Subject: Re: [Buildroot] [PATCH] package/mpd: rebase init script on layout
 introduced by openssh
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

Hello Andreas,

On Sun, 21 Jul 2024 08:57:37 +0200
Andreas Ziegler <br015@umbiko.net> wrote:

> +	printf "Starting %s: " "$DAEMON"
> +	# $DAEMON creates its own $PIDFILE, so do not use --pidfile

Not correct: you still need to use --pidfile. --pidfile does not tell
start-stop-daemon to create the PID file, but it will check whether the
process really created it.

OpenSSH also creates its own PID file, so could you rework to really
follow the S50sshd example?

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
