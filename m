Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F31FC4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 19:49:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16C5E420E8;
	Wed,  7 Feb 2024 19:49:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9xw4IWB4KbE9; Wed,  7 Feb 2024 19:49:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C9A8420A3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C9A8420A3;
	Wed,  7 Feb 2024 19:49:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7F04F1BF350
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 19:49:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7997980BD5
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 19:49:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IA_GetKdJM7c for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 19:49:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6DE5780BD4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DE5780BD4
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6DE5780BD4
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 19:49:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 34ED920003;
 Wed,  7 Feb 2024 19:49:38 +0000 (UTC)
Date: Wed, 7 Feb 2024 20:49:37 +0100
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240207204937.49368b78@windsurf>
In-Reply-To: <20240207194428.591147-1-ju.o@free.fr>
References: <20240207194428.591147-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707335378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p0Als7KhHB9E708ej9ise7x5A47Fxz9mBbCsL6va1rE=;
 b=hXq3IuIGa8lzPLvGIpoXQrVleCBFFcBkQQQa5kMkUmWaUYfv/7v1fiVO5l/5skAuZXf84N
 wv1q90ANpwr0p6r8f/XS27cDOIHazERYTIiE2qmL6RkdSvxh2ThC0NhdogzhSqmRZZ4XqD
 ZQ3BQ2Ne2KSvAdlM20AuMnTbx+jyjlntUbGl/w+D+o+sOWOoyjHhPdaNPpH3AZj3KAp6UJ
 iO/a4uctB6hA1CC5wTPPecrLpX+K/iSW/usZ4RfNGHeJFaO1yQOf6b2IgK6vOMf80QvIax
 rPQiJr+gvgJ5vJyDAVIXTH8KfnltFUYOoR+0H3B2shZ4jwpnnT5vIq/BcqCmVw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hXq3IuIG
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: gnupg2: increase a
 timeout
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

On Wed,  7 Feb 2024 20:44:28 +0100
Julien Olivain <ju.o@free.fr> wrote:

> The symmetric encryption test can sometimes take longer than the default
> timeout. This commit increase the timeout to 10 seconds for that
> command.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  support/testing/tests/package/test_gnupg2.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
