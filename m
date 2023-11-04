Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B402DC4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 13:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CF8F8207C;
	Sat,  4 Nov 2023 13:43:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CF8F8207C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V1Ggkj716fOG; Sat,  4 Nov 2023 13:43:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8E9982070;
	Sat,  4 Nov 2023 13:43:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8E9982070
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BA21C1BF30C
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 13:43:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C3F84193E
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 13:43:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C3F84193E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rc2TKVyQYBq5 for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 13:43:23 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6A450418DD
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 13:43:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A450418DD
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7C33820003;
 Sat,  4 Nov 2023 13:43:21 +0000 (UTC)
Date: Sat, 4 Nov 2023 14:43:20 +0100
To: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Message-ID: <20231104144320.471020b7@windsurf>
In-Reply-To: <20231103111618.548198-1-buildroot@heine.tech>
References: <20231103111618.548198-1-buildroot@heine.tech>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699105401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PSejSinN+Z+xmB1sAZS+E/poZcMo+bdWeA7xRHaGFGs=;
 b=WKwmRw1+liU3kMbLsPGsYOD9BvVGnkJiBjpP8KplMMnUYxpZYOtNHnDCxNYfzgLeAyC/aW
 UpLu//lPAXt2Uez2F7kohoUK7IhJfAkWPNffFD1FYwVoLVP1RXNS+hW4wHzOVb+OT9ProW
 8ywTEa7aO7epmpuvEIA8WLmOWOUnQ3ihdmXLH23PxFFWWhGa8KnE3IncdDeVHuGFGhlPAN
 6wE8w6JuAEGLsvWkZTS5oqlkdR8npqR3y0PTucyPSTD5mJZEAwS9gQVf5aG9p2yNM/FsQP
 dpiBpaKbw2ijvvt8G99KYNiBlBdq/7BxPmzoFTLnm0v1mWiOqS2rpyyx45vIsQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WKwmRw1+
Subject: Re: [Buildroot] [PATCH] package/websocketpp: fix build with C++20
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
Cc: Ryan Barnett <ryan.barnett@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Michael,

On Fri,  3 Nov 2023 12:16:12 +0100
Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:

> websocketpp had some ill-formed usage of template parameters which was
> finally removed in C++20. Hence build fails when building with C++20 support
> enabled.
> 
> The patch is already in the develop branch but no new release was done.
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
>  .../websocketpp/0001-fix_cpp20_build.patch    | 108 ++++++++++++++++++
>  1 file changed, 108 insertions(+)
>  create mode 100644 package/websocketpp/0001-fix_cpp20_build.patch

Thanks a lot, I have extended the commit log with the very useful
details you provided as a reply to my question, and applied to master.
Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
