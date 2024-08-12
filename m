Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0981C52D7C
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 20:50:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFC1E8109F;
	Mon, 12 Aug 2024 20:50:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g1qwNCDg7vPf; Mon, 12 Aug 2024 20:50:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB431810A8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB431810A8;
	Mon, 12 Aug 2024 20:50:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 018261BF344
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 20:50:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E243D401B2
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 20:50:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eUxnQVIR0jNn for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 20:50:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A42B3400B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A42B3400B5
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A42B3400B5
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 20:50:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C24001BF205;
 Mon, 12 Aug 2024 20:50:34 +0000 (UTC)
Date: Mon, 12 Aug 2024 22:50:33 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240812225033.18fd8e2d@windsurf>
In-Reply-To: <20240810174645.709425-1-bernd@kuhls.net>
References: <20240810174645.709425-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723495834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2f69YmzjH1Nv1mxmllTktWcV++REKO1MdkdZC067UAk=;
 b=Lq428K/CiMOZNr7y500x18w9pC4J85jHXjX5kDsEtUozlBxagz/NSRCOgPKjFK2XemtIMr
 f/8hXDa3W65gEGjS5gX3qpW0K0JEinP9s0hgJveGVnJTj+UxBPURGhcMJUakbFQpwp+/3A
 ddeo5Y9ByVNRE9lY+Ej+SA7j1TKEtK2KxWG8b8UFyjIpkp9DNCmwsjenX8ofAiJ7+6moEk
 MyV7+y/op4IZlc/zmKewJps7dl89NexQANJvFL56yW93Vh98SCaZbWbyx/krnnqiFI3V5K
 +7BLN0ZzHA/o5HdEjfC0fm+8ni2Ma9Zg//lyz/lKkIFdMfkSaHsLXOCxxEvdog==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Lq428K/C
Subject: Re: [Buildroot] [PATCH 1/1] package/gnutls: security bump version
 to 3.8.6
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

On Sat, 10 Aug 2024 19:46:45 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Version 3.8.4 fixes CVE-2024-28834 & CVE-2024-28835.
> 
> Release notes:
> 3.8.4: https://lists.gnupg.org/pipermail/gnutls-help/2024-March/004845.html
> 3.8.5: https://lists.gnupg.org/pipermail/gnutls-help/2024-April/004846.html
> 3.8.6: https://lists.gnupg.org/pipermail/gnutls-help/2024-July/004848.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/gnutls/gnutls.hash | 4 ++--
>  package/gnutls/gnutls.mk   | 2 +-
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
