Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A970EC02180
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 08:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CE048483A;
	Sat, 14 Sep 2024 08:24:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qpq4FUmD0SAc; Sat, 14 Sep 2024 08:24:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9780C84834
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9780C84834;
	Sat, 14 Sep 2024 08:24:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9741E1BF2AB
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 08:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A01D84062C
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 08:24:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vyKr2KuQ834J for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 08:24:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 45CE540623
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45CE540623
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 45CE540623
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 08:24:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4455B1BF203;
 Sat, 14 Sep 2024 08:23:58 +0000 (UTC)
Date: Sat, 14 Sep 2024 10:23:56 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20240914102356.571622b5@windsurf>
In-Reply-To: <20240914071930.1189715-1-peter@korsgaard.com>
References: <20240914071930.1189715-1-peter@korsgaard.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726302238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ku0ArtX3uuaGYGKwD+cBQjXbgz2O+odqR2c/sGhCyE4=;
 b=IM3CdoVAj5JiRq3zi5o2Nkw2MXWZxlxruPrpb+axzWnsDqf/zS3L/mAZEn/TVr4eiZhSTd
 6uiCWbIASSi35tEQMIuOlArGZL+2RYh4n4R4PwLVGH7EEYvWw+WD/RHJTzHjOln732upYW
 75s0A1Ld622G0SoOnmrzZmce6mL6WtL2lrIO4EaPuM9NRxWTs/OLC60GoApCQ12Ni0dYKd
 C8KDJfmEUwzwiRKWdmPXzTM00zFe3Z326qnkBa0eDFgsNm7gC9bQj0zV389cmzP+nIzDY8
 qYbMbFCKpGGjzXhQJ/AGB+2GEg2kbSzYrqIlLZyA8BXQkspglG53eJmqzcJIRA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IM3CdoVA
Subject: Re: [Buildroot] [PATCH 01/23] package/icu: fix typos in help text
 and patch description
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

On Sat, 14 Sep 2024 09:19:08 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/icu/0002-workaround-toolchain-bugs.patch | 2 +-
>  package/icu/Config.in                            | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Having fun with some spell-checker? Or AI, or something? :-)

Series applied, after doing a few fixes. I'll reply to the individual
patches.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
