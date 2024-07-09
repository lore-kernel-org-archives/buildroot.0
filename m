Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE82C3DA41
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 09:44:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04A1140AB9;
	Tue,  9 Jul 2024 09:44:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ldU_fgT1wskq; Tue,  9 Jul 2024 09:44:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA37740B42
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA37740B42;
	Tue,  9 Jul 2024 09:44:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2C96C1BF29A
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 09:44:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A66E60B34
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 09:44:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nA8RCn36rc6a for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 09:44:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EEC9260AFD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EEC9260AFD
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EEC9260AFD
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 09:44:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 073841C0007;
 Tue,  9 Jul 2024 09:44:34 +0000 (UTC)
Date: Tue, 9 Jul 2024 11:44:34 +0200
To: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Message-ID: <20240709114434.21467acb@windsurf>
In-Reply-To: <20240709071311.37460-1-buildroot@heine.tech>
References: <20240709071311.37460-1-buildroot@heine.tech>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720518275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CAytlve7J4TJG9hUJndUJqTv4EG66ZCmsUABjUrUQEo=;
 b=T71xQWv3iz5AOgb/oFCt1ObJhs8YA60DzhZOPh3H9gd9FDoZq//HKmAakwRMpNqoVaPUl2
 IUGgjB1ieeDExJxX/8cFdU40NaSAAxmdWVY1td+uxD1tamEHS4tO0Sh3MyPsNq0NRAd8HY
 kr3vkCJqWCMhCM+AeKiXWnc+nm1f5EuNI8WG3G7oxE9FFYnv+SGwDGhUU91QrDDpurQajw
 c5jdPIQp6sE0SgxByP9BZEHyfRBIMYHud/lbIOvwofly0j530UFHRjPkSQzndXWc6KejtJ
 ixIxKhEKTgjO8Lzsplmn05yAKmOml2uVBFxg/COS4TH+xtmMOjSGJRP0n8H9Fw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=T71xQWv3
Subject: Re: [Buildroot] [PATCH] package/fmt: bump to version 11.0.1
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
Cc: Semyon Kolganov <semenak94@mail.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  9 Jul 2024 09:13:09 +0200
Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
>  package/fmt/fmt.hash | 2 +-
>  package/fmt/fmt.mk   | 2 +-
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
