Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9655DC3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 12:07:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5970A400D2;
	Mon, 22 Jul 2024 12:07:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 96EhQJSXDk3I; Mon, 22 Jul 2024 12:07:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B2C340437
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B2C340437;
	Mon, 22 Jul 2024 12:07:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E17741BF2A1
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:07:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE7634025F
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:07:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FdmcVY-tZK_T for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 12:07:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 666BA4024A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 666BA4024A
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 666BA4024A
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 12:07:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D7014E0002;
 Mon, 22 Jul 2024 12:07:20 +0000 (UTC)
Date: Mon, 22 Jul 2024 14:07:20 +0200
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Message-ID: <20240722140720.16c78ed1@windsurf>
In-Reply-To: <20240722111123.1256111-1-buildroot@bubu1.eu>
References: <20240722111123.1256111-1-buildroot@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721650041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hOorbubWWDRFuFGczSMZUblRqL2FVIySp6zkYa9tBiw=;
 b=I48EcL8wLIjfze257YdrBnrmGNbI4QZPiiV2hbo3IJ/26UM7Jl+kzq3CAksvLWD4rLlpUQ
 syHt++YWTjG0ePAuimBH3wjoOL7IDbJoUBYPYhQ167Pb6+Fo5LkS0gD2ZqcLT88LBL6EQm
 dnX0xKR8eJewnU1aSYATJXz86UhA+/Cm1iE054Q8QuD1Nc/dtCxhTZ4oNJPLVXfbhZSg3a
 3LGu3ud/sw9UyakANn0Mb17dFzGL+MyJ3RfoH+c2tl8wOn7zAJ2WydwDyFDKAMQ+VCjwTg
 kFgmn4MvUKbQP/Gl+71e1RwjRD3ldSfI7aZbdjcnxuv09Jyn015JsziivWZWAg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=I48EcL8w
Subject: Re: [Buildroot] [PATCH] package/python-uvicorn: bump to 0.30.3
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
 Marcus Hoffmann <buildroot@bubu1.eu>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 22 Jul 2024 13:11:23 +0200
Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

> Changelog:
> 
> * https://github.com/encode/uvicorn/releases/tag/0.30.3
> * https://github.com/encode/uvicorn/releases/tag/0.30.2
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
>  package/python-uvicorn/python-uvicorn.hash | 4 ++--
>  package/python-uvicorn/python-uvicorn.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
