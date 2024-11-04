Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E483BD1CA00
	for <buildroot@archiver.kernel.org>; Mon,  4 Nov 2024 21:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 955DF606BB;
	Mon,  4 Nov 2024 21:54:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b-LbuhI0woh1; Mon,  4 Nov 2024 21:54:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FB7860762
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FB7860762;
	Mon,  4 Nov 2024 21:54:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 34E45723
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 21:54:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2370580F86
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 21:54:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RXyar-YmVW3L for <buildroot@buildroot.org>;
 Mon,  4 Nov 2024 21:54:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 10DC880F80
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10DC880F80
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 10DC880F80
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 21:54:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CA838E0003;
 Mon,  4 Nov 2024 21:54:12 +0000 (UTC)
Date: Mon, 4 Nov 2024 22:54:12 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Message-ID: <20241104225412.46456f53@windsurf>
In-Reply-To: <20241031200051.1097467-1-bernd@kuhls.net>
References: <20241031200051.1097467-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730757253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BlUoy1+u0dos5nKNaWgyG+xAA5XwugIbQLxQpyQV9Z0=;
 b=RySszkdtukfVE/3GcibFDJgYDV1q34Dz4jKpKODPirQNaZS0yVozzSBr8yohqhQgATWkH1
 Rw2Pgq/eW+prHpF/oM2UwnwtkPdSsiwNcsczDGuI6ST/Q3oXCsnAdIDRXNaHwkZEDzPifG
 sMSFD8jeE20CvVfb2GzoGu+dtnP985TeULsuTVTDf7t23CcU/z3RfRpFonHruvyctKpXam
 Cu1ShAgB4wkaaZr+J0rx55bsY01Cn3atQphmUdSen41m5UXrR5PweJUjmHEvHMe3SiLFOM
 x0f2gUSx2ZDtE/tpd/2AeLumluTS1VO1hNGM0/+U6+BQ/cI1w6MKsGLDX9vfww==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RySszkdt
Subject: Re: [Buildroot] [PATCH 1/1] package/python-cryptography: requires
 RC4 support in openssl
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 31 Oct 2024 21:00:51 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/988/98819c1e202ddd77a390c9063ad31ee0601fefbe/
> 
> The build error, afaics, first appeared in
> http://autobuild.buildroot.net/results/a08/a087c27dbc92c643f607ca9c66977156778ff1a0//
> after the bump to version 43.0.1 with buildroot commit
> 37c397c8b691495b21623b7d0a4d1e5ee7f0f61e which added chacha support when
> building with libopenssl.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/python-cryptography/Config.in | 1 +
>  1 file changed, 1 insertion(+)

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
