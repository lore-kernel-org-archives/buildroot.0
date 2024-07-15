Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06290C3DA4B
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 14:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C7C9240918;
	Mon, 15 Jul 2024 14:39:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MMVm49ANnHBY; Mon, 15 Jul 2024 14:39:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BBDB40919
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7BBDB40919;
	Mon, 15 Jul 2024 14:39:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B04EC1BF3AD
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA49840919
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:39:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7BO38n5zKpi4 for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 14:39:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0778840918
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0778840918
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0778840918
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 14:39:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A017A1BF205;
 Mon, 15 Jul 2024 14:39:35 +0000 (UTC)
Date: Mon, 15 Jul 2024 16:39:33 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240715163933.7317e08c@windsurf>
In-Reply-To: <20240715102848.7dc3d619@windsurf>
References: <20240630210938.1590435-1-yann.morin.1998@free.fr>
 <20240715102848.7dc3d619@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721054376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s/01EQJMHWfvzOMBXxmi+VTOjRGEMegPuBHv3p0JTzA=;
 b=WTRBhgioYPkDxN0qj9NYxunP81oJa4uFXnoK+9OJwq8S0XdcdNspxVpY5Cvdgs8nEgjff8
 qm29hzZgQq0stzghg3x4zX5Tlnj25urD71ObSeY1g6Pn7mlWDlupockDxAMI3figc8EGY2
 PHBbkeHfIxX4PQcn74hitQNH6oqPoRZeajRNwVsXIvUTkkvwQ7J93X1Ku2hSVOeNwxVR2Y
 JFLg7H8gzBCXD3AE6hqM7CaEhjYVq3EHSa9ZbVMCWvHdize9IFGh+OwDs7h/maJS6ca7px
 lGjwjqBHIMQcWd+U5QLG6ejTGelRU7oIaJMQM4JvLzwTZD7t4MYmYCZFiaGbig==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WTRBhgio
Subject: Re: [Buildroot] [PATCH] package/tar: fix linking with libiconv
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

Hello,

On Mon, 15 Jul 2024 10:28:48 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> I've changed this to:
> 
>     Fixes:
>     
>      https://gitlab.com/buildroot.org/buildroot/-/issues/4
>      http://autobuild.buildroot.net/results/c074c2e22a7f764400ecc7dd1a6cd6022fa87fb9/
> 
> I don't know if Peter will agree, but I find the full URL to the gitlab
> issue to be clearer. One can directly click, we can more easily grep
> through the git commit messages to find all commits that fix a Gitlab
> issue, etc.

Except these patches are touching Makefile.am, so we need
TAR_AUTORECONF = YES.

... except TAR_AUTORECONF = YES is fine for target tar, but not
host-tar, because it would add a dependency on
host-{autoconf,automake,libtool}, which themselves depend on host-tar.

This caused some failures in the autobuilders:

  http://autobuild.buildroot.net/results/efd/efdf7cf9ede810ed7f766cc4138b16054bc0c18a/build-end.log

So I added a quirk:

  https://gitlab.com/buildroot.org/buildroot/-/commit/69cbb563a124002fcb3e2725c3516b502587f9cc

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
