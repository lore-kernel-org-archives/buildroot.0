Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C20BAC52D6F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 21:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FBC26061D;
	Wed,  7 Aug 2024 21:08:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id klnkkgusHNCe; Wed,  7 Aug 2024 21:08:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABA7D608D1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABA7D608D1;
	Wed,  7 Aug 2024 21:08:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AF36E1BF2CA
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 21:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9CFCD608D1
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 21:08:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dnneq9deMBME for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 21:08:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 926B16061D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 926B16061D
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 926B16061D
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 21:08:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E0A1D20002;
 Wed,  7 Aug 2024 21:08:41 +0000 (UTC)
Date: Wed, 7 Aug 2024 23:08:41 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240807230841.7d6b1318@windsurf>
In-Reply-To: <20240807195736.167142-1-ju.o@free.fr>
References: <20240807195736.167142-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723064922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=57OkX5z9BCby7aJb7zuaDQebcWakHpXVJ4t+odT3LTU=;
 b=c0oJsqY+vgDg1LVbCPeu8tug32VNH5JYK6sHqinW8wAKbfOEGg1rYcv/nhIoP276aegfK3
 mSiP0ZfaV90TFLp+Vc+NrR8BKgs0vJEID2YvfkC0ZqLyKa+HJHDgq55qa5dwjxcM9IYb/7
 xkB9VUbmv67N44XHCOS4ZuhlbxkICSiGrzPGUzrH/owW8wlZgcG+IETgUyWXPf9pOan73A
 lxEKjGMSJvqPQGOWXHvbQR3qvvZJVXYayNt08eYVjj7NbcYMWT3/28c84h22hNHw3xPmDc
 s98+6tJRh89gf8b2fSBDf/WgwFZRnUGte3kQgx790MvY0IsDMV0n9Nk3c9q53w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=c0oJsqY+
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add vorbis-tools
 runtime test
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

On Wed,  7 Aug 2024 21:57:36 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/7530002562
> ---
>  DEVELOPERS                                    |  1 +
>  .../tests/package/test_vorbis_tools.py        | 20 +++++++++++++++++++
>  2 files changed, 21 insertions(+)
>  create mode 100644 support/testing/tests/package/test_vorbis_tools.py

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
