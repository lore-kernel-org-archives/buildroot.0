Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ECFFC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 15:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18DD040146;
	Fri, 12 Jul 2024 15:07:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8u_PCO_u6VeA; Fri, 12 Jul 2024 15:07:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E31794043A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E31794043A;
	Fri, 12 Jul 2024 15:07:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 75CBE1BF5D7
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 15:06:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 70CF26133F
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 15:06:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JsJtN2qk1O6I for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 15:06:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 539106132A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 539106132A
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 539106132A
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 15:06:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 87DDA2000B;
 Fri, 12 Jul 2024 15:06:42 +0000 (UTC)
Date: Fri, 12 Jul 2024 17:06:41 +0200
To: Dmitry Chestnykh <dm.chestnykh@gmail.com>
Message-ID: <20240712170641.12f1d760@windsurf>
In-Reply-To: <20240519045003.306052-1-dm.chestnykh@gmail.com>
References: <20240519045003.306052-1-dm.chestnykh@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720796802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=St8AVqRvDCoOYI25frD0lXLzQ2sAZ+6e5rzKQM3G/Ig=;
 b=MvQUYLiuyswggV+oWp0Gi50MBG36eAdg6r0jI9mZh2w6suMlUJDhXCvzDYj6nkXOdBcufB
 TQLUiQYmJ+ZbC/Ee46IPTD4ilx7Giq2RZxN1uc+r2np1gDL7lJregQCdiLpIH2SM38oR3S
 Q84LXO2jPQ6fXSFTl2kuA7MKa9brWQkXMCh+BnlsNVPGd7pAVJWs2D6Khm6gFelMoWZkIh
 G2I1QoQIdxIVRA67wbuhO9sJB/PjuJE8pwzHsJdbhNl33/X2bFkfGgBmcjxr6GLRvKk1ig
 7iLJlvkl4+qJdVDhpG1js6eB6gu+2F7YUua2z05qunQCHrDzI810JhzKwNTTQg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MvQUYLiu
Subject: Re: [Buildroot] [PATCH] package/uclibc-ng-test: Bump to the latest
 git version.
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

On Sun, 19 May 2024 07:50:03 +0300
Dmitry Chestnykh <dm.chestnykh@gmail.com> wrote:

> Upstream contains new tests and refactoring
> of the existing functionality.
> 
> Signed-off-by: Dmitry Chestnykh <dm.chestnykh@gmail.com>
> ---
>  DEVELOPERS                                 | 1 +
>  package/uclibc-ng-test/uclibc-ng-test.hash | 2 +-
>  package/uclibc-ng-test/uclibc-ng-test.mk   | 2 +-
>  3 files changed, 3 insertions(+), 2 deletions(-)

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
