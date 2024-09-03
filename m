Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2767CD37AB
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 19:33:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FF766059D;
	Tue,  3 Sep 2024 19:33:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P6o2j4V5kbRi; Tue,  3 Sep 2024 19:33:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9125F605B0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9125F605B0;
	Tue,  3 Sep 2024 19:33:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4618F1BF344
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:33:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3295F4027F
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:33:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y_zijX7sArRx for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 19:33:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BADF940267
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BADF940267
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BADF940267
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 19:33:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4120A20002;
 Tue,  3 Sep 2024 19:33:21 +0000 (UTC)
Date: Tue, 3 Sep 2024 21:33:20 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240903213320.35490d86@windsurf>
In-Reply-To: <20240902210055.239859-1-dario.binacchi@amarulasolutions.com>
References: <20240902210055.239859-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725392002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ql17liIGaFpz2v8U+lRDY2uJhFa2kYAZZ62nhebovDQ=;
 b=CAlnNiKXOjAeO+kFXPjzuP1tjOlzCIXNskIWH7SIi/v8OCF+h8K9pYR2ftfjCXrLPgos0c
 HVR3dQy4jvOyywUygKalVr69u+HAlehtrEugBrRdQTtywVL7CZstBeK7ZMrfmOoiuSVph8
 DZ+tCoD1NE6PuJ17S8+ZBL6ApyMIKOe9lcHzpJAbNCcqjQZEJipm5KlDJbFX0O/1EkXwsh
 5s6R04xs77zs/5jgL6ljbw6lN5+qD0IWc94IEJdSbpBW7dDsVpG1UHGtyjMSUfRpyfti9X
 xtX2JCbCTFR8F7l1OC3O+hCajnd8HCSFE6a56HwCKESCWbg8zZaUOsuVemWa/A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CAlnNiKX
Subject: Re: [Buildroot] [PATCH 1/1] package/ipmitool: only accept local PEN
 registry
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
Cc: Floris Bos <bos@je-eigen-domein.nl>, Heiko Thiery <heiko.thiery@gmail.com>,
 linux-amarula@amarulasolutions.com, "Yann
 E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  2 Sep 2024 23:00:55 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> The https://www.iana.org/assignments/enterprise-numbers.txt is not a
> versioned URL, and that file is regularly updated, so it is not
> acceptable to change its hash each time.
> 
> Following Yann's suggestions [1], only local files are now accepted,
> removing the need to download the PEN registry and consequently verify
> the hash's correctness.
> 
> Fixes:
> - http://autobuild.buildroot.org/results/5ae5ee948d99679cd50d1115a7d46f4368347b4f
> 
> [1]: https://patchwork.ozlabs.org/project/buildroot/patch/20240824103634.1955431-1-dario.binacchi@amarulasolutions.com/
> Co-Developed-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  package/ipmitool/Config.in   | 12 ++++++------
>  package/ipmitool/ipmitool.mk | 13 +++++--------
>  2 files changed, 11 insertions(+), 14 deletions(-)

I don't like this solution, having to download separately a file is
annoying.

Why not using:

  https://github.com/larseggert/iana-assignments

which precisely provides a versioned set of IANA documents, including
that enterprise-numbers file?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
