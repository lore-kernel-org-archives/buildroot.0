Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7791C52D7F
	for <buildroot@archiver.kernel.org>; Wed, 14 Aug 2024 22:04:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 691EF403B9;
	Wed, 14 Aug 2024 22:04:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jy7__2aJCaYC; Wed, 14 Aug 2024 22:04:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAAE8403D1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAAE8403D1;
	Wed, 14 Aug 2024 22:04:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 89B191BF32E
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 22:04:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8160A811DC
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 22:04:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r_t8raESkQgB for <buildroot@lists.busybox.net>;
 Wed, 14 Aug 2024 22:04:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EFA51811D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFA51811D9
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EFA51811D9
 for <buildroot@busybox.net>; Wed, 14 Aug 2024 22:04:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B06BD20004;
 Wed, 14 Aug 2024 22:03:59 +0000 (UTC)
Date: Thu, 15 Aug 2024 00:03:58 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Message-ID: <20240815000358.6887f1bf@windsurf>
In-Reply-To: <20240814063932.2630721-1-francois.perrad@gadz.org>
References: <20240814063932.2630721-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723673040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OSbtBoC1hzlmgNlMcGmAi9qUQezm2Py3phdeiyd5c3U=;
 b=l1d4yX/I/2APmvSSg/fiuZCLp/WGO+JsPfd1xl7UqjRzabR4gyyU8YRXIWi1421W7WQJie
 peMFrquAQm4Z5GJfgFuDdiJLpdFx5uZ3XrFl7jmaSwc2F+codD2x69BYdJ1+M9ZntvNlfv
 zx38BHwXG5qqV7wEUajnq/DhovN2P1BWfCCdLQru7rFpmhc31KiH2lhrteaejZtmlpTtvx
 FjWqnYIPBkBLhWIsy5uxEj5ZwOxHT+9vdDI1uTHMvF1YJ7tdvyJK0f9WqCS1ocrZfpvFIJ
 +xhkyUk3mmndL1wj73UDC+RUf+2l6dhSaVnZHTddy+YJQ8729nJH77ADWBqX4A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=l1d4yX/I
Subject: Re: [Buildroot] [PATCH] package/libgtk4: missing dependencies
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 14 Aug 2024 08:39:31 +0200
Francois Perrad <francois.perrad@gadz.org> wrote:

> libgtk4 needs png & pdf support (like libgtk3)
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Could you provide a bit more details about the issues encountered?

First build issue I had is:

Found CMake: /home/thomas/buildroot/buildroot/output/host/bin/cmake (3.30.0)
Run-time dependency libpng found: NO (tried pkgconfig and cmake)
Run-time dependency png found: NO (tried pkgconfig and cmake)
Looking for a fallback subproject for the dependency libpng

which gets solved by enabling LIBPNG (not PNG support in Cairo). That
being said, Cairo's header file complain with a warning when no PNG
support is enabled:

/home/thomas/buildroot/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/cairo/cairo.h:2597:5: warning: "CAIRO_HAS_PNG_FUNCTIO
NS" is not defined, evaluates to 0 [-Wundef]

This is a bug that should be reported to upstream Cairo.

Then second build issue was an include of <cairo-pdf.h>, which means
PDF support in Cairo is needed, but that should have triggered an issue
at configure time, not at build time. This bug should be reported to
gtk4 upstream.

We try as much as possible to "go the extra mile" and not just paper
over the problem, but provide bug reports/fixes upstream where needed.

Could you have a look into this?

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
