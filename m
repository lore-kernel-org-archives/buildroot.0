Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 003EAD59F75
	for <buildroot@archiver.kernel.org>; Wed,  6 Nov 2024 22:27:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEF2140821;
	Wed,  6 Nov 2024 22:27:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4SMbAYWAy9Vk; Wed,  6 Nov 2024 22:27:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 343F44090B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 343F44090B;
	Wed,  6 Nov 2024 22:27:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DE5EA4C38
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 22:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA18D6068A
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 22:27:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 63m7fiDrn9W0 for <buildroot@buildroot.org>;
 Wed,  6 Nov 2024 22:27:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B243F60AAE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B243F60AAE
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B243F60AAE
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 22:27:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0B7AE40004;
 Wed,  6 Nov 2024 22:27:14 +0000 (UTC)
Date: Wed, 6 Nov 2024 23:27:14 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Asaf Kahlon <asafka7@gmail.com>
Message-ID: <20241106232714.42551800@windsurf>
In-Reply-To: <20241105180225.1406819-1-james.hilliard1@gmail.com>
References: <20241105180225.1406819-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730932035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8W7zbg0BVzuWxZFFhcMGx3uo9tRxloSIChxZikFHTp0=;
 b=SK8raUXt2lk5gH4326rLdQNMy/ACPpnB1761s42B5xW5fqEQz9v203u84yKdvwrpu57a3k
 LLXu/vCEzMlSRf7r4y/oejXj32NS0BGg+9ZKsGCHg0qBtyEfWFxxyLCLcA7OmkDrdoRvut
 61cg8ivUSXAl5mH04M0smboPWSuD9dzP261hBB49qGphtilaIIRxaSbe4CpfBZ0d5F8AaI
 DkSHMKj0Pvm7S/BiXreyIiNcTZtakxbTsrkOa7t8Yj3KpEGZYdy60/QhOw/ptJ1JHU72G/
 kS4JUYkigolQ+Lra9rZVTUyMffAVwHASQL8mxiAAa0w0c58hVf79Ldk+8ydxLg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SK8raUXt
Subject: Re: [Buildroot] [PATCH 1/1] package/python-sh: use poetry setup type
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

On Tue,  5 Nov 2024 11:02:25 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Use the new poetry setup type which automatically pulls in the
> host-python-poetry-core dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-sh/python-sh.mk | 3 +--
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
