Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95612C3DA41
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 20:23:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 645D460B70;
	Mon,  8 Jul 2024 20:23:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zdrX6UKIBO_q; Mon,  8 Jul 2024 20:23:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E2A960B8B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E2A960B8B;
	Mon,  8 Jul 2024 20:23:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1F39A1BF390
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:22:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C0EE4033A
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:22:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dsntJ0m6h-19 for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 20:22:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9C2E540133
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C2E540133
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9C2E540133
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 20:22:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DD5F21BF203;
 Mon,  8 Jul 2024 20:22:21 +0000 (UTC)
Date: Mon, 8 Jul 2024 22:21:19 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240708222119.63f0dbd2@windsurf>
In-Reply-To: <20240706151004.3818101-1-dario.binacchi@amarulasolutions.com>
References: <20240706151004.3818101-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720470142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=guCHvS9U1Cylk+Y5wKVuE1r7UMHuCCrE2Gw9DqxTAlI=;
 b=HWFElsQZrXUQapKV5tJftp49Iyoa9/eo7ckgm95c7IaXZjmQWzzJXj4cYHm9msdVKaf2Y+
 tkqGRXknx4cbxLO2HLTqpG5o4G39rChI16tyqi31cHx0+8yEeB0yznAUo0OTSuGZZh5Sq/
 sFK4XCciq8Qwv4MkEcn79AQjtAQB0nGcPsGDOUIvGp12+3k/ryI5XxNuctqzqsWEriREnX
 GTTUeCTt8rTwSdG+L6l0Jr2Bk8RX8kkqfGMcvOZnqPKza8VvH9a+f3wOBsiluLsMvBqbkX
 pl1FseznPXX5lTPDy4mssss3ZyXtsofCXG1kP9/7daTk4PNawzFOwa12gcMZXw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HWFElsQZ
Subject: Re: [Buildroot] [PATCH 1/1] package/freeradius-server: update the
 patches to be applied with fuzz 0
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
Cc: David GOUARIN <dgouarin@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  6 Jul 2024 17:10:04 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
> fuzz factor to 0") reduced the fuzz factor.
> 
> Due to this change, freeradius-server fails to build with output:
> 
>     Applying 0001-jlibtool-cross-with-host-CC.patch using patch:
>     patching file scripts/libtool.mk
>     Hunk #1 FAILED at 43.
>     1 out of 1 hunk FAILED -- saving rejects to file scripts/libtool.mk.rej
> 
>     Applying 0009-src-modules-rlm_python-fix-build-with-Ofast.patch using patch:
>     patching file src/modules/rlm_python3/configure.ac
>     Hunk #1 succeeded at 44 (offset -15 lines).
>     Hunk #2 FAILED at 73.
>     1 out of 2 hunks FAILED -- saving rejects to file src/modules/rlm_python3/configure.ac.rej
> 
> This commit refreshes the package patches on the current package version.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  .../0001-jlibtool-cross-with-host-CC.patch             |  5 +++--
>  ...9-src-modules-rlm_python-fix-build-with-Ofast.patch | 10 ++++++----
>  2 files changed, 9 insertions(+), 6 deletions(-)

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
