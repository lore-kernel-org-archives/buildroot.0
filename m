Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 635E7C25B10
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 16:20:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2944C40560;
	Thu,  9 May 2024 16:20:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id apIrTdnqKkli; Thu,  9 May 2024 16:20:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E92104168B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E92104168B;
	Thu,  9 May 2024 16:20:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DFE9B1BF337
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD94041D7C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:20:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TAGTEqu6wfqQ for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 16:20:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 704954039D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 704954039D
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 704954039D
 for <buildroot@buildroot.org>; Thu,  9 May 2024 16:20:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B5B1F60004;
 Thu,  9 May 2024 16:20:47 +0000 (UTC)
Date: Thu, 9 May 2024 18:20:46 +0200
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <20240509182046.26098621@windsurf>
In-Reply-To: <20240422192607.1830232-1-thomas@devoogdt.com>
References: <20240422192607.1830232-1-thomas@devoogdt.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715271647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eVNY0iE3JLyulpr8qzeZYeIv3SAfMlmtr7BaMkeXRTg=;
 b=aVoZDMnrJvbiploxE/LMttdGa8SCFwAsZOPDa+I3OZocy7mq6D/OVlPpAFqdBay42gwlWH
 q+YFQvZQSCqfIa8J/452a4aJZPFvnV24jkU0AvdgmhnLUfrMDrxrvt0yBOavcG9xvWsmyl
 M5k/ikOxNBLrw8sgU7dUsBflvq8HfoX6sQrAPC7hdikxosem8U9A79EnBhm7zyISVvvY5R
 tsCQcCMwgYIVug6uvyUYTdSsNzmUOeoMj4fh/fJIcuywsttnAD2peYBOc3R1taZCGCF0Yz
 S9YwBJqCTBoQgc2s0pq40iols3BsBKs11YjSaVPP8YLR+H0hezDbqfluYzlfcA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aVoZDMnr
Subject: Re: [Buildroot] [PATCH v1] package/lighttpd: bump to 1.4.76
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

On Mon, 22 Apr 2024 21:26:07 +0200
Thomas Devoogdt <thomas@devoogdt.com> wrote:

> News:
>  - https://www.lighttpd.net/2024/2/19/1.4.74
>  - https://www.lighttpd.net/2024/3/13/1.4.75
>  - https://www.lighttpd.net/2024/4/12/1.4.76
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
> ---
>  package/lighttpd/lighttpd.hash | 8 ++++----
>  package/lighttpd/lighttpd.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)

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
