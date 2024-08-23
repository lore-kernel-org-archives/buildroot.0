Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43725C52D7C
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 07:55:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03E7C81322;
	Fri, 23 Aug 2024 07:55:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KSSJUB8fe90I; Fri, 23 Aug 2024 07:55:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0CF2813D7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0CF2813D7;
	Fri, 23 Aug 2024 07:55:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 23E441BF3C2
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 07:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F483813D7
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 07:55:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4jhFO0b0xfhS for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 07:55:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D246481322
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D246481322
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D246481322
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 07:55:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BDEE8240005;
 Fri, 23 Aug 2024 07:55:50 +0000 (UTC)
Date: Fri, 23 Aug 2024 09:55:50 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240823095550.012ac485@windsurf>
In-Reply-To: <20240823063318.961358-1-dario.binacchi@amarulasolutions.com>
References: <20240823063318.961358-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724399751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P62FcIx5KA9cCmtqSldYJ+6h8VB9QtUXXfeJWcP4VBA=;
 b=kFyeVyA9Z8+uQlz1uwxOltskOoOLmxVE2lDJIpBmbXkHMfcfL/HG/NyCHytym3QwXnFOF7
 pyxBDBQl+0Ibwx9KarDbCE+tE9zYa1YJTzjd81JML/mr2nEd5Zj5Gh8l+dk2L+dv9AVDvu
 z0k3QS5rLTE9rTi1WIOOfwojj0Wjl6lqlM7s0337CcMeAjpgOVPpcL2tKcKsvSTc4GQthS
 NfUF1ChXdgeEtWgvyOMijc35MBLrBk/2acLIWiuc9qoAFCJ+Lm/dMCT6NfFtNCxSuYt/kH
 16n/8AeDlXScACkOm9pgGEJkj2IW9CZEFtltNDYIk885OWtEymqhIqn928JmOg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kFyeVyA9
Subject: Re: [Buildroot] [PATCH 1/1] package/ipmitool: add hash for
 enterprise-numbers.txt
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
Cc: Floris Bos <bos@je-eigen-domein.nl>, buildroot@buildroot.org,
 Heiko Thiery <heiko.thiery@gmail.com>, linux-amarula@amarulasolutions.com,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 23 Aug 2024 08:33:18 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> Fixes:
> - http://autobuild.buildroot.org/results/5ae5ee948d99679cd50d1115a7d46f4368347b4f
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

I believe it is not possible to do that
because https://www.iana.org/assignments/enterprise-numbers.txt is not a
"versioned" URL, and that file is regularly updated, so this hash will
become broken at some point in the future, causing breakage.

So basically, we need one of the two following options:

(Best)      Find a URL for enterprise-numbers.txt that is versioned, so
            that we know what we fetch is stable

(Less Best) Add something like BR_REALLY_NO_CHECK_HASH_FOR that
            continues to disable the hash check even when
            BR2_DOWNLOAD_FORCE_CHECK_HASHES is enabled

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
