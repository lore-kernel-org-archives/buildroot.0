Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E9DC3DA64
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 15:10:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BFDBD4058D;
	Tue,  6 Aug 2024 15:10:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G0GZK-bJx_IG; Tue,  6 Aug 2024 15:10:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA3B840A56
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA3B840A56;
	Tue,  6 Aug 2024 15:10:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0382E1BF35B
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 15:10:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5C63606F6
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 15:10:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7a3vPnjCPMxk for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 15:10:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B6D2A606B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6D2A606B4
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B6D2A606B4
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 15:10:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B4D711C0006;
 Tue,  6 Aug 2024 15:10:15 +0000 (UTC)
Date: Tue, 6 Aug 2024 17:10:14 +0200
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Message-ID: <20240806171014.65cea8b0@windsurf>
In-Reply-To: <20240212002128.3002289-1-buildroot@bubu1.eu>
References: <20240212002128.3002289-1-buildroot@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722957015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o0oQGYcxqDRomeHTT+JuP5cD995aMyMg5vf6PiUFq0M=;
 b=orAJ0vEdjMAlR63ooqOCz7SnFUIa6H5OIf1YRPmSw0rAQv6CvJeQCLnkV9nSVoT9aLk73N
 cXMarnwAsUU4uB5moL0b3ajTpGvOpNbZMoFmvZ7bVoD/v66l1oVe8j6w5lg56/DdDls6wN
 mynt/oiaPL4rXwrJFmWjJpPQAkOtE3l+EdaCqeV7pKULrU5L1D6CvVoIUeRuRNvW9Hl4fX
 B7ZV2R27PJTFzvwEdlPIGGmYGoFCLL+bZI23ytAAZw1mAjIq4/3/50TVcCpJKGKlHzsB5S
 VbQGzr6TkQeMSp2lmw/4M1Smqcdsn2WvRvlz1+YSVyJcUC9DRBVH0L39DHPDgg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=orAJ0vEd
Subject: Re: [Buildroot] [PATCH] Revert "docs/website/support.html: document
 irc channel permission changes"
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
Cc: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 12 Feb 2024 01:21:26 +0100
Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

> This didn't work out as planned, neither the restriction of muting
> unregistered users, nor the exception for matrix users worked as planned.
> 
> The channel mode has been reverted to +R (meaning only registered users
> are allowed to join) and an exception for *that* has been introduced for
> matrix users via +e. The channel modes are documented in [1].
> 
> [1] https://www.oftc.net/ChannelModes/
> 
> This reverts commit d1e6d7845b0f3b450709b84a6e4fc4527f12b196.
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
>  docs/website/support.html | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
