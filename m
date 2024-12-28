Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D798E77188
	for <buildroot@archiver.kernel.org>; Sat, 28 Dec 2024 23:00:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1F8180CEC;
	Sat, 28 Dec 2024 23:00:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HrwXopn8p2H4; Sat, 28 Dec 2024 23:00:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83F5780CE7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83F5780CE7;
	Sat, 28 Dec 2024 23:00:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 50746CA
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 23:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3EA2260627
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 23:00:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VTDp6u9wQ803 for <buildroot@buildroot.org>;
 Sat, 28 Dec 2024 23:00:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B365C6061B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B365C6061B
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B365C6061B
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 23:00:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9D879E0005;
 Sat, 28 Dec 2024 23:00:16 +0000 (UTC)
Date: Sun, 29 Dec 2024 00:00:15 +0100
To: Heiko Thiery <heiko.thiery@gmail.com>
Cc: buildroot@buildroot.org, Fiona Klute <fiona.klute@gmx.de>, Jan
 =?UTF-8?B?S3VuZHLDoXQ=?= <jan.kundrat@cesnet.cz>
Message-ID: <20241229000015.1a9d4011@windsurf>
In-Reply-To: <20241219152105.298310-1-heiko.thiery@gmail.com>
References: <20241219152105.298310-1-heiko.thiery@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735426816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v51Xnr+8ZRuSX72FCqk/pZ0LB+tCXHkTkDTfdlp2H7A=;
 b=BS5RKuas3mPI2LYmQYey2lAZOgpcYKToUzWXvxkq56pazH/zE14W78jHgUB6q+Xuzr1o+v
 ybWsmdwDdF3zEa4M4o1WZVlJwe90dpvEcnAA732rd2lYTcujMLgwS6reqNCzzS9v22S3rF
 xUR2HYHf9pqwHoK7RETX9rF5EsMXot3pS98gbFZzf81puDcZc8D5Uxv4DXpeKCwaZ/tIoN
 WgV8ueH7lh8bPpJ4p/8Ei0gWIOU6T8HbOyZAa/Kwt6qiKQjYGSiGZ1bBcd0L98WpV4zDR1
 CtGdd/2/V/GfsaEi0c1FDMay17RC4uX3Y4VLNMfZ4119T4sACOokNlpBq9U0wA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BS5RKuas
Subject: Re: [Buildroot] [PATCH 1/6] package/libyang: bump to version 3.4.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Heiko,

On Thu, 19 Dec 2024 16:21:01 +0100
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> The LICENSE hash has to be updated due to copyright year change.
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

I wanted to merge this with the new tests, but without the libnetconf2
bump as I reported some issues with it. However, it seems like this
libyang update and the libnetconf2 update need to be done in lockstep,
as the build of libnetconf2 version in Buildroot today with the updated
libyang fails:

/home/thomas/projets/outputs/TestNetopeer2/build/libnetconf2-2.1.28/src/log.c:140:5: error: too many arguments to function 'ly_set_log_clb'
  140 |     ly_set_log_clb(nc_ly_log_clb, 1);
      |     ^~~~~~~~~~~~~~

and some more errors clearly hitting at an API change.

Not much you can do about it, aside for making it clear in the commit
messages.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
