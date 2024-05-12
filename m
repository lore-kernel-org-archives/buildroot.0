Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A777DC10F1A
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 07:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75715403A5;
	Sun, 12 May 2024 07:06:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qAHPD2ecklAr; Sun, 12 May 2024 07:06:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80EED404A5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 80EED404A5;
	Sun, 12 May 2024 07:06:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 95BA31BF473
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 07:06:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E50142222
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 07:06:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YKI45rwgIz_E for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 07:06:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 15C414221D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15C414221D
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 15C414221D
 for <buildroot@buildroot.org>; Sun, 12 May 2024 07:06:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 29C3A40002;
 Sun, 12 May 2024 07:06:37 +0000 (UTC)
Date: Sun, 12 May 2024 09:06:36 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240512090636.7d94a55a@windsurf>
In-Reply-To: <20240511181352.1712489-1-dario.binacchi@amarulasolutions.com>
References: <20240511181352.1712489-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715497597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3ou1N0h5zs/8rro+ebo0P8tmVykNUE6j40coSoz0yoY=;
 b=cW7QuzqMNImkoDFeo8iTmZpLXUnCbZogG6CDcV9QTjpf1VB9R6JiuzQLZKTjhcSk9ooUMw
 4DGCOK9N1FKDfioZvLzZITtaho20e7v4ryq17HsFZIb9ITc+SE3enzRiTHOrxcpuUFIADQ
 bLvdRkHeXIvHsorMRohWcUlhRqQ34iyAWWtN7dG4f5KzT+85k8qVy0b5RAoEYCN3RVb+w0
 K3WdojxnF7aMqnfTF70NW0FH4MHKsYPgeH7/7OzjK2lDDPTmC68rngGLFRa9N3Pr4UDA/p
 tqo4kqN+/tvMi+o5QUV2F3LYJ3CXN8uh0cspO0OJgqx4HyghPl9qelqIKlrCYQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cW7QuzqM
Subject: Re: [Buildroot] [PATCH 1/1] package/sscep: fix linking error with
 musl-libc
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
Cc: michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 11 May 2024 20:13:52 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> The patch fixes the following linking failure:
> 
> /home/buildroot/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i586-buildroot-linux-musl/9.3.0/../../../../i586-buildroot-linux-musl/bin/ld: /home/buildroot/instance-0/output-1/host/i586-buildroot-linux-musl/sysroot/lib/libc.a(getopt.o): in function `getopt':
> getopt.c:(.text.getopt+0x0): multiple definition of `getopt'; src/getopt.o:getopt.c:(.text+0x0): first defined here
> /home/buildroot/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i586-buildroot-linux-musl/9.3.0/../../../../i586-buildroot-linux-musl/bin/ld: /home/buildroot/instance-0/output-1/host/i586-buildroot-linux-musl/sysroot/lib/libc.a(getopt.o):(.data.optind+0x0): multiple definition of `optind'; src/getopt.o:(.data+0x0): first defined here
> 
> Fixes:
> - http://autobuild.buildroot.net/results/d5b1b4e5e9d9c8eca5e75c345db4d1f3f0cd84ed
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  ...-getopt-linking-error-with-musl-libc.patch | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 package/sscep/0002-Fix-getopt-linking-error-with-musl-libc.patch

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
