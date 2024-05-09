Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF158C25B10
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 16:02:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FC4283E94;
	Thu,  9 May 2024 16:02:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4vshw6dq5z7T; Thu,  9 May 2024 16:02:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 259A983E90
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 259A983E90;
	Thu,  9 May 2024 16:02:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 270841BF39C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13333818C0
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:02:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rDHZc9uCdwFo for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 16:01:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EDFAF8204D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDFAF8204D
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EDFAF8204D
 for <buildroot@busybox.net>; Thu,  9 May 2024 16:01:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 02021240003;
 Thu,  9 May 2024 16:01:56 +0000 (UTC)
Date: Thu, 9 May 2024 18:01:56 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Message-ID: <20240509180156.6ae00492@windsurf>
In-Reply-To: <20240422171503.40740-1-francois.perrad@gadz.org>
References: <20240422171503.40740-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715270517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j26gTTmtlpp+HOa3FG83h49hhE5w3LmRqVZ3oLGy1YU=;
 b=VigtWhvxQqF7KUhhvJaG4PkyQ2KICVXatO6XPubNY2GJE1KoRTUekhvl67CsoiGRY7NnF+
 UGYVP8KXnNEBtQEG2JXG7xl9eBFeVQ5Zwtqt1hqWqNoovQ0503LG+YlmvIgNZl5igsYs3J
 jlWkEWYQavLEJ85e0RrCcTHQ4KpeLYrGyyXDPW9OrIbHsZaOb+IW7p9ARflaykMdNq9P3/
 4oyZ6vP4lrZ5+yqp+RWdxf5qlUiPaqm+UkDi5XsHtJOuCKei4TxGzsrkGMKM6yvxOynO7E
 pRIBTWSi7LfpHfAd5mZjRvHRH2Bgm3BlyuDvI6jQl9kBr6YwAW5mrqBKICfaRA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VigtWhvx
Subject: Re: [Buildroot] [PATCH] package/open62541: bump to version 1.3.10
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 22 Apr 2024 19:15:03 +0200
Francois Perrad <francois.perrad@gadz.org> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/open62541/open62541.hash | 2 +-
>  package/open62541/open62541.mk   | 2 +-
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
