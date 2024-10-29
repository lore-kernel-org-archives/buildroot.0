Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0044CD3A67C
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 18:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CB1480EEB;
	Tue, 29 Oct 2024 18:35:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id psG2mn2tmsFL; Tue, 29 Oct 2024 18:35:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DE8F811B7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DE8F811B7;
	Tue, 29 Oct 2024 18:35:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 11FB2494E
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 18:35:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D71660A50
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 18:35:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 36x2ANpkXNQI for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 18:35:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E8F7360A43
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8F7360A43
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E8F7360A43
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 18:35:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F0764C0002;
 Tue, 29 Oct 2024 18:35:40 +0000 (UTC)
Date: Tue, 29 Oct 2024 19:35:40 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <20241029193540.22a4a675@windsurf>
In-Reply-To: <20241028224132.2463402-1-bernd@kuhls.net>
References: <20241028224132.2463402-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730226941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AZZbMnNf1tY7Z3uOr9xadjRr0wn0Py5GNiD2ovIwQi4=;
 b=NcJ2V5ZfiSEFU3guQaRgHaq5mB1lJbhNMG9g9VpoRtpjHsGBeNKbl6YRb9fBxsXgnL2eOp
 LcU0bfI7ZrUv8hrk6twadLOhXzpy/dZg2YGR3nZXzL/nxvbYCUf9Gm8/c3a53OOkDMmvmd
 xgm7b9nAgoBdCvrZH0UKc/WdBcdp5jlsui88giNatYNAXUxgjBkfqFEPPXacCj11ZIOAkZ
 f+jOcz7+Km3uaLJpscFliWMheSRbvqEtkR5gYvb/Hec0KoEUYofrKYNm2TDee7MN+cIYRq
 iXaEMc+ZHKhUUqzAgGhYi+NGS11OSphR1qoyTfGyvOh/iF6nhFCRI+hR5VOQ8w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NcJ2V5Zf
Subject: Re: [Buildroot] [PATCH 1/1] package/cmake: bump to 3.30.5
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

On Mon, 28 Oct 2024 23:41:32 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> https://cmake.org/cmake/help/v3.30/release/3.30.html#id3
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/cmake/cmake.hash | 4 ++--
>  package/cmake/cmake.mk   | 2 +-
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
