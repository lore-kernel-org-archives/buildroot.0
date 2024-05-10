Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82081C25B10
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 20:12:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4264142439;
	Fri, 10 May 2024 20:12:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7D7dpqwEpdIw; Fri, 10 May 2024 20:12:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A3FA42445
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A3FA42445;
	Fri, 10 May 2024 20:12:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EEFE01BF28A
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 20:12:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBFD440492
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 20:12:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YtCDjzUonoG8 for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 20:12:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C1AA7401D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1AA7401D5
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C1AA7401D5
 for <buildroot@buildroot.org>; Fri, 10 May 2024 20:12:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1FD4420003;
 Fri, 10 May 2024 20:12:02 +0000 (UTC)
Date: Fri, 10 May 2024 22:12:01 +0200
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20240510221201.158e1a1b@windsurf>
In-Reply-To: <20240325143917.2620448-1-aperez@igalia.com>
References: <20240325143917.2620448-1-aperez@igalia.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715371922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NBzGjG/5cEbIdUGQuWLffxaiKz4vevf7cl62qsDusyY=;
 b=DIvGXXO6c8N+6+xD/na/EC+oQ7U5tTsDkBj8xYlObLzfNNsiHOzAf+R56hK0W2Oz4avO8n
 vyzuBR4jm/4vDIbX8nHWQP7ZAr7PsMeERtbtx2To847z9yQuJg60wonoh123UYMdEtr4mK
 hrUlFwGRALgTA9vQa+J+85quEVgbMrvAjaK8pnNXtfzKse8YmlGHlh6zSiHyGJdxJGRDg7
 1Yw3hVVQN6v7d65vVGSkOIHmOZIZRHrpEIlOI728vYtZtfu36QW1prFw0PEPp78jMjPbN+
 yYY82aardBl/kFHTswRY4MjF7bgSvUinzO5FCr1SEnssdBEGfEAQGxs/lSWLOQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DIvGXXO6
Subject: Re: [Buildroot] [PATCH] package/libmanette: bump to version 0.2.7
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

On Mon, 25 Mar 2024 16:39:15 +0200
Adrian Perez de Castro <aperez@igalia.com> wrote:

> This is a bugfix release which mainly imroves device detection,
> specially inside the Flatpak sandbox. Additionally, this version
> includes the patch for building as a static library, and the patch
> file can be removed.
> 
> Release notes:
> 
>   https://gitlab.gnome.org/GNOME/libmanette/-/commit/27554bd118c08141134d4147cc34794057eb36e2
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  ...n-hardcode-building-a-shared-library.patch | 34 -------------------
>  package/libmanette/libmanette.hash            |  4 +--
>  package/libmanette/libmanette.mk              |  2 +-
>  3 files changed, 3 insertions(+), 37 deletions(-)
>  delete mode 100644 package/libmanette/0001-Meson-Un-hardcode-building-a-shared-library.patch

Applied to master after updating the .checkpackageignore file to
account for the removed patch, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
