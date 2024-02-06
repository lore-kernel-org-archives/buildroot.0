Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 285CCC4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 10:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D718F40857;
	Tue,  6 Feb 2024 10:38:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D718F40857
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VSpyH5vtQeJt; Tue,  6 Feb 2024 10:38:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BD39403A8;
	Tue,  6 Feb 2024 10:38:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BD39403A8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3E2291BF311
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 38D848204A
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:35:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s8bXpCKbtAQw for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 10:35:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3BD8181FD4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BD8181FD4
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3BD8181FD4
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 10:35:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7623FE0005;
 Tue,  6 Feb 2024 10:35:22 +0000 (UTC)
Date: Tue, 6 Feb 2024 11:35:21 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240206113521.3871c5af@windsurf>
In-Reply-To: <20240109074803.4049179-1-james.hilliard1@gmail.com>
References: <20240109074803.4049179-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707215722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mEFOrMlYRmcZ0WJQhVbdnTcJbE6WWHz2Eujn0X2xIa8=;
 b=Njz2CMmU5exA65Jw3HQscUmvS00f7C5fOOM2qClE85R0yah3S1I1bazavjj2MNRxc1U9cz
 DnAAmOTjI04oxGeeL+IsO7nWL6Y5149BFxxwb3OlezITv//7oZxfCDjPHPhJBdBqZ/wCO6
 9zyLMEuaPGz5+1tgUsy0+lZVopU7BRWGU7iOoN3FWseBnyUQ7NbEJB//ch6VF0NzPpO7rf
 nqYwSMURnlFf1zwg4Vp1jcDoLYBIcl4Cva5S1lPSghR2k+RAjdX9Q0E18lqaf+DKG3eHQ0
 HRwLbo2mDMQnVqM03OL2RPKtkcfoIKQFjwFp7t6I3EqoFdyVKHIxbwtI1d15+g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Njz2CMmU
Subject: Re: [Buildroot] [PATCH 1/1] package/python-frozenlist: bump to
 version 1.4.1
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  9 Jan 2024 00:48:03 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-frozenlist/python-frozenlist.hash | 4 ++--
>  package/python-frozenlist/python-frozenlist.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
