Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B9B4C3DA45
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 20:58:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65FBE40354;
	Fri, 12 Jul 2024 20:58:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dZnBYITNaGq7; Fri, 12 Jul 2024 20:58:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 202A441513
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 202A441513;
	Fri, 12 Jul 2024 20:58:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F30C81BF420
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:58:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DEA5141513
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:58:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 86i3KTaI2KiK for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 20:58:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7F09340354
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F09340354
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7F09340354
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 20:58:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5EC5740002;
 Fri, 12 Jul 2024 20:58:03 +0000 (UTC)
Date: Fri, 12 Jul 2024 22:58:02 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240712225802.2edefb09@windsurf>
In-Reply-To: <20240520152748.1952373-1-ju.o@free.fr>
References: <20240520152748.1952373-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720817883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y9S8NQrEwJO3nucRDXK4rHcgNv1bW84tamtJtxbQlsk=;
 b=dKwujxu7vvHgd5VDGgvDzq3EVJvpHH+DTywEk5rTk06UmB+9DfRWT8ei0wgZ/MZ4cODs4A
 g7lrX4T8VCal8GRr8L5VWVxpOXhwtDrqS5J1AtpzESyf/twpOz7gD2rEbFKI6cquJbQ05n
 VtUhmsINsN6ifptP7FgjLQSnu4m+KooMac9q/Pa/Lj1apXlS/SY0guvjeLE1+tu05XLjM7
 rLzGUwcAjXDz+203UwzOI6rYumXiMG4z1ugouk+ecv2tb0ZWV4Igqo8HsM9c0eF4s/UR9x
 n6z4Q3u5COGjQsJ760249SKo6fjewCNofh5pSVUQvftqWfo9mHo3ZIT95Xuqiw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dKwujxu7
Subject: Re: [Buildroot] [PATCH 1/1] package/tig: new package
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

On Mon, 20 May 2024 17:27:48 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Tig is an ncurses-based text-mode interface for git. It
> functions mainly as a Git repository browser, but can also
> assist in staging changes for commit at chunk level and act
> as a pager for output from various Git commands.
> 
> https://jonas.github.io/tig/
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested on branch master at commit 6a4bf73 with commands:

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
