Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44BFCC2BD09
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 20:25:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 088974012B;
	Tue,  9 Jul 2024 20:25:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bTa9SZZlqb6k; Tue,  9 Jul 2024 20:25:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E60AD40B98
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E60AD40B98;
	Tue,  9 Jul 2024 20:25:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 93B881BF5DD
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 20:25:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E33260F4A
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 20:25:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tYf5xtNdScgF for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 20:25:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3AEC160F48
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AEC160F48
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3AEC160F48
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 20:25:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 578D5FF805;
 Tue,  9 Jul 2024 20:25:15 +0000 (UTC)
Date: Tue, 9 Jul 2024 22:25:14 +0200
To: Brandon Maier via buildroot <buildroot@buildroot.org>
Message-ID: <20240709222514.0c8af184@windsurf>
In-Reply-To: <20240702-atftp-sysvinit-v1-0-f26694337129@collins.com>
References: <20240702-atftp-sysvinit-v1-0-f26694337129@collins.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720556715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hSgRYfbolL/yLMeELOZzM2hQTs5Tt//3n6D8D6BzzPA=;
 b=Z1tWJ1jrPfJQQ1tXKcQdyQYXgT7wZ0Lm0e0XarsPFORJmyl7Bv22ybA5AUSn8APXW+BNNJ
 e6aqnbpn/qGCpup1Vm/1G244mLEbKlpZWuM4995O19PQCc+FoW9EsOPihLrNaxFP3WLYdE
 Ulk4PT2ll134Pshv0YjRnqZYq0Lj5osMEfpWqG2sUe+M3FXjZV2N2kjItsXL05pIq3Bjqj
 Ye1a0CaoNhYDg4rJUgdX+26+5HtCjjxkQPUvPjW7zWSWM0VlWR3fx5ykZUH7u8Uo2OlT4x
 P/f9AdWP0eI/fh4GR6PTdM7zvZ/x/Tg0r7nAwxA6G000Cdah1V/PB6tKPO+MmQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Z1tWJ1jr
Subject: Re: [Buildroot] [PATCH 0/3] package/atftp: add init script and
 support/testing
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
Cc: Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 02 Jul 2024 15:18:43 +0000
Brandon Maier via buildroot <buildroot@buildroot.org> wrote:

> Brandon Maier (3):
>       package/atftp: add sysvinit script
>       support/testing: add atftp test
>       DEVELOPERS: add myself for package/atftp

Thanks, series applied. On PATCH 1/3, I did some small tweaks to make
your init script look more like our canonical example in the Buildroot
manual. Also on PATCH 2/3, I added an entry in the DEVELOPERS to have
you as the maintainer of the atftp test.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
