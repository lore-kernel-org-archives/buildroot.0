Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C21ED59F75
	for <buildroot@archiver.kernel.org>; Wed,  6 Nov 2024 22:26:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 100B0407EE;
	Wed,  6 Nov 2024 22:26:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rVg3N9LLu6Zx; Wed,  6 Nov 2024 22:26:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCC2940080
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCC2940080;
	Wed,  6 Nov 2024 22:26:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C90C74C38
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 22:26:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9C3840260
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 22:26:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mAkoLzDV1tL0 for <buildroot@buildroot.org>;
 Wed,  6 Nov 2024 22:26:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4F204401AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F204401AF
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4F204401AF
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 22:26:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 59D0BC0004;
 Wed,  6 Nov 2024 22:26:41 +0000 (UTC)
Date: Wed, 6 Nov 2024 23:26:40 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Marcin Niestroj <m.niestroj@grinn-global.com>,
 Asaf Kahlon <asafka7@gmail.com>
Message-ID: <20241106232640.72b6e83e@windsurf>
In-Reply-To: <20241105172935.1391069-1-james.hilliard1@gmail.com>
References: <20241105172935.1391069-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730932001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rj7xkYlCx2rNFdh8xZM8iubmWzOSXexsPJ0I9WVZfDo=;
 b=Bdi4AVZGSqYJfJQA+EPIWgDhJURtCNU7vBUR3YbWMnGHLhd7vQPYojTTX0xLoio8mSCboY
 z/BCFZt+F3cCeoszp8Gcsym7GjhUXbASQsn/Ic1hZhVHBBYYwAvYIAl38x9jtucjP9WmGb
 3+VbJdA867L9En1XDWfiPrGBw4H2+GJ6+n3Ej4l/8RNY+IYc2WJVh+EPtmdaZ7TrhVktGw
 58uCu7RvdOcfg8QAAedKyTTEjFxsa00Cd3RRLdHFM9zFlxOg5mhybdYOQ4AhGii8EwTA8D
 3Ibm6aNh1ec3d3TD8g7BuI6GjCik891ajKY4alMhE9gWKsvv55W/45F3xvZ3IQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Bdi4AVZG
Subject: Re: [Buildroot] [PATCH 1/1] package/python-dbus-fast: use poetry
 setup type
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

On Tue,  5 Nov 2024 10:29:35 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Use the new poetry setup type which automatically pulls in the
> host-python-poetry-core dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-dbus-fast/python-dbus-fast.mk | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

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
