Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE59D59F7A
	for <buildroot@archiver.kernel.org>; Wed,  6 Nov 2024 22:26:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DA3E605CB;
	Wed,  6 Nov 2024 22:26:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RwIjOYNmyLYi; Wed,  6 Nov 2024 22:26:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3184B60A49
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3184B60A49;
	Wed,  6 Nov 2024 22:26:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 537034C38
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 22:26:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3755605CB
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 22:26:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EBPmZpai1hrw for <buildroot@buildroot.org>;
 Wed,  6 Nov 2024 22:26:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 842D0608C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 842D0608C4
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 842D0608C4
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 22:26:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C0100C0002;
 Wed,  6 Nov 2024 22:26:48 +0000 (UTC)
Date: Wed, 6 Nov 2024 23:26:48 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>, Asaf
 Kahlon <asafka7@gmail.com>
Message-ID: <20241106232648.59d57b4d@windsurf>
In-Reply-To: <20241105173425.1393747-1-james.hilliard1@gmail.com>
References: <20241105173425.1393747-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730932009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N+FGsi8GV14hfgeoyHSH6kwJ/D4KixO+LBH2ZDEBp5Y=;
 b=CyP+GMEouC45MdbF7b4KZstvxxiKPCQpjAYJMlvOLkbtwbgM8DoKAt2nz/BVgV25uQySGn
 2O3TK0wRsCCF/rQS8wrBgqlxC7aJrAViMfPD40XKrd6Ydl6f+a0HzhrzOrB99xpYFaLxMU
 bSvacAEiBI2a3P98J+VfmgGRwRWjnMFwWev4nSQqWpGvG7ee8hK+jJg1It4eJULGO7FDMF
 qJqwzxouW0nr45sn9auC9Iyrd6T2ykodX9dqNe/OOeILY8SksIDecFVGv1SO5oNdJjkQYx
 Hm9fMdNlabVgQxJghDpFaUZquDJarxAa1MQiPHuxGxH7NP1oNAmxdNWNlhpOWg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CyP+GMEo
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pkgconfig: use poetry
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

On Tue,  5 Nov 2024 10:34:25 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Use the new poetry setup type which automatically pulls in the
> host-python-poetry-core dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-pkgconfig/python-pkgconfig.mk | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

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
