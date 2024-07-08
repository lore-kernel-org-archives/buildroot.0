Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E3D7C3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 20:22:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D71B560AE6;
	Mon,  8 Jul 2024 20:22:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MTZj3WiOYZ2G; Mon,  8 Jul 2024 20:22:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A31AA60ADA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A31AA60ADA;
	Mon,  8 Jul 2024 20:22:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 583051BF390
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 45EAC810DA
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:22:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n-EM3kgEicMy for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 20:22:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 10D6A8109E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10D6A8109E
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 10D6A8109E
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 20:22:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E36031BF209;
 Mon,  8 Jul 2024 20:22:15 +0000 (UTC)
Date: Mon, 8 Jul 2024 22:21:37 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240708222137.35ced1ba@windsurf>
In-Reply-To: <20240707091437.3872260-1-dario.binacchi@amarulasolutions.com>
References: <20240707091437.3872260-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720470136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x+teMh01h+piIPWbMAKEpmZqQ7QN7N6UmAaEJplGnWI=;
 b=GjzGf4VfYKsZzvlnbjmuDsxIUsCxZmEiTPZTsQaOADYIny/yInMsqfr+dsM8d8nFeVB+HC
 iQCPDsVjIzXsu/ZhHgohoXaXCWaybRL8WGN/pWasUeWtYC7G7faTt7UEurqM+EBx+pRp08
 kHkBxpV/9jTawW2mwLZXXwsrEmfoHruBpsO8CIHX6SgOtTfxqZWLW8xjAQNW5zEA5NIdJL
 uuNfpkC/JEr5EZP86q5NLN65c/cv2zctgjormSEpWClpMmfFvJLQbjDP1RXi9ScvO/dA8/
 SEmrh3rVQ1MqMgDVaQamzsE49lnuxRa39UpqdlXKkY5P3D4W0xaG59KH2PiknQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GjzGf4Vf
Subject: Re: [Buildroot] [PATCH 1/1] package/libgdiplus: update the patches
 to be applied with fuzz 0
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  7 Jul 2024 11:14:37 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
> fuzz factor to 0") reduced the fuzz factor.
> 
> Due to this change, libgdiplus fails to build with output:
> 
>     Applying 0001-Build-unit-tests-only-when-enable-unit-tests-is-pass.patch using patch:
>     patching file Makefile.am
>     patching file configure.ac
>     Hunk #1 FAILED at 39.
>     1 out of 1 hunk FAILED -- saving rejects to file configure.ac.rej
> 
> This commit refreshes the package patch on the current package version.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  ...ild-unit-tests-only-when-enable-unit-tests-is-pass.patch | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

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
