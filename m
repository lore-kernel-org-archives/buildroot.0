Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C1DCC2BB85
	for <buildroot@archiver.kernel.org>; Sat, 22 Jun 2024 17:06:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E61B440364;
	Sat, 22 Jun 2024 17:06:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aJmNtTCQbfZc; Sat, 22 Jun 2024 17:06:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF58E40497
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF58E40497;
	Sat, 22 Jun 2024 17:06:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CEC911BF5DB
 for <buildroot@lists.busybox.net>; Sat, 22 Jun 2024 17:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2E3140711
 for <buildroot@lists.busybox.net>; Sat, 22 Jun 2024 17:06:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6TKTt-whA9SU for <buildroot@lists.busybox.net>;
 Sat, 22 Jun 2024 17:06:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D9726407BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9726407BE
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D9726407BE
 for <buildroot@buildroot.org>; Sat, 22 Jun 2024 17:06:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E821040005;
 Sat, 22 Jun 2024 17:06:00 +0000 (UTC)
Date: Sat, 22 Jun 2024 19:06:00 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240622190600.63d3b9c8@windsurf>
In-Reply-To: <20240612192246.52305-1-bernd@kuhls.net>
References: <20240612192246.52305-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1719075961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v2VisJhC6v2nkTaiOfZt7m3rU9GxIcAumKZIThoFkxQ=;
 b=ML27S7neJvGvP2dJBWxpbnOd7Ef125kd29nJT32WYFWLKPNnNHLKYnM/LAGuXAs8SpAxe+
 Zv6cLk6jpL7DGllQh/F6lM2J5MfguRbfyXyhsdfyerAM1TtJ3oABAbhOUhb4K7EvQqmzbp
 kfXgcystM54RK3pn0OouzdcRSD9tjBM9fBuZEyvXT5NTqbV3avp5wAmoRuNod/EWm40M0U
 ZNr3ClDWzszzwffoGio+Z9LO5nrwx5Z1Nw4Sb7weoxHwnkdf6KEitQNeJLsU9al+8LHjjx
 J9UTiyLcmJQ9Iob0VwIeqUMdwlYM/FMFomZgPwT/lM35Lpdfgc5pdHvFtJZ/Ug==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ML27S7ne
Subject: Re: [Buildroot] [PATCH 1/1] package/tor: bump version to 0.4.8.12
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

On Wed, 12 Jun 2024 21:22:46 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> https://gitlab.torproject.org/tpo/core/tor/-/raw/release-0.4.8/ReleaseNotes
> https://forum.torproject.org/t/stable-release-0-4-8-12/13060
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/tor/tor.hash | 4 ++--
>  package/tor/tor.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
