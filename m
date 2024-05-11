Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DCE1C04FFE
	for <buildroot@archiver.kernel.org>; Sat, 11 May 2024 06:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED5FD616B4;
	Sat, 11 May 2024 06:57:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3zbMsM8hfjnP; Sat, 11 May 2024 06:57:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5EF7616AC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5EF7616AC;
	Sat, 11 May 2024 06:57:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 536EC1BF398
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 06:57:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 40BA840132
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 06:57:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hK-7eDHCScxE for <buildroot@lists.busybox.net>;
 Sat, 11 May 2024 06:57:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1798F400F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1798F400F9
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1798F400F9
 for <buildroot@buildroot.org>; Sat, 11 May 2024 06:57:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0B7DC1BF204;
 Sat, 11 May 2024 06:57:02 +0000 (UTC)
Date: Sat, 11 May 2024 08:57:02 +0200
To: Brandon Maier via buildroot <buildroot@buildroot.org>
Message-ID: <20240511085702.28b11e6b@windsurf>
In-Reply-To: <20240510220704.1924373-1-brandon.maier@collins.com>
References: <20240510220704.1924373-1-brandon.maier@collins.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715410623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AqCcla77WrPHJmUXOqSu72Xo2ss4F6KxVJGO1wD0Zgc=;
 b=edQCjx0l8L/PFvMuMoLSrtDm4Q9fpu3fQBXQSkyAD8P/zyVJxBIepB7ZD+8gbMDVEf4o64
 N/d3L5u/sy1F1OM6tAyDB3iMKi0VvDiGINm7kGuVGYGNiPuyghezjavDX+PBeZWmjrARKQ
 W4Rli+9nEDk6WlItt1GWAqzHOHL1+Ykb2NV1CqPmfcd/1eJi9Y1RqZajuX5kVrwcjJq4Av
 WEXjPFOJxRGEO6PuukBdjDQ6rNakvLT7L8qaLNlcrl1QSX/65jn9IEVtZFYXjmhLuZaGzq
 ICC7HrvGWvASWry0EKoSW2r6uD8RQoEilRV7tzmMOEvn9nCSWBaCoGCt0OsZgQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=edQCjx0l
Subject: Re: [Buildroot] [PATCH] package/gcc: add patch to fix gcc 11 build
 warning
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 10 May 2024 22:07:04 +0000
Brandon Maier via buildroot <buildroot@buildroot.org> wrote:

> When building GCC 11 with GCC 14 the following error occurs
> 
> > ../../../libiberty/simple-object-mach-o.c:1231:17: error: passing argument 1 of 'set_32' from incompatible pointer type [-Wincompatible-pointer-types]  
> 
> This was fixed upstream in GCC12[1]. It is applied to the GCC 11 release
> branch[2], but has not been officially released yet.
> 
> [1] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=38757aa88735ab2e511bc428e2407a5a5e9fa0be
> [2] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=02cd761eb1198df50453b2e39653f48053609ffc
> 
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>
> ---
>  ...libiberty-Darwin-Fix-a-build-warning.patch | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 package/gcc/11.4.0/0009-libiberty-Darwin-Fix-a-build-warning.patch

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
