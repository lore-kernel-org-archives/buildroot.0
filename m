Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC725C3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 20:29:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 774F38115D;
	Mon, 22 Jul 2024 20:29:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uwGR_z0yseXz; Mon, 22 Jul 2024 20:29:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A88B81160
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A88B81160;
	Mon, 22 Jul 2024 20:29:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 839861BF296
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 20:29:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 719C0401AF
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 20:29:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q_kWDNvMBY0m for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 20:29:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C8133400AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8133400AC
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C8133400AC
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 20:29:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 24D56E0005;
 Mon, 22 Jul 2024 20:29:43 +0000 (UTC)
Date: Mon, 22 Jul 2024 22:29:42 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240722222942.749cc3f6@windsurf>
In-Reply-To: <20240627205332.3302187-1-yann.morin.1998@free.fr>
References: <20240627205332.3302187-1-yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721680183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RNxDpu8O39QaMoTeNlOupLt0sv9/ff1NE5AOTZxXvmg=;
 b=gFkNv6ViViKIyMoYrQW9kMNzgIHLtc3hZtk3oUAx5SCTlWvz6TV4hNVDhWzQAA29MMysKx
 8CH93ZI8He2PPuOOBZ/f8v4XOM7+WYkUXqPKLkI1T2NfGukFQN2lGwK5vACZJSx2RRyzyd
 9JmD5B99zFtGteNNd+aTIWcWU9ekP1po90ygyNh6Pt3+DX3Z6zH/9vE/SdQlaSQ8KOpp4w
 laBS0p2OQwTxHSJYjP9j6FR68S7O91IGoBvsKaMm2xb4RtbfQoDynCj2gbi4OShwztOKtG
 jN78LTxkgU/bRb31Neqk8RRPkQWrc7nQ8483cQoKuk4s0PZacZrojd1Py4Qg+g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gFkNv6Vi
Subject: Re: [Buildroot] [PATCH] package/am335x-pru-package: fix downlaod
 issue
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

On Thu, 27 Jun 2024 22:53:32 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> am335x-pru-package is downloaded with the github helper, so the tarball
> is generated "on-the-fly" by github.
> 
> It loos like the process to generate those tarballs has changed, again.
> The hash for the archive has recently" changed. The delta is in the way
> directories are stored in the tarball: it looks like the "basename" of
> the directory path has been split off from the "dirname", into a
> separate field:
> 
> @@ -270078,8 +270078,8 @@
>  0041efd0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 |................|
>  0041efe0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 |................|
>  0041eff0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 |................|
> -0041f000  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 |................|
> -0041f010  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 |................|
> +0041f000  50 52 55 5f 50 52 55 74  6f 50 52 55 5f 49 6e 74 |PRU_PRUtoPRU_Int|
> +0041f010  65 72 72 75 70 74 2f 00  00 00 00 00 00 00 00 00 |errupt/.........|
>  0041f020  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 |................|
>  0041f030  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 |................|
>  0041f040  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 |................|
> @@ -270104,8 +270104,8 @@
>  0041f170  34 61 64 35 37 63 63 31  39 35 66 32 38 62 66 35 |4ad57cc195f28bf5|
>  0041f180  65 35 38 35 63 33 64 34  34 36 61 62 61 36 65 65 |e585c3d446aba6ee|
>  0041f190  37 30 39 36 2f 70 72 75  5f 73 77 2f 65 78 61 6d |7096/pru_sw/exam|
> -0041f1a0  70 6c 65 5f 61 70 70 73  2f 50 52 55 5f 50 52 55 |ple_apps/PRU_PRU|
> -0041f1b0  74 6f 50 52 55 5f 49 6e  74 65 72 72 75 70 74 00 |toPRU_Interrupt.|
> +0041f1a0  70 6c 65 5f 61 70 70 73  00 00 00 00 00 00 00 00 |ple_apps........|
> +0041f1b0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 |................|
>  0041f1c0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 |................|
>  0041f1d0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 |................|
>  0041f1e0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 |................|
> 
> Switch to using a git download, which uses our reproducible way of
> generating archives.
> 
> Once extracted, the files have been verified to be identical to the ones
> in the archive on s.b.o.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Frank Hunleth <fhunleth@troodon-software.com>
> ---
>  package/am335x-pru-package/am335x-pru-package.hash | 2 +-
>  package/am335x-pru-package/am335x-pru-package.mk   | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)

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
