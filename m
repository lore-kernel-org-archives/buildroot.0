Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3400BC3DA7F
	for <buildroot@archiver.kernel.org>; Fri,  2 Aug 2024 21:39:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3F926069C;
	Fri,  2 Aug 2024 21:39:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ecGnar1qA0K; Fri,  2 Aug 2024 21:39:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BBB6606A5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BBB6606A5;
	Fri,  2 Aug 2024 21:39:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4ECEB1BF3FF
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 21:39:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 48CD540104
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 21:39:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FNcGdivNiJAm for <buildroot@lists.busybox.net>;
 Fri,  2 Aug 2024 21:39:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 00B71400B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00B71400B5
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 00B71400B5
 for <buildroot@buildroot.org>; Fri,  2 Aug 2024 21:39:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 045F460002;
 Fri,  2 Aug 2024 21:39:09 +0000 (UTC)
Date: Fri, 2 Aug 2024 23:39:08 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240802233908.6e7a3dfa@windsurf>
In-Reply-To: <20240719030537.3156999-1-james.hilliard1@gmail.com>
References: <20240719030537.3156999-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722634750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cPHWk/5QFCAed62RIvzjbBdgFBNgCIM/XFtopTYH69c=;
 b=keE6TGyID4GTYXd8Xd5N7CyiftVmzqRajlrhyqHnu+cd9wC73bvit819Ewpytj5b8oSGov
 ghu5U0w/3m0qtGMyqN9HqI+3WqWtZs1Rf7Mfpirt6jYQsQ31L3Da0b0yDm5fasiapjCC9I
 wG7n7TL77f3TtqLmEnhOhJP2vq6NEqUYBoBRSjD3s1kZY28YcMBrhKOucWwOCKVUq3mV8P
 Mtt4hfxJ7Ks9rdaBF64PJJLD4VwMt4Ah/rCL8ZLLuWm14yshnDUJRbXwGHtfdLEIphgx8/
 C9H6fjjuE7a89uWqIXTT/40drr2FFDlzUQRYe8jFBt4otHA10tWoXLEx7F5GZQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=keE6TGyI
Subject: Re: [Buildroot] [PATCH 1/2] package/pkg-golang.mk: allow packages
 to override download GOPROXY
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
Cc: Anisse Astier <anisse@astier.eu>, Christian Stewart <christian@aperture.us>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 18 Jul 2024 21:05:36 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Some packages like the upcoming tailscale package need to set GOPROXY
> to get the correct dependencies.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/pkg-golang.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Considering the feedback from Christian on this PATCH 1/2, I have
marked the series as Changes Requested. Could you resend once the
vendoring issue is resolved?

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
