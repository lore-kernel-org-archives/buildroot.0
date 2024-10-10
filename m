Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D260D24454
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 21:37:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4659D415C5;
	Thu, 10 Oct 2024 21:37:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2OuARHu48rwx; Thu, 10 Oct 2024 21:37:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C30D4415FC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C30D4415FC;
	Thu, 10 Oct 2024 21:37:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1905F1BF3C3
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:36:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B27E64131F
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:36:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7zihdsgPwwhy for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 21:36:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 56431412F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56431412F0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 56431412F0
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 21:36:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 928AD40005;
 Thu, 10 Oct 2024 21:36:34 +0000 (UTC)
Date: Thu, 10 Oct 2024 23:34:05 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20241010233405.17c0cc61@windsurf>
In-Reply-To: <20241009153208.3776928-1-james.hilliard1@gmail.com>
References: <20241009153208.3776928-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1728596194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=grEMnktnYRxXdVhFG+Gt3fkdlOoQ8JtWnDRI0aFzOBk=;
 b=chSyiL6k6t7knbamQut5qwww/QnBIFOBnLorGQxj0eUZJv2WKualWKrmCZCfjZlUXBNfJi
 Z3HlDYp9MaFmeEVH4/i7vekDg27iirAxS5atWCU/ZT6I8JqAJ3k9FSCANyEK08FRA6omrI
 DVk3xJ+nzbrTMZaRH6br+NAtssYkLwxUQveDT6RzZA6hUw7YRvl2rKdhNc12Y3ChStOvgo
 Jkh3+6r/ktRJbKISjG5BL20hn2ppbtF3qwjgckuSfM8rj8IFJJ1j/9LdYUdiEoBjF3NAtt
 GLK3UUKz+UcS+WMOH8/ywIhVsMmzcXUOgZgfzmTYeDqZxMcqT4BsfDqgeWwoEQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=chSyiL6k
Subject: Re: [Buildroot] [PATCH 1/1] package/python-argcomplete: bump to
 version 3.5.1
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

On Wed,  9 Oct 2024 09:32:08 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-argcomplete/python-argcomplete.hash | 4 ++--
>  package/python-argcomplete/python-argcomplete.mk   | 4 ++--
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
