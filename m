Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 054D8CD5BB8
	for <buildroot@archiver.kernel.org>; Thu,  5 Sep 2024 19:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1E1080BE8;
	Thu,  5 Sep 2024 19:29:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X8iO155sTFeS; Thu,  5 Sep 2024 19:29:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE7D781E0D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE7D781E0D;
	Thu,  5 Sep 2024 19:29:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 095621BF423
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 19:29:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB97F81E0D
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 19:29:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y4y2lYjVjO7z for <buildroot@lists.busybox.net>;
 Thu,  5 Sep 2024 19:29:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D304680BE8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D304680BE8
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D304680BE8
 for <buildroot@buildroot.org>; Thu,  5 Sep 2024 19:29:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BBC5820002;
 Thu,  5 Sep 2024 19:29:11 +0000 (UTC)
Date: Thu, 5 Sep 2024 21:29:10 +0200
To: "Guillaume GC. Chaye" <guillaume.chaye@zeetim.com>
Message-ID: <20240905212910.6a91fd2d@windsurf>
In-Reply-To: <20240905154511.1319010-1-guillaume.chaye@zeetim.com>
References: <20240905154511.1319010-1-guillaume.chaye@zeetim.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725564551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wLg4C1A6uHXzItK6AsuKu06FZG/TTs4NoFQ0D6E8THs=;
 b=LltB4YIJnRZaksEJZmo1CdKl4Tl7YsbxqIwImPnomDzB+/tqvTbi3xXvOClMxpztz53KYz
 UroWwXPv02u1UEDcpjtxcWr8Jwnkj471VK/cOmAQIrtyR3s4y71SfMbIfd3v/luM2kYqqb
 G8yoiJSl+1+PidM2gqG79QZ8QIORfAIfN1I2lgAOhFXe89x3UmviHIPfZMlw8C9CYLG5mx
 XBeYmtiFHXsbPOnrFeQ5rLUmwW9ovvxHbhuAvn5+Qo7Drornx7x1evo9P01/g8u2UH1p0z
 Du3+4TaCzU5r2Gb3FuPvw2tTjmy6MBtCoRS1/hyyjBfKNt85K51MfSo35gfLgQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LltB4YIJ
Subject: Re: [Buildroot] [PATCH 4/4] package/alsa-plugins: add support for
 pulseaudio
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
Cc: Charles Hardin <ckhardin@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  5 Sep 2024 17:45:11 +0200
"Guillaume GC. Chaye" <guillaume.chaye@zeetim.com> wrote:

> build package with pulseaudio support only if package is selected in menuconfig
> 
> Signed-off-by: Guillaume GC. Chaye <guillaume.chaye@zeetim.com>
> ---
>  package/alsa-plugins/alsa-plugins.mk | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
