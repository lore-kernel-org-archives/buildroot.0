Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75888C4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 15:32:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33F6340497;
	Sun, 11 Feb 2024 15:32:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qBRQor1H1VEi; Sun, 11 Feb 2024 15:32:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CFBF94025D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CFBF94025D;
	Sun, 11 Feb 2024 15:32:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 23BA51BF39A
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 15:32:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E29760655
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 15:32:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9nr5tWvA4EEy for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 15:32:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1B5D660869
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B5D660869
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1B5D660869
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 15:32:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5BEA01C0005;
 Sun, 11 Feb 2024 15:32:06 +0000 (UTC)
Date: Sun, 11 Feb 2024 16:32:05 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240211163205.79ceedd3@windsurf>
In-Reply-To: <20240209184814.1438551-1-james.hilliard1@gmail.com>
References: <20240209184814.1438551-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707665526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LjW1NQeC+edTJF/qj9Jd9Lr82Z8EdC5cDHe5M5PAxno=;
 b=U8w9xCKyc7AJiRrQMFh97xNW/nm+riABb4HAnFazxXZIO1NBEdu0RBKnp3rPx68XMeQ/HS
 BolJ/N0X0aSj+zJ/7AGGOagvIpw5XJlZuEkt4M8vnwRCX0trhpuY9oz0X8tDmZrpx4IgmQ
 +zzUTNNOwJF22Tb6DvFRVE8fpC99S7lkkbHdjDbnhy98wBdPygSEJJugfVFMkOYKnQmG98
 oWrDSVLxhFUXnZXgDZR2GNsfaUO1WvuVF/5/QSt6HJS4vRAcGoZ4xAQUjmoBeSgOfL/dJ6
 Qzcv70n0XhkfKvELtLfcaI5tI3OO28LgRf1Amtx1JwZJbUlIAf95rF4cn/ftHQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=U8w9xCKy
Subject: Re: [Buildroot] [PATCH 1/1] package/gst1-python: disable tests
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

On Fri,  9 Feb 2024 11:48:14 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> We don't need tests enabled which can also cause build issues.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/gstreamer1/gst1-python/gst1-python.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

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
