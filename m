Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75275E7718F
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 22:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DD444053D;
	Sun, 29 Dec 2024 22:11:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GIxXbLkhH7t4; Sun, 29 Dec 2024 22:11:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33436405B3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33436405B3;
	Sun, 29 Dec 2024 22:11:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C44B0CA
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 22:11:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A568A6090A
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 22:11:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7l-4KePmjNea for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 22:11:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 873F8608BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 873F8608BA
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 873F8608BA
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 22:11:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BB7BD40004;
 Sun, 29 Dec 2024 22:11:14 +0000 (UTC)
Date: Sun, 29 Dec 2024 23:11:14 +0100
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20241229231114.3d360591@windsurf>
In-Reply-To: <20241018215214.623918-1-raphael.pavlidis@gmail.com>
References: <20241018215214.623918-1-raphael.pavlidis@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735510274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AjhBIgG2gRyAmX8H3d6DUG6QozUxgaQ13zXTA/i5Cv8=;
 b=kTIBD5Y7ZsVzyuhb+riNrw6OTf0ZaG8eJOGTpEDW/ybJiP9+hUaz6/yfx3V0trqsrHR1iD
 uYyT22s1CUMhGVfWjaNriYwJ75l5SQxmk1ixiM6iJp9igQZW0qm73COV8Ig1tOhD9n/i57
 a4w3ALPGHaAk7q2BGq/HD+7KRemM/ULuUcM49ka12bykkqBj0E6KRNH7XUDVE52fWjDe4R
 d71aRjZVaP+G4xU5scjJsxhLlU+qnxv6cQCenuiP6Ks63sQgL28SbQGI500hfVa1QX3wcp
 O0S8SmbZ2KuxImZnCXuMBbV1W2IZ7B+k5LK7XtvFvAkZsy8fFIYO6y1lm35XxQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kTIBD5Y7
Subject: Re: [Buildroot] [PATCH v1 1/2] package/x11r7/xorgproto: bump
 version to 2024.1
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

On Fri, 18 Oct 2024 21:52:13 +0000
Raphael Pavlidis <raphael.pavlidis@gmail.com> wrote:

> Release notes:
> https://lists.x.org/archives/xorg-announce/2024-March/003495.html
> 
> Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
> ---
>  package/x11r7/xorgproto/xorgproto.hash | 8 +++++---
>  package/x11r7/xorgproto/xorgproto.mk   | 2 +-
>  2 files changed, 6 insertions(+), 4 deletions(-)

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
