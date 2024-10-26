Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D85D10BF7
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 13:59:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5D5F40C2F;
	Sat, 26 Oct 2024 13:59:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U9HxeJNKEOxW; Sat, 26 Oct 2024 13:59:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82D7640D0B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82D7640D0B;
	Sat, 26 Oct 2024 13:59:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 70F765C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 13:59:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E50840175
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 13:59:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5WxxPxxngjn4 for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 13:59:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0A7BB400D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A7BB400D7
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0A7BB400D7
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 13:59:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4DCB5FF802;
 Sat, 26 Oct 2024 13:59:46 +0000 (UTC)
Date: Sat, 26 Oct 2024 15:59:45 +0200
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Cc: Christian Stewart <christian@aperture.us>, James Hilliard
 <james.hilliard1@gmail.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>
Message-ID: <20241026155945.478500ee@windsurf>
In-Reply-To: <20241026045421.44823-1-christian@aperture.us>
References: <20241026045421.44823-1-christian@aperture.us>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729951186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5BQLwTJb5PZToYXu3lEfrwaF2xpZm2w8wgxq+pRWo1I=;
 b=HkIw2j1nZNMV3ALwcAVAhNFlpUiRqSNLQtcrJZ63iE9veOj7U5oIkJK3WpmKkHewW1bY2D
 kXwS5gO/33sq4EwVSYaMxwYeS9wWt+zRzRV0vB+OZiC9w4qFApng+9YqskVEHQ1oaUeALJ
 6fHT6nN9jMCWfXkMIu3ACUvjA1lgR34U+6fGeeR/NhJ113b/iAVSeK8ek5n5fkjCSiQbgu
 TLi7FuGJ9jAw6DSpaLGDS86DrJq6HUFg4LBW7un8TsdqeVN/aZPvlivkOtrzsM8S4Z6YeS
 YUmMWu7uC8eRnTpErNzWWGfci6RFmKA9OvGE0sobPfuZg3idLO36B46bAP5Z7A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HkIw2j1n
Subject: Re: [Buildroot] [PATCH v1 1/1] package/go: bump version to go1.23.2
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

On Fri, 25 Oct 2024 21:54:21 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> Go 1.23.0 is a major release of Go.
> 
> Most of its changes are in the implementation of the toolchain, runtime, and libraries.
> 
> https://go.dev/doc/go1.23
> https://go.dev/doc/devel/release#go1.23.2
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>
> ---
>  package/go/go-bin/go-bin.hash | 14 +++++++-------
>  package/go/go-src/go-src.hash |  2 +-
>  package/go/go.mk              |  2 +-
>  3 files changed, 9 insertions(+), 9 deletions(-)

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
