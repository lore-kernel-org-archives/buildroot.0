Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 581E7C3DA49
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 20:24:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18B1580B85;
	Tue, 23 Jul 2024 20:24:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ryKfAvsZGIEO; Tue, 23 Jul 2024 20:24:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A48681373
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A48681373;
	Tue, 23 Jul 2024 20:24:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8F0D41BF27E
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 20:23:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8972C40319
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 20:23:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9eRjiNJWkC31 for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 20:23:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 31DF0400F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31DF0400F6
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 31DF0400F6
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 20:23:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7DFFCE0002;
 Tue, 23 Jul 2024 20:23:56 +0000 (UTC)
Date: Tue, 23 Jul 2024 22:23:55 +0200
To: Brandon Maier via buildroot <buildroot@buildroot.org>
Message-ID: <20240723222355.3f5c2cde@windsurf>
In-Reply-To: <20240723-gamin-remove-kconfig-v1-1-7d85212f201e@collins.com>
References: <20240723-gamin-remove-kconfig-v1-1-7d85212f201e@collins.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721766236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WKUEf/4HjwGTHFTeEM5vnoe4FCjSiaO5Ggyr8pVC1x8=;
 b=EmElrE7Oc3+lw6buH4mHtZjjrhwxbHLrV/PKzZuSIEbx3y+3Y7Xrq1aoDyRPI0yHEwKF4w
 k+uhNjwHx7xn+YP/owjf+uelRvHSZsOxGTAJwNC6CXYOKK36VnwQ7ecfvjVedbwOGqfAOw
 jbauJX74obpvxhkh6UqPu9ISxlC1xcDQb5xZEvA7u49IMP9ZyHpUxYJmbk/c4Zg47uYm4z
 3Vmiqtt22TRkqFd/cyUBmDfgXeuekju2W0oohBtxConfO5qn0kw2zBhN9VcoHKk95Mkezs
 CmbDBoQHuiSHFB4MceFVoHWJxw2RPCxaiKmgCuLAQsVNIBLnqsIsBIIo9hvaGw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EmElrE7O
Subject: Re: [Buildroot] [PATCH] package/gamin: remove stale Config.in file
 breaking build
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 23 Jul 2024 18:43:26 +0000
Brandon Maier via buildroot <buildroot@buildroot.org> wrote:

> The previous commit ce00b93d5 (package/gamin: drop package) forgot to
> remove gamin from Kconfig, which triggers the following error.
> 
>   package/Config.in:1645: can't open file "package/gamin/Config.in"
>   make: *** [Makefile:1027: raspberrypi2_defconfig] Error 1
> 
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>
> ---
>  package/Config.in | 1 -
>  1 file changed, 1 deletion(-)

Thanks for fixing my mess! Applied to master.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
