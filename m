Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E70C3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 21:00:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6309F608F5;
	Mon,  8 Jul 2024 21:00:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kFbT8E0z8067; Mon,  8 Jul 2024 21:00:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C67060A5F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C67060A5F;
	Mon,  8 Jul 2024 21:00:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 600A21BF390
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 21:00:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 59F43405B5
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 21:00:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F2LTxdePXSoJ for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 21:00:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E034740544
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E034740544
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E034740544
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 21:00:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2A5BD40003;
 Mon,  8 Jul 2024 21:00:38 +0000 (UTC)
Date: Mon, 8 Jul 2024 23:00:38 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240708230038.454df6b6@windsurf>
In-Reply-To: <20240706092724.36092-1-bernd@kuhls.net>
References: <20240706092724.36092-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720472439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CoG8izHYd0NMcIRldC8Cx8jHMSBOSnguAvPHr7zNc2I=;
 b=f9+xpjowhUxYntWKdSgh3nM9YJUs8P4yDM2ZgCqqf3DOgYyBqrBu60b2A18IfGkQupSK6A
 IHloLWTv8k46QQ38mMNjJskU0eIU4uW9ZM0RcCvTblo7OSCNxxjYKC7UFHEWR9eDj4cIE5
 J3WQM6kx/mHAkLm2YwRzzWDrapZHBW7H0nH7KXWEmdVc7vDFmWYcFMq6C/wyfjXxX896CM
 71sP2tIsYFZu4ampml0DZNk+Pw6z+WUdSBoqgQZS6kiEk7DvIYZT8l1+7+3yBezWSBWTin
 j2tM90Pd+JqChKzXnK4Zd08x5+X7hUAwkfn2ENNah517aLCDniY4/mlYWPA4Rw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=f9+xpjow
Subject: Re: [Buildroot] [PATCH 1/1] package/znc: security bump version to
 1.9.1
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
Cc: =?UTF-8?B?Q8OpZHJpYyBDaMOpcGllZA==?= <cedric.chepied@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  6 Jul 2024 11:27:24 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes CVE-2024-39844.
> 
> Changelog: https://wiki.znc.in/ChangeLog/1.9.1
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/znc/znc.hash | 2 +-
>  package/znc/znc.mk   | 2 +-
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
