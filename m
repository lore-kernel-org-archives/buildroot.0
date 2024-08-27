Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B2A0C54731
	for <buildroot@archiver.kernel.org>; Tue, 27 Aug 2024 16:41:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B66F1400CD;
	Tue, 27 Aug 2024 16:41:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SYa6N_I7NaQB; Tue, 27 Aug 2024 16:41:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2330404E4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2330404E4;
	Tue, 27 Aug 2024 16:41:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 802201BF4E5
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 16:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D2FC4059B
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 16:41:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U0fqaxULrQDY for <buildroot@lists.busybox.net>;
 Tue, 27 Aug 2024 16:41:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C492C400CD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C492C400CD
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C492C400CD
 for <buildroot@buildroot.org>; Tue, 27 Aug 2024 16:41:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F3D22FF80A;
 Tue, 27 Aug 2024 16:41:17 +0000 (UTC)
Date: Tue, 27 Aug 2024 18:41:17 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240827184117.380b6530@windsurf>
In-Reply-To: <20240825134229.1323250-1-bernd@kuhls.net>
References: <20240825134229.1323250-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724776878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MImr1jz3k07biGKxhmNrgIk9Ue7FJ74CoMXkcbM1x+g=;
 b=D8x3khRawt3qAAwmzCIwN0sYWMskNrNUfnoq4TYSfF7Bxidal1DHrUFEUgHsFdqhfoVTac
 X9aoo+lkTQv8TnDcZbQCGXqSBClsL/VyAX8YrbRbwGDchwBMG7UrBgWpQUZQW+UgfigvKo
 KfrnZdwSWIl5gRw99vW6QOzPYiRJYINAnM7Ye7gZa2ZuJhinBeniIHAhYWL+TJF/wmvlcT
 2BVbPsXzm461pCD6100Mc2ou4sf+I7+lL3L2kFGUVob/RTRSHRnZLRhZuiwwcWC4RQKhie
 x0agC4lpqtasy/WN6gcIysGTMfIRmQ3hfAFe28eE0wAvnsx5gKAGSJBalYTy5Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=D8x3khRa
Subject: Re: [Buildroot] [PATCH/next 1/1] package/xmrig: bump version to
 6.22.0
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

On Sun, 25 Aug 2024 15:42:29 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Changelog: https://github.com/xmrig/xmrig/blob/master/CHANGELOG.md
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/xmrig/xmrig.hash | 2 +-
>  package/xmrig/xmrig.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
