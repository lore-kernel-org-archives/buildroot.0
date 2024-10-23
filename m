Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F9C9CFA464
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 20:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 053F940520;
	Wed, 23 Oct 2024 20:14:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qVoLSOvmL5X9; Wed, 23 Oct 2024 20:14:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC53340C07
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC53340C07;
	Wed, 23 Oct 2024 20:14:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E36EC3F2E
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 20:14:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C3DF440C4F
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 20:14:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QRCku-fQ9PZD for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 20:14:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A73E640520
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A73E640520
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A73E640520
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 20:14:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E52AA20005;
 Wed, 23 Oct 2024 20:14:05 +0000 (UTC)
Date: Wed, 23 Oct 2024 22:14:04 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <20241023221404.321bc559@windsurf>
In-Reply-To: <20241022174345.127042-1-ju.o@free.fr>
References: <20241022174345.127042-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729714446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4xHBjVb7y15xQOBhatP2CUIzzdgYuW8Acoe2RD088Vc=;
 b=IljXVaDyINEcg1hZOM4ARFqMtWfbj94i/D1kq4cjP37OUveCf6JwZWNISeMMwajbk2q7dd
 pqw3QCfickSIRykRoNGghP3LcediWEmWy0V0tS2PtupV8iZnGCFlahRuAbtpgJQhVHBFAH
 YQa7GyTHx0ZLXg4fXBn0cWmJyZXmC+pf5c6nmgcALokBZLAMyocUqXvgZxxOjWnTTUrZrX
 qzX+ljDU7hytuB5i6zOGMv18jWqEeGPk9MikRa7UyyMEMeumR5gzcHpvfdC8HXoYQIwHNw
 /Hdy9HPPVD4eb0K5C2mar9dDPaIotOetlnDwY+uKBdz3uF4l/OR4+mp5oetnWg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IljXVaDy
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add iputils runtime
 test
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

On Tue, 22 Oct 2024 19:43:45 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/8156359331
> ---
>  DEVELOPERS                                    |  1 +
>  support/testing/tests/package/test_iputils.py | 48 +++++++++++++++++++
>  2 files changed, 49 insertions(+)
>  create mode 100644 support/testing/tests/package/test_iputils.py

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
