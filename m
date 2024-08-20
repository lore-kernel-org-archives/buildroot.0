Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A9DBC3DA4A
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 21:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16CA740B4A;
	Tue, 20 Aug 2024 21:25:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VX_cryHWcVFO; Tue, 20 Aug 2024 21:25:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E477D40B7F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E477D40B7F;
	Tue, 20 Aug 2024 21:25:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 80C9A1BF3B8
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 21:25:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D5B340679
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 21:25:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 09cNfZpOa7Bp for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 21:25:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 415C440393
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 415C440393
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 415C440393
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 21:25:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3C9081BF208;
 Tue, 20 Aug 2024 21:25:33 +0000 (UTC)
Date: Tue, 20 Aug 2024 23:25:32 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20240820232532.0531df7a@windsurf>
In-Reply-To: <20240820093559.3893162-1-peter@korsgaard.com>
References: <20240820093559.3893162-1-peter@korsgaard.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724189133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TCdhcYW232tIitVla5Oaa0ECt6SKfFZdjy/31nI0uYk=;
 b=NTcTf8sc7ML6t2aXR66KYewyEf6+Zcg2PKaos5I75zZ+etmdh0BZWwCwo1+2JZ207kTLhO
 OmSrXmui22fBWC80OzZeGCBTCmi2Dkg3WsIEblEoFwMKmwne0jnpRIMBvM4/iT3fxLW0zg
 uuqJbq0QYbmf6Be+75GT5KwMfth01oA9XDB48eh1uJJRAhsMD7PogZMSTbXRjw4c2sDh/2
 bmpLC+Nf9YZQXOek5mnnC7dJXipWhVIm0qbGGNFehv/HF1o3/Z60lfB6VauaEb3E86kvUj
 hpg8iSO10HTkKNJ2amfs74jWvfR+bML9qal9UfBaODVsX/PN+RXBvjiNqvXKmw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NTcTf8sc
Subject: Re: [Buildroot] [PATCH-NEXT 1/2] package/eudev: correct !static
 comment
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Bernd Kuhls <bernd@kuhls.net>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 20 Aug 2024 11:35:57 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> eudev itself includes dlfcn.h, so even without kmod it cannot be built
> statically:
> 
> grep -rs dlfcn build/eudev-3.2.14/src
> eudev-3.2.14/src/shared/util.c:#include <dlfcn.h>
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/eudev/Config.in | 2 +-
>  system/Config.in        | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Both applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
