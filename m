Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B576C3DA49
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 17:58:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 68FCE41136;
	Thu, 11 Jul 2024 17:58:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mgYy58xJ_3YF; Thu, 11 Jul 2024 17:58:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F05141138
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F05141138;
	Thu, 11 Jul 2024 17:58:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A402C1BF47D
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 17:58:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22BBD4001F
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 17:58:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fraZpi3EvzXx for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 17:58:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D9E24415C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9E24415C3
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D9E24415C3
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 17:58:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0E067240002;
 Thu, 11 Jul 2024 17:58:27 +0000 (UTC)
Date: Thu, 11 Jul 2024 19:58:26 +0200
To: Francis Laniel <flaniel@linux.microsoft.com>
Message-ID: <20240711195826.733c22f5@windsurf>
In-Reply-To: <20240617151020.31120-3-flaniel@linux.microsoft.com>
References: <20240617151020.31120-1-flaniel@linux.microsoft.com>
 <20240617151020.31120-3-flaniel@linux.microsoft.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720720708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OIGhOME3E5ZFKyHFaRShThKNwqxElO5loAxPM0jNuNY=;
 b=AkS22M/MPFaoeCEwwlE+teCOV5EzUrqryLlJ1ZVQ1B75cHfkIIu6R2i9pKos9Vj2chY6ZQ
 glLB/Z4r1WIqHO9LQNwqFx9i8T9ExfAmsIDh2E7qDrrViKQAgaJjdv4gQBZDb6wXC43Mof
 /pcXjo/Oyj6OzrBbVDLXcmIf4z9+R+lXApt0TlmdZuESba1Om9g/58wjYUhK4HnkTtEuKU
 c+Cg1MmfKx7HyAgLXPl8pRg8icihZNLpspftlqPAVPsxbzUdTsEHnQKHd7pUCCBJxvyXLH
 j1TWBgRr9bjbTqjTJeCjMiJ7kj1dwQ2uoLgQJNDFJYzQE+H7mIQn/v2bclxIYw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AkS22M/M
Subject: Re: [Buildroot] [RFC PATCH v1 2/4] package/tbb: bump to version
 2021.12.0.
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

On Mon, 17 Jun 2024 16:10:18 +0100
Francis Laniel <flaniel@linux.microsoft.com> wrote:

> Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
> ---
>  package/tbb/tbb.hash | 2 +-
>  package/tbb/tbb.mk   | 2 +-
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
