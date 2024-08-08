Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17272C3DA4A
	for <buildroot@archiver.kernel.org>; Thu,  8 Aug 2024 19:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC2694034F;
	Thu,  8 Aug 2024 19:59:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RLSRdUfNQe0P; Thu,  8 Aug 2024 19:59:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B76540354
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B76540354;
	Thu,  8 Aug 2024 19:59:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 236571BF21A
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 19:59:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1035640292
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 19:59:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5FieF7aJ4ezU for <buildroot@lists.busybox.net>;
 Thu,  8 Aug 2024 19:59:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 67D9E4015F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67D9E4015F
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 67D9E4015F
 for <buildroot@buildroot.org>; Thu,  8 Aug 2024 19:59:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5B3961BF208;
 Thu,  8 Aug 2024 19:59:07 +0000 (UTC)
Date: Thu, 8 Aug 2024 21:59:06 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240808215906.6365ecfa@windsurf>
In-Reply-To: <20240808192126.1767471-1-bernd@kuhls.net>
References: <20240808192126.1767471-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723147147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ITQ+VItlWKgVGNrVfwH0I5lF7oHKMDPI9fCzljVYtcQ=;
 b=TtWd0kJEScQfMbnWF6PTiONZ+qcYJSSEMxtEQuCNWZ6tLssGILFvLHRjK8oDiU/YCm1t6q
 bQkSlxMjQCA/UINvIN1gZVIIUezaPkffcU3tlf8mqC4TuYZOZff4mI3btMTqmaqxWhf42O
 QIQ4avUKnS6cA8CPC93m/sTmky3kh0jca83tMTi5aMOufZz2svRhavYXBoNeNemytF9APX
 e+3oecYPNeVIQlN6wGRdHRqBsP2TB+9e5H6S0qNk5KgyJ1q/QTMToP3GwviLVRrWxE4PRd
 +5MROLCGEgQkhNfunFY8FdtIsjIIUYPWEG+uA79GFTJ10ve/+Monvurj9Z6LBw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TtWd0kJE
Subject: Re: [Buildroot] [PATCH v2 1/1] package/mjpg-streamer: fix undefined
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

On Thu,  8 Aug 2024 21:21:26 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes runtime error:
> 
>     dlopen: /usr/lib/mjpg-streamer/input_uvc.so: undefined symbol: resolutions_help
> 
> Patch was suggested by Thomas:
> http://lists.busybox.net/pipermail/buildroot/2024-August/759732.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Thanks, applied, two comments below.

> ---
> v2: used code suggested by Thomas, run-time tested (Thomas)
> 
>  ...-all-symbols-of-mjpg_streamer-binary.patch | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 package/mjpg-streamer/0001-Export-all-symbols-of-mjpg_streamer-binary.patch
> 
> diff --git a/package/mjpg-streamer/0001-Export-all-symbols-of-mjpg_streamer-binary.patch b/package/mjpg-streamer/0001-Export-all-symbols-of-mjpg_streamer-binary.patch
> new file mode 100644
> index 0000000000..a0b80ff711
> --- /dev/null
> +++ b/package/mjpg-streamer/0001-Export-all-symbols-of-mjpg_streamer-binary.patch
> @@ -0,0 +1,33 @@
> +From fbde1593948ae95f287b2167d0bec5b27948cc01 Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +Date: Tue, 6 Aug 2024 17:04:55 +0200
> +Subject: [PATCH 1/1] Export all symbols of mjpg_streamer binary

Please generate the patches with git format-patch -N. Shall I suggest
that you add:

  https://paste.ack.tf/c160ab

into your .git/hooks/post-commit ? This way you will get automatic
check-package verification when you create or rework commits.

> +Fixes runtime error with stripped binary
> +
> +    dlopen: /usr/lib/mjpg-streamer/input_uvc.so: undefined symbol: resolutions_help
> +
> +Source: http://lists.busybox.net/pipermail/buildroot/2024-August/759732.html
> +
> +Upstream: https://github.com/jacksonliam/mjpg-streamer/pull/401
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

This commit message is pretty terse. For me or you who have looked at
the problem, it's pretty obvious, but for the maintainer of
mjpg-streamer, it really isn't very clear what is going on and why this
patch would be needed.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
