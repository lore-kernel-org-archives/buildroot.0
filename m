Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C04C27C53
	for <buildroot@archiver.kernel.org>; Sat, 22 Jun 2024 17:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D920405B6;
	Sat, 22 Jun 2024 17:42:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WKsymSC9-9bq; Sat, 22 Jun 2024 17:42:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C406405BE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C406405BE;
	Sat, 22 Jun 2024 17:42:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5CD941BF5DB
 for <buildroot@lists.busybox.net>; Sat, 22 Jun 2024 17:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 45BBA81EDE
 for <buildroot@lists.busybox.net>; Sat, 22 Jun 2024 17:42:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gma9rGU6ucVi for <buildroot@lists.busybox.net>;
 Sat, 22 Jun 2024 17:42:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1CD7A81ECF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CD7A81ECF
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1CD7A81ECF
 for <buildroot@buildroot.org>; Sat, 22 Jun 2024 17:42:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CEF0E1BF205;
 Sat, 22 Jun 2024 17:42:22 +0000 (UTC)
Date: Sat, 22 Jun 2024 19:42:22 +0200
To: Titouan Christophe <titouanchristophe@gmail.com>
Message-ID: <20240622194222.234c5296@windsurf>
In-Reply-To: <20240617075538.938635-1-titouanchristophe@gmail.com>
References: <20240617075538.938635-1-titouanchristophe@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1719078143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CIHiqqY8HfGQ1YMbB5OUK7mah67dCQiy8Koaj9MkZt4=;
 b=echPWcXycFHAm/qwm+vu0cN63jO8zwkU7y6tP5lPzG47NVhU1yU1tlqemEeIs6Rpc5hy9U
 j3uGtySSo+vrFTC9zRBAUTRInFUWNpoc4Iy0ZcxmB7RXkTINbjSNWptR6I0fwuFdjdsZ7J
 dgUNAYzceY7/pPihE6DJvyZszdHzc672ix5idkTYeA+15ihOZ3h2p9n/EfAQg8SNiYmPE3
 wYHD3oJb5XykX2AfnS8f4AaVfv1nEEh7jh5I7XXqEht5A9H+9Ta84CohjyQwRjEdHmLvi7
 Q+r6B55DgOWS8UuNOSTdMZwowEmFDzsmkBhX9SH2Ch+W2gq7+nvSX6sc9TGUcw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=echPWcXy
Subject: Re: [Buildroot] [PATCH 1/1] package/redis: bump to v7.2.5
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

On Mon, 17 Jun 2024 09:55:38 +0200
Titouan Christophe <titouanchristophe@gmail.com> wrote:

> From the release notes:
> ================================================================================
> Redis 7.2.5    Released Thu 16 May 2024 12:00:00 IST
> ================================================================================
> 
> Upgrade urgency MODERATE: Program an upgrade of the server, but it's not urgent.
> 
> Bug fixes
> =========
> 
> * A single shard cluster leaves failed replicas in CLUSTER SLOTS instead of removing them (#12824)
> * Crash in LSET command when replacing small items and exceeding 4GB (#12955)
> * Blocking commands timeout is reset due to re-processing command (#13004)
> * Conversion of numbers in Lua args to redis args can fail. Bug introduced in 7.2.0 (#13115)
> 
> Bug fixes in CLI tools
> ======================
> 
> * redis-cli: --count (for --scan, --bigkeys, etc) was ignored unless --pattern was also used (#13092)
> * redis-check-aof: incorrectly considering data in manifest format as MP-AOF (#12958)
> 
> Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
> ---
>  package/redis/redis.hash | 2 +-
>  package/redis/redis.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
