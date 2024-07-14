Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80556C3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 15:08:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51EC66059E;
	Sun, 14 Jul 2024 15:08:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YXLLdQ1ZVIXG; Sun, 14 Jul 2024 15:08:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63690607D0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63690607D0;
	Sun, 14 Jul 2024 15:08:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 854BD1BF44A
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 15:08:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7210140096
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 15:08:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id op-prFDGD1I9 for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 15:08:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4603A4012A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4603A4012A
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4603A4012A
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 15:08:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 86E55C0002;
 Sun, 14 Jul 2024 15:08:40 +0000 (UTC)
Date: Sun, 14 Jul 2024 17:08:39 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240714170839.0970d3c4@windsurf>
In-Reply-To: <20240713200626.565477-1-fontaine.fabrice@gmail.com>
References: <20240713200626.565477-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720969720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OXtpzMIkVoqChIanmMkfr0KuWziOdVC0ys7e3kAC1w4=;
 b=UyqRbWYfP+CZpqarTkPyxbVeqL0vmpzxBe/rseGqDljU/L/Z4RGeAPyj26lnCSkEsyrgpV
 AMe4gQ6m8nZU9u9/k8hjaKGrANELUvYnPU8ZoHoITcEZVEgp6uLUk4Q1g9ocLbfjyr2pka
 TWA7lF8OaIH0wqlOU1D6/ixPjI9NVsb3zFJtlp1Kec4F43/7IvkRVptyyGD1ernKWuHft3
 1IutxNYOMQrVaLJ+rIhM/R24HwCmyq0GHJAPWTKmGC6x7j9Zd7Gfr/COjULPQkEtLXwg73
 //xLfwHl3PGuAXbvVN7cdnRX8BHwTlPgP1T/htcgZKX2StvLKpeUBjrWGzUswQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UyqRbWYf
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/libavif: add LIBAVIF_CPE_ID_VENDOR
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
Cc: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 13 Jul 2024 22:06:26 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> cpe:2.3:a:aomedia:libavif is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/detail/5F25E3BB-870F-4513-96DB-34FF4FCF156C
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
>  - Fix title typo

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
