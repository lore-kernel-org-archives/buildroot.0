Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA11D0E3F8
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 20:01:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72F7F60BB4;
	Thu, 24 Oct 2024 20:01:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aJ_-u0xqOPH9; Thu, 24 Oct 2024 20:01:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1DAD60C2B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1DAD60C2B;
	Thu, 24 Oct 2024 20:01:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D4A3159BD
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:01:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2D7A81AAB
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:01:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZJ0nK2fR0yce for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 20:01:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AE19681A92
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE19681A92
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AE19681A92
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:01:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 57603FF805;
 Thu, 24 Oct 2024 20:01:50 +0000 (UTC)
Date: Thu, 24 Oct 2024 22:01:49 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <20241024220149.304f0946@windsurf>
In-Reply-To: <20241008174859.3625956-1-bernd@kuhls.net>
References: <20241008174859.3625956-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729800110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ou/BN+9W3N7tQTn0OSq1KZQV9OvCbdEbXVNNeHtDtUk=;
 b=FNWbSu+Cs2WwxumqE9f3Y6SSncXHiejV3nU6r3m6gHo0bpX4GdGrUvkstMenPgmu20Tz2S
 WCDSjCa5AyKbEmRk0stzxnRQfqeZW1SVqCXOwY9KynZYJvBEFruAjLQO0KxLtSk6I2Z569
 eG96R434AxxQsg3mf4guUmN7JF5E9N6ZIEiUzWlrpbarHQJk1XoXMSNp2IgfIrS14oQcKT
 lWix7DaHdJjVZRLZOd32dJnL/ES1MswZz5OhntkBvqy5CkOEWihPOYOA4vo8Ny760D7/j2
 5fWZziwMsSLl6gs8CQm9hjBHbr9Cj3V1kghUPQZZw6zSJl8xkPVV9rGxddf2Mw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FNWbSu+C
Subject: Re: [Buildroot] [PATCH 1/1] package/sqlite: bump version to 3.46.1
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

On Tue,  8 Oct 2024 19:48:59 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes: https://sqlite.org/releaselog/3_46_1.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/sqlite/sqlite.hash | 2 +-
>  package/sqlite/sqlite.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
