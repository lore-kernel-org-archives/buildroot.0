Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDFC5C021A8
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 18:08:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A79381312;
	Sat, 14 Sep 2024 18:08:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dRcjJejstYuL; Sat, 14 Sep 2024 18:08:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B10108413B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B10108413B;
	Sat, 14 Sep 2024 18:08:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 61A421BF283
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 18:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5092C403BE
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 18:08:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tHz94ApPlkWL for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 18:08:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 16BC0400D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16BC0400D1
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 16BC0400D1
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 18:08:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9DE4340003;
 Sat, 14 Sep 2024 18:08:40 +0000 (UTC)
Date: Sat, 14 Sep 2024 20:08:39 +0200
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20240914200839.7aec4cf1@windsurf>
In-Reply-To: <20240914160550.3406790-1-aperez@igalia.com>
References: <20240914160550.3406790-1-aperez@igalia.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726337320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hdKlPIJ7yZB2a4lnS55M49PWRk9kAoH8XFV33PO5RG4=;
 b=lKeaCIul4nUgKMNRBp2bZbkUQkd2pOhzIePWrph0Z1eXsa76pKaGkR82BEMbNbJn7pDX2I
 vw0QXm+nX2TIrQiqhnA35DCdaiNxq7xM0NLtENvvTRAMiEj2oXjgmaMnbAZ8q/N3q3Lrc7
 3P9iiiB3pqyygp9bwi1V5xfAZNl3/VHrqHpXo/Ks4+OmBWqnZqcIEytCERsbTae8BZN53b
 CXahw6O3cKOMxKkcBzgVkMxFVQBCT/Z7jStAS1WnW/Ox7KjCepa5F73iOrIdlz2NwjI+yb
 6qqqdTTARE+Z2dWffXvB+ZkONvR+/v1evU/MyeBEvETMVb8e2pRQC9nTJr5Wtw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lKeaCIul
Subject: Re: [Buildroot] [PATCH] package/libmanette: bump to version 0.2.9
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

On Sat, 14 Sep 2024 19:05:49 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:

> Bugfix release which includes cleanups to the game controller database,
> and the ability to map more gamepad and joystick controls, and honorig
> user mappings.
> 
> Release notes:
> 
>   https://gitlab.gnome.org/GNOME/libmanette/-/blob/508df238f9c25a20c0d06da8c9bf83138759d40f/NEWS
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  package/libmanette/libmanette.hash | 4 ++--
>  package/libmanette/libmanette.mk   | 2 +-
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
