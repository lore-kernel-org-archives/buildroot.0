Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E3E8CD129A
	for <buildroot@archiver.kernel.org>; Tue,  9 Apr 2024 19:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED6E060618;
	Tue,  9 Apr 2024 19:47:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K-xebrCJQcCs; Tue,  9 Apr 2024 19:47:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE5446067E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE5446067E;
	Tue,  9 Apr 2024 19:47:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1BDCD1BF59E
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 19:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 05BFB81A23
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 19:47:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EIcbER4hwhaU for <buildroot@lists.busybox.net>;
 Tue,  9 Apr 2024 19:47:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 66A5E8199D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66A5E8199D
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 66A5E8199D
 for <buildroot@buildroot.org>; Tue,  9 Apr 2024 19:46:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 130471C0003;
 Tue,  9 Apr 2024 19:46:56 +0000 (UTC)
Date: Tue, 9 Apr 2024 21:46:56 +0200
To: Petr Vorel <petr.vorel@gmail.com>
Message-ID: <20240409214656.721dc7c3@windsurf>
In-Reply-To: <20240408213807.GA44146@pevik>
References: <20240403121807.2087547-1-robimarko@gmail.com>
 <20240408223621.39b37892@windsurf> <20240408213807.GA44146@pevik>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712692017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=19gWOrx6UB0unoCzmAxrtO3Jafwei77Z0jin/2hu+6s=;
 b=QnN8+oEvV2T+sqmgzD+xKWMzPzKS1GPqjhj8tJILvQwk/Ci02Opa6w4MjINFE3Eo8s8kaq
 wTKcAD1Sa43WiFMWDkoQ+tFmAlIYoMa3eX+igZbVbXreWzjGdvQKm20UDFkXl1gJfbdSEY
 Z8HsQfuKUfoJt9OGIpA6zkC0owa4h/awRQ83JmffcpzaBgFYsFrzvph3PNL84Mz7xinSJK
 v9ZmuThQ8Bmwjq3ttndaC/j+7Nup4a/hd0ieIfGZziIDLhVf9S19eQ+pMkd4GGDAW9yAkM
 iWdApFEYyC7LCxE/WvAm9FH45Zn9qNQAZ2mYwc+8AVe8+Ip2e6IIOEToQ8d1Cg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QnN8+oEv
Subject: Re: [Buildroot] [PATCH 1/1] kconfig/lxdialog: fix check() with GCC14
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
Cc: Robert Marko <robimarko@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 8 Apr 2024 23:38:07 +0200
Petr Vorel <petr.vorel@gmail.com> wrote:

> FYI I gave up kconfig update after big rewrites in the Linux kernel
> made by Masahiro Yamada (the new kbuild and kconfig maintainer), because the
> code changes were quite big but kconfig in Buildroot is IMHO not missing any
> significant usability function. But I can be wrong, Thomas let me know if you
> miss something significant which would justify the update. Obviously we would
> get some fixes, but also major rewrite, which would likely require changes in
> other parts of Buildroot.

I have no idea what are the new interesting features that have been
added in the upstream scripts/kconfig/ (if any). However, keeping our
support/kconfig/ reasonably up-to-date is not only about new features,
it's also about staying compatible with reasonably recent
libraries/tools (more recent ncurses, Gtk, Qt, more recent GCC, like
this issue illustrates).

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
