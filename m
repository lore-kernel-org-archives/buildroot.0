Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49AADCDD0CB
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 19:18:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17D6640219;
	Tue, 22 Oct 2024 19:18:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XvwbsinFb7-v; Tue, 22 Oct 2024 19:18:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3F1D403E2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3F1D403E2;
	Tue, 22 Oct 2024 19:18:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4084359F4
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 19:18:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E882080DA3
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 19:17:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QCV_pCREC1ux for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 19:17:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D4FB180DB9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4FB180DB9
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D4FB180DB9
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 19:17:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4F56A20002;
 Tue, 22 Oct 2024 19:17:55 +0000 (UTC)
Date: Tue, 22 Oct 2024 21:17:54 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Asaf Kahlon <asafka7@gmail.com>
Message-ID: <20241022211754.676a3ed0@windsurf>
In-Reply-To: <20241013195023.2813141-1-james.hilliard1@gmail.com>
References: <20241013195023.2813141-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729624676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ojwJfWrdBoaG3FhPg0xHItu5KHevdxWSnpkOUOKYIDc=;
 b=o7XzVS8xV0l/C75vp0VvdmMVcq2vTxnEpZ2kr2wQbx/bak0FXPWwfVxAEUpOx89HKqQAv6
 0+4eT6f00RYyKdCB1TBjGjh66F5JC1FVHRopoNrAjBR7OfC2fBGsqtj9MPEZaWDvUxL4o8
 9rQo8z+2wqy5+kLVjuELsQW3ZxUAY927ecuuj1xo0LCIK2cXZbeLG9iOTqHTwdgNbw+8ly
 o1tg/M8aUTekBZWCTpsaEqmhK4q9NG7AjDu2RWlIwmTnQK0GQNCHhWNQTrs8QAYCNEfKI2
 Wpm9o00Tgq+j2vm83mIBqUhPcBEjSRaR8YmwKI/lkxdSz4oj3/cpLNsmQJqjWw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=o7XzVS8x
Subject: Re: [Buildroot] [PATCH 1/1] package/python-xmltodict: bump to
 version 0.14.1
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

On Sun, 13 Oct 2024 13:50:23 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-xmltodict/python-xmltodict.hash | 4 ++--
>  package/python-xmltodict/python-xmltodict.mk   | 4 ++--
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
