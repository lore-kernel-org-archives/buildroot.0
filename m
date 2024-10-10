Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0EE6D2444F
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 21:37:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7FDC541616;
	Thu, 10 Oct 2024 21:37:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 07B0RAPUFY8v; Thu, 10 Oct 2024 21:37:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0723A41665
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0723A41665;
	Thu, 10 Oct 2024 21:37:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7FDA81BF98E
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B0EB40592
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:36:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M56e5HxDT_Nf for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 21:36:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9D7F3404D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D7F3404D1
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9D7F3404D1
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 21:36:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D71C740004;
 Thu, 10 Oct 2024 21:36:40 +0000 (UTC)
Date: Thu, 10 Oct 2024 23:35:47 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20241010233547.39a641ba@windsurf>
In-Reply-To: <20241009181830.3878089-1-james.hilliard1@gmail.com>
References: <20241009181830.3878089-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1728596201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iI+ubhGTklUb5PyfpJAkSiWYL/TC5ZAszuqb1lP508Y=;
 b=JHdE41D5jvTAK/A5eqdJe24GQF2iffWbvUVoxaArrnh27aWCmTsCPRfIpRVwluqlDALc0m
 aOiG9h3IencIVmlQk98VMjwalMa1rs+flknxajQ1aoBmsE8rakrPttpk0faRAc24SuMWk0
 gmRtbdFxCpM7+a7t2RNzJTKRIRJbxgXI++NHhvKIX2xDMMNP2Y6voynABNVKRrU2FHmSKH
 36Czn7uNIT0Uae1TPvkdJEKYg5DTvjiBV4mxazvT4yt4n9os/tyxT42pJFO4JYktxMYUyt
 sP8e6aRzkySAcjmOQeIHJjRq6UnlxCIfwVKMWRR/yetr/Tk1lfYO+jimNDgEsQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JHdE41D5
Subject: Re: [Buildroot] [PATCH 1/1] package/python-urwid-readline: bump to
 version 0.15.1
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  9 Oct 2024 12:18:30 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-urwid-readline/python-urwid-readline.hash | 4 ++--
>  package/python-urwid-readline/python-urwid-readline.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
