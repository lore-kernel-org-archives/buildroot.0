Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E665C3DA5D
	for <buildroot@archiver.kernel.org>; Thu, 25 Jul 2024 16:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C822408D2;
	Thu, 25 Jul 2024 16:26:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZJRkzHtpxkqs; Thu, 25 Jul 2024 16:26:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8EEB408D8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8EEB408D8;
	Thu, 25 Jul 2024 16:26:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 24E141BF330
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 16:26:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E5AE4042B
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 16:26:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W--DO624VSiC for <buildroot@lists.busybox.net>;
 Thu, 25 Jul 2024 16:26:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5937E4004A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5937E4004A
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5937E4004A
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 16:26:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CD20F60002;
 Thu, 25 Jul 2024 16:26:02 +0000 (UTC)
Date: Thu, 25 Jul 2024 18:26:02 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240725182602.2cb9493f@windsurf>
In-Reply-To: <20240725135859.522321-1-fontaine.fabrice@gmail.com>
References: <20240725135859.522321-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721924764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7muTeF81LFPbXGt1lJP4fc0Y5XbBSAkjKpcqOTKW17k=;
 b=J5VBWkiNw+AVYS3CcUJ27lKDqSn6xznncVDGE2e8YuwgHmVDMmsK8IhMaaWXWKhOUR2rEG
 6kLPnZt+5bYjnv+MgpKGbpPToo4PJdWm8rTGsRr6XPKZ24Wk/UHep0NoR504vyDZZAwCAK
 oZr8M+W7rjyDyM2hofg9YMF4bLhfGx7AUrPgkB2K02X+XNy1DXaOU9IrTmuvM681f1oVhR
 VldZawrLBvKeBjFZMk4JfvNViRl0TAtlkeYPDhx1UMkpJiKoZLEMxU8fRlTbFIGG9C+G6F
 QcefzCaLg+6qXSIGDhwP9pP6Nj9yJEIxPT4l1Q4EZBvEi/N3e8Db2vDWi/WL/Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=J5VBWkiN
Subject: Re: [Buildroot] [PATCH 1/1] package/libdex: fix musl build with
 liburing
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
Cc: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 25 Jul 2024 15:58:59 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> +LIBDEX_CFLAGS += $(TARGET_CFLAGS) -D_GNU_SOURCE

You will probably hate me, but I think this is not the right solution.
Indeed, if we adopt this solution then *ALL* packages that use liburing
will have to manually define _GNU_SOURCE.

I am not entirely clear on
whether https://github.com/axboe/liburing/commit/c427ed678f39fd144d784f2e970bd8c52f425e14
is a good idea. It's not clear for me whether the public header of a
library like this is supposed to set the feature macros it requires for
itself, or whether that should be done by the users of the library. The
latter seems really odd to me, to be honest.

At the very least, what I would suggest here is that -D_GNU_SOURCE gets
added to the .pc file of liburing, and this contributed to upstream
liburing. Or maybe -D_XOPEN_SOURCE=500 -D_GNU_SOURCE.

Really, I have no idea what is the correct way of dealing with those
feature macros.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
