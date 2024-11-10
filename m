Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A245DD12D49
	for <buildroot@archiver.kernel.org>; Sun, 10 Nov 2024 16:53:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6ACB560639;
	Sun, 10 Nov 2024 16:53:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id olLfPRZmnacH; Sun, 10 Nov 2024 16:53:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81FFA60673
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81FFA60673;
	Sun, 10 Nov 2024 16:53:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7BC966C
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 16:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D98980FDD
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 16:53:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 98QHRvIoBnjf for <buildroot@buildroot.org>;
 Sun, 10 Nov 2024 16:53:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5AF1780F90
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AF1780F90
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5AF1780F90
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 16:53:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E633140002;
 Sun, 10 Nov 2024 16:53:34 +0000 (UTC)
Date: Sun, 10 Nov 2024 17:53:34 +0100
To: Cherniaev Andrei <dungeonlords789@naver.com>
Cc: buildroot@buildroot.org, Marcus Hoffmann <bubu@bubu1.eu>
Message-ID: <20241110175334.54847106@windsurf>
In-Reply-To: <20241109170900.1766890-1-dungeonlords789@naver.com>
References: <20241109170900.1766890-1-dungeonlords789@naver.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1731257615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d/SJYj62PgUOGh8byAXa2+/BiuI3Cu54O64BIbcZ4Wg=;
 b=JwzZRr1gLWXCYOU8FMU8M4wlX+ljL8FzoeBm2fUVwmMJvngN2b0MumE3lQU8N8e3MJpee+
 hb7tbjR0OLvReyWx9vr2kH4XDI7q02ZzHBx1y8usUx/fi5JjJSSzniCAXJWtLjKSaVpqAU
 n0pTTB+Nk9oUQeCFLV1i49jOa0eIiLzr12zwSoXnJwwNhTyvo3vP5R8iI4ShO4lRf+jkJC
 sgfMg4wtfe688jGQFCLeSa+F2Oa+aA5wal3gokCdcJcKzRCYO0Mm8YEvUYOo/sXCugJkQo
 G1hw2AmRJ5lU7ip2DjLKFawqSQAw1C0zCAGuLgdSCnWlGb36/1W1qsB/t5MRBg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JwzZRr1g
Subject: Re: [Buildroot] [PATCH 1/1] package/picotool: fix help
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

On Sun, 10 Nov 2024 02:09:00 +0900
Cherniaev Andrei <dungeonlords789@naver.com> wrote:

> before this you will every-time see "*** picotool needs a toolchain w/ C++, threads, gcc >= 4.9 ***" even if all features are enabled
> 
> Signed-off-by: Cherniaev Andrei <dungeonlords789@naver.com>
> ---
>  package/picotool/Config.in | 2 +-
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
