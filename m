Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CEF8C3DA7F
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 20:43:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 064FA81281;
	Mon,  5 Aug 2024 20:43:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F8NV9WkcLw4y; Mon,  5 Aug 2024 20:43:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C041811E0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C041811E0;
	Mon,  5 Aug 2024 20:43:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 300801BF335
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 20:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A14F40197
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 20:43:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kw61ztLu8PZf for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 20:43:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C335F40126
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C335F40126
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C335F40126
 for <buildroot@buildroot.org>; Mon,  5 Aug 2024 20:43:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6EECFC0002;
 Mon,  5 Aug 2024 20:42:58 +0000 (UTC)
Date: Mon, 5 Aug 2024 22:42:57 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240805224257.5f9cc541@windsurf>
In-Reply-To: <20240805193650.658452-1-ju.o@free.fr>
References: <20240805193650.658452-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722890578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yysrCQrUx/1kKJ7SpuRR50g62jc6iK+stuUxzHI33nc=;
 b=fJbd03UT9NXKxtohDh+fkftc/Wt1Ez30fXtcLAl17htI7ONyWwTppLdOeP3tXhB7Tl2Dkh
 9RSiQaJZp2ya3JV1iwAEjUwf+IoGRbYYXT17+bbVz9Fm68zbaZTVZJopZqCfsPJv0Zpbea
 TLzkTE/qSWepA6fDglD7Ft9A7eJqlV2jYIvhG4+364Md93A7RZ7WoV+tLrFMIjSIWTFkEI
 C2r8bOozrHQ05QNApjIbOCrBliCWkGsWPfIxyH+hYqL7v+xz9yM5KTDhkxFueVgm1il37U
 YB5HeTvEqHEx3lg8Tqos3iSuAECngabjy2P4/Jj86br03KQbo2rb8/in1+BJ1w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fJbd03UT
Subject: Re: [Buildroot] [PATCH 1/1] package/libopenmpt: security bump to
 version 0.7.9
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

On Mon,  5 Aug 2024 21:36:50 +0200
Julien Olivain <ju.o@free.fr> wrote:

> For release note, see:
> https://lib.openmpt.org/libopenmpt/2024/07/21/security-updates-0.7.9-0.6.18-0.5.32-0.4.44/
> 
> Note: this release is flagged as a "security" update from the release
> note. There is no CVE allocated.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/libopenmpt/libopenmpt.hash | 2 +-
>  package/libopenmpt/libopenmpt.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
