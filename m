Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2224C25B10
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 20:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B2D6415AB;
	Fri, 10 May 2024 20:10:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 28blbPF5uRcY; Fri, 10 May 2024 20:09:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3659B4170B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3659B4170B;
	Fri, 10 May 2024 20:09:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1E0461BF28A
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 20:09:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 17BFF401D5
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 20:09:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HnhaQX-ANPor for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 20:09:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6D40940327
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D40940327
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6D40940327
 for <buildroot@buildroot.org>; Fri, 10 May 2024 20:09:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AA45F20002;
 Fri, 10 May 2024 20:09:53 +0000 (UTC)
Date: Fri, 10 May 2024 22:09:52 +0200
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20240510220952.613a8855@windsurf>
In-Reply-To: <20240325124106.2347400-1-aperez@igalia.com>
References: <20240325124106.2347400-1-aperez@igalia.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715371793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Dqy+pd073zwciJPPZnq/2W86zlsvkwGuhZmS4Xb74A=;
 b=aBu8gWTfv0wOnXEmbUVHGfxk5eeue6Z60dMtdtp9yU/clSs1lcvkx8+8HTShBY7J9RaI5R
 +/DPFnmrSRbR8q8uSRGbAVRpNBMEgIHQg/POZg1O9SenGbZT2kslVPS12DV2ySwENnO0ks
 KhOpOvoYPq4gSjCN++hezXe5QrwL8TBdUjz90lcHwNkZylt2k8uJeMLFGPefR0TOzm2M48
 RoOWK0dHFsezQaNnG2x8Gw8QVpX3j1DHUKwHpUpDWoWLSwXAqSAbMzz5loCPfDxC/lb39o
 hw8I0+bql9aF3l45d12C6om3lpyCiKQ8UiG+0VAxkky6eOC2LjqtLJFDKgaxPA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aBu8gWTf
Subject: Re: [Buildroot] [PATCH] package/cog: bump to version 0.18.3
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

On Mon, 25 Mar 2024 14:41:04 +0200
Adrian Perez de Castro <aperez@igalia.com> wrote:

> This is a small bugfix release, with fixes for device scaling handling
> (i.e. HiDPI displays), and with support to toggle WebKit runtime
> features. Release notes:
> 
>   https://wpewebkit.org/release/cog-0.18.3.html
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  package/cog/cog.hash | 8 ++++----
>  package/cog/cog.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)

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
